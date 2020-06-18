USE [master]
GO
/****** Object:  Database [KangmeiHospitalCRM]    Script Date: 2020/6/16 22:03:13 ******/
CREATE DATABASE [KangmeiHospitalCRM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KangmeiHospitalCRM', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\KangmeiHospitalCRM.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KangmeiHospitalCRM_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\KangmeiHospitalCRM_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KangmeiHospitalCRM] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KangmeiHospitalCRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KangmeiHospitalCRM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET ARITHABORT OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET RECOVERY FULL 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET  MULTI_USER 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KangmeiHospitalCRM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KangmeiHospitalCRM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KangmeiHospitalCRM', N'ON'
GO
USE [KangmeiHospitalCRM]
GO
/****** Object:  Table [dbo].[ClientMdicalIformation]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














CREATE TABLE [dbo].[ClientMdicalIformation](
	[ConclusionID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int]  NOT NULL,
	[CustomerAppointmentID] [int]  NOT NULL,
	[SurgicalExaminationID] [int]  NOT NULL,
	[MedicalExaminationID] [int]  NOT NULL,
	[InspectionTime] [date] NULL,
	[InspectionResults] [nvarchar](100) NULL,
	[ConclusionOfPhysicalExamination] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConclusionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerAppointment]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAppointment](
	[CustomerAppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[startTime] [date] NOT NULL,
	[EndTime] [date] NOT NULL,
	[PhysicalExaminationDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK__Customer__D181A5A7CF3E0773] PRIMARY KEY CLUSTERED 
(
	[CustomerAppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerInformation]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerInformation](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[CustomerIDCard] [nvarchar](100) NOT NULL,
	[CustomerGender] [nvarchar](10) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[CustomerNationality] [nvarchar](50) NOT NULL,
	[ClientsMaritalStatus] [nvarchar](10) NOT NULL,
	[CustomerBloodGroup] [nvarchar](10) NOT NULL,
	[CustomerOccupation] [nvarchar](50) NOT NULL,
	[CustomerEducation] [nvarchar](50) NOT NULL,
	[CustomerBelief] [nvarchar](50) NOT NULL,
	[CustomerContactNumber] [nvarchar](50) NOT NULL,
	[CustomerEmergencyContactNumber] [nvarchar](50) NOT NULL,
	[CustomerHomeAddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerInformation] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerReturnVisit]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerReturnVisit](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[ConclusionID] [int] NOT NULL,
	[ContentOfReturnVisit] [nvarchar](100) NULL,
	[ContentTime] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerService]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerService](
	[CustomerServiceID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int]  NOT NULL,
	[ConsultationContent] [nvarchar](100)  NOT NULL,
	[ConsultationTime] [date]  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KnowledgeBaseContentManagement]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KnowledgeBaseContentManagement](
	[KnowledgeBase] [int] IDENTITY(1,1) NOT NULL,
	[KnowledgeBaseTypeID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[Problem] [nvarchar](max) NULL,
	[OpenOrNot] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[KnowledgeBase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KnowledgeBaseTypeManagement]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KnowledgeBaseTypeManagement](
	[KnowledgeBaseTypeID] [int] IDENTITY(1,1) NOT NULL,
	[KnowledgeBaseType] [nvarchar](50) NULL,
	[OpenOrNot] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[KnowledgeBaseTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalExamination]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalExamination](
	[MedicalExaminationID] [int] IDENTITY(1,1) NOT NULL,
	[BloodPressure] [nvarchar](50) NULL,
	[Pulse] [nvarchar](50) NULL,
	[DevelopmentAndNutrition] [nvarchar](50) NULL,
	[HeartAndBloodVessels] [nvarchar](50) NULL,
	[NervesAndSpirits] [nvarchar](50) NULL,
	[LungAndRespiratoryTract] [nvarchar](50) NULL,
	[AbdominalOrgan] [nvarchar](50) NULL,
	[Liver] [nvarchar](50) NULL,
	[Spleen] [nvarchar](50) NULL,
	[Transaminase] [nvarchar](50) NULL,
	[TransaminaseDescription] [nvarchar](50) NULL,
	[HepatitisBSurfaceAntigen] [nvarchar](50) NULL,
	[HepatitisBSurfaceAntigenDescription] [nvarchar](50) NULL,
	[ChestXRay] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalExaminationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalHistory]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalHistory](
	[MedicalHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[HistoryOfPresentLllness] [nvarchar](50) NULL,
	[HistoryOfPresentLllnessMedicalHistory] [date] NULL,
	[HistoryOfPresentLllnessLocationOfVisit] [nvarchar](50) NULL,
	[HistoryOfPresentLllnessSituation] [nvarchar](50) NULL,
	[PastHistory] [nvarchar](50) NULL,
	[PastHistoryMedicalHistory] [date] NULL,
	[PastHistoryLocationOfVisit] [nvarchar](50) NULL,
	[PastHistorySituation] [nvarchar](50) NULL,
	[FamilyHistory] [nvarchar](50) NULL,
	[FamilyHistoryMedicalHistory] [date] NULL,
	[FamilyHistoryLocationOfVisit] [nvarchar](50) NULL,
	[FamilyHistorySituation] [nvarchar](50) NULL,
	[MenstrualHistory] [nvarchar](50) NULL,
	[MenstrualHistoryMedicalHistory]  [date] NULL,
	[MenstrualHistoryLocationOfVisit] [nvarchar](50) NULL,
	[MenstrualHistorySituation] [nvarchar](50) NULL,
	[MarriageAndPregnancy] [nvarchar](50) NULL,
	[MarriageAndPregnancyMedicalHistory] [date] NULL,
	[MarriageAndPregnancyLocationOfVisit] [nvarchar](50) NULL,
	[MarriageAndPregnancySituation] [nvarchar](50) NULL,
	[PhysicalExamination] [nvarchar](50) NULL,
	[PhysicalExaminationMedicalHistory] [date] NULL,
	[PhysicalExaminationLocationOfVisit] [nvarchar](50) NULL,
	[PhysicalExaminationSituation] [nvarchar](50) NULL,
	[LaboratoryExamination] [nvarchar](50) NULL,
	[LaboratoryExaminationMedicalHistory] [date] NULL,
	[LaboratoryExaminationLocationOfVisit] [nvarchar](50) NULL,
	[LaboratoryExaminationSituation] [nvarchar](50) NULL,
	[SpecialInspection] [nvarchar](50) NULL,
	[SpecialInspectionMedicalHistory]  [date] NULL,
	[SpecialInspectionLocationOfVisit] [nvarchar](50) NULL,
	[SpecialInspectionSituation] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SurgicalExamination]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurgicalExamination](
	[SurgicalExaminationID] [int] IDENTITY(1,1) NOT NULL,
	[Height] [nvarchar](50) NULL,
	[Bust] [nvarchar](50) NULL,
	[Skin] [nvarchar](50) NULL,
	[Weights] [nvarchar](50) NULL,
	[PoorBreath] [nvarchar](50) NULL,
	[Face] [nvarchar](50) NULL,
	[Neck] [nvarchar](50) NULL,
	[Spine] [nvarchar](50) NULL,
	[Limb] [nvarchar](50) NULL,
	[Joint] [nvarchar](50) NULL,
	[Other] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SurgicalExaminationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDoctorList]    Script Date: 2020/6/16 22:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDoctorList](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorOfName] [nvarchar](50) NOT NULL,
	[DoctorMajor] [nvarchar](50) NOT NULL,
	[DoctorGender] [nvarchar](10) NOT NULL,
	[DoctorDateOfBirth] [date] NOT NULL,
	[DoctorIdentity] [nvarchar](100) NOT NULL,
	[DoctorAge] [int] NOT NULL,
	[DoctorAccount] [nvarchar](50) NOT NULL,
	[DoctorPassword] [nvarchar](50) NOT NULL,
	[DoctorSubject] [nvarchar](50) NOT NULL,
	[AdministratorOrNot] [nvarchar](10) NULL,
 CONSTRAINT [PK__UserDoct__2DC00EDF9C66990C] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__UserDoct__4DE7BD71E5D86B2D] UNIQUE NONCLUSTERED 
(
	[DoctorAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO









/****** Object:  Index [IX_MedicalHistory]    Script Date: 2020/6/16 22:03:13 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MedicalHistory] ON [dbo].[MedicalHistory]
(
	[MedicalHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserDoctorList] ADD  CONSTRAINT [DF_UserDoctorList_AdministratorOrNot]  DEFAULT (N'‘0’') FOR [AdministratorOrNot]
GO
ALTER TABLE [dbo].[ClientMdicalIformation]  WITH CHECK ADD  CONSTRAINT [FK__ClientMdi__Custo__3E52440B] FOREIGN KEY([CustomerAppointmentID])
REFERENCES [dbo].[CustomerAppointment] ([CustomerAppointmentID])
GO
ALTER TABLE [dbo].[ClientMdicalIformation] CHECK CONSTRAINT [FK__ClientMdi__Custo__3E52440B]
GO
ALTER TABLE [dbo].[ClientMdicalIformation]  WITH CHECK ADD  CONSTRAINT [FK__ClientMdi__Docto__3D5E1FD2] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[UserDoctorList] ([DoctorID])
GO
ALTER TABLE [dbo].[ClientMdicalIformation] CHECK CONSTRAINT [FK__ClientMdi__Docto__3D5E1FD2]
GO
ALTER TABLE [dbo].[ClientMdicalIformation]  WITH CHECK ADD FOREIGN KEY([MedicalExaminationID])
REFERENCES [dbo].[MedicalExamination] ([MedicalExaminationID])
GO
ALTER TABLE [dbo].[ClientMdicalIformation]  WITH CHECK ADD FOREIGN KEY([SurgicalExaminationID])
REFERENCES [dbo].[SurgicalExamination] ([SurgicalExaminationID])
GO
ALTER TABLE [dbo].[CustomerReturnVisit]  WITH CHECK ADD FOREIGN KEY([ConclusionID])
REFERENCES [dbo].[ClientMdicalIformation] ([ConclusionID])
GO
ALTER TABLE [dbo].[CustomerReturnVisit]  WITH CHECK ADD  CONSTRAINT [FK__CustomerR__Docto__48CFD27E] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[UserDoctorList] ([DoctorID])
GO
ALTER TABLE [dbo].[CustomerReturnVisit] CHECK CONSTRAINT [FK__CustomerR__Docto__48CFD27E]
GO
ALTER TABLE [dbo].[CustomerService]  WITH CHECK ADD  CONSTRAINT [FK__CustomerS__Docto__44FF419A] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[UserDoctorList] ([DoctorID])
GO
ALTER TABLE [dbo].[CustomerService] CHECK CONSTRAINT [FK__CustomerS__Docto__44FF419A]
GO
ALTER TABLE [dbo].[KnowledgeBaseContentManagement]  WITH CHECK ADD  CONSTRAINT [FK__Knowledge__Docto__5165187F] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[UserDoctorList] ([DoctorID])
GO
ALTER TABLE [dbo].[KnowledgeBaseContentManagement] CHECK CONSTRAINT [FK__Knowledge__Docto__5165187F]
GO
ALTER TABLE [dbo].[KnowledgeBaseContentManagement]  WITH CHECK ADD FOREIGN KEY([KnowledgeBaseTypeID])
REFERENCES [dbo].[KnowledgeBaseTypeManagement] ([KnowledgeBaseTypeID])
GO
ALTER TABLE [dbo].[KnowledgeBaseTypeManagement]  WITH CHECK ADD  CONSTRAINT [CK_KnowledgeBaseTypeManagement] CHECK  (([KnowledgeBaseType]='内科' OR [KnowledgeBaseType]='外科'))
GO
ALTER TABLE [dbo].[KnowledgeBaseTypeManagement] CHECK CONSTRAINT [CK_KnowledgeBaseTypeManagement]
GO
ALTER TABLE [dbo].[KnowledgeBaseTypeManagement]  WITH CHECK ADD  CONSTRAINT [CK_OpenOrNot] CHECK  (([OpenOrNot]='0' OR [OpenOrNot]='1'))
GO
ALTER TABLE [dbo].[KnowledgeBaseTypeManagement] CHECK CONSTRAINT [CK_OpenOrNot]
GO
ALTER TABLE [dbo].[UserDoctorList]  WITH CHECK ADD  CONSTRAINT [CK_UserDoctorList] CHECK  (([AdministratorOrNot]='1' OR [AdministratorOrNot]='0'))
GO
ALTER TABLE [dbo].[UserDoctorList] CHECK CONSTRAINT [CK_UserDoctorList]
GO
USE [master]
GO
ALTER DATABASE [KangmeiHospitalCRM] SET  READ_WRITE 
GO

ALTER table CustomerAppointment  add constraint CK_CustomerIDandAppointment foreign key (CustomerID) references CustomerInformation(CustomerID)

ALTER table MedicalHistory  add constraint CK_CustomerIDandCustomerAppointment foreign key (CustomerID) references CustomerInformation(CustomerID)