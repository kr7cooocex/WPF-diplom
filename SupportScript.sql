USE [master]
GO
/****** Object:  Database [Support]    Script Date: 26.01.2025 21:42:02 ******/
CREATE DATABASE [Support]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Support', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Support.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Support_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Support_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Support] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Support].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Support] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Support] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Support] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Support] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Support] SET ARITHABORT OFF 
GO
ALTER DATABASE [Support] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Support] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Support] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Support] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Support] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Support] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Support] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Support] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Support] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Support] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Support] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Support] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Support] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Support] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Support] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Support] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Support] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Support] SET RECOVERY FULL 
GO
ALTER DATABASE [Support] SET  MULTI_USER 
GO
ALTER DATABASE [Support] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Support] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Support] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Support] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Support] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Support] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Support', N'ON'
GO
ALTER DATABASE [Support] SET QUERY_STORE = ON
GO
ALTER DATABASE [Support] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Support]
GO
/****** Object:  Table [dbo].[Customer_requests]    Script Date: 26.01.2025 21:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_requests](
	[customer_request_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_ask] [nvarchar](300) NULL,
	[problem_id] [int] NOT NULL,
	[login_vdi] [nvarchar](50) NOT NULL,
	[password_vdi] [nvarchar](50) NOT NULL,
	[customer_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[status_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Customer_requests] PRIMARY KEY CLUSTERED 
(
	[customer_request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 26.01.2025 21:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](256) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone_number] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 26.01.2025 21:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Problems]    Script Date: 26.01.2025 21:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problems](
	[problem_id] [int] IDENTITY(1,1) NOT NULL,
	[problem_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Problems] PRIMARY KEY CLUSTERED 
(
	[problem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ranks]    Script Date: 26.01.2025 21:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ranks](
	[rank_id] [int] NOT NULL,
	[rank_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ranks] PRIMARY KEY CLUSTERED 
(
	[rank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26.01.2025 21:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 26.01.2025 21:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26.01.2025 21:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[date_of_birth] [date] NULL,
	[rank_id] [int] NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
	[department_id] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer_requests] ON 

INSERT [dbo].[Customer_requests] ([customer_request_id], [customer_ask], [problem_id], [login_vdi], [password_vdi], [customer_id], [date], [status_id], [user_id]) VALUES (22, N'78787878, 787878, 7878787. 56-78?', 2, N'78787878', N'78787878', 12, CAST(N'2025-01-23T11:22:03.597' AS DateTime), 0, 5)
SET IDENTITY_INSERT [dbo].[Customer_requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([customer_id], [login], [password], [name], [phone_number], [email]) VALUES (12, N'7878', N'7878', N'7878', N'7878787878', N'7878@78.com')
INSERT [dbo].[Customers] ([customer_id], [login], [password], [name], [phone_number], [email]) VALUES (13, N'456', N'456', N'456', N'456456456456', N'456456456@56.45')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([department_id], [department_name]) VALUES (1, N'call_centre')
INSERT [dbo].[Departments] ([department_id], [department_name]) VALUES (2, N'диспетчерская')
INSERT [dbo].[Departments] ([department_id], [department_name]) VALUES (3, N'серверная')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Problems] ON 

INSERT [dbo].[Problems] ([problem_id], [problem_name]) VALUES (1, N'Проблема с продуктом')
INSERT [dbo].[Problems] ([problem_id], [problem_name]) VALUES (2, N'Задать вопрос')
INSERT [dbo].[Problems] ([problem_id], [problem_name]) VALUES (3, N'Сообщить о баге')
INSERT [dbo].[Problems] ([problem_id], [problem_name]) VALUES (4, N'Предложить идею')
SET IDENTITY_INSERT [dbo].[Problems] OFF
GO
INSERT [dbo].[Ranks] ([rank_id], [rank_name]) VALUES (1, N'ИТ специалист')
INSERT [dbo].[Ranks] ([rank_id], [rank_name]) VALUES (2, N'Секретарь')
INSERT [dbo].[Ranks] ([rank_id], [rank_name]) VALUES (3, N'Системный администратор')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'user')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'SystemAdministrator')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (0, N'Открыт')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (1, N'В работе')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (2, N'Требуется информация')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (3, N'Завершён')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [name], [date_of_birth], [rank_id], [login], [password], [role_id], [department_id]) VALUES (1, N'admin', CAST(N'1985-09-04' AS Date), 1, N'admin', N'admin', 1, 3)
INSERT [dbo].[Users] ([user_id], [name], [date_of_birth], [rank_id], [login], [password], [role_id], [department_id]) VALUES (2, N'svetlana', CAST(N'1999-06-09' AS Date), 2, N'sveta', N'sveta', 2, 1)
INSERT [dbo].[Users] ([user_id], [name], [date_of_birth], [rank_id], [login], [password], [role_id], [department_id]) VALUES (3, N'SystemAdministrator', CAST(N'1980-03-04' AS Date), 3, N'sys', N'sys', 3, 2)
INSERT [dbo].[Users] ([user_id], [name], [date_of_birth], [rank_id], [login], [password], [role_id], [department_id]) VALUES (4, N'new', CAST(N'1980-06-06' AS Date), 2, N'new', N'new', 2, 3)
INSERT [dbo].[Users] ([user_id], [name], [date_of_birth], [rank_id], [login], [password], [role_id], [department_id]) VALUES (5, N'Никто', NULL, 2, N'null', N'null', 2, 3)
INSERT [dbo].[Users] ([user_id], [name], [date_of_birth], [rank_id], [login], [password], [role_id], [department_id]) VALUES (6, N'old', CAST(N'1985-09-04' AS Date), 2, N'old', N'old', 2, 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Customer_requests]  WITH CHECK ADD  CONSTRAINT [FK_Customer_requests_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Customer_requests] CHECK CONSTRAINT [FK_Customer_requests_Customers]
GO
ALTER TABLE [dbo].[Customer_requests]  WITH CHECK ADD  CONSTRAINT [FK_Customer_requests_Problems] FOREIGN KEY([problem_id])
REFERENCES [dbo].[Problems] ([problem_id])
GO
ALTER TABLE [dbo].[Customer_requests] CHECK CONSTRAINT [FK_Customer_requests_Problems]
GO
ALTER TABLE [dbo].[Customer_requests]  WITH CHECK ADD  CONSTRAINT [FK_Customer_requests_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[Customer_requests] CHECK CONSTRAINT [FK_Customer_requests_Status]
GO
ALTER TABLE [dbo].[Customer_requests]  WITH CHECK ADD  CONSTRAINT [FK_Customer_requests_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Customer_requests] CHECK CONSTRAINT [FK_Customer_requests_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Departments] FOREIGN KEY([department_id])
REFERENCES [dbo].[Departments] ([department_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Departments]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Ranks] FOREIGN KEY([rank_id])
REFERENCES [dbo].[Ranks] ([rank_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Ranks]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [Support] SET  READ_WRITE 
GO
