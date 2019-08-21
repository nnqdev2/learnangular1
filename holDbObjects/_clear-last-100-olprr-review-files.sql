USE lust

/*

	Get the ID for newest 100 LUST records, then update the OLPRR records to set their status to "NEW", remove the 
	associated Incident record
*/

DECLARE @lustId INT
SELECT TOP 300 @LustId = i.LustId
FROM OlprrIncident o JOIN incident i ON o.OlprrId = i.OlprrId
ORDER BY i.lustid DESC

--SELECT @LustId
--SELECT * FROM incident WHERE lustId > @lustId ORDER BY OlprrId DESC
--SELECT * FROM OlprrIncident WHERE OlprrId IN (
--SELECT OlprrId FROM incident WHERE lustId >  @LustId )



UPDATE OlprrIncident SET SiteStatus = 'NEW'
WHERE OlprrID IN (
SELECT OlprrId from incident where lustId >  @LustId)

DELETE FROM incident 
WHERE LustId >= @LustId 


