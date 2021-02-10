/****** Object:  Table [dbo].[Transaction]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[user_id] [int] NULL,
	[date_order] [date] NULL,
 CONSTRAINT [PK__Transact__3213E83F0C7C3337] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Order]
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_User]