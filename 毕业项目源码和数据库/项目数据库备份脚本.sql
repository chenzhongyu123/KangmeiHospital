USE [master]
GO
/****** Object:  Database [KangmeiHospitalCRM]    Script Date: 2020/6/28 0:32:28 ******/
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
ALTER DATABASE [KangmeiHospitalCRM] SET  ENABLE_BROKER 
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
/****** Object:  Table [dbo].[ClientMdicalIformation]    Script Date: 2020/6/28 0:32:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientMdicalIformation](
	[ConclusionID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[CustomerAppointmentID] [int] NOT NULL,
	[SurgicalExaminationID] [int] NOT NULL,
	[MedicalExaminationID] [int] NOT NULL,
	[InspectionTime] [date] NOT NULL,
	[InspectionResults] [nvarchar](100) NULL,
	[ConclusionOfPhysicalExamination] [nvarchar](100) NULL,
 CONSTRAINT [PK__ClientMd__0953F003F659FCC9] PRIMARY KEY CLUSTERED 
(
	[ConclusionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerAppointment]    Script Date: 2020/6/28 0:32:28 ******/
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
/****** Object:  Table [dbo].[CustomerCare]    Script Date: 2020/6/28 0:32:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCare](
	[CustomerCareID] [int] IDENTITY(1,1) NOT NULL,
	[ConclusionID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[ProcessedOrNot] [int] NULL,
 CONSTRAINT [PK__Customer__00B336DDB2545668] PRIMARY KEY CLUSTERED 
(
	[CustomerCareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerInformation]    Script Date: 2020/6/28 0:32:29 ******/
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
/****** Object:  Table [dbo].[CustomerReturnVisit]    Script Date: 2020/6/28 0:32:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerReturnVisit](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[ConclusionID] [int] NOT NULL,
	[ContentOfReturnVisit] [nvarchar](100) NOT NULL,
	[ContentTime] [date] NOT NULL,
 CONSTRAINT [PK__Customer__2907A87EF61CD2EE] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerService]    Script Date: 2020/6/28 0:32:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerService](
	[CustomerServiceID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[ConsultationContent] [nvarchar](100) NOT NULL,
	[ConsultationTime] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KnowledgeBaseContentManagement]    Script Date: 2020/6/28 0:32:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KnowledgeBaseContentManagement](
	[KnowledgeBase] [int] IDENTITY(1,1) NOT NULL,
	[KnowledgeBaseTypeID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[Problem] [nvarchar](max) NULL,
	[Reply] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[KnowledgeBase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KnowledgeBaseTypeManagement]    Script Date: 2020/6/28 0:32:29 ******/
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
/****** Object:  Table [dbo].[MedicalExamination]    Script Date: 2020/6/28 0:32:29 ******/
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
/****** Object:  Table [dbo].[MedicalHistory]    Script Date: 2020/6/28 0:32:29 ******/
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
	[MenstrualHistoryMedicalHistory] [date] NULL,
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
	[SpecialInspectionMedicalHistory] [date] NULL,
	[SpecialInspectionLocationOfVisit] [nvarchar](50) NULL,
	[SpecialInspectionSituation] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SurgicalExamination]    Script Date: 2020/6/28 0:32:29 ******/
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
/****** Object:  Table [dbo].[UserDoctorList]    Script Date: 2020/6/28 0:32:29 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_KnowledgeBase]    Script Date: 2020/6/28 0:32:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_KnowledgeBase]
AS
SELECT  dbo.KnowledgeBaseContentManagement.KnowledgeBase, 
                   dbo.KnowledgeBaseContentManagement.KnowledgeBaseTypeID, dbo.KnowledgeBaseContentManagement.DoctorID, 
                   dbo.KnowledgeBaseContentManagement.Problem, dbo.KnowledgeBaseContentManagement.Reply, 
                   dbo.KnowledgeBaseTypeManagement.OpenOrNot, dbo.KnowledgeBaseTypeManagement.KnowledgeBaseType
FROM      dbo.KnowledgeBaseContentManagement INNER JOIN
                   dbo.KnowledgeBaseTypeManagement ON 
                   dbo.KnowledgeBaseContentManagement.KnowledgeBaseTypeID = dbo.KnowledgeBaseTypeManagement.KnowledgeBaseTypeID
                    AND 
                   dbo.KnowledgeBaseContentManagement.KnowledgeBaseTypeID = dbo.KnowledgeBaseTypeManagement.KnowledgeBaseTypeID

GO
SET IDENTITY_INSERT [dbo].[ClientMdicalIformation] ON 

INSERT [dbo].[ClientMdicalIformation] ([ConclusionID], [DoctorID], [CustomerAppointmentID], [SurgicalExaminationID], [MedicalExaminationID], [InspectionTime], [InspectionResults], [ConclusionOfPhysicalExamination]) VALUES (4, 1, 15, 4, 4, CAST(0x48410B00 AS Date), N'正常', N'正常')
SET IDENTITY_INSERT [dbo].[ClientMdicalIformation] OFF
SET IDENTITY_INSERT [dbo].[CustomerAppointment] ON 

INSERT [dbo].[CustomerAppointment] ([CustomerAppointmentID], [CustomerID], [startTime], [EndTime], [PhysicalExaminationDescription]) VALUES (15, 9, CAST(0x35410B00 AS Date), CAST(0x38410B00 AS Date), N'头晕反胃，需要详细检查')
SET IDENTITY_INSERT [dbo].[CustomerAppointment] OFF
SET IDENTITY_INSERT [dbo].[CustomerInformation] ON 

INSERT [dbo].[CustomerInformation] ([CustomerID], [CustomerName], [CustomerIDCard], [CustomerGender], [dateOfBirth], [CustomerNationality], [ClientsMaritalStatus], [CustomerBloodGroup], [CustomerOccupation], [CustomerEducation], [CustomerBelief], [CustomerContactNumber], [CustomerEmergencyContactNumber], [CustomerHomeAddress]) VALUES (9, N'陈仲宇', N'430321200010133312', N'男', CAST(0x25250B00 AS Date), N'汉族', N'未婚', N'O', N'学生', N'小学', N'无', N'18711761803', N'15616270655', N'湖南省湘潭')
INSERT [dbo].[CustomerInformation] ([CustomerID], [CustomerName], [CustomerIDCard], [CustomerGender], [dateOfBirth], [CustomerNationality], [ClientsMaritalStatus], [CustomerBloodGroup], [CustomerOccupation], [CustomerEducation], [CustomerBelief], [CustomerContactNumber], [CustomerEmergencyContactNumber], [CustomerHomeAddress]) VALUES (13, N'黄娟', N'430203200006124028', N'女', CAST(0xAA240B00 AS Date), N'汉族', N'未婚', N'O', N'学生', N'大学专科', N'无', N'13218563245', N'15616270655', N'湖南省株洲市天元区')
SET IDENTITY_INSERT [dbo].[CustomerInformation] OFF
SET IDENTITY_INSERT [dbo].[CustomerReturnVisit] ON 

INSERT [dbo].[CustomerReturnVisit] ([ContentID], [DoctorID], [ConclusionID], [ContentOfReturnVisit], [ContentTime]) VALUES (8, 1, 4, N'奇怪，你们费用太贵', CAST(0x41410B00 AS Date))
SET IDENTITY_INSERT [dbo].[CustomerReturnVisit] OFF
SET IDENTITY_INSERT [dbo].[CustomerService] ON 

INSERT [dbo].[CustomerService] ([CustomerServiceID], [DoctorID], [ConsultationContent], [ConsultationTime]) VALUES (6, 1, N'这个医院是搞什么的', CAST(0x41410B00 AS Date))
SET IDENTITY_INSERT [dbo].[CustomerService] OFF
SET IDENTITY_INSERT [dbo].[KnowledgeBaseContentManagement] ON 

INSERT [dbo].[KnowledgeBaseContentManagement] ([KnowledgeBase], [KnowledgeBaseTypeID], [DoctorID], [Problem], [Reply]) VALUES (20, 1, 1, N'这是个什么诊所', N'111111111111111111111111')
INSERT [dbo].[KnowledgeBaseContentManagement] ([KnowledgeBase], [KnowledgeBaseTypeID], [DoctorID], [Problem], [Reply]) VALUES (21, 2, 1, N'这是个什么诊所', N'111111111111111111111111')
SET IDENTITY_INSERT [dbo].[KnowledgeBaseContentManagement] OFF
SET IDENTITY_INSERT [dbo].[KnowledgeBaseTypeManagement] ON 

INSERT [dbo].[KnowledgeBaseTypeManagement] ([KnowledgeBaseTypeID], [KnowledgeBaseType], [OpenOrNot]) VALUES (1, N'内科', N'1')
INSERT [dbo].[KnowledgeBaseTypeManagement] ([KnowledgeBaseTypeID], [KnowledgeBaseType], [OpenOrNot]) VALUES (2, N'外科', N'1')
INSERT [dbo].[KnowledgeBaseTypeManagement] ([KnowledgeBaseTypeID], [KnowledgeBaseType], [OpenOrNot]) VALUES (4, N'其他类', N'1')
SET IDENTITY_INSERT [dbo].[KnowledgeBaseTypeManagement] OFF
SET IDENTITY_INSERT [dbo].[MedicalExamination] ON 

INSERT [dbo].[MedicalExamination] ([MedicalExaminationID], [BloodPressure], [Pulse], [DevelopmentAndNutrition], [HeartAndBloodVessels], [NervesAndSpirits], [LungAndRespiratoryTract], [AbdominalOrgan], [Liver], [Spleen], [Transaminase], [TransaminaseDescription], [HepatitisBSurfaceAntigen], [HepatitisBSurfaceAntigenDescription], [ChestXRay]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MedicalExamination] OFF
SET IDENTITY_INSERT [dbo].[MedicalHistory] ON 

INSERT [dbo].[MedicalHistory] ([MedicalHistoryID], [CustomerID], [HistoryOfPresentLllness], [HistoryOfPresentLllnessMedicalHistory], [HistoryOfPresentLllnessLocationOfVisit], [HistoryOfPresentLllnessSituation], [PastHistory], [PastHistoryMedicalHistory], [PastHistoryLocationOfVisit], [PastHistorySituation], [FamilyHistory], [FamilyHistoryMedicalHistory], [FamilyHistoryLocationOfVisit], [FamilyHistorySituation], [MenstrualHistory], [MenstrualHistoryMedicalHistory], [MenstrualHistoryLocationOfVisit], [MenstrualHistorySituation], [MarriageAndPregnancy], [MarriageAndPregnancyMedicalHistory], [MarriageAndPregnancyLocationOfVisit], [MarriageAndPregnancySituation], [PhysicalExamination], [PhysicalExaminationMedicalHistory], [PhysicalExaminationLocationOfVisit], [PhysicalExaminationSituation], [LaboratoryExamination], [LaboratoryExaminationMedicalHistory], [LaboratoryExaminationLocationOfVisit], [LaboratoryExaminationSituation], [SpecialInspection], [SpecialInspectionMedicalHistory], [SpecialInspectionLocationOfVisit], [SpecialInspectionSituation]) VALUES (7, 9, N'无', NULL, NULL, NULL, N'无', NULL, NULL, NULL, N'无', NULL, NULL, NULL, N'无', NULL, NULL, NULL, N'无', NULL, NULL, NULL, N'无', NULL, NULL, NULL, N'无', NULL, NULL, NULL, N'无', NULL, NULL, NULL)
INSERT [dbo].[MedicalHistory] ([MedicalHistoryID], [CustomerID], [HistoryOfPresentLllness], [HistoryOfPresentLllnessMedicalHistory], [HistoryOfPresentLllnessLocationOfVisit], [HistoryOfPresentLllnessSituation], [PastHistory], [PastHistoryMedicalHistory], [PastHistoryLocationOfVisit], [PastHistorySituation], [FamilyHistory], [FamilyHistoryMedicalHistory], [FamilyHistoryLocationOfVisit], [FamilyHistorySituation], [MenstrualHistory], [MenstrualHistoryMedicalHistory], [MenstrualHistoryLocationOfVisit], [MenstrualHistorySituation], [MarriageAndPregnancy], [MarriageAndPregnancyMedicalHistory], [MarriageAndPregnancyLocationOfVisit], [MarriageAndPregnancySituation], [PhysicalExamination], [PhysicalExaminationMedicalHistory], [PhysicalExaminationLocationOfVisit], [PhysicalExaminationSituation], [LaboratoryExamination], [LaboratoryExaminationMedicalHistory], [LaboratoryExaminationLocationOfVisit], [LaboratoryExaminationSituation], [SpecialInspection], [SpecialInspectionMedicalHistory], [SpecialInspectionLocationOfVisit], [SpecialInspectionSituation]) VALUES (11, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MedicalHistory] OFF
SET IDENTITY_INSERT [dbo].[SurgicalExamination] ON 

INSERT [dbo].[SurgicalExamination] ([SurgicalExaminationID], [Height], [Bust], [Skin], [Weights], [PoorBreath], [Face], [Neck], [Spine], [Limb], [Joint], [Other]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SurgicalExamination] OFF
SET IDENTITY_INSERT [dbo].[UserDoctorList] ON 

INSERT [dbo].[UserDoctorList] ([DoctorID], [DoctorOfName], [DoctorMajor], [DoctorGender], [DoctorDateOfBirth], [DoctorIdentity], [DoctorAge], [DoctorAccount], [DoctorPassword], [DoctorSubject], [AdministratorOrNot]) VALUES (1, N'胡瑶', N'眼科', N'女', CAST(0x3D200B00 AS Date), N'4303211997-05-06', 18, N'123', N'123', N'视神经学科', N'1')
INSERT [dbo].[UserDoctorList] ([DoctorID], [DoctorOfName], [DoctorMajor], [DoctorGender], [DoctorDateOfBirth], [DoctorIdentity], [DoctorAge], [DoctorAccount], [DoctorPassword], [DoctorSubject], [AdministratorOrNot]) VALUES (2, N'易安妮', N'神经科', N'女', CAST(0x00000000 AS Date), N'430321189805123312', 18, N'111111', N'111111', N'脑神经', N'0')
SET IDENTITY_INSERT [dbo].[UserDoctorList] OFF
/****** Object:  Index [IX_MedicalHistory]    Script Date: 2020/6/28 0:32:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MedicalHistory] ON [dbo].[MedicalHistory]
(
	[MedicalHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserDoct__4DE7BD71E5D86B2D]    Script Date: 2020/6/28 0:32:29 ******/
ALTER TABLE [dbo].[UserDoctorList] ADD  CONSTRAINT [UQ__UserDoct__4DE7BD71E5D86B2D] UNIQUE NONCLUSTERED 
(
	[DoctorAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[ClientMdicalIformation]  WITH CHECK ADD  CONSTRAINT [FK__ClientMdi__Medic__276EDEB3] FOREIGN KEY([MedicalExaminationID])
REFERENCES [dbo].[MedicalExamination] ([MedicalExaminationID])
GO
ALTER TABLE [dbo].[ClientMdicalIformation] CHECK CONSTRAINT [FK__ClientMdi__Medic__276EDEB3]
GO
ALTER TABLE [dbo].[ClientMdicalIformation]  WITH CHECK ADD  CONSTRAINT [FK__ClientMdi__Medic__30F848ED] FOREIGN KEY([MedicalExaminationID])
REFERENCES [dbo].[MedicalExamination] ([MedicalExaminationID])
GO
ALTER TABLE [dbo].[ClientMdicalIformation] CHECK CONSTRAINT [FK__ClientMdi__Medic__30F848ED]
GO
ALTER TABLE [dbo].[ClientMdicalIformation]  WITH CHECK ADD  CONSTRAINT [FK__ClientMdi__Surgi__286302EC] FOREIGN KEY([SurgicalExaminationID])
REFERENCES [dbo].[SurgicalExamination] ([SurgicalExaminationID])
GO
ALTER TABLE [dbo].[ClientMdicalIformation] CHECK CONSTRAINT [FK__ClientMdi__Surgi__286302EC]
GO
ALTER TABLE [dbo].[ClientMdicalIformation]  WITH CHECK ADD  CONSTRAINT [FK__ClientMdi__Surgi__31EC6D26] FOREIGN KEY([SurgicalExaminationID])
REFERENCES [dbo].[SurgicalExamination] ([SurgicalExaminationID])
GO
ALTER TABLE [dbo].[ClientMdicalIformation] CHECK CONSTRAINT [FK__ClientMdi__Surgi__31EC6D26]
GO
ALTER TABLE [dbo].[CustomerAppointment]  WITH CHECK ADD  CONSTRAINT [CK_CustomerIDandAppointment] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerInformation] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerAppointment] CHECK CONSTRAINT [CK_CustomerIDandAppointment]
GO
ALTER TABLE [dbo].[CustomerCare]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCare_ClientMdicalIformation] FOREIGN KEY([ConclusionID])
REFERENCES [dbo].[ClientMdicalIformation] ([ConclusionID])
GO
ALTER TABLE [dbo].[CustomerCare] CHECK CONSTRAINT [FK_CustomerCare_ClientMdicalIformation]
GO
ALTER TABLE [dbo].[CustomerCare]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCare_UserDoctorList] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[UserDoctorList] ([DoctorID])
GO
ALTER TABLE [dbo].[CustomerCare] CHECK CONSTRAINT [FK_CustomerCare_UserDoctorList]
GO
ALTER TABLE [dbo].[CustomerReturnVisit]  WITH CHECK ADD  CONSTRAINT [FK__CustomerR__Concl__29572725] FOREIGN KEY([ConclusionID])
REFERENCES [dbo].[ClientMdicalIformation] ([ConclusionID])
GO
ALTER TABLE [dbo].[CustomerReturnVisit] CHECK CONSTRAINT [FK__CustomerR__Concl__29572725]
GO
ALTER TABLE [dbo].[CustomerReturnVisit]  WITH CHECK ADD  CONSTRAINT [FK__CustomerR__Concl__32E0915F] FOREIGN KEY([ConclusionID])
REFERENCES [dbo].[ClientMdicalIformation] ([ConclusionID])
GO
ALTER TABLE [dbo].[CustomerReturnVisit] CHECK CONSTRAINT [FK__CustomerR__Concl__32E0915F]
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
ALTER TABLE [dbo].[KnowledgeBaseContentManagement]  WITH CHECK ADD FOREIGN KEY([KnowledgeBaseTypeID])
REFERENCES [dbo].[KnowledgeBaseTypeManagement] ([KnowledgeBaseTypeID])
GO
ALTER TABLE [dbo].[MedicalHistory]  WITH CHECK ADD  CONSTRAINT [CK_CustomerIDandCustomerAppointment] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerInformation] ([CustomerID])
GO
ALTER TABLE [dbo].[MedicalHistory] CHECK CONSTRAINT [CK_CustomerIDandCustomerAppointment]
GO
ALTER TABLE [dbo].[KnowledgeBaseTypeManagement]  WITH CHECK ADD  CONSTRAINT [CK_OpenOrNot] CHECK  (([OpenOrNot]='0' OR [OpenOrNot]='1'))
GO
ALTER TABLE [dbo].[KnowledgeBaseTypeManagement] CHECK CONSTRAINT [CK_OpenOrNot]
GO
ALTER TABLE [dbo].[UserDoctorList]  WITH CHECK ADD  CONSTRAINT [CK_UserDoctorList] CHECK  (([AdministratorOrNot]='0' OR [AdministratorOrNot]='1' OR [AdministratorOrNot]='2'))
GO
ALTER TABLE [dbo].[UserDoctorList] CHECK CONSTRAINT [CK_UserDoctorList]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "KnowledgeBaseContentManagement"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 310
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KnowledgeBaseTypeManagement"
            Begin Extent = 
               Top = 7
               Left = 358
               Bottom = 148
               Right = 620
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_KnowledgeBase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_KnowledgeBase'
GO
USE [master]
GO
ALTER DATABASE [KangmeiHospitalCRM] SET  READ_WRITE 
GO
