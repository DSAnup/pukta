USE [Pukta]
GO

/****** Object:  Table [dbo].[DocumentType]    Script Date: 9/19/2024 3:31:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Document](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[DocumentDescription] [varchar](500) NULL,
	[DocumentNote] [varchar](500) NULL,
	[DocumentFileName] [varchar](500) NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateLastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


