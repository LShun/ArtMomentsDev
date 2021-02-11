USE [ArtMomentsDb]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [product_id], [quantity], [deliver_channel], [date_delivery], [order_status], [date_received], [transaction_id]) VALUES (6, 2, 1, N'Pos Laju', NULL, N'Pending', NULL, 18)
INSERT [dbo].[Order] ([id], [product_id], [quantity], [deliver_channel], [date_delivery], [order_status], [date_received], [transaction_id]) VALUES (7, 1, 2, N'Pos Laju', NULL, N'Pending', NULL, 19)
INSERT [dbo].[Order] ([id], [product_id], [quantity], [deliver_channel], [date_delivery], [order_status], [date_received], [transaction_id]) VALUES (8, 4, 2, N'Pos Laju', NULL, N'Pending', NULL, 20)
INSERT [dbo].[Order] ([id], [product_id], [quantity], [deliver_channel], [date_delivery], [order_status], [date_received], [transaction_id]) VALUES (9, 7, 1, N'Pos Laju', NULL, N'Pending', NULL, 21)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
