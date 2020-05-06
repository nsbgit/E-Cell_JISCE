USE [dbEcellJISGrp]
GO

/****** Object:  Table [dbo].[tblAdminDetails]    Script Date: 06-08-2014 03:24:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblAdminDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[emailPass] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

