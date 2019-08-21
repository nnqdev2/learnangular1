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

