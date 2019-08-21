/*
	
	HOL-201: 
	Per Ginny Deck:
	DISCOVERED date is required on Incident form in HOL on existing LUST sites.  Most LUST sites in the database 
	do not have this field filled in.  I think at one time it might have been de-populated.  
	I can’t remember.  However, at this point in time, we should fill it in if it will 
	be a required field. 
	Is there a way to fix this in the existing LUST database before we migrate to 
	the new system?  I’m thinking, if DISCOVERED date is already populated for a site, 
	leave it that way.  If the DISCOVERED DATE is blank, then set it equal to the RECEIVED date.
	This should only be for updating existing sites in the LUST database.  This will save us from 
	hand-entering the date, prevent confusion, and provide consistency.

*/
USE LUST
GO
/*  Create table to contain the updated assessmentID's and the DiscoverDate */
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='AssessmentDiscoveryDateUpd' AND xType='U')
 CREATE TABLE dbo.AssessmentDiscoveryDateUpd (
  AssessmenntId INT NOT NULL,
  DiscoverDate DATETIME
  )
GO
/* Use a transaction - just in case */
BEGIN TRANSACTION
 UPDATE Assessment
 SET DiscoverDate = Incident.ReceivedDate,
  LastChangeBy = 'CONV',
  LastChangeDate = GETDATE()
 
 OUTPUT Inserted.AssessmentId, Inserted.DiscoverDate INTO AssessmentDiscoveryDateUpd
 FROM Incident 
 WHERE Assessment.LustId = Incident.LustId
 AND Assessment.DiscoverDate IS NULL

 /* Verify all rows were updated - In other rows, this result set should be empty */
 --SELECT * FROM incident i JOIN assessment a ON i.LustId = a.LustId
 --WHERE a.DiscoverDate IS NULL
 /* Verify the rows were inserted in the new table */
 --SELECT * FROM AssessmentDiscoveryDateUpd
 /* Use rollback - Comment the COMMIT TRANSACTION LINE to test */
--ROLLBACK TRANSACTION
 /* Use rollback to test - Comment the COMMIT TRANSACTION LINE to test */
COMMIT TRANSACTION 
/* verify the output that no rows exist */
SELECT * 
FROM incident i JOIN assessment a ON i.LustId = a.LustId
WHERE a.DiscoverDate IS NULL

