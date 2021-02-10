/****** Object:  Table [dbo].[Order]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[deliver_channel] [nvarchar](50) NULL,
	[date_delivery] [date] NULL,
	[order_status] [nvarchar](20) NULL,
	[date_received] [date] NULL,
 CONSTRAINT [PK__Order__3213E83F83065AB9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]