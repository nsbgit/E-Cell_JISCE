USE [dbEcellJISGrp]
GO

/****** Object:  Table [dbo].[tblFacultyRegistration]    Script Date: 06-08-2014 03:25:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblFacultyRegistration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[mobileNumber] [varchar](50) NOT NULL,
	[joiningYear] [varchar](50) NOT NULL,
	[department] [varchar](50) NOT NULL,
	[doorNStreet] [varchar](50) NOT NULL,
	[rlyStation] [varchar](50) NOT NULL,
	[po] [varchar](50) NOT NULL,
	[postalCode] [varchar](50) NOT NULL,
	[district] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[dt] [datetime] NOT NULL,
 CONSTRAINT [PK__tblFacul__3213E83FA185896D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

