USE [LUST]
GO
/****** Object:  Table [dbo].[DebugTable]    Script Date: 4/25/2019 9:43:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DebugTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DebugTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InsertTime] [datetime] NULL,
	[Message] [varchar](1024) NULL,
 CONSTRAINT [PK_DebugTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
GRANT INSERT ON [dbo].[DebugTable] TO [LUSTUser] AS [dbo]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DebugTabl__Inser__0856F164]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DebugTable] ADD  DEFAULT (getdate()) FOR [InsertTime]
END

GO
