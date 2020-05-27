create table MedicalHistory(--�ͻ���
  MedicalHistory int primary key identity(1,1),
  CustomerID int foreign key references CustomerInformation(CustomerID),
  --�ֲ�ʷ
  HistoryOfPresentLllness nvarchar(50),
  HistoryOfPresentLllnessMedicalHistory nvarchar(50),
  HistoryOfPresentLllnessLocationOfVisit nvarchar(50),
  HistoryOfPresentLllnessSituation nvarchar(50),

  --����ʷ
  PastHistory nvarchar(50),
  PastHistoryMedicalHistory nvarchar(50),
  PastHistoryLocationOfVisit nvarchar(50),
  PastHistorySituation nvarchar(50),

  --����ʷ
  FamilyHistory nvarchar(50),
  FamilyHistoryMedicalHistory nvarchar(50),
  FamilyHistoryLocationOfVisit nvarchar(50),
  FamilyHistorySituation nvarchar(50),

  --�¾�ʷ
  MenstrualHistory nvarchar(50),
  MenstrualHistoryMedicalHistory nvarchar(50),
  MenstrualHistoryLocationOfVisit nvarchar(50),
  MenstrualHistorySituation nvarchar(50),

  --����ʷ
  MarriageAndPregnancy nvarchar(50),
  MarriageAndPregnancyMedicalHistory nvarchar(50),
  MarriageAndPregnancyLocationOfVisit nvarchar(50),
  MarriageAndPregnancySituation nvarchar(50),

  --�����
  PhysicalExamination nvarchar(50),
  PhysicalExaminationMedicalHistory nvarchar(50),
  PhysicalExaminationLocationOfVisit nvarchar(50),
  PhysicalExaminationSituation nvarchar(50),

  --������
  LaboratoryExamination nvarchar(50),
  LaboratoryExaminationMedicalHistory nvarchar(50),
  LaboratoryExaminationLocationOfVisit nvarchar(50),
  LaboratoryExaminationSituation nvarchar(50),

  --������
  SpecialInspection nvarchar(50),
  SpecialInspectionMedicalHistory nvarchar(50),
  SpecialInspectionLocationOfVisit nvarchar(50),
  SpecialInspectionSituation nvarchar(50),
)

insert into MedicalHistory values(2
,'ʪ��','2020��1��','������̶','������'
,'ʪ��','2008��1��','������̶','������'
,'ƫͷʹ','2000��1��','������̶','δ����'
,'�¾�','ÿ��10��','��','��'
,'��','��','��','��'
,'�����','2019��4��','������̶','����'
,'������','2019��5��','������̶','����'
,'������','2019��6��','������̶','����'
)

create table UserDoctorList(--ҽ����
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

insert into UserDoctorList values('����','�ۿ�','��','1897/10/20','43032118973312',50,'����ѧ��','0')

create table CustomerAppointment(--����ԤԼ��
  CustomerAppointmentID int  primary key identity(1,1),
  CustomerID int foreign key references CustomerInformation(CustomerID),
  startTime nvarchar(50),
  EndTime nvarchar(50),
  PhysicalExaminationDescription  nvarchar(100)
)

insert into CustomerAppointment values(2,'2020/5/20','2020/5/50','θ�����з�θ��')

create table SurgicalExamination(--��Ƽ��
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
insert into SurgicalExamination values('181','45cm','����','70','60-70','����','����','����','����','����','����')

create table MedicalExamination(--�ڿƼ��
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
insert into MedicalExamination values('����','����','����','����','����','����','����','����','����','����','����','����','����','����')


create table ClientMdicalIformation(--�����Ϣ��
 ConclusionID  int  primary key identity(1,1),
 DoctorID int foreign key references UserDoctorList(DoctorID),--ҽ�����
 CustomerAppointmentID int foreign key references CustomerAppointment(CustomerAppointmentID),--ԤԼ���
 SurgicalExaminationID int foreign key references SurgicalExamination(SurgicalExaminationID),--��Ƽ�����
 MedicalExaminationID int foreign key references MedicalExamination(MedicalExaminationID),--�ڿƼ�����
 InspectionTime  nvarchar(50),
 InspectionResults nvarchar(100),
 ConclusionOfPhysicalExamination nvarchar(100)
)

insert into ClientMdicalIformation values('1','1','1','1','����','��������һ�������������е�����','��Ҫ��������')

create table CustomerService  (--�ͻ������
 CustomerServiceID  int  primary key identity(1,1),
  DoctorID int foreign key references UserDoctorList(DoctorID),--ҽ�����
  ConclusionID int foreign key references ClientMdicalIformation(ConclusionID),--�����Ϣ���
  ConsultationContent nvarchar(100),
  ConsultationTime nvarchar(100),
)

insert into CustomerService values(1,1,'��������������ö���','2500Ԫ���۰�̨��������ԤԼ')

create table CustomerReturnVisit(--�ͻ��طñ�
 ContentID  int  primary key identity(1,1),
  DoctorID int foreign key references UserDoctorList(DoctorID),--ҽ�����
  ConclusionID int foreign key references ClientMdicalIformation(ConclusionID),--�����Ϣ���
  ContentOfReturnVisit nvarchar(100),
  ContentTime nvarchar(100),
)

insert into CustomerReturnVisit values(1,1,'�ϴΰ����ָ�״�����','�ǳ����⣬�ָ�ͦ�õ�')


create table KnowledgeBaseTypeManagement(--֪ʶ�����ͱ�
 KnowledgeBaseTypeID  int  primary key identity(1,1),
  KnowledgeBaseType nvarchar(10),
  OpenOrNot nvarchar(10),
)

insert into KnowledgeBaseTypeManagement values('�ڿ�','1')

create table KnowledgeBaseContentManagement  (--֪ʶ���
 KnowledgeBase  int  primary key identity(1,1),
  KnowledgeBaseTypeID int foreign key references KnowledgeBaseTypeManagement(KnowledgeBaseTypeID),--֪ʶ���������
  DoctorID int foreign key references UserDoctorList(DoctorID),--ҽ�����
  Problem nvarchar(max),
  OpenOrNot nvarchar(max)
)


insert into KnowledgeBaseContentManagement values(1,1,'����һ�����ߣ�������ѣ��Ż����������Ƹ�ð','ʵ�������θ���ף�����ע��')