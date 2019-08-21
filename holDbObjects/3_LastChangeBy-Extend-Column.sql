USE LUST 
GO


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='Assessment'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE Assessment 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='AssessmentConfirmationType'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE AssessmentConfirmationType 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='AssessmentDiscoveryType'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE AssessmentDiscoveryType 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='AssessmentReleaseType'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE AssessmentReleaseType 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='CONSULTANT'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE CONSULTANT 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='FileStatusType'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE FileStatusType 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='Incident'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE Incident 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='Inspection'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE Inspection 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='Management'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE Management 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='PcsDisposalFacility'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE PcsDisposalFacility 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='PcsSoilStatusType'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE PcsSoilStatusType 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

-- PCSSwPermit LastChangeby allows nulls (?)

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='PcsSwPermit'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE PcsSwPermit 
			  ALTER COLUMN LastChangeBy varchar(64) NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='PetroContamSoil'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE PetroContamSoil 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='Picture'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE Picture 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='ProjectManagerHistory'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE ProjectManagerHistory 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='PublicNotice'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE PublicNotice 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='PublicNoticeType'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE PublicNoticeType 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='SiteControl'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE SiteControl 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='SiteNameAlias'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE SiteNameAlias 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='SitePicture'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE SitePicture 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='SiteScoreValues'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE SiteScoreValues 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='SiteType'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE SiteType 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;



IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='WorkReported'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE WorkReported 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;

			  
IF EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='WorkReportedType'
			  AND COLUMN_NAME='lastchangeby'
	   ) 
	   ALTER TABLE WorkReportedType 
			  ALTER COLUMN LastChangeBy varchar(64) NOT NULL;


IF NOT EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='OlprrContacts'
			  AND COLUMN_NAME='OlprrContactsId'
	   ) 
	   ALTER TABLE OlprrContacts
			  ADD OlprrContactsId [int] NOT NULL IDENTITY(1, 1)



IF NOT EXISTS(SELECT * FROM sys.indexes WHERE name = 'PK_OlprrContactsId' AND object_id = OBJECT_ID('OlprrContacts'))
    BEGIN
        ALTER TABLE [dbo].[OlprrContacts] ADD CONSTRAINT [PK_OlprrContactsId] PRIMARY KEY NONCLUSTERED  ([OlprrContactsId])
    END





/*
	HOL-131 Create and Populate Project Manager Table 
	LUST gets the AD GROUP for LustProjectManager and populates the PM dropdown in the Consultants screen
	When the user adds PMs to the Project Manager screen, those PM's are displayed in the Incident PM dropdown list.
*/

IF NOT EXISTS(SELECT * FROM sysobjects WHERE name='ProjectManager' and xType = 'U')
	CREATE TABLE [dbo].[ProjectManager](
		[ProjMgrId] [int] IDENTITY(1,1) NOT NULL,
		[PmLogin] [varchar](64) NOT NULL,
		[PmName] [varchar](64) NOT NULL,
		[LastChangeBy] [varchar](64) NOT NULL,
		[LastChangeDate] [datetime] NOT NULL,
	CONSTRAINT [PK_ProjectManager] PRIMARY KEY CLUSTERED 
	(
		[ProjMgrId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

ELSE
	DELETE FROM ProjectManager
GO

INSERT INTO dbo.ProjectManager (PmLogin, PmName, LastChangeBy, LastChangeDate)
VALUES 
('patkins', 'ATKINS Patricia', 'CONV', GetDate()),
('GBROWN', 'BROWN Geoff', 'CONV', GetDate()),
('AChavez',	'CHAVEZ Anthony', 'CONV', GetDate()),
('jclawso',	'CLAWSON Jessica', 'CONV', GetDate()),
('ECLOUGH',	'CLOUGH Eric', 'CONV', GetDate()),
('JCOLLINS',	'COLLINS Jamie', 'CONV', GetDate()),
('KDAUGHE',	'DAUGHERTY Katie', 'CONV', GetDate()),
('adesmon',	'DESMOND Ash', 'CONV', GetDate()),
('ldimock',	'DIMOCK Lauren', 'CONV', GetDate()),
('mdrouin',	'DROUIN Mark', 'CONV', GetDate()),
('deckert',	'ECKERT Dylan', 'CONV', GetDate()),
('TENGLAN', 'ENGLAND Tracy', 'CONV', GetDate()),
('AFarris',	'FARRIS Ann', 'CONV', GetDate()),
('BFUNK',	'FUNK Brent', 'CONV', GetDate()),
('agarcia',	'GARCIA Andrea', 'CONV', GetDate()),
('lgates',	'GATES LeeAnn', 'CONV', GetDate()),
('JGLASS',	'GLASS Jim', 'CONV', GetDate()),
('lgleim',	'GLEIM Laura', 'CONV', GetDate()),
('aguedea',	'GUEDEA Alex', 'CONV', GetDate()),
('DHANSON',	'HANSON Don', 'CONV', GetDate()),
('RHOOD',	'HOOD Robert', 'CONV', GetDate()),
('CJACOBS',	'JACOBSEN Craig', 'CONV', GetDate()),
('mkays',	'KAYS Melissa', 'CONV', GetDate()),
('ekelley',	'KELLEY Eric', 'CONV', GetDate()),
('ckenned',	'KENNEDY Charles', 'CONV', GetDate()),
('MKORTEN',	'KORTENHOF Mike', 'CONV', GetDate()),
('HLARSEN',	'LARSEN Henning', 'CONV', GetDate()),
('PLaswel',	'LASWELL Paula', 'CONV', GetDate()),
('aleidel',	'LEIDEL Alyssa', 'CONV', GetDate()),
('LLO',		'LO Lewis', 'CONV', GetDate()),
('pmcgove',	'McGOVERN Patty', 'CONV', GetDate()),
('EMCMORR',	'MCMORRINE Edith', 'CONV', GetDate()),
('EOller',	'OLLER Emily', 'CONV', GetDate()),
('MPUGH',	'PUGH Mark', 'CONV', GetDate()),
('nquan',	'QUAN Nga', 'CONV', GetDate()),
('CRichar',	'RICHARDSON Chris', 'CONV', GetDate()),
('NSAWKA',	'SAWKA Nancy', 'CONV', GetDate()),
('jschatz',	'SCHATZ Jeff', 'CONV', GetDate()),
('MSCHEEL',	'SCHEEL Mitch', 'CONV', GetDate()),
('BSCHERZ',	'SCHERZINGER Bruce', 'CONV', GetDate()),
('BSCHWAR',	'SCHWARZ Bob', 'CONV', GetDate()),
('BTHOMS',	'THOMS Bryn', 'CONV', GetDate()),
('sturnbl',	'TURNBLOM Susan', 'CONV', GetDate()),
('cvillac',	'VILLACA Cesar', 'CONV', GetDate()),
('rwells',	'WELLS-ALBERS Rebecca', 'CONV', GetDate()),
('syankey',	'YANKEY Scott', 'CONV', GetDate())



/* 
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
	HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects HOTC Objects 
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************
******************************************************************************************************************************

*/ 



USE HOTC


IF NOT EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='HOT_DECOMMISSION'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE HOT_DECOMMISSION
			  ADD LastChangeBy VARCHAR(64) DEFAULT('CONV');


IF NOT EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='HOT_DECOMMISSION'
			  AND COLUMN_NAME='LastChangeDate'
	   ) 
	   ALTER TABLE HOT_DECOMMISSION
			  ADD LastChangeDate DATETIME DEFAULT('01/01/1900');

GO



UPDATE HOT_DECOMMISSION
	SET LastChangeBy = 'CONV'
	WHERE LastChangeBy IS NULL;
GO

UPDATE HOT_DECOMMISSION	
	SET LastChangeDate = '01/01/1900'
	WHERE LastChangeDate IS NULL;

GO


IF NOT EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='HOT_MANAGEMENT'
			  AND COLUMN_NAME='LastChangeBy'
	   ) 
	   ALTER TABLE HOT_MANAGEMENT
			  ADD LastChangeBy VARCHAR(64) DEFAULT('CONV');


IF NOT EXISTS
(
	   SELECT 
			  COLUMN_NAME 
	   FROM 
			  INFORMATION_SCHEMA.COLUMNS
	   WHERE 
			  TABLE_NAME='HOT_MANAGEMENT'
			  AND COLUMN_NAME='LastChangeDate'
	   ) 
	   ALTER TABLE HOT_MANAGEMENT
			  ADD LastChangeDate DATETIME DEFAULT('01/01/1900');
GO






UPDATE HOT_MANAGEMENT
	SET LastChangeBy = 'CONV'
	WHERE LastChangeBy IS NULL;
GO


UPDATE HOT_MANAGEMENT
	SET LastChangeDate = '01/01/1900'
	WHERE LastChangeDate IS NULL;
GO




