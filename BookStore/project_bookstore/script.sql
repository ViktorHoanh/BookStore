USE [BookStore]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [nvarchar](10) NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [nvarchar](10) NOT NULL,
	[PublisherID] [nvarchar](10) NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[TypeID] [int] NULL,
	[PublishDate] [date] NOT NULL,
	[NoPages] [int] NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books_Authors]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books_Authors](
	[BookID] [nvarchar](10) NOT NULL,
	[AuthorID] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books_Translators]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books_Translators](
	[BookID] [nvarchar](10) NOT NULL,
	[TranslatorID] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[TranslatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[OrderID] [int] NOT NULL,
	[StatusDate] [date] NOT NULL,
	[StatusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[OrderID] [int] NOT NULL,
	[BookID] [nvarchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[ShipMethodID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[CusName] [nvarchar](50) NOT NULL,
	[CusPhone] [varchar](20) NOT NULL,
	[CusAddress] [nvarchar](max) NOT NULL,
	[CusEmail] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PubID] [nvarchar](10) NOT NULL,
	[PubName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingMethods]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingMethods](
	[MethodID] [int] NOT NULL,
	[MethodName] [nvarchar](50) NOT NULL,
	[Cost] [money] NULL,
	[ShippingTime] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] NOT NULL,
	[StatusValue] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translators]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translators](
	[TranslatorID] [nvarchar](10) NOT NULL,
	[TranslatorName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TranslatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 3/24/2022 2:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'aaa', N'123456', N'kadwdw@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'admin', N'admin123', N'admin@gmail.com', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'banhkeo', N'ahihidongoc', N'applepen@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'deptrai123', N'12345678', N'deptrai123@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'doudoudou', N'1234dou', N'doudou@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'fptalo', N'handsome', N'123aaa@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'lanhoa', N'lanhoahoe', N'ka@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'lanhoaqua', N'ahihihi', N'lanHE172832@fpt.edu.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'lophoc', N'123456789', N'lanlophoc@fpt.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'minhanh', N'minhanh123', N'minhanh@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'nhunguyet', N'ahihihi', N'nguyetxin@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'prj301', N'123456789', N'prj301@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'sachvo', N'sachhay', N'sachhay@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'ura', N'urauraura', N'ura12@gmal.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'user1', N'user1abc', N'user1@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'user2', N'abcabc', N'user2@fpt.edu.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'user3', N'123789', N'dawdd@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'user4', N'aaaaaa', N'qwedawdd@gmail.com', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Email], [Role]) VALUES (N'user7', N'7777777', N'qwedawdd@yahoo.com', 0)
GO
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A1', N'José Mauro de Vasconcelos')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A10', N'Jane Chisholm')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A11', N'Chung Sơn Cư Sỹ Chân Vỹ')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A111', N'Lưu Chấn Hồng')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A12', N'Julie Barlow')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A13', N'Léopold Michel Cadière')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A14', N'Đoàn Trang')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A15', N'Viện Sử học')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A16', N'Gaston Dorren')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A17', N'Vĩnh Sính')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A18', N'Yoshitoki Oima')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A19', N'Gosho Aoyama')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A2', N'Diệp Hồng Vũ')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A20', N'Huỳnh Thái Ngọc')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A21', N'Toyotarou')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A22', N'Fumino Yuki')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A23', N'Koyoharu Gotouge')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A24', N'Morgan Housel')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A25', N'Damon Zahariades')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A26', N'DD.Watkins')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A27', N'Napoleon Hill')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A28', N'Mary Buffett')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A29', N'Jim Collins')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A3', N'Ocean Vuong')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A30', N'Tahl Raz')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A31', N'Đặng Hoàng Giang')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A32', N'Esther Perel')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A33', N'Huy Đức')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A34', N'Dan Ariely')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A35', N'Werner Bartens')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A36', N'Thomas Harris')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A37', N'Phương Ny')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A38', N'Alexandre Dumas')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A39', N'Jane Austen')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A4', N'Mishima Yomu')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A40', N'Paulo Coelho')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A41', N'Mario Puzo')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A42', N'Harper Lee')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A43', N'Phạm Hằng Nguyên')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A44', N'Anthony William')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A45', N'Gene Stone')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A46', N'Hiromi Shinya')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A47', N'Thomas E. Levy')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A48', N'Nguyễn Quang Uẩn')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A49', N'Don Sexton')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A5', N'Nguyễn Văn Nam')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A50', N'Nguyễn Thị Nhung')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A52', N'Jean-Benoit Nadeau')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A53', N'Akira Toriyama')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A54', N'Jack Canfield')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A55', N'SEAN SEAH')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A56', N'Keith Ferrazzi')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A57', N'Michael Greger')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A58', N'Nguyễn Thị Hậu')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A59', N'Nguyễn Quỳnh Nga')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A6', N'Yuval Noah Harari')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A69', N'Minh Anh Linh')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A7', N'Jared Diamond')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A8', N'Pierre Dieulefils')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName]) VALUES (N'A9', N'Michel Đức Chaigneau')
GO
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000123', N'TG5', N'CÂY CAM NGỌT CỦA TÔI', 168000.0000, 1, CAST(N'2020-01-20' AS Date), 244, N'Cuốn sách được đón nhất nhiều nhất của Nhã Nam trong suốt hai năm qua là đây. Đó là tác phẩm văn học Brazil - giàu tính nhân văn, giáo dục - kể về cậu bé 5 tuổi Zeze - sinh ra tại khu ổ chuột và gia đình nghèo khó. Cậu bé có tâm hồn nhạy cảm, sẽ học những bài học đầu đời về tình thương, trách nhiệm và cả những mất mát. Mở đầu bằng những thanh âm trong sáng và kết thúc lắng lại trong những nốt trầm hoài niệm, Cây cam ngọt của tôi khiến ta nhận ra vẻ đẹp thực sự của cuộc sống đến từ những điều giản dị như bông hoa trắng của cái cây sau nhà, và rằng cuộc đời thật khốn khổ nếu thiếu đi lòng yêu thương và niềm trắc ẩn. Cuốn sách kinh điển này bởi thế không ngừng khiến trái tim người đọc khắp thế giới thổn thức, kể từ khi ra mắt lần đầu năm 1968 tại Brazil.', 194, N'https://salt.tikicdn.com/cache/200x200/ts/product/7b/eb/8b/8c4eb4eddc13341e34a7c951ea49d0d7.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000124', N'TG5', N'Tâm Lý Học - Phác Họa Chân Dung Kẻ Phạm Tội', 155000.0000, 2, CAST(N'2020-10-10' AS Date), 320, N'Tội phạm, nhất là những vụ án mạng, luôn là một chủ đề thu hút sự quan tâm của công chúng, khơi gợi sự hiếu kỳ của bất cứ ai. Một khi đã bắt đầu theo dõi vụ án, hẳn bạn không thể không quan tâm tới kết cục, đặc biệt là cách thức và động cơ của kẻ sát nhân, từ những vụ án phạm vi hẹp cho đến những vụ án làm rúng động cả thế giới.Lấy 36 vụ án CÓ THẬT kinh điển nhất trong hồ sơ tội phạm của FBI, “Tâm lý học tội phạm - phác họa chân dung kẻ phạm tội” mang đến cái nhìn toàn cảnh của các chuyên gia về chân dung tâm lý tội phạm. Trả lời cho câu hỏi: Làm thế nào phân tích được tâm lý và hành vi tội phạm, từ đó khôi phục sự thật thông qua các manh mối, từ hiện trường vụ án, thời gian, dấu tích,… để tìm ra kẻ sát nhân thực sự.', 99, N'https://salt.tikicdn.com/cache/200x200/ts/product/e4/a3/52/4845a31ebb7c0b75766ef9272506f236.jpg', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000125', N'TT', N'Một Thoáng Ta Rực Rỡ Ở Nhân Gian', 103000.0000, 1, CAST(N'2020-12-25' AS Date), 300, N'Một thoáng ta rực rỡ ở nhân gian viết dưới dạng một lá thư của nhân vật chính, Chó Con, gửi cho người mẹ không biết chữ của mình. Dưới dạng những mẩu chuyện nhỏ, xen kẽ với những đoạn trữ tình ngoại đề, triết lý, và những bài thơ, cuốn sách kể câu chuyện đời không chỉ của Chó Con (tên gọi yêu do bà ngoại đặt cho, nhưng cũng là cách tất cả mọi người trong sách gọi cậu) từ thuở nhỏ đến lúc chớm trưởng thành, mà cả ba thế hệ từ bà, đến mẹ, đến cậu, một cuộc di cư dài từ làng quê Việt Nam sang đất Mỹ, cũng như câu chuyện của những thanh niên Mỹ', 127, N'https://salt.tikicdn.com/cache/200x200/ts/product/2f/b5/4e/a8208e9019c8510e8a8eebe06f50299c.jpg', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000126', N'TRE98', N'Thế Giới Otome Game Thật Khắc Nghiệt Với Nhân Vật Quần Chúng - Tập 4', 134000.0000, 4, CAST(N'2020-03-12' AS Date), 120, N'Trong tập trước, Leon đã cùng nhóm của Marie đi tới nước Cộng hòa Alzer với tư cách là những du học sinh. Nếu như có thêm một Marie tại nước Cộng hòa, một lần nữa thế giới sẽ lại đứng trước nguy cơ bị diệt vong. Và thật không may, điều này đã thực sự xảy ra. Nhân vật chính - người chỉ tồn tại một mình trong trò chơi - trên thực tế lại xuất hiện dưới tư cách một cặp chị em sinh đôi. Thêm vào đó, với sự hậu thuẫn của Thần Thụ, những công tử đầy ngạo mạn của các quý tộc đã chĩa nanh vuốt về phía Leon.', 6, N'https://salt.tikicdn.com/cache/200x200/ts/product/94/9b/c4/6511d351f840ac17edc34f407e82ce54.jpg', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000127', N'GD', N'Giáo Trình Kinh Tế Chính Trị Mác – Lênin', 200000.0000, 8, CAST(N'2022-01-01' AS Date), 300, N'Giáo trình gồm 6 chương:Chương 1 cung cấp những tri thức cơ bản về sự ra đời và phát triển của môn học kinh tế chính trị Mác - Lênin; đối tượng nghiên cứu, phương pháp nghiên cứu và chức năng của khoa học kinh tế chính trị Mác - Lênin trong nhận thức cũng như trong thực tiễn.Chương 2 cung cấp một cách có hệ thống về lý luận giá trị lao động của C. Mác thông qua các phạm trù cơ bản về hàng hóa, tiền tệ, giá cả, quy luật giá trị, tính hai mặt của lao động sản xuất hàng hóa, năng suất lao độ', 123, N'https://salt.tikicdn.com/cache/200x200/ts/product/d4/51/60/6a5c49d0e64b233150faad9bd3386b73.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000128', N'GD', N'Sapiens: Lược Sử Loài Người', 155400.0000, 6, CAST(N'2020-03-12' AS Date), 500, N'Trong ấn bản mới này của cuốn Sapiens - Lược sử loài người, chúng tôi đã có một số hiệu chỉnh về nội dung với sự tham gia, đóng góp của các thành viên Cộng đồng đọc sách Tinh hoa. Xin trân trọng cảm ơn ý kiến đóng góp tận tâm của các quý độc giả, đặc biệt là ông Nguyễn Hoàng Giang, ông Nguyễn Việt Long, ông Đặng Trọng Hiếu cùng những người khác. Mong tiếp tục nhận được sự quan tâm và góp ý từ độc giả.', 202, N'https://salt.tikicdn.com/cache/200x200/ts/product/17/b2/c0/4c0493ff3c6fb142f221c27c0abbe892.JPG.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000129', N'VH001', N'Súng, Vi Trùng Và Thép', 234000.0000, 6, CAST(N'2019-10-10' AS Date), 300, N'Súng, Vi Trùng Và Thép (Tái Bản).Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 18, N'https://salt.tikicdn.com/cache/200x200/ts/product/ee/5e/b7/bef072cd379599f55702a12af9976dc0.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000130', N'TT', N'Sách - Đông Dương tráng lệ', 210000.0000, 6, CAST(N'2021-01-10' AS Date), 120, N'Giá sản phẩm trên đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu ', 10, N'https://salt.tikicdn.com/cache/200x200/ts/product/9e/2c/fb/2322e2eade623837eb924f3388d8214b.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000131', N'PNVN', N'HỒI ỨC VỀ KINH THÀNH HUẾ ', 159000.0000, 6, CAST(N'2020-07-07' AS Date), 213, N'Tôi ít hợp sách Thái Hà (dạy bạn làm giàu, trong khi tôi làm nghèo túi bạn) nên thật phiến diện khi tôi nói tác phẩm dưới đây có thể quan trọng và giàu giá trị nội dung nhất trong năm 2020 của họ. *** Để hiểu cuốn sách này bạn cần nắm lấy bối cảnh: trong quãng Gia Long phục quốc-bên cạnh ông ngoài ngũ hổ tưởng như Võ Tánh, Lê Văn Duyệòn có những gã Tây giang hồ như Jean-Baptiste Chaigneau hay Vúp sức. Họ trở thành khai quốc công thần, và từ thủa nhà Nguyễn lập đô tại Huế thì cậu bé Michel Đức Chaigneau ra đời. Dưới là ghi chép con người phương Tây sinh ra tại đây - từng diện kiến cả Gia Long và Minh Mạng: ta sẽ ồ, àới hình ảnh, kiến trúc và phong tục Huế gần hai trăm trước', 98, N'https://salt.tikicdn.com/cache/200x200/ts/product/4a/89/b2/6bcd726dc5a27aee6bd004b71402dfce.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000132', N'KD12', N'Lịch Sử Thế Giới Theo Dòng Sự Kiện ', 300000.0000, 6, CAST(N'2020-06-12' AS Date), 135, N'Cung cấp những kiến thức lịch sử giá trị, đáng tin cậy khắp năm châu bốn bể', 98, N'https://salt.tikicdn.com/cache/200x200/ts/product/59/a2/a8/14af99ec8250dbceb60816d6671f3808.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000133', N'HN1', N'Hán Sở Diễn Nghĩa', 132000.0000, 6, CAST(N'2021-01-03' AS Date), 200, N'Hán Sở diễn nghĩa (tên gốc Tây Hán diễn nghĩa) là trước tác của Chung Sơn cư sỹ Chân Vĩ, vốn quen thuộc với độc giả Việt Nam qua cái tên Hán Sở tranh hùng. Lần này, qua bản dịch mới mẻ và đầy đủ 101 hồi của dịch giả Châu Hải Đường, một lần nữa quá khứ bi hùng về cuộc chiến giữa Lưu Bang và Hạng Vũ cách đây hơn hai nghìn năm lại như sống dậy trước mắt độc giả.', 130, N'https://salt.tikicdn.com/cache/200x200/ts/product/93/38/0e/d27adf01a9adca0d932199d529f97f01.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000134', N'TRE98', N'Một Nước Pháp Khác – Không Chỉ Là Thanh Lịch', 50000.0000, 5, CAST(N'2019-11-20' AS Date), 124, N'Một nước Pháp khác là một chuyến hành trình đến với trái tim, suy nghĩ và tâm hồn người Pháp. Giải mã những ý tưởng của người Pháp về đất đai, quyền riêng tư cũng như ngôn ngữ. Hai tác giả Nadeau và Barlow đã đan xen những chủ đề của xã hội Pháp – từ sự tập trung hóa và bộ luật Napoléon đến nền giáo dục ưu tú, và thậm chí những cuộc biểu tình trên đường phố – lần đầu tiên đem đến cho độc giả một bức tranh toàn cảnh nước Pháp.', 21, N'https://salt.tikicdn.com/cache/200x200/ts/product/f9/d5/de/d00b54a2f74e1932437bf0f068d0cabd.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000135', N'TT', N'Nghệ Thuật Huế', 190000.0000, 5, CAST(N'2020-01-10' AS Date), 203, N'Với những bài phân tích tỉ mỉ cùng hơn 200 phụ bản sinh động, Nghệ thuật Huế là một nguồn tư liệu quý giá, lột tả các đặc tính của nền mỹ thuật bản địa vốn có nội dung phong phú cùng hệ thống biểu tượng, nhưng vẫn hạn chế về năng lực tả thực bởi các ràng buộc về quy ước trong văn hóa và nghệ thuật truyền thống, cũng như bởi tư duy khuôn mẫu của những nghệ nhân không một lần dám bước ra ngoài lệ thường.', 198, N'https://salt.tikicdn.com/cache/200x200/ts/product/b2/23/87/912023c8a8f018a13d55d47c8f6c6047.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000136', N'KD12', N'Non nước Việt Nam 63 tỉnh thành', 133000.0000, 5, CAST(N'2020-12-12' AS Date), 144, N'Cuốn sách giới thiệu một cách có hệ thống các thông tin cơ bản về 63 tỉnh thành; cung cấp cho người đọc cái nhìn tổng quan về tỉnh, thành được giới thiệu: khái quát ngắn gọn về vị trí địa lý, các đơn vị hành chính, dân số, dân tộc, văn hóa – du lịch…', 894, N'https://salt.tikicdn.com/cache/200x200/ts/product/9a/e5/ae/815d823aaa7bb50f3b753d54371e8919.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000137', N'TG5', N'Đô Thị Cổ Việt Nam', 144000.0000, 5, CAST(N'2021-01-07' AS Date), 200, N'Công trình nhằm khảo tả và giới thiệu 13 đô thị cổ ra đời và phát triển trong khoảng thời gian từ thế kỷ thứ III đến thế kỷ thứ XIX ở Việt Nam về các mặt lịch sử; kinh tế, văn hóa, xã hội. Trong các đô thị cổ được lựa chọn này, có đô thị đã xuất hiện từ rất sớm, nay đã bị mai một chỉ còn tồn tại như một xóm nhỏ. Có đô thị đã bị mai một hoàn toàn chỉ còn để lại một vài dấu tích trên mặt hoặc trong lòng đất. Nhưng cũng có đô thị tồn tại và liên tục phát triển cho đến ngày nay và trở thành đô thị hiện đại.', 64, N'https://salt.tikicdn.com/cache/200x200/ts/product/a8/66/5f/4e7b4ad4999eb433954acf9e0c329ebe.jpg.webp', 0)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000138', N'TRE98', N'Babel Vòng Quanh Thế Giới Qua 20 Ngôn Ngữ', 356000.0000, 5, CAST(N'2019-02-20' AS Date), 333, N'Sự đa ngữ của loài người là một món quà hay một sự trừng phạt? Và, liệu ngọn tháp Babel ngôn ngữ có đáng mơ ước hay không? “Nói được thêm một ngôn ngữ chính là có thêm một tâm hồn”, đó là phát biểu của Hoàng đế Charlemagne. 6000 ngôn ngữ hiện có của thế giới là 6000 vũ trụ tinh thần khác nhau, nơi tích lũy nguồn tri thức và văn hóa vô cùng đa dạng của nhân loại. Năng lực đa ngữ giúp một người có thể sống một đời sống phong phú và cảm thông với nhiều góc nhìn. Tình trạng đơn ngữ, dù đó là thứ ngôn ngữ được ưa chuộng nhất thế giới, cũng sẽ thu hẹp khả năng trải nghiệm cuộc sống của mỗi ngườ ', 586, N'https://salt.tikicdn.com/cache/200x200/ts/product/1c/a0/97/40a33614f428859fef4bf78dd7a8956b.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000139', N'TG5', N'Giao Điểm Giữa Hai Nền Văn Hóa Việt Nam Và Nhật Bản', 40000.0000, 5, CAST(N'2020-02-02' AS Date), 132, N'Nhân dịp kỷ niệm 150 năm Minh Trị duy tân (1868-2018) và 45 năm thiết lập quan hệ ngoại giao Việt Nam - Nhật Bản (1973-2018), chúng tôi chọn Vĩnh Sính và các tiểu luận của ông để giới thiệu đến đông đảo độc giả có dành sự quan tâm đến tiến trình giao lưu văn hóa Việt Nam - Nhật Bản.', 230, N'https://salt.tikicdn.com/cache/200x200/ts/product/c6/c0/33/59c411ff35b1d68fafe1894385842499.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000140', N'KD12', N'Boxset 7 Tập: Dáng Hình Thanh Âm', 350000.0000, 4, CAST(N'2020-12-29' AS Date), 1344, N'Chuyện kể về Nishimiya Shoko là cô bé bị khiếm thính bẩm sinh. Khi nhập học vào trường tiểu học, cô bé luôn bị các bạn cùng lớp bắt nạt mà đầu têu là cậu bé Ishiya Shoya ngỗ nghịch, khiến mẹ cô bé đành phải chuyển trường cho con mình. Vài năm sau, hối hận vì những hành động không hay lúc nhỏ của mình, Ishida Shoya đã cất công đi tìm cô bạn học năm xưa để bù đắp cho những lỗi lầm của mình khi ấy.', 27, N'https://salt.tikicdn.com/cache/200x200/ts/product/80/21/3e/f143763e64372d347aaf2e2101285fcc.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000141', N'GD', N'Thám Tử Lừng Danh Conan - Tập 98', 20000.0000, 4, CAST(N'2021-01-14' AS Date), 184, N'Vụ án diễn biến bất ngờ với nhiều khúc ngoặt để rồi cuối cùng, Akai Shuichi xuất hiện…!? Không dừng lại ở đó, tập 98 còn mang tới vụ án giải mật mã của một người giúp việc, nơi cuộc đua phá án giữa Conan và Heiji đã khởi phát từ mưu kế của Ooka Momiji!!', 78, N'https://salt.tikicdn.com/cache/200x200/ts/product/6d/61/45/4d4166c4fee360442889f320c84a12c5.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000142', N'TG5', N'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn', 59000.0000, 4, CAST(N'2020-11-20' AS Date), 200, N'Cuốn sách là những mẩu chuyện nhỏ được ghi lại bằng tranh xoay quanh Thỏ Bảy Màu và những người nghĩ nó là bạn. Những mẩu chuyện được truyền tải rất “teen” đậm chất hài hước, châm biếm qua sự sáng tạo không kém phần “mặn mà” của tác giả càng trở nên độc đáo và thu hút.', 84, N'https://salt.tikicdn.com/cache/200x200/ts/product/b7/b1/16/9e6bafeea8f51e96883cbe29ebe8f331.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000143', N'TT', N'Dragon Ball Super - Tập 12', 22000.0000, 4, CAST(N'2019-10-15' AS Date), 150, N'Ác nhân Moro cùng đồng bọn là những tù nhân vượt ngục đang làm loạn khắp cõi Ngân Hà nhằm thâu tóm năng lượng sống từ các hành tinh có giá trị. Cùng lúc ấy, trên Trái Đất cũng xuất hiện một băng nhóm Ngân tặc, trong đó có gã tù “Số 73” với năng lực sao chép cực kì lợi hại. Thiếu Goku, nhóm bạn đã phải chật vật chiến đấu với hắn ra sao?', 50, N'https://salt.tikicdn.com/cache/200x200/ts/product/14/75/6c/8e032b7c2ff3014953cc8795bc073646.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000144', N'PNVN', N'Lắng Nghe Tiếng Nắng (Boxset 2 Tập)', 84000.0000, 4, CAST(N'2021-01-01' AS Date), 365, N'Trái ngược như ồn ào và lặng lẽ, nhưng cũng xâm lấn như ồn ào vào lặng lẽ, người ấy đã từng bước hiện diện rõ rệt trong đời cậu. Lôi cậu ra khỏi lối sinh hoạt cô đơn buồn tẻ. Làm cậu buồn cười vì kiểu chép bài như gà bới. Cổ vũ cậu rằng khuyết tật đâu phải là cái tội. Giúp cậu tìm thấy niềm vui trong việc nấu ăn cho chỉ một người. Và khiến cậu, lần đầu tiên trong đời quyết giãi bày tình cảm…', 192, N'https://salt.tikicdn.com/cache/200x200/ts/product/13/8d/96/3fe20e88e33b59bf78129311c1d18d8d.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000145', N'GD', N'Thanh Gươm Diệt Quỷ - Tập 18: Kí Ức Trỗi Dậy', 25000.0000, 4, CAST(N'2020-12-12' AS Date), 200, N'Tomioka và Tanjiro đang đấu với Thượng huyền tam Akaza. Dù 2 người chỉ đủ sức phòng thủ trước những đòn tấn công áp đảo của hắn, nhưng giữa trận chiến căng thẳng cực độ, Tanjiro đã đạt đến cảnh giới của “Thế giới trong suốt” mà cha cậu đã truyền thụ! Cuối cùng, liệu lưỡi gươm của Tanjiro có chạm đến được Akaza…!?', 109, N'https://salt.tikicdn.com/cache/200x200/ts/product/28/77/7b/cdeaf6e6dc4b159bb6e55df0ef677716.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000146', N'KD12', N'Tâm Lý Học Về Tiền', 115000.0000, 3, CAST(N'2020-10-29' AS Date), 384, N'Tiền bạc có ở khắp mọi nơi, nó ảnh hưởng đến tất cả chúng ta, và khiến phần lớn chúng ta bối rối. Mọi người nghĩ về nó theo những cách hơi khác nhau một chút. Nó mang lại những bài học có thể được áp dụng tới rất nhiều lĩnh vực trong cuộc sống, như rủi ro, sự tự tin, và hạnh phúc. Rất ít chủ đề cung cấp một lăng kính phóng to đầy quyền lực giúp giải thích vì sao mọi người lại hành xử theo cách họ làm hơn là về tiền bạc. Đó mới là một trong những chương trình hoành tráng nhất trên thế giới.', 193, N'https://salt.tikicdn.com/cache/200x200/ts/product/83/23/b7/14a42ae4f66c9b8b298aaef4b9671442.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000147', N'GD', N'Nghệ Thuật Từ Chối', 59000.0000, 3, CAST(N'2020-05-15' AS Date), 104, N'Bí quyết đưa ra lời Từ chối mà không làm tổn hại các mối quan hệ nằm “Nghệ Thuật Từ Chối – Cách Nói Không Mà Vẫn Có Được Đồng Thuận” giúp bạn tìm hiểu nguyên nhân và đưa ra cách từ chối “nhẹ nhàng”. Cuốn sách chia quy trình Từ chối thành những bước như- Chuẩn bị từ chối, đưa ra từ chối và hoàn tất từ chối - cuốn sách hướng dẫn bạn phương pháp nói Không hiệu quả, mạnh mẽ nhất, bạn có thể thực hiện ngay trong đời sống, công việc và các mối quan hệ.', 147, N'https://salt.tikicdn.com/cache/200x200/ts/product/67/02/06/0747f0d843db55db3801a8051916dd39.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000148', N'KD12', N'Người Nam Châm', 45000.0000, 3, CAST(N'2020-12-08' AS Date), 194, N'Cuốn sách viết về cách hoạt động của Luật hấp dẫn trong cuộc sống của bạn, từ đó bạn có thể hiểu nhiều hơn về bản thân mình - thực ra bạn là ai và tại sao bạn lại ở đây. Cuốn sách này chính là chìa khóa của bạn. Nó có thể mở cánh cửa tới tương lai như bạn mong ước và đưa bạn tới con đường có nhiều niềm vui, sung túc và giàu có hơn.', 198, N'https://salt.tikicdn.com/cache/200x200/ts/product/0f/2b/f4/6ada8869a4ea8cfd557729253324c3fb.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000149', N'TRE98', N'Think And Grow Rich - Nghĩ Giàu Và Làm Giàu', 85000.0000, 3, CAST(N'2020-01-03' AS Date), 450, N'"Think and Grow Rich –Nghĩ giàu và Làm giàu là một trong những cuốn sách bán chạy nhất mọi thời đại. Đã hơn 60 triệu bản được phát hành với gần trăm ngôn ngữ trên toàn thế giới và được công nhận là cuốn sách tạo ra nhiều triệu phú, một cuốn sách truyền cảm hứng thành công nhiều hơn bất cứ cuốn sách kinh doanh nào trong lịch sử.', 127, N'https://salt.tikicdn.com/cache/200x200/ts/product/99/10/67/aa71f851071fc05bec537bec76dc4234.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000150', N'TG5', N'7 Phương Pháp Đầu Tư Warren Buffet', 89800.0000, 3, CAST(N'2020-03-04' AS Date), 230, N'Warren Buffett là chuyên gia đầu tư và là một trong những doanh nhân giàu có, được kính trọng nhất thế giới. Với 12 năm học hỏi trực tiếp các chiến lược và thói quen đầu tư của Warren Buffett, Marry Buffett, cùng với Sean Sear, đã viết nên một cuốn sách hướng dẫn hoàn chỉnh dành cho những nhà đầu tư mới muốn học theo cách đầu tư thành công của Warren Buffett.', 40, N'https://salt.tikicdn.com/cache/200x200/ts/product/bf/b2/5d/6894cba1fa118189ee567a2329a55f98.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000151', N'PNVN', N'Từ Tốt Đến Vĩ Đại', 104000.0000, 3, CAST(N'2021-05-06' AS Date), 300, N'Jim Collins cùng nhóm nghiên cứu đã miệt mài nghiên cứu những công ty có bước nhảy vọt và bền vững để rút ra những kết luận sát sườn, những yếu tố cần kíp để đưa công ty từ tốt đến vĩ đại. Đó là những yếu tố khả năng lãnh đạo, con người, văn hóa, kỷ luật, công nghệ… Những yếu tố này được nhóm nghiên cứu xem xét tỉ mỉ và kiểm chứng cụ thể qua 11 công ty nhảy vọt lên vĩ đại. Mỗi kết luận của nhóm nghiên cứu đều hữu ích, vượt thời gian, ý nghĩa vô cùng to lớn đối với mọi lãnh đạo và quản lý ở mọi loại hình công ty (từ công ty có nền tảng và xuất phát tốt đến những công ty mới khởi nghiệp), và mọi lĩnh vực ngành nghề.', 495, N'https://salt.tikicdn.com/cache/200x200/ts/product/84/f5/a2/8cd3d96f65304037a1f038c982e718e9.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000152', N'HNV123', N'Đừng Bao Giờ Đi Ăn Một Mình', 191000.0000, 3, CAST(N'2021-12-10' AS Date), 246, N'Công thức để làm được điều này, theo lời bậc thầy về kết nối là Keith Ferrazzi, chính là phải biết làm quen với mọi người. Ferrazzi đã khám phá từ khi còn trẻ rằng điểm khác biệt của những người thành công rực rỡ chính là cách họ vận dụng quyền năng của những mối quan hệ - để mọi người cùng thắng.', 133, N'https://salt.tikicdn.com/cache/200x200/ts/product/8e/c5/c3/9f680d49c05be61065c81a6e6fce4faa.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000153', N'PNVN', N'Tìm Mình Trong Thế Giới Hậu Tuổi Thơ', 97980.0000, 2, CAST(N'2021-06-07' AS Date), 100, N'Khi ngợi khen một người trẻ độc lập mạnh mẽ, có thể chúng ta không biết họ lớn lên trong môi trường phải làm bố mẹ của bố mẹ mình ra sao, cô đơn khắc khoải thế nào. Khi ngưỡng một một người trẻ học giỏi, có thể chúng ta không biết họ đã bị ngạt thở bởi kỳ vọng của cha mẹ. Khi phán xét một người trẻ hời hợt thiếu động lực sống, có thể chúng ta không biết từ bé đến lớn họ đã được "đút sẵn" đến nỗi không còn biết mình là ai. Khi kêu ca một người trẻ thiếu nghị lực muốn kết thúc cuộc sống, có thể chúng ta không biết họ đã oằn mình mang gánh nặng mà gia đình ấn xuống quá lâu, khiến cánh giải thoát duy nhất là cái chết…', 128, N'https://salt.tikicdn.com/cache/200x200/ts/product/80/fd/b5/999460db5daf4fef7d8e61529eec43b6.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000154', N'TRE98', N'Trí Thông Minh Trên Giường', 150000.0000, 2, CAST(N'2021-10-11' AS Date), 256, N'Và các cặp đôi bị mắc kẹt trong lựa chọn: tiếp tục ở lại để đổi lấy sự an toàn, sự kết nối hay bước ra để được sống lại một lần nữa? Chúng ta muốn sự cởi mở, sự chia sẻ, sự ân cần trong tình yêu, nhưng lại cần sự mạnh bạo, sự bí ẩn. Chúng ta cần một tri kỉ và một người tình trong cùng một người.', 119, N'https://salt.tikicdn.com/cache/200x200/ts/product/04/90/c1/0e3060bb0a170ced73d9cd0e123bd489.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000155', N'HN1', N'Hiểu Tâm Lý Rành Tâm Ý', 91000.0000, 2, CAST(N'2021-12-12' AS Date), 344, N'Có tồn tại hay không người được gọi là một nửa “hoàn hảo” của mình?Nếu bạn đang tìm lời giải đáp cho những câu hỏi trên thì “Hiểu Tâm Lý Rành Tâm Ý” chính là cuốn sách dành cho bạn.', 21, N'https://salt.tikicdn.com/cache/200x200/ts/product/54/e7/0a/b81702bf8426f16a587bb145af7d2378.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000156', N'TRE98', N'Phi Lý Trí', 148000.0000, 2, CAST(N'2021-12-14' AS Date), 320, N'Tại sao chúng ta luôn tự hứa là sẽ ăn kiêng để rồi ý nghĩ ấy vụt biến ngay khi chiếc xe chở đồ tráng miệng đi qua? Tại sao đôi khi chúng ta hào hứng mua sắm những thứ không thật sự cần đến? Tại sao chúng ta vẫn cảm thấy đau đầu sau khi dùng loại aspirin có giá 1 xu nhưng cơn đau đầu ấy lại biến mất nếu thuốc đó đắt gấp 50 lần? Tại sao những tín đồ được yêu cầu nhớ lại Mười điều răn của Chúa có xu hướng thành thật (ít nhất là ngay sau đó) hơn những người không được yêu cầu làm vậy?', 226, N'https://salt.tikicdn.com/cache/200x200/ts/product/e6/2e/91/b80a691db4ef95dc30deec4c3d74f63a.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000157', N'TG5', N'Chạm (Sách Tâm Lý Học Ứng Dụng)', 122000.0000, 2, CAST(N'2021-10-10' AS Date), 200, N'Nói đến sự đụng chạm, hầu hết mọi người sẽ cảm thấy khó chịu và nghĩ rằng đó là hành động bất thường làm phá vỡ mọi giới hạn khoảng cách. Tùy vào nền văn hóa của từng nước, ví dụ như ở châu Âu thì đó là một hành động hết sức thân mật và thể hiện sự thân thiện, lịch sự đối với người khác khi gặp gỡ chào hỏi nhau; nhưng với văn hóa phương Đông thì họ cho rằng sự đụng chạm là điều kiêng kỵ và có thể khiến đối phương cảm thấy ghê tởm, xấu hổ hoặc tổn thương.', 119, N'https://salt.tikicdn.com/cache/200x200/ts/product/ac/fc/d9/3e2a0fc7ba44300d4517cdac30884e9b.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000158', N'LD44', N'Sự Im Lặng Của Bầy Cừu', 101000.0000, 1, CAST(N'2021-12-30' AS Date), 500, N'Những cuộc phỏng vấn ở xà lim với kẻ ăn thịt người ham thích trò đùa trí tuệ, những tiết lộ nửa chừng hắn chỉ dành cho kẻ nào thông minh, những cái nhìn xuyên thấu thân phận và suy tư của cô mà đôi khi cô muốn lảng trá Clarice Starling đã dấn thân vào cuộc điều tra án giết người lột da hàng loạt như thế, để rồi trong tiếng bức bối của chiếc đồng hồ đếm ngược về cái chết, cô phải vật lộn để chấm dứt tiếng kêu bao lâu nay vẫn đeo đẳng giấc mơ mình: tiếng kêu của bầy cừu sắp bị đem đi giết thịt.', 198, N'https://salt.tikicdn.com/cache/200x200/ts/product/cd/2a/5b/926ca6c7b295c6e7cea39390efe08968.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000159', N'PNVN', N'Em Đến Để Thương Anh', 41000.0000, 1, CAST(N'2020-05-06' AS Date), 345, N'Thanh xuân của bạn đã gặp một người như thế chưa? Một người mà bạn thích đến điên cuồng, chẳng vì quá đẹp trai hay giỏi giang, mà chỉ bởi ngày gặp đầu tiên, người ấy mặc chiếc áo sơ mi màu xanh mà bạn thích. Một người là cả thế giới, là tất cả niềm khao khát mong ước của bạn. Người ấy vui, bạn cũng vui, người đó buồn thì bạn cũng bất an, cả ngày trở nên u ám. Và để có được tình yêu của người ấy, bạn sẵn sàng làm mọi điều dù là ngốc nghếch nhất.', 143, N'https://salt.tikicdn.com/cache/200x200/ts/product/86/37/73/27686f7e061e22634d4900cc71a62d32.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000160', N'VH001', N'Ba Người Lính Ngự Lâm', 172000.0000, 1, CAST(N'2021-04-05' AS Date), 500, N'Tình cờ gặp gỡ ở Paris, chàng quý tộc tỉnh lẻ d’Artagnan kết thân cùng ba người lính ngự lâm Athos, Aramis, Porthos. Từ bốn con người với những tính cách hoàn toàn khác biệt - nhà quý tộc Athos mẫu mực từ trong ra ngoài, ông hộ pháp Porthos huênh hoang nhưng tốt bụng, ngài “tu viện trưởng” Aramis duyên dáng như con gái nhưng sâu sắc chẳng kém ai, chàng trẻ tuổi d’Artagnan khôn ngoan và liều lĩnh - họ kết thành một khối thống nhất nhờ tình bạn keo sơn “Một người vì mọi người, mọi người vì một người.” ', 194, N'https://salt.tikicdn.com/cache/200x200/ts/product/f7/0e/24/dde4a82f70303c65cf399b548117c2b5.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000161', N'PNVN', N'Kiêu Hãnh Và Định Kiến', 120000.0000, 1, CAST(N'2021-08-13' AS Date), 400, N'Bằng tài quan sát nhạy bén, bút pháp trào lộng tinh vi và giọng văn dí dỏm, Jane Austen cuốn hút độc giả theo từng diễn biến trong câu chuyện xoay quanh số phận và con đường tình duyên của năm cô thiếu nữ chưa chồng nhà Bennet trên nền một xã hội đề cao địa vị và gia sản trong quan hệ hôn nhân. Ở trung tâm của thế giới ấy, hai nhân vật chính Elizabeth Bennet và Fitzwilliam Darcy dường như là một cặp đôi lý tưởng, nhưng ngăn cách giữa họ không chỉ là địa vị chênh lệch cùng mưu toan ngáng trở của người ngoài, mà còn là những hiểu lầm sâu sắc xuất phát từ bản tính của đôi bên. ', 897, N'https://salt.tikicdn.com/cache/200x200/ts/product/d9/09/b2/460b1344379f405668d7245bf46fe6a4.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000162', N'LD44', N'Nhà Giả Kim', 76000.0000, 1, CAST(N'2021-03-25' AS Date), 457, N'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người. "Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ." ', 999, N'https://salt.tikicdn.com/cache/200x200/ts/product/45/3b/fc/aa81d0a534b45706ae1eee1e344e80d9.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000163', N'HN1', N'Bố Già', 80000.0000, 1, CAST(N'2021-01-03' AS Date), 642, N'Thế giới ngầm được phản ánh trong tiểu thuyết Bố Già là sự gặp gỡ giữa một bên là ý chí cương cường và nền tảng gia tộc chặt chẽ theo truyền thống mafia xứ Sicily với một bên là xã hội Mỹ nhập nhằng đen trắng, mảnh đất màu mỡ cho những cơ hội làm ăn bất chính hứa hẹn những món lợi kếch xù. Trong thế giới ấy, hình tượng Bố Già được tác giả dày công khắc họa đã trở thành bức chân dung bất hủ trong lòng người đọc. Từ một kẻ nhập cư tay trắng đến ông trùm tột đỉnh quyền uy, Don Vito Corleone là con rắn hổ mang thâm trầm, nguy hiểm khiến kẻ thù phải kiềng nể, e dè, nhưng cũng được bạn bè, thân quyến xem như một đấng toàn năng đầy nghĩa khí. ', 117, N'https://salt.tikicdn.com/cache/200x200/ts/product/b3/32/f0/acaa4cc4384ee100984e4293d15165c6.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000164', N'KD12', N'Giết Con Chim Nhại', 90000.0000, 1, CAST(N'2021-04-17' AS Date), 438, N'Nào, hãy mở cuốn sách này ra. Bạn phải làm quen ngay với bố Atticus của hai anh em - Jem và Scout, ông bố luật sư có một cách riêng, để những đứa trẻ của mình cứng cáp và vững vàng hơn khi đón nhận những bức xúc không sao hiểu nổi trong cuộc sống. Bạn sẽ nhớ rất lâu người đàn ông thích trốn trong nhà Boo Radley, kẻ bị đám đông coi là lập dị đã chọn một cách rất riêng để gửi những món quà nhỏ cho Jem và Scout, và khi chúng lâm nguy, đã đột nhiên xuất hiện để che chở. Và tất nhiên, bạn không thể bỏ qua anh chàng Tom Robinson, kẻ bị kết án tử hình vì tội hãm hiếp một cô gái da trắng, sự thật thà và suy nghĩ quá đỗi đơn giản của anh lại dẫn đến một cái kết hết sức đau lòng, chỉ vì lý do anh là một người da đen.', 1150, N'https://salt.tikicdn.com/cache/200x200/ts/product/07/d5/b7/68b4d6773f4d1ecd9fd5869e693c45b1.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000165', N'PNVN', N'How The Body Works - Hiểu Hết Về Cơ Thể', 225000.0000, 7, CAST(N'2021-10-22' AS Date), 220, N'Truyền thông ngập tràn những khám phá và những lời khuyên mới mẻ về những thứ chúng ta nạp vào cơ thể nhưng có cơ sở khoa học nào cho bất kỳ tuyên bố đó không? Với những hình minh họa rõ ràng, dễ hiểu, cuốn sách Hiểu hết về thức ăn sẽ mang lại những thông tin lý thú liên quan đến thức ăn, từ công đoạn sản xuất đến ích lợi/tác hại của chúng với sức khỏe.', 200, N'https://salt.tikicdn.com/cache/200x200/ts/product/b8/db/b7/7827a39c17b68337b093de7850fc3337.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000166', N'GD', N'Cơ Thể Tự Chữa Lành: Thực Phẩm Thay Đổi Cuộc Sống', 125000.0000, 7, CAST(N'2021-12-03' AS Date), 300, N'Cơ thể tự chữa lành: Thực phẩm thay đổi cuộc sống - Thần dược đến từ trái cây và rau củ giúp chúng ta tăng nhận thức và có cái nhìn mới về những loại trái cây và rau củ - những tinh túy mà thiên nhiên đã ban tặng cho chúng ta. Đối với mỗi loại thực phẩm được liệt kê trong cuốn sách, tác giả sẽ kèm theo một danh sách các căn bệnh và triệu chứng mà thứ trái cây hoặc rau củ đó sẽ giúp giảm nhẹ tình trạng bệnh, đồng thời chỉ ra rất nhiều lợi ích của chúng trong việc hỗ trợ về mặt tinh thần và cảm xúc. Ngoài ra, còn có những công thức các món ăn ngon lành và dễ làm xuyên suốt cuốn sách.', 174, N'https://salt.tikicdn.com/cache/200x200/ts/product/4b/ea/99/958ae923471fac9f54440498b2d1fb1b.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000167', N'TRE98', N'Ăn Gì Không Chết - Sức Mạnh Chữa Lành Của Thực Phẩm', 224000.0000, 7, CAST(N'2021-06-06' AS Date), 130, N'Rất nhiều cái chết trẻ có thể ngăn ngừa được đơn giản bằng những thay đổi trong chế độ ăn và lối sống. Trong cuốn Ăn gì không chết, bác sĩ Michael Greger, bác sĩ, chuyên gia dinh dưỡng nổi tiếng quốc tế, và là nhà sáng lập NutritionFacts.org, nghiên cứu tỉ mỉ 15 nguyên nhân hàng đầu dẫn đến chết trẻ ở Hoa Kỳ – bệnh tim, ung thư, tiểu đường, Parkinson, cao huyết áp, và nhiều bệnh khác – giải thích tại sao can thiệp dinh dưỡng và lối sống đôi khi có thể thành công hơn thuốc kê toa và các giải pháp phẫu thuật và thuốc men khác, cho chúng ta sống khỏe mạnh hơn.', 342, N'https://salt.tikicdn.com/cache/200x200/ts/product/b8/86/71/1b9a82a388df9bc882240b71c6521721.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000168', N'HN1', N'Nhân Tố Enzyme', 83000.0000, 7, CAST(N'2022-01-15' AS Date), 154, N'Tại các cơ sở y tế, các bác sĩ cũng hướng dẫn ăn uống đối với một số căn bệnh cần phải hạn chế ăn uống như bệnh tiểu đường. Tuy nhiên, những hướng dẫn đó chỉ giúp bệnh tình không trở nặng hơn. Không quá lời khi nói rằng cho đến nay, những hướng dẫn trong cách ăn uống, sinh hoạt để bệnh nhân không bị bệnh, hay có thể sống thọ một cách khỏe mạnh vẫn còn là điểm mù của nền y học hiện đại.', 232, N'https://salt.tikicdn.com/cache/200x200/ts/product/df/7a/00/554fe0242ea04df38edfbbb427bf7e91.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000169', N'PNVN', N'Đừng Chết Bởi Canxi', 119000.0000, 7, CAST(N'2021-03-02' AS Date), 200, N'Tuy nhiên trước khi đi đến chỗ quá tự mãn, chúng ta cần phải nhận ra rằng con người vẫn hay chế ra các mô hình khiếm khuyết của thực tại. Các lý thuyết được hình thành với rất ít bằng chứng hỗ trợ nhưng lại được tâng bốc như chân lý là chuyện quá thường gặp, trong khi hàng đống bằng chứng ủng hộ điều ngược lại bị bỏ qua và thậm chí bị sửa đổi. Thông thường, những thực tại nhuốm màu cổ tích được chấp nhận là đúng vì ta muốn hoặc cần chúng được coi là đúng. Việc quá phổ biến là nhiều nhà khoa học, và cả những người không chuyên, mạo hiểm danh tiếng chuyên môn và cá nhân của họ để trung thành với những kết luận đã được định trước – ngay cả sau khi “chân lý” không thể bác bỏ của họ được chứng minh là sai.', 316, N'https://salt.tikicdn.com/cache/200x200/ts/product/ce/42/eb/715f86c352361d9ab101ffec501c7dee.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000170', N'PNVN', N'Giáo Trình Tâm Lí Học Đại Cương', 200000.0000, 8, CAST(N'2021-06-07' AS Date), 170, N'Giá sản phẩm trên đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 229, N'https://salt.tikicdn.com/cache/200x200/ts/product/71/96/b6/b592b5fcad3ae882132a03ad1f57cf56.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000171', N'TT', N'Marketing Căn Bản', 100000.0000, 8, CAST(N'2021-10-19' AS Date), 300, N'Giá sản phẩm trên đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 299, N'https://salt.tikicdn.com/cache/200x200/ts/product/7e/be/ec/19058e30d803a5bdd9d4638da7ed2bc8.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000172', N'VH001', N'Học Mĩ Thuật 4', 69000.0000, 8, CAST(N'2020-12-12' AS Date), 96, N'Bộ sách Học Mĩ thuật theo định hướng phát triển năng lực từ lớp 1 đến lớp 5 được biên soạn nhằm hướng tới mục tiêu lấy học sinh làm trung tâm; kích thích sự tương tác, tư duy sáng tạo và phát triển nhận thức, từ đó giúp các em hình thành và phát triển ba năng lực cốt lõi ', 424, N'https://salt.tikicdn.com/cache/200x200/ts/product/2b/a0/b7/3e0fab96749164a2decde14f861d8fc9.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000173', N'PNVN', N'Logic học đại cương', 192002.0000, 8, CAST(N'2021-09-01' AS Date), 190, N'Đối tượng nghiên cứu của môn loogic học đại cương là những vấn đề loogic hình thức cơ bản nhất - các hình thức và quy luật của tư duy đúng đắn.', 997, N'https://salt.tikicdn.com/cache/200x200/ts/product/4a/a5/e1/32ae9ba601bb7132e4eac366216d6b9a.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000174', N'TG5', N'Hài Hước Một Chút Thế Giới Sẽ Khác Đi', 80000.0000, 2, CAST(N'2022-01-22' AS Date), 125, N'Trong xã hội hiện đại, giao tiếp là chìa khóa giải quyết mọi vấn đề. Vậy làm thế nào để giao tiếp hiệu quả? Đó là biết vận dụng một cách tinh tế sự hài hước vào lời nói và tư duy, hài hước có thể giúp giúp chúng ta thiết lập được mạng lưới quan hệ rộng rãi. Tuy nhiên, hài hước không phải là một năng lực bẩm sinh, muốn có được “nghệ thuật giúp bạn thành công” này, bạn phải trải qua quá tình bồi dưỡng và rèn luyện bản thân. Hài hước một chút, thế giới sẽ khác đi - cuốn sách với nội dung phong phú mà sâu sắc này sẽ giúp các bạn có được cái nhìn rõ nét hơn về tính hài hước dưới các góc độ, phương diện đánh giá khác nhau, cũng như có thêm kĩ năng vận dụng sự hài hước vào cuộc sống hàng ngày.', 286, N'https://salt.tikicdn.com/cache/200x200/ts/product/e6/2b/2c/eb59f9f0496bda757fead238bd07e3a8.png.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000176', N'LD44', N'Cây Olive Màu Trắng', 555000.0000, 1, CAST(N'2021-10-22' AS Date), 1000, N'Tỷ lệ người với người có duyên gặp gỡ là một phần bảy tỷ. Trong tỷ lệ hiếm hoi ấy, trong vài tích tắc ngắn ngủi trước khi quả bom phát nổ, số phận của nữ phóng viên Tống Nhiễm và chuyên gia gỡ bom Lý Toản bỗng gắn chặt với nhau bằng một sợi dây chỉ đỏ.

Trải qua những phút giây hiểm nguy cận kề, những thời khắc tưởng chừng tất cả có thể nổ tung trong chớp mắt, hay khi bóng ma tâm lý bủa vây, họ vẫn luôn lặng lẽ dìu đỡ, chở che cho đối phương.

Trên mảnh đất bạc màu vì bom đạn anh chỉ cho cô thấy một cây olive trắng. Màu trắng đó tương trưng cho bi thương, mất mát, nhưng cũng chính là màu của dịu dàng, thuần khiết, như chính tình yêu của họ.

“Cây olive trắng dưới bầu trời sa mạc xanh trong, còn họ ở bên nhau, chứng minh rằng mọi chuyện không phải một giấc mộng.”', 433, N'https://salt.tikicdn.com/cache/200x200/ts/product/93/db/52/9df4a5761e7a25b053cf2a3edb34ab11.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000178', N'HN1', N'Chó sủa nhầm cây', 97500.0000, 3, CAST(N'2019-06-06' AS Date), 320, N'Bạn có biết:

- Các thủ khoa hiếm khi trở thành triệu phú, và nhược điểm lớn nhất có khi lại là ưu điểm tuyệt vời nhất mà ai ai cũng khao khát sở hữu.

- Ở công ty, sự chăm chỉ đang bị thổi phồng quá mức, còn những trò nịnh bợ lại thường mang đến kết quả tốt, và liệu đề cao chính nghĩa hay sa vào tà đạo mới là con đường dẫn đến thành công?

- Những người lính Navy SEAL và những nhân viên bán bảo hiểm có một điểm chung quan trọng, và cách sử dụng nguyên tắc WNGF trong thiết kế trò chơi để biến đống bài tập chán ngắt thành những trò chơi hấp dẫn. 

Rất nhiều lời khuyên về thành công rất logic, đầy cảm hứng, và sai bét. Bằng cách nhìn qua lăng kính khoa học để xem những người cực kỳ thành công khác với mình ở những điểm nào, ta học được cách để trở nên giống họ—và nhận ra trong vài trường hợp, không được như họ hóa ra lại tốt hơn.', 497, N'https://salt.tikicdn.com/cache/200x200/ts/product/03/ed/e9/32e1ff66be34767100fb05932e514065.jpg.webp', 1)
INSERT [dbo].[Books] ([BookID], [PublisherID], [Title], [Price], [TypeID], [PublishDate], [NoPages], [Description], [Quantity], [Image], [Status]) VALUES (N'10000179', N'AHA', N'Thú Tội', 169000.0000, 1, CAST(N'2018-12-13' AS Date), 245, N'<h2><strong>Th&uacute; tội</strong></h2>

<p>Cảnh s&aacute;t nhận định đ&acirc;y l&agrave; vụ tai nạn nhưng Moriguchi biết ai đ&atilde; s&aacute;t hại con g&aacute;i m&igrave;nh -&nbsp; kẻ ở ngay trong lớp học do m&igrave;nh chủ nhiệm. Moriguchi bắt đầu kế hoạch b&aacute;o th&ugrave; của ri&ecirc;ng c&ocirc;...</p>

<p>&quot;<em>Một c&acirc;u chuyện t&acirc;m l&yacute; kinh dị, ớn lạnh, thuyết phục, g&acirc;y bất ngờ kh&ocirc;ng chỉ một lần...Day dứt, t&agrave;n nhẫn v&agrave; cho&aacute;ng v&aacute;ng</em>.&quot;</p>

<p>- WALL STREET JOURNAL</p>

<p>&quot;<em>Cuốn s&aacute;ch đ&aacute;ng đọc n&agrave;y vừa tăm tối, g&acirc;y x&aacute;o động v&agrave; biết đ&aacute;nh lừa độc giả, với giọng văn sắc b&eacute;n, dồn dập, mỗi chương đều đưa người đọc tới tận c&ugrave;ng căng thẳng</em>.&quot;</p>

<p>- TORONTO STAR</p>
', 1995, N'https://salt.tikicdn.com/cache/200x200/ts/product/45/80/54/5c5a2c14bde00cc5be525efc1a0e16cc.jpg.webp', 1)
GO
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000123', N'A1')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000124', N'A2')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000125', N'A3')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000126', N'A4')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000127', N'A5')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000128', N'A6')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000129', N'A7')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000130', N'A8')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000131', N'A9')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000132', N'A10')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000133', N'A11')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000134', N'A12')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000134', N'A52')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000135', N'A13')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000136', N'A14')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000137', N'A15')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000138', N'A16')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000139', N'A17')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000140', N'A18')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000141', N'A19')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000142', N'A20')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000143', N'A21')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000143', N'A53')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000144', N'A22')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000145', N'A23')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000146', N'A24')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000147', N'A25')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000148', N'A26')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000148', N'A54')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000149', N'A27')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000150', N'A28')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000150', N'A55')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000151', N'A29')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000152', N'A30')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000152', N'A56')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000153', N'A31')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000154', N'A32')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000155', N'A33')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000156', N'A34')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000157', N'A35')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000158', N'A36')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000159', N'A37')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000160', N'A38')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000161', N'A39')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000162', N'A40')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000163', N'A41')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000164', N'A42')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000165', N'A43')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000166', N'A44')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000167', N'A45')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000167', N'A57')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000168', N'A46')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000169', N'A47')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000170', N'A48')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000171', N'A49')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000172', N'A50')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000172', N'A58')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000172', N'A59')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000173', N'A50')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000174', N'A111')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000176', N'A69')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000178', N'A16')
INSERT [dbo].[Books_Authors] ([BookID], [AuthorID]) VALUES (N'10000179', N'A13')
GO
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000123', N'017')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000124', N'012')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000126', N'003')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000128', N'015')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000129', N'003')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000130', N'014')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000132', N'018')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000133', N'017')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000134', N'002')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000135', N'013')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000138', N'007')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000140', N'006')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000141', N'007')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000143', N'006')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000144', N'003')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000145', N'012')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000146', N'018')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000147', N'019')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000148', N'019')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000149', N'006')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000150', N'003')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000151', N'011')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000152', N'018')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000154', N'003')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000156', N'015')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000157', N'004')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000158', N'012')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000160', N'014')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000161', N'001')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000162', N'007')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000163', N'002')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000164', N'019')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000166', N'016')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000167', N'013')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000168', N'007')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000169', N'015')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000171', N'019')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000178', N'014')
INSERT [dbo].[Books_Translators] ([BookID], [TranslatorID]) VALUES (N'10000179', N'008')
GO
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (3, CAST(N'2022-02-22' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (4, CAST(N'2022-02-22' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (5, CAST(N'2022-02-02' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (6, CAST(N'2022-02-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (7, CAST(N'2022-02-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (8, CAST(N'2022-02-28' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (9, CAST(N'2022-03-01' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (10, CAST(N'2022-03-03' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (11, CAST(N'2022-03-04' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (12, CAST(N'2022-03-05' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (13, CAST(N'2022-03-05' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (14, CAST(N'2022-03-05' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (15, CAST(N'2022-03-05' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (16, CAST(N'2022-03-05' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (17, CAST(N'2022-03-05' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (18, CAST(N'2022-03-06' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (19, CAST(N'2022-03-06' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (20, CAST(N'2022-03-06' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (21, CAST(N'2022-03-08' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (22, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (23, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (24, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (25, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (26, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (27, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (28, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (29, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (30, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (31, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (32, CAST(N'2022-03-09' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (33, CAST(N'2022-03-11' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (34, CAST(N'2022-03-11' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (35, CAST(N'2022-03-11' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (36, CAST(N'2022-03-11' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (37, CAST(N'2022-03-11' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (38, CAST(N'2022-03-11' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (39, CAST(N'2022-03-11' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (40, CAST(N'2022-03-11' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (41, CAST(N'2022-03-11' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (42, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (43, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (44, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (45, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (46, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (47, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (48, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (49, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (50, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (51, CAST(N'2022-03-12' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (52, CAST(N'2022-03-13' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (53, CAST(N'2022-03-13' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (54, CAST(N'2022-03-14' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (55, CAST(N'2022-03-15' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (56, CAST(N'2022-03-15' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (57, CAST(N'2022-03-15' AS Date), 2)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (3, CAST(N'2022-02-26' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (4, CAST(N'2022-02-26' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (5, CAST(N'2022-02-26' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (6, CAST(N'2022-02-17' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (7, CAST(N'2022-02-13' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (8, CAST(N'2022-03-05' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (10, CAST(N'2022-03-08' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (12, CAST(N'2022-03-09' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (13, CAST(N'2022-03-09' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (14, CAST(N'2022-03-08' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (15, CAST(N'2022-03-08' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (16, CAST(N'2022-03-08' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (19, CAST(N'2022-03-09' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (20, CAST(N'2022-03-09' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (21, CAST(N'2022-03-09' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (22, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (23, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (24, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (25, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (26, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (27, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (28, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (29, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (30, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (31, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (32, CAST(N'2022-03-11' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (33, CAST(N'2022-03-12' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (34, CAST(N'2022-03-12' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (35, CAST(N'2022-03-12' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (36, CAST(N'2022-03-12' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (37, CAST(N'2022-03-12' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (38, CAST(N'2022-03-12' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (39, CAST(N'2022-03-12' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (40, CAST(N'2022-03-12' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (41, CAST(N'2022-03-12' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (42, CAST(N'2022-03-14' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (44, CAST(N'2022-03-14' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (45, CAST(N'2022-03-14' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (47, CAST(N'2022-03-14' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (48, CAST(N'2022-03-14' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (49, CAST(N'2022-03-14' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (52, CAST(N'2022-03-14' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (53, CAST(N'2022-03-14' AS Date), 3)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (3, CAST(N'2022-02-28' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (4, CAST(N'2022-03-05' AS Date), 4)
GO
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (5, CAST(N'2022-03-01' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (6, CAST(N'2022-02-21' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (7, CAST(N'2022-02-17' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (8, CAST(N'2022-03-08' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (10, CAST(N'2022-03-09' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (11, CAST(N'2022-03-09' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (14, CAST(N'2022-03-09' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (15, CAST(N'2022-03-09' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (16, CAST(N'2022-03-09' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (17, CAST(N'2022-03-08' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (18, CAST(N'2022-03-08' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (19, CAST(N'2022-03-11' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (20, CAST(N'2022-03-11' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (21, CAST(N'2022-03-11' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (22, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (23, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (24, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (25, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (26, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (27, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (28, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (29, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (30, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (32, CAST(N'2022-03-12' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (43, CAST(N'2022-03-14' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (50, CAST(N'2022-03-14' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (51, CAST(N'2022-03-14' AS Date), 4)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (31, CAST(N'2022-03-12' AS Date), 5)
INSERT [dbo].[Order_Status] ([OrderID], [StatusDate], [StatusID]) VALUES (46, CAST(N'2022-03-14' AS Date), 5)
GO
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (3, N'10000123', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (3, N'10000125', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (3, N'10000130', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (3, N'10000146', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (3, N'10000156', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (4, N'10000155', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (4, N'10000171', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (4, N'10000173', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (5, N'10000155', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (6, N'10000125', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (6, N'10000133', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (7, N'10000134', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (7, N'10000139', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (7, N'10000150', 5)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (8, N'10000146', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (9, N'10000123', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (10, N'10000125', 4)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (11, N'10000128', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (12, N'10000125', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (12, N'10000155', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (12, N'10000174', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (13, N'10000125', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (14, N'10000149', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (15, N'10000130', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (16, N'10000123', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (17, N'10000125', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (17, N'10000126', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (17, N'10000129', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (18, N'10000142', 15)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (18, N'10000171', 23)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (19, N'10000140', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (19, N'10000145', 20)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (19, N'10000172', 17)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (20, N'10000128', 18)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (21, N'10000126', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (21, N'10000129', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (22, N'10000134', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (22, N'10000144', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (22, N'10000166', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (22, N'10000167', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (22, N'10000179', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (23, N'10000125', 4)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (23, N'10000135', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (23, N'10000152', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (23, N'10000161', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (23, N'10000173', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (24, N'10000156', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (24, N'10000157', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (24, N'10000158', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (24, N'10000159', 4)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (25, N'10000164', 9)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (25, N'10000170', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (25, N'10000176', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (25, N'10000178', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (26, N'10000150', 8)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (27, N'10000151', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (28, N'10000129', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (28, N'10000133', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (28, N'10000142', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (28, N'10000159', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (29, N'10000135', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (29, N'10000164', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (30, N'10000163', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (31, N'10000136', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (31, N'10000145', 4)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (31, N'10000148', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (31, N'10000162', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (31, N'10000163', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (32, N'10000155', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (32, N'10000156', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (32, N'10000160', 4)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (33, N'10000134', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (33, N'10000140', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (33, N'10000152', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (33, N'10000156', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (33, N'10000160', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (34, N'10000156', 4)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (34, N'10000164', 10)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (35, N'10000147', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (35, N'10000151', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (35, N'10000167', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (35, N'10000178', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (36, N'10000141', 21)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (37, N'10000152', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (37, N'10000173', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (37, N'10000174', 11)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (37, N'10000176', 10)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (38, N'10000128', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (38, N'10000131', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (38, N'10000140', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (38, N'10000148', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (38, N'10000170', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (39, N'10000125', 10)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (39, N'10000144', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (40, N'10000134', 8)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (40, N'10000136', 5)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (40, N'10000144', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (40, N'10000163', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (40, N'10000169', 5)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (40, N'10000172', 2)
GO
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (41, N'10000146', 6)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (41, N'10000151', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (41, N'10000153', 5)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (41, N'10000156', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (41, N'10000159', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (41, N'10000166', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (41, N'10000179', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (42, N'10000133', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (42, N'10000137', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (43, N'10000147', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (43, N'10000151', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (43, N'10000169', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (44, N'10000134', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (44, N'10000141', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (44, N'10000178', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (45, N'10000152', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (45, N'10000163', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (46, N'10000123', 5)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (46, N'10000137', 2)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (46, N'10000139', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (47, N'10000129', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (47, N'10000147', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (47, N'10000154', 3)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (48, N'10000131', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (48, N'10000149', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (49, N'10000126', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (49, N'10000144', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (49, N'10000152', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (50, N'10000164', 30)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (51, N'10000130', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (51, N'10000134', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (51, N'10000138', 14)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (52, N'10000166', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (52, N'10000168', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (52, N'10000169', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (52, N'10000171', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (52, N'10000172', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (53, N'10000145', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (53, N'10000149', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (53, N'10000152', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (54, N'10000145', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (54, N'10000154', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (54, N'10000170', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (55, N'10000126', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (56, N'10000124', 1)
INSERT [dbo].[OrderLines] ([OrderID], [BookID], [Quantity]) VALUES (57, N'10000126', 8)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (3, N'banhkeo', 1, CAST(N'2022-02-22' AS Date), N'Trần Ngọc Kỳ', N'0395778964', N'Số 12, ngách 9, đường Trần Duy Hưng, Hà Nội', N'applepen@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (4, N'banhkeo', 1, CAST(N'2022-02-22' AS Date), N'Trần Ngọc Nam', N'0391118964', N'Số 12, ngách 9, đường Lê Lợi, Hà Nội', N'cucai@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (5, N'user2', 3, CAST(N'2022-02-02' AS Date), N'Nguyễn Nghĩa', N'0312318964', N'Số 12, thôn 8, ngõ 10, quận 7, HCM', N'nghiavtn12@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (6, N'aaa', 2, CAST(N'2022-02-12' AS Date), N'Nguyễn Không', N'0169999654', N'Đường Lê Lợi, Cao Bằng', N'kokoco@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (7, N'fptalo', 4, CAST(N'2022-02-12' AS Date), N'Đại Đạo ĐI', N'0388888889', N'Đường 2 Bà Trưng, số 69, Hà Nội', N'aloalo@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (8, N'user2', 5, CAST(N'2022-02-28' AS Date), N'Nguyễn Nam', N'035687444', N'Số 37, quận Long Long, thành phố Vũng Tàu, tỉnh Phú Thọ', N'khahdddd@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (9, N'user2', 3, CAST(N'2022-03-01' AS Date), N'Nguyễn Nam Em', N'0123123123', N'Số 37, quận Long Long, thành phố Vũng Tàu, tỉnh Phú Thọ', N'lksdd@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (10, N'user2', 2, CAST(N'2022-03-03' AS Date), N'Toàn', N'333212145', N'Số 37, quận Long Long, thành phố Vũng Tàu, tỉnh Phú Thọ', N'eeeeeeeee@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (11, N'lophoc', 4, CAST(N'2022-03-04' AS Date), N'Học Thức', N'77778888999', N'Số 1, đường Trần Duy Hưng, Hà Nội', N'lanlophoc@fpt.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (12, N'lophoc', 2, CAST(N'2022-03-05' AS Date), N'Alam Linlcoaw', N'0333388817', N'35 UK, NGA, VN', N'alam@gmail.pov.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (13, N'lophoc', 1, CAST(N'2022-03-05' AS Date), N'Alam Linlcoaw', N'0333388817', N'35 UK, NGA, VN', N'alam@gmail.pov.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (14, N'lophoc', 5, CAST(N'2022-03-05' AS Date), N'Linda', N'0123123123', N'Xanh pot, UBND quận Thường Tín, Hà Nội', N'linda@edu.vn')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (15, N'lophoc', 2, CAST(N'2022-03-05' AS Date), N'Linda Khoip', N'0333388817', N'Số 37, quận Long Long, thành phố Vũng Tàu, tỉnh Phú Thọ', N'lanlophoc@fpt.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (16, N'lophoc', 1, CAST(N'2022-03-05' AS Date), N'Lan Anh Tan', N'0318776542', N'tòa nhà Đại Nguyễn đường 2 Bà Trưng, Nguyễn Du. Đống Đa Hà Nội', N'lananhne@yahoo.com.vn')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (17, N'lophoc', 1, CAST(N'2022-03-05' AS Date), N'Lan Anh Tan', N'0318776542', N'tòa nhà Đại Nguyễn đường 2 Bà Trưng, Nguyễn Du. Đống Đa Hà Nội', N'lananhne@yahoo.com.vn')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (18, N'user4', 4, CAST(N'2022-03-06' AS Date), N'MInhAnh', N'123457802', N'Cao Bằng, đường Lê Lợi, số 35, xã Hòa Lạc', N'minhanhne@hihi.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (19, N'admin', 1, CAST(N'2022-03-06' AS Date), N'Loiii', N'11221212121', N'Phố Nguyễn Trãi, đường 2 bà Trưng, ngã 3 Lê lợi, Hà Nam', N'loiiiiii@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (20, N'admin', 5, CAST(N'2022-03-06' AS Date), N'Trang Tran', N'09232312', N'ngã 3 đường Trương Định, Quận 7, Huế', N'trtrang@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (21, N'admin', 2, CAST(N'2022-03-08' AS Date), N'Trần Trung Hiếu', N'8383838383', N'thành phố Vĩnh Thịnh, tỉnh Cao bằng, Nghệ An, số nhà 34', N'hieudeptrai@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (22, N'user1', 1, CAST(N'2022-03-09' AS Date), N'Tú Trần', N'012345678', N'Số 2, đường Lê Lợi, Quận Thanh Xuân, Hà Nội', N'tutt@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (23, N'lanhoa', 4, CAST(N'2022-03-09' AS Date), N'Lan Hoa', N'7898788777', N'tòa nhà Lan Hoa, đường Láng, Văn Cao, Nguyễn Trãi, Lâm Đồng', N'lanhoa@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (24, N'user7', 5, CAST(N'2022-03-09' AS Date), N'Anh Bảy', N'0987777892', N'số 7, ngõ 7, quận 7, Sài Gòn', N'777bay@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (25, N'user7', 2, CAST(N'2022-03-09' AS Date), N'Anh Bảy', N'77778888999', N'Số 327, quận Long Long, thành phố Vũng Tàu, tỉnh Phú Thọ', N'777bay@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (26, N'user2', 2, CAST(N'2022-03-09' AS Date), N'Minh Vương', N'2222222201', N'số 2, ngách 2, quận 2 đường Trưng Trắc, Hà nam', N'vuongminh@gmail.com.us')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (27, N'user2', 2, CAST(N'2022-03-09' AS Date), N'Ngọc Văn', N'1234565432', N'Số 23, đường Trần Duy Hưng, Hà Nội', N'vanngoc@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (28, N'aaa', 2, CAST(N'2022-03-09' AS Date), N'aaan ân an', N'123123213', N'Chùa Hương, Vĩnh Phúc', N'an@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (29, N'aaa', 2, CAST(N'2022-03-09' AS Date), N'minh', N'1233313', N'tòa nhà Đại Nguyễn đường 2 Bà Trưng, Nguyễn Du. Đống Đa Hà Nội', N'lananhne@yahoo.com.vn')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (30, N'user4', 1, CAST(N'2022-03-09' AS Date), N'Anh Tư', N'4444444444', N'số 4, ngõ 4, đường An Dương  vương, Huế', N'tututu@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (31, N'prj301', 2, CAST(N'2022-03-09' AS Date), N'prj', N'101010101010', N'số 34, đường Lê Lơi, Vinh, Nghệ An', N'prj301@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (32, N'prj301', 4, CAST(N'2022-03-09' AS Date), N'prj', N'101010101010', N'Cao Bằng, đường Lê Lợi, số 35, xã Hòa Lạc', N'prj301@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (33, N'user7', 1, CAST(N'2022-03-11' AS Date), N'Anh Bảy', N'77778888999', N'tòa nhà Đại Nguyễn đường 2 Bà Trưng, Nguyễn Du. Đống Đa Hà Nội', N'777bay@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (34, N'user7', 3, CAST(N'2022-03-11' AS Date), N'Anh Bảy', N'77778888999', N'Số 37, quận Long Long, thành phố Vũng Tàu, tỉnh Phú Thọ', N'777bay@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (35, N'sachvo', 4, CAST(N'2022-03-11' AS Date), N'Nguyen Van Sach', N'0983239322', N'đường Tô Hiệu, hàng Kênh, Hải Phòng', N'sachvo@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (36, N'sachvo', 1, CAST(N'2022-03-11' AS Date), N'Nguyen Thi Huệ', N'0391293112', N'số 33, đường Nguyễn Huệ, Hà Nội', N'huent@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (37, N'deptrai123', 4, CAST(N'2022-03-11' AS Date), N'Tria tria', N'032192822', N'số 1 đường Nguyễn Trãi phố Lê Lợi, Trần Duy Hưng', N'deptrai@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (38, N'doudoudou', 5, CAST(N'2022-03-11' AS Date), N'đâu đê đi', N'123123123', N'đường 2 chiều, ngã 3', N'doudoud@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (39, N'doudoudou', 1, CAST(N'2022-03-11' AS Date), N'đường văn ngoan', N'21382372711', N'đường 4 chiều, ngã 2 ngách 4 quận 6', N'ngoanngoan@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (40, N'fptalo', 2, CAST(N'2022-03-11' AS Date), N'Đại học', N'9099382882', N'phố Tàu, đường Chỉnh, quận 3, ngahcs 23', N'deptrai@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (41, N'fptalo', 3, CAST(N'2022-03-11' AS Date), N'Nguyễn Nam', N'101010101010', N'Số 1, đường Trần Duy Hưng, Hà Nội', N'123aaa@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (42, N'fptalo', 1, CAST(N'2022-03-12' AS Date), N'Lan Anh Tan', N'0192383822', N'ngo 3 đường Láng Hòa Lạc, số 24', N'fpTTT@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (43, N'fptalo', 2, CAST(N'2022-03-12' AS Date), N'Nguyen Van A', N'0929100223', N'Tòa A nhà B tầng 10 phòng 509B, HP', N'angytenavan@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (44, N'minhanh', 5, CAST(N'2022-03-12' AS Date), N'Minh Anh', N'0919321929', N'số 19, quận K, nhà A ngõ B Hà Nội', N'minanhne@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (45, N'minhanh', 1, CAST(N'2022-03-12' AS Date), N'Minh Anh', N'0333388817', N'Số 1, đường Trần Duy Hưng, Hà Nội', N'minanhne@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (46, N'minhanh', 4, CAST(N'2022-03-12' AS Date), N'Minh Anh', N'0318776542', N'Số 1, đường Trần Duy Hưng, Hà Nội', N'minanhne@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (47, N'banhkeo', 2, CAST(N'2022-03-12' AS Date), N'Keo keo', N'7819938282', N'Pho Banh keo duong vang ma quan 8', N'ankeoko@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (48, N'banhkeo', 3, CAST(N'2022-03-12' AS Date), N'Lan Anh Tan', N'0283877827', N'ngach 19, so 1, quận K, nhà A ngõ B Hà Nội', N'bankkeo@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (49, N'user7', 2, CAST(N'2022-03-12' AS Date), N'Anh Bảy', N'77778888999', N'Cao Bằng, đường Lê Lợi, số 35, xã Hòa Lạc', N'777bay@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (50, N'nhunguyet', 1, CAST(N'2022-03-12' AS Date), N'Nguyệt', N'0987838221', N'số 12, đường 12, ngách 123, quận 7 Thành phố Hồ Chí Minh', N'nguyetneahihi@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (51, N'nhunguyet', 3, CAST(N'2022-03-12' AS Date), N'Nguyệt', N'0123123123', N'đường 2 chiều, ngã 3 4 quận Cam Ranh', N'nguyetneahihi@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (52, N'ura', 1, CAST(N'2022-03-13' AS Date), N'Ura', N'090983221', N'ura ura ngach 3 quan 7 so 15', N'ura123@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (53, N'ura', 1, CAST(N'2022-03-13' AS Date), N'Ura', N'039129', N'duong doi quan 2 ba trung le loi duong giai phong', N'ura123@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (54, N'ura', 4, CAST(N'2022-03-14' AS Date), N'Ura', N'09888282818', N'35 UK, NGA, VN', N'ura123@gmail.com')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (55, N'admin', 1, CAST(N'2022-03-15' AS Date), N'Lan Anh Tan', N'0333388817', N'tòa nhà Đại Nguyễn đường 2 Bà Trưng, Nguyễn Du. Đống Đa Hà Nội', N'lananhne@yahoo.com.vn')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (56, N'admin', 3, CAST(N'2022-03-15' AS Date), N'Lan Anh Tan', N'123123123123', N'Số 37, quận Long Long, thành phố Vũng Tàu, tỉnh Phú Thọ', N'lananhne@yahoo.com.vn')
INSERT [dbo].[Orders] ([OrderID], [Username], [ShipMethodID], [OrderDate], [CusName], [CusPhone], [CusAddress], [CusEmail]) VALUES (57, N'admin', 1, CAST(N'2022-03-15' AS Date), N'Lan Anh Tan', N'0318776542', N'tòa nhà Đại Nguyễn đường 2 Bà Trưng, Nguyễn Du. Đống Đa Hà Nội', N'lananhne@yahoo.com.vn')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'AHA', N'Anh Hào')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'GD', N'Giáo dục')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'HN1', N'Hà Nội')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'HNV123', N'Hội nhà văn')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'KD12', N'Kim Đồng')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'LD44', N'Lao động')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'PNVN', N'Phụ nữ Việt Nam')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'TG5', N'Thế giới')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'TRE98', N'Trẻ')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'TT', N'Tri thức')
INSERT [dbo].[Publishers] ([PubID], [PubName]) VALUES (N'VH001', N'Văn học')
GO
INSERT [dbo].[ShippingMethods] ([MethodID], [MethodName], [Cost], [ShippingTime]) VALUES (1, N'Ship COD', 20000.0000, 5)
INSERT [dbo].[ShippingMethods] ([MethodID], [MethodName], [Cost], [ShippingTime]) VALUES (2, N'Giao hàng bưu điện', 15000.0000, 7)
INSERT [dbo].[ShippingMethods] ([MethodID], [MethodName], [Cost], [ShippingTime]) VALUES (3, N'Giao hàng tiết kiệm', 5000.0000, 14)
INSERT [dbo].[ShippingMethods] ([MethodID], [MethodName], [Cost], [ShippingTime]) VALUES (4, N'Dịch vụ đảm bảo', 10000.0000, 7)
INSERT [dbo].[ShippingMethods] ([MethodID], [MethodName], [Cost], [ShippingTime]) VALUES (5, N'Giao hàng nhanh', 30000.0000, 2)
GO
INSERT [dbo].[Status] ([StatusID], [StatusValue]) VALUES (2, N'Đang xử lí')
INSERT [dbo].[Status] ([StatusID], [StatusValue]) VALUES (3, N'Đang vận chuyển')
INSERT [dbo].[Status] ([StatusID], [StatusValue]) VALUES (4, N'Đã giao')
INSERT [dbo].[Status] ([StatusID], [StatusValue]) VALUES (5, N'Đã hủy')
GO
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'001', N'Nguyễn Hữu Đạt')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'002', N'Uyên Thiểm')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'003', N'Siu Pham')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'004', N'Nguyễn Quang Phương')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'005', N'Trần Quốc Tuấn')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'006', N'Nguyễn Nam')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'007', N'Trần Bằng')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'008', N'Phan Văn Tài Em')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'009', N'Giang')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'010', N'Vương Hải Yến')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'011', N'Phúc Du')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'012', N'Lý Quốc Sỉnh')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'013', N'Tất An')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'014', N'Quốc Cường')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'015', N'Xuân Sơn')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'016', N'Nguyễn Phúc')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'017', N'Văn Hậu')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'018', N'Công Phượng')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'019', N'Tuấn')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'020', N'Trung Kiên')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'069', N'Quang Toản')
INSERT [dbo].[Translators] ([TranslatorID], [TranslatorName]) VALUES (N'23', N'Minh Anh Linh')
GO
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (1, N'Sách văn học')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (2, N'Sách tâm lý')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (3, N'Sách kinh tế')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (4, N'Truyện tranh')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (5, N'Sách du lịch')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (6, N'Sách lịch sử')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (7, N'Sách sinh học')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (8, N'Sách giáo khoa')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (9, N'Sách tôn giáo')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__A9D105347D653FFE]    Script Date: 3/24/2022 2:57:36 PM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,/*SORT_IN_TEMPDB = OFF*/IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [DF_status]  DEFAULT ('1') FOR [Status]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publishers] ([PubID])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([TypeID])
GO
ALTER TABLE [dbo].[Books_Authors]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[Books_Authors]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[Books_Translators]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[Books_Translators]  WITH CHECK ADD FOREIGN KEY([TranslatorID])
REFERENCES [dbo].[Translators] ([TranslatorID])
GO
ALTER TABLE [dbo].[Order_Status]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Status]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ShipMethodID])
REFERENCES [dbo].[ShippingMethods] ([MethodID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
