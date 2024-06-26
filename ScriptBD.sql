USE [ArchiveVSK]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 23.06.2024 17:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarModels]    Script Date: 23.06.2024 17:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModels](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[BrandID] [int] NOT NULL,
	[ModelName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 23.06.2024 17:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[BrandID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
	[YearRelease] [int] NOT NULL,
	[VIN] [nvarchar](50) NOT NULL,
	[RegistrationNumber] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 23.06.2024 17:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[CarID] [int] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsuranceTypes]    Script Date: 23.06.2024 17:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceTypes](
	[InsuranceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InsuranceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policies]    Script Date: 23.06.2024 17:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policies](
	[PolicyID] [int] IDENTITY(1,1) NOT NULL,
	[PolicyNumber] [nvarchar](50) NOT NULL,
	[ClientID] [int] NULL,
	[InsuranceTypeID] [int] NULL,
	[CarID] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CostPolicy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 23.06.2024 17:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23.06.2024 17:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (1, N'Audi')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (2, N'BMW')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (3, N'Mercedes-Benz')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (4, N'Toyota')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (5, N'Honda')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (6, N'Ford')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (7, N'Volkswagen')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (8, N'Hyundai')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (9, N'Nissan')
INSERT [dbo].[Brands] ([BrandID], [BrandName]) VALUES (10, N'Chevrolet')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[CarModels] ON 

INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (1, 1, N'A4')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (3, 1, N'A6')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (2, 1, N'Q5')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (4, 2, N'3 Series')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (5, 2, N'5 Series')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (6, 2, N'X5')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (8, 3, N'C-Class')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (7, 3, N'E-Class')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (9, 3, N'S-Class')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (10, 4, N'Camry')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (11, 4, N'Corolla')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (12, 4, N'Rav4')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (14, 5, N'Accord')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (13, 5, N'Civic')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (15, 5, N'CR-V')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (17, 6, N'Fiesta')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (16, 6, N'Focus')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (18, 6, N'Mustang')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (19, 7, N'Golf')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (20, 7, N'Passat')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (21, 7, N'Tiguan')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (22, 8, N'Elantra')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (23, 8, N'Sonata')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (24, 8, N'Tucson')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (25, 9, N'Altima')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (27, 9, N'Rogue')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (26, 9, N'Sentra')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (28, 10, N'Cruze')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (30, 10, N'Equinox')
INSERT [dbo].[CarModels] ([ModelID], [BrandID], [ModelName]) VALUES (29, 10, N'Malibu')
SET IDENTITY_INSERT [dbo].[CarModels] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (1, 1, 1, 2018, N'WAUZZZF42JA000001', N'А123ВВ456')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (2, 1, 2, 2019, N'WA1AAAF78JD000002', N'В456ЕЕ789')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (3, 1, 3, 2020, N'WA12345678AB000003', N'С789ОО012')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (4, 2, 4, 2020, N'WBA5R1C53LF000003', N'Е789КК012')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (5, 2, 5, 2017, N'WBA8E5G5XH0K000004', N'К012ММ345')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (6, 2, 6, 2018, N'WB1234567LK000005', N'М345СС678')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (7, 3, 7, 2016, N'WDDZF4JB8HA000005', N'М345НН678')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (8, 3, 8, 2015, N'WDC0J8DB9FF000006', N'Н678ОО901')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (9, 3, 9, 2017, N'WD1234567CF000007', N'О901УУ234')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (10, 4, 10, 2014, N'4T1BF1FK9EU000007', N'О901РР234')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (11, 4, 11, 2013, N'5YFBURHE3HP000008', N'Р234СС567')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (12, 4, 12, 2015, N'5Y1234567HP000009', N'С567АА890')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (13, 5, 13, 2012, N'2HGFG3B5XFH000009', N'С567ТТ890')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (14, 5, 14, 2011, N'JHMFA3F25BS000010', N'Т890УУ123')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (15, 5, 15, 2013, N'JH1234567AB000011', N'У123ВВ456')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (16, 6, 16, 2010, N'1FA6P8CF1F5G000011', N'У123ХХ456')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (17, 6, 17, 2009, N'1FADP3F24FL000012', N'Х456АА789')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (18, 6, 18, 2011, N'1F1234567F5G000013', N'А789СС012')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (19, 7, 19, 2008, N'WVWBB7AJ4CW000013', N'В789ЕЕ012')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (20, 7, 20, 2007, N'1VWAT7A32CC000014', N'Е012КК345')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (21, 7, 21, 2009, N'WV1234567CC000015', N'К345ММ678')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (22, 8, 22, 2006, N'KMHDU46D48U000015', N'К345ММ678')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (23, 8, 23, 2005, N'5NPEU46F68H000016', N'М678НН901')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (24, 8, 24, 2008, N'KM1234567DH000017', N'Н901ОО234')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (25, 9, 25, 2004, N'1N4AL11D14N000017', N'Н901ОО234')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (26, 9, 26, 2003, N'3N1AB7AP5KY000018', N'О234РР567')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (27, 9, 27, 2005, N'1N1234567KY000019', N'Р567СС890')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (28, 10, 28, 2002, N'1G1PC5SB4D7K000019', N'Р567СС890')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (29, 10, 29, 2001, N'1G1ZB5ST3HF000020', N'С890ТТ123')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (30, 10, 30, 2004, N'1G1234567HF000021', N'ТТ123ТТ456')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (72, 2, 5, 3245, N'sdfgsdfg', N'sdgdsg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (73, 4, 10, 2345, N'dfgh', N'dfghdf')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (74, 3, 3, 3245, N'sdfgsdg', N'sdfgsdg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (75, 9, 27, 5234, N'sdfgsd', N'sdfgsdg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (76, 3, 8, 3245, N'sdfgsdg', N'sdfgsdg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (77, 10, 29, 2345, N'dfghdfh', N'dfghdfgh')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (78, 3, 7, 3456, N'dfghdfh', N'dfghdfh')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (79, 2, 4, 4356, N'dsfgsdfg', N'sdfgsdg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (80, 3, 7, 2345, N'sdfgsdfg', N'sdfgsdfg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (81, 3, 7, 2345, N'sdfgsdfg', N'sdfgsdfg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (82, 3, 8, 211, N'sdfgsd', N'sdfgsdg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (83, 3, 8, 211, N'sdfgsd', N'sdfgsdg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (84, 5, 13, 3425, N'sdfgsdg', N'sdgsdg')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (85, 4, 12, 2006, N'dfgbdfgb', N'dfgbdfgb')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (86, 4, 12, 2006, N'dfgbdfgb', N'dfgbdfgb')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (87, 9, 27, 2006, N'dfgbdfgb', N'dfgbdfgb')
INSERT [dbo].[Cars] ([CarID], [BrandID], [ModelID], [YearRelease], [VIN], [RegistrationNumber]) VALUES (88, 3, 7, 345, N'dfghfdgh', N'fghdfghdfghfdg')
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (1, N'Иван', N'Иванов', N'Иванович', CAST(N'1985-05-10' AS Date), N'Москва, ул. Ленина, д. 10', N'1234567890', N'ivanov@example.com', 1, 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (2, N'Петр', N'Петров', N'Петрович', CAST(N'1990-08-15' AS Date), N'Санкт-Петербург, ул. Пушкина, д. 20', N'9876543210', N'petrov@example.com', 5, 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (3, N'Мария', N'Сидорова', N'Ивановна', CAST(N'1988-02-20' AS Date), N'Екатеринбург, ул. Гагарина, д. 30', N'5556667777', N'sidorova@example.com', 7, 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (4, N'Елена', N'Николаева', N'Петровна', CAST(N'1995-11-25' AS Date), N'Новосибирск, ул. Лермонтова, д. 40', N'4443332222', N'nikolaeva@example.com', 17, 3)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (5, N'Алексей', N'Кузнецов', N'Александрович', CAST(N'1980-04-30' AS Date), N'Казань, ул. Пушкина, д. 50', N'6667778888', N'kuznetsov@example.com', 12, 2)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (22, N'dfghdfh', N'fdhfg', N'dfghdfgh', CAST(N'2024-05-31' AS Date), N'dfghdfdf', N'34564', N'dfgh', 72, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (23, N'dfghd', N'dfgh', N'dfgh', CAST(N'2024-05-27' AS Date), N'dghd', N'43564', N'fghdfgh', 73, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (24, N'sdgf', N'sdg', N'sdfgsd', CAST(N'2024-05-27' AS Date), N'sdgsdg', N'3452', N'dsgfsdg', 74, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (25, N'sdgsd', N'dgs', N'sdgsd', CAST(N'2024-05-29' AS Date), N'sdfgsd3425', N'2345', N'dsfg', 75, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (26, N'sdgf', N'sdg', N'sdfgsd', CAST(N'2024-05-27' AS Date), N'sdgsdg', N'3452', N'dsgfsdg', 76, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (27, N'sdgsdg', N'dfgs', N'sdfgsdg', CAST(N'2024-06-19' AS Date), N'sdgs', N'2345', N'gfsg', 77, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (28, N'hdfghdfhdfghdf', N'dfhdf', N'ghdfh', CAST(N'2024-06-11' AS Date), N'fdhd', N'456', N'dgh', 78, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (29, N'ghdfghdgh', N'dfghdf', N'dfghdf', CAST(N'2024-06-06' AS Date), N'dfghdf', N'356', N'dfghd', 79, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (30, N'gsdfgsdg', N'sdgsd', N'sdgfsdg', CAST(N'2024-05-28' AS Date), N'sdf', N'34535', N'dsgd', 80, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (31, N'gsdfgsdg', N'sdgsd', N'sdgfsdg', CAST(N'2024-05-28' AS Date), N'sdf', N'34535', N'dsgd', 81, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (32, N'wertw', N'sdfgsdgd', N'sdfgsdfg', CAST(N'2024-05-27' AS Date), N'sdfgsd', N'234532', N'sdgsdg', 82, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (33, N'wertw', N'sdfgsdgd', N'sdfgsdfg', CAST(N'2024-05-27' AS Date), N'sdfgsd', N'234532', N'sdgsdg', 83, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (34, N'dfghdfh', N'fghdfgh', N'dfghdfgh', CAST(N'2024-06-03' AS Date), N'dfghd', N'4536456', N'dfghd', 84, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (35, N'sdfvsdfv', N'csadc', N'sdfvsd', CAST(N'2024-07-03' AS Date), N'vsdf', N'4356345', N'dfgb', 85, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (36, N'sdfvsdfv', N'csadc', N'sdfvsd', CAST(N'2024-07-03' AS Date), N'vsdf', N'4356345', N'dfgb', 86, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (37, N'sdfvsdfv', N'csadc', N'sdfvsd', CAST(N'2024-07-03' AS Date), N'vsdf', N'4356345', N'dfgb', 87, NULL)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [LastName], [Patronymic], [DateOfBirth], [Address], [PhoneNumber], [Email], [CarID], [UserID]) VALUES (38, N'dsfgdsg', N'sdfgd', N'dsfgsdf', CAST(N'2024-06-03' AS Date), N'dsfgsdg', N'3456436', N'ddfgh', 88, NULL)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[InsuranceTypes] ON 

INSERT [dbo].[InsuranceTypes] ([InsuranceTypeID], [TypeName]) VALUES (1, N'Каско')
INSERT [dbo].[InsuranceTypes] ([InsuranceTypeID], [TypeName]) VALUES (2, N'ОСАГО')
SET IDENTITY_INSERT [dbo].[InsuranceTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Policies] ON 

INSERT [dbo].[Policies] ([PolicyID], [PolicyNumber], [ClientID], [InsuranceTypeID], [CarID], [StartDate], [EndDate], [CostPolicy]) VALUES (1, N'П-12345', 1, 1, 1, CAST(N'2024-06-22' AS Date), CAST(N'2025-01-01' AS Date), 7500)
INSERT [dbo].[Policies] ([PolicyID], [PolicyNumber], [ClientID], [InsuranceTypeID], [CarID], [StartDate], [EndDate], [CostPolicy]) VALUES (2, N'П-23456', 2, 2, 5, CAST(N'2024-02-15' AS Date), CAST(N'2025-02-28' AS Date), 20000)
INSERT [dbo].[Policies] ([PolicyID], [PolicyNumber], [ClientID], [InsuranceTypeID], [CarID], [StartDate], [EndDate], [CostPolicy]) VALUES (3, N'П-34567', 3, 1, 7, CAST(N'2024-06-22' AS Date), CAST(N'2025-03-20' AS Date), 3054)
INSERT [dbo].[Policies] ([PolicyID], [PolicyNumber], [ClientID], [InsuranceTypeID], [CarID], [StartDate], [EndDate], [CostPolicy]) VALUES (4, N'П-45678', 4, 1, 17, CAST(N'2024-06-23' AS Date), CAST(N'2025-04-15' AS Date), 6876)
INSERT [dbo].[Policies] ([PolicyID], [PolicyNumber], [ClientID], [InsuranceTypeID], [CarID], [StartDate], [EndDate], [CostPolicy]) VALUES (5, N'П-56789', 5, 2, 12, CAST(N'2024-06-22' AS Date), CAST(N'2025-05-10' AS Date), 23150)
SET IDENTITY_INSERT [dbo].[Policies] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Агент')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role_ID]) VALUES (1, N'admin', N'Admin@1', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role_ID]) VALUES (2, N'manager1', N'Manager@1', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Role_ID]) VALUES (3, N'agent1', N'Agent@1', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CarModel__8CA93584E0CC6098]    Script Date: 23.06.2024 17:04:39 ******/
ALTER TABLE [dbo].[CarModels] ADD UNIQUE NONCLUSTERED 
(
	[BrandID] ASC,
	[ModelName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CarModels]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([ModelID])
REFERENCES [dbo].[CarModels] ([ModelID])
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD FOREIGN KEY([InsuranceTypeID])
REFERENCES [dbo].[InsuranceTypes] ([InsuranceTypeID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
