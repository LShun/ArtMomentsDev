/****** Object:  Table [dbo].[Product]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prod_name] [nvarchar](50) NULL,
	[prod_size] [nvarchar](20) NULL,
	[prod_description] [nvarchar](max) NULL,
	[category_id] [int] NULL,
	[prod_image] [varbinary](max) NULL,
	[prod_price] [float] NULL,
	[prod_stock] [int] NULL,
	[prod_sales] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK__Product__3213E83FDEFAE05B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Product_Category] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_Category]
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]