USE [master]
GO
/****** Object:  Database [clown_von_db]    Script Date: 3/21/2020 2:32:56 PM ******/
CREATE DATABASE [clown_von_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clown_von_db', FILENAME = N'D:\rdsdbdata\DATA\clown_von_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'clown_von_db_log', FILENAME = N'D:\rdsdbdata\DATA\clown_von_db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [clown_von_db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clown_von_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clown_von_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clown_von_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clown_von_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clown_von_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clown_von_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [clown_von_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clown_von_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clown_von_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clown_von_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clown_von_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clown_von_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clown_von_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clown_von_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clown_von_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clown_von_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [clown_von_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clown_von_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clown_von_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clown_von_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clown_von_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clown_von_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clown_von_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clown_von_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [clown_von_db] SET  MULTI_USER 
GO
ALTER DATABASE [clown_von_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clown_von_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clown_von_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clown_von_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [clown_von_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [clown_von_db] SET QUERY_STORE = OFF
GO
USE [clown_von_db]
GO
/****** Object:  User [countess_bathory]    Script Date: 3/21/2020 2:32:58 PM ******/
CREATE USER [countess_bathory] FOR LOGIN [countess_bathory] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [countess_bathory]
GO
/****** Object:  Table [dbo].[form_daily]    Script Date: 3/21/2020 2:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[form_daily](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sub_id] [int] NULL,
	[original] [text] NULL,
	[edits] [text] NULL,
	[hours_total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[form_mileage]    Script Date: 3/21/2020 2:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[form_mileage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sub_id] [int] NULL,
	[original] [text] NULL,
	[edits] [text] NULL,
	[miles_total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[form_weekly]    Script Date: 3/21/2020 2:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[form_weekly](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sub_id] [int] NULL,
	[original] [text] NULL,
	[edits] [text] NULL,
	[hours_total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mileage_entry]    Script Date: 3/21/2020 2:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mileage_entry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entry_date] [datetime] NULL,
	[miles] [float] NULL,
	[group_title] [varchar](15) NULL,
	[form_id] [int] NULL,
	[form_table] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 3/21/2020 2:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NULL,
	[admin_portal] [int] NOT NULL,
	[submit_docs] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[submissions]    Script Date: 3/21/2020 2:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[submissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sub_date] [date] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[service_auth] [varchar](100) NULL,
	[prime] [varchar](50) NULL,
	[provider_id] [varchar](50) NULL,
	[documents] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_table]    Script Date: 3/21/2020 2:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_table](
	[id] [int] NULL,
	[description] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[time_entry]    Script Date: 3/21/2020 2:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[time_entry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entry_date] [datetime] NULL,
	[in_time] [datetime] NULL,
	[out_time] [datetime] NULL,
	[total_hours] [float] NULL,
	[group_title] [varchar](15) NULL,
	[form_id] [int] NULL,
	[form_table] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/21/2020 2:32:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](300) NULL,
	[usr_role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[form_daily]  WITH CHECK ADD FOREIGN KEY([sub_id])
REFERENCES [dbo].[submissions] ([id])
GO
ALTER TABLE [dbo].[form_mileage]  WITH CHECK ADD FOREIGN KEY([sub_id])
REFERENCES [dbo].[submissions] ([id])
GO
ALTER TABLE [dbo].[form_weekly]  WITH CHECK ADD FOREIGN KEY([sub_id])
REFERENCES [dbo].[submissions] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([usr_role])
REFERENCES [dbo].[roles] ([id])
GO
USE [master]
GO
ALTER DATABASE [clown_von_db] SET  READ_WRITE 
GO
