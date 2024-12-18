USE [Pukta]
GO

/****** Object:  Table [dbo].[ExpenseType]    Script Date: 9/19/2024 12:14:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DocumentType](
	[DocumentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeName] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateLastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


