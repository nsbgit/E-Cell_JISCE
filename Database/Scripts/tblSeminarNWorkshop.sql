USE [dbEcellJISGrp]
GO

/****** Object:  Table [dbo].[tblSeminarNWorkshop]    Script Date: 06-08-2014 03:25:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblSeminarNWorkshop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[wdate] [varchar](50) NOT NULL,
	[wtime] [varchar](50) NOT NULL,
	[venue] [varchar](50) NOT NULL,
	[wdescription] [varchar](500) NOT NULL,
	[organisedBy] [varchar](50) NULL,
	[dt] [datetime] NOT NULL,
 CONSTRAINT [PK__tblSemin__3213E83FB875028E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

