USE [ArtMomentsDb]
GO
SET IDENTITY_INSERT [dbo].[Product_Category] ON 

INSERT [dbo].[Product_Category] ([id], [category_name], [category_desc_size], [category_image]) VALUES (1, N'Painting', N'Work made of spread colors (acrylic, watercolor, gouache, oil, aerosol can ...) on a surface prepared for this purpose.', 0x3F3F433A5C55736572735C557365725C4465736B746F705C57656220506963747572655C31343131313932375F61726374757275732D30312E6A7067)
INSERT [dbo].[Product_Category] ([id], [category_name], [category_desc_size], [category_image]) VALUES (2, N'Photography', N'Image captured by the artist via a camera. This category excludes any addition, or excessive editing done by computer.', 0x3F3F433A5C55736572735C557365725C4465736B746F705C57656220506963747572655C36633139613339613761333965616338633439653337306236656231643764312E6A7067)
INSERT [dbo].[Product_Category] ([id], [category_name], [category_desc_size], [category_image]) VALUES (3, N'Digital Arts', N'Works of creation realized using computer tools and electronic interfaces.', 0x3F3F433A5C55736572735C557365725C4465736B746F705C57656220506963747572655C637972696C2D726F6C616E646F2D6469676974616C2D696C6C757374726174696F6E732D332E6A7067)
INSERT [dbo].[Product_Category] ([id], [category_name], [category_desc_size], [category_image]) VALUES (4, N'Drawing', N'Works done on a surface using an instrument (pencil, pen, charcoal, markers ...).', 0x3F3F433A5C55736572735C557365725C4465736B746F705C57656220506963747572655C65646333303732393265353637356237636339613464306161346365306162312E6A7067)
INSERT [dbo].[Product_Category] ([id], [category_name], [category_desc_size], [category_image]) VALUES (5, N'Prints', N'Work printed by means of a matrix treated in relief (engraving on wood, on linoleum), hollow (on metal: intaglio) or flat (lithography, serigraphy).', 0x3F3F433A5C55736572735C557365725C4465736B746F705C57656220506963747572655C616E6F746865722D6C6F6F6B2D61742D70617269735F752D6C2D707A35663868302E6A7067)
SET IDENTITY_INSERT [dbo].[Product_Category] OFF
GO
