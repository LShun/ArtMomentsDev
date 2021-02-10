/****** Object:  Table [dbo].[Wishlist]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Wishlist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Wishlist2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Product]
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_User]