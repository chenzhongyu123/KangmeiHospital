create table MedicalHistory(--客户表
  MedicalHistory int primary key identity(1,1),
  CustomerID int foreign key references CustomerInformation(CustomerID),
  --现病史
  HistoryOfPresentLllness nvarchar(50),
  HistoryOfPresentLllnessMedicalHistory nvarchar(50),
  HistoryOfPresentLllnessLocationOfVisit nvarchar(50),
  HistoryOfPresentLllnessSituation nvarchar(50),

  --既往史
  PastHistory nvarchar(50),
  PastHistoryMedicalHistory nvarchar(50),
  PastHistoryLocationOfVisit nvarchar(50),
  PastHistorySituation nvarchar(50),

  --家族史
  FamilyHistory nvarchar(50),
  FamilyHistoryMedicalHistory nvarchar(50),
  FamilyHistoryLocationOfVisit nvarchar(50),
  FamilyHistorySituation nvarchar(50),

  --月经史
  MenstrualHistory nvarchar(50),
  MenstrualHistoryMedicalHistory nvarchar(50),
  MenstrualHistoryLocationOfVisit nvarchar(50),
  MenstrualHistorySituation nvarchar(50),

  --婚孕史
  MarriageAndPregnancy nvarchar(50),
  MarriageAndPregnancyMedicalHistory nvarchar(50),
  MarriageAndPregnancyLocationOfVisit nvarchar(50),
  MarriageAndPregnancySituation nvarchar(50),

  --体格检查
  PhysicalExamination nvarchar(50),
  PhysicalExaminationMedicalHistory nvarchar(50),
  PhysicalExaminationLocationOfVisit nvarchar(50),
  PhysicalExaminationSituation nvarchar(50),

  --化验检查
  LaboratoryExamination nvarchar(50),
  LaboratoryExaminationMedicalHistory nvarchar(50),
  LaboratoryExaminationLocationOfVisit nvarchar(50),
  LaboratoryExaminationSituation nvarchar(50),

  --特殊检查
  SpecialInspection nvarchar(50),
  SpecialInspectionMedicalHistory nvarchar(50),
  SpecialInspectionLocationOfVisit nvarchar(50),
  SpecialInspectionSituation nvarchar(50),
)

insert into MedicalHistory values(2
,'湿疹','2020年1月','湖南湘潭','已治愈'
,'湿疹','2008年1月','湖南湘潭','已治愈'
,'偏头痛','2000年1月','湖南湘潭','未治愈'
,'月经','每月10号','无','无'
,'无','无','无','无'
,'体格检查','2019年4月','湖南湘潭','正常'
,'化验检查','2019年5月','湖南湘潭','正常'
,'特殊检查','2019年6月','湖南湘潭','正常'
)

create table UserDoctorList(--医生表
  DoctorID int primary key identity(1,1),
  DoctorOfName nvarchar(50),
  DoctorMajor nvarchar(50),
  DoctorGender nvarchar(10),
  DoctorDateOfBirth nvarchar(50),
  DoctorIdentity nvarchar(100),
  DoctorAge int,
  DoctorSubject nvarchar(50),
  AdministratorOrNot nvarchar(10),
)

insert into UserDoctorList values('丁磊','眼科','男','1897/10/20','43032118973312',50,'视神经学科','0')

create table CustomerAppointment(--体验预约表
  CustomerAppointmentID int  primary key identity(1,1),
  CustomerID int foreign key references CustomerInformation(CustomerID),
  startTime nvarchar(50),
  EndTime nvarchar(50),
  PhysicalExaminationDescription  nvarchar(100)
)

insert into CustomerAppointment values(2,'2020/5/20','2020/5/50','胃部，有反胃感')

create table SurgicalExamination(--外科检查
 SurgicalExaminationID  int  primary key identity(1,1),
 Height  nvarchar(50),
 Bust nvarchar(50),
 Skin nvarchar(50),
 Weights nvarchar(50),
 PoorBreath nvarchar(50),
 Face nvarchar(50),
 Neck nvarchar(50),
 Spine nvarchar(50),
 Limb nvarchar(50),
 Joint nvarchar(50),
 Other nvarchar(100)
)
insert into SurgicalExamination values('181','45cm','正常','70','60-70','正常','正常','正常','正常','正常','蛀牙')

create table MedicalExamination(--内科检查
 MedicalExaminationID  int  primary key identity(1,1),
 BloodPressure  nvarchar(50),
 Pulse  nvarchar(50),
 DevelopmentAndNutrition  nvarchar(50),
 HeartAndBloodVessels  nvarchar(50),
 NervesAndSpirits  nvarchar(50),
 LungAndRespiratoryTract  nvarchar(50),
 AbdominalOrgan  nvarchar(50),
 Liver  nvarchar(50),
 Spleen  nvarchar(50),
 Transaminase  nvarchar(50),
 TransaminaseDescription  nvarchar(50),
 HepatitisBSurfaceAntigen  nvarchar(50),
 HepatitisBSurfaceAntigenDescription  nvarchar(50),
 ChestXRay  nvarchar(50),
)
insert into MedicalExamination values('正常','正常','正常','正常','正常','正常','正常','正常','正常','正常','正常','正常','正常','正常')


create table ClientMdicalIformation(--体检信息表
 ConclusionID  int  primary key identity(1,1),
 DoctorID int foreign key references UserDoctorList(DoctorID),--医生外键
 CustomerAppointmentID int foreign key references CustomerAppointment(CustomerAppointmentID),--预约外键
 SurgicalExaminationID int foreign key references SurgicalExamination(SurgicalExaminationID),--外科检查外键
 MedicalExaminationID int foreign key references MedicalExamination(MedicalExaminationID),--内科检查外键
 InspectionTime  nvarchar(50),
 InspectionResults nvarchar(100),
 ConclusionOfPhysicalExamination nvarchar(100)
)

insert into ClientMdicalIformation values('1','1','1','1','弱视','患者其他一切正常，视力有点弱视','需要视力矫正')

create table CustomerService  (--客户服务表
 CustomerServiceID  int  primary key identity(1,1),
  DoctorID int foreign key references UserDoctorList(DoctorID),--医生外键
  ConclusionID int foreign key references ClientMdicalIformation(ConclusionID),--检查信息外键
  ConsultationContent nvarchar(100),
  ConsultationTime nvarchar(100),
)

insert into CustomerService values(1,1,'做宫颈癌疫苗费用多少','2500元，港澳台地区可以预约')

create table CustomerReturnVisit(--客户回访表
 ContentID  int  primary key identity(1,1),
  DoctorID int foreign key references UserDoctorList(DoctorID),--医生外键
  ConclusionID int foreign key references ClientMdicalIformation(ConclusionID),--检查信息外键
  ContentOfReturnVisit nvarchar(100),
  ContentTime nvarchar(100),
)

insert into CustomerReturnVisit values(1,1,'上次拔牙恢复状况如何','非常满意，恢复挺好的')


create table KnowledgeBaseTypeManagement(--知识库类型表
 KnowledgeBaseTypeID  int  primary key identity(1,1),
  KnowledgeBaseType nvarchar(10),
  OpenOrNot nvarchar(10),
)

insert into KnowledgeBaseTypeManagement values('内科','1')

create table KnowledgeBaseContentManagement  (--知识库表
 KnowledgeBase  int  primary key identity(1,1),
  KnowledgeBaseTypeID int foreign key references KnowledgeBaseTypeManagement(KnowledgeBaseTypeID),--知识库类型外键
  DoctorID int foreign key references UserDoctorList(DoctorID),--医生外键
  Problem nvarchar(max),
  OpenOrNot nvarchar(max)
)


insert into KnowledgeBaseContentManagement values(1,1,'遇到一个患者，出现了眩晕呕吐情况，疑似感冒','实则检查后是胃穿孔，请大家注意')