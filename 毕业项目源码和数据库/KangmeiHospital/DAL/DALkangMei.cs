using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
namespace DAL
{
    public class DALkangMei
    {
        KangmeiHospitalCRMEntities4 db = new KangmeiHospitalCRMEntities4();
        //查询所有的客户
        public List<CustomerInformation> SelectInformation()
        {
            return db.CustomerInformation.ToList(); 
        }
        //新增一个用户的方法
        public int AddCustomerInformation(CustomerInformation customerInformation)
        {
            db.CustomerInformation.Add(customerInformation);
            db.SaveChanges();
            CustomerInformation Customer=  db.CustomerInformation.ToList().LastOrDefault();
             int CustomerID= Customer.CustomerID;
            return CustomerID;
        }
        
        //新增一个用户的的同时新建病史信息
        public void AddCustomerDetails(int CustomerID)
        {
            MedicalHistory medicalHistory = new MedicalHistory();
            medicalHistory.CustomerID = CustomerID;
            db.MedicalHistory.Add(medicalHistory);
            db.SaveChanges();
        }
        //修改一个客户的病史表
        public void EditCustomerDetails(MedicalHistory medicalHistory)
        {

            db.Entry(medicalHistory).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
        //删除一个客户的病史表
        public void DeleteMedicalHistory(int id)
        {
            MedicalHistory medicalHistory = db.MedicalHistory.Where(p => p.CustomerID == id).ToList().First(); ;
            db.MedicalHistory.Remove(medicalHistory);
            db.SaveChanges();
        }
        //删除一个用户的方法
        public void DeleteCustomerInformation(int id)
        {
            //病历表删除
            MedicalHistory medicalHistory = db.MedicalHistory.Where(p => p.CustomerID == id).ToList().FirstOrDefault();
            db.MedicalHistory.Remove(medicalHistory);
            db.SaveChanges();
            //删除预约表
            List<CustomerAppointment> customerAppointment = db.CustomerAppointment.Where(p => p.CustomerID == id).ToList();
            if (customerAppointment.Count>0)
            {
                foreach (var item in customerAppointment)
                {
                    //利用所有的预约id去查有没有体检信息，有则删除体检信息
                    ClientMdicalIformation clientMdicalIformation = db.ClientMdicalIformation.Where(p => p.CustomerAppointmentID == item.CustomerAppointmentID).ToList().FirstOrDefault();
                    if (clientMdicalIformation!=null)
                    {


                        //删除体检信息之后才能删除内外科
                        db.ClientMdicalIformation.Remove(clientMdicalIformation);
                        db.SaveChanges();
                        //删除外科体检信息
                        int SurgicalExaminationID = clientMdicalIformation.SurgicalExaminationID;
                        SurgicalExamination surgicalExamination= db.SurgicalExamination.Find(SurgicalExaminationID);
                        db.SurgicalExamination.Remove(surgicalExamination);
                        db.SaveChanges();
                        //删除内科体检信息
                        int MedicalExaminationID = clientMdicalIformation.MedicalExaminationID;
                        MedicalExamination medicalExamination = db.MedicalExamination.Find(MedicalExaminationID);
                        db.MedicalExamination.Remove(medicalExamination);
                        db.SaveChanges();


                        //删除客户回访信息
                     List<CustomerReturnVisit> customerReturnVisit =  db.CustomerReturnVisit.Where(p=>p.ConclusionID== clientMdicalIformation.ConclusionID).ToList();
                        if (customerReturnVisit.Count>0)
                        {
                            foreach (var item2 in customerReturnVisit)
                            {
                                CustomerReturnVisit customerReturnVisit1= db.CustomerReturnVisit.Find(item2.ConclusionID);
                                db.CustomerReturnVisit.Remove(customerReturnVisit1);
                                db.SaveChanges();
                            }
                        }
                    }
                }
            }
            


            CustomerInformation customerInformation = db.CustomerInformation.Find(id);
            db.CustomerInformation.Remove(customerInformation);
            db.SaveChanges();
        }
        //详细查看客户的方法
        public CustomerInformation DetailedCustomerInformation(int id)
        {
            return db.CustomerInformation.Find(id);
        }
        //详细查看客户的方法
        public int EditCustomerInformation(CustomerInformation customerInformation)
        {
            db.Entry(customerInformation).State = System.Data.Entity.EntityState.Modified;
            int res = db.SaveChanges();
            return res;
        }
        







        //查询所有预约信息
        public List<CustomerAppointment> SelectAppointments()
        {
            return db.CustomerAppointment.ToList();
           
        }
        //新增预约信息
        public void AddCustomerAppointment(CustomerAppointment customerAppointment)
        {
            db.CustomerAppointment.Add(customerAppointment);
            db.SaveChanges();

        }
        
        //利用名字查询单独的一个客户ID
        public int SelectInform(string name)
        {
            CustomerInformation customerInformation= db.CustomerInformation.FirstOrDefault(p=>p.CustomerName== name);
            int rez;
            if (customerInformation==null)
            {
                 rez = 1;
            }
            else
            {
                 rez = customerInformation.CustomerID;
            }
                return rez;
        }
        
        //删除预约信息
        public void DeleteCustomerAppointment(int id)
        {
           

            //利用所有的预约id去查有没有体检信息，有则删除体检信息
            ClientMdicalIformation clientMdicalIformation = db.ClientMdicalIformation.Where(p => p.CustomerAppointmentID == id).ToList().FirstOrDefault();
            if (clientMdicalIformation != null)
            {


                //删除体检信息之后才能删除内外科
                db.ClientMdicalIformation.Remove(clientMdicalIformation);
                db.SaveChanges();
                //删除外科体检信息
                int SurgicalExaminationID = clientMdicalIformation.SurgicalExaminationID;
                SurgicalExamination surgicalExamination = db.SurgicalExamination.Find(SurgicalExaminationID);
                db.SurgicalExamination.Remove(surgicalExamination);
                db.SaveChanges();
                //删除内科体检信息
                int MedicalExaminationID = clientMdicalIformation.MedicalExaminationID;
                MedicalExamination medicalExamination = db.MedicalExamination.Find(MedicalExaminationID);
                db.MedicalExamination.Remove(medicalExamination);
                db.SaveChanges();
            }
            CustomerAppointment customerAppointment = db.CustomerAppointment.Find(id);
            db.CustomerAppointment.Remove(customerAppointment);
            db.SaveChanges();


        }

        //按预约id查询一个预约信息
        public CustomerAppointment EditCustomerAppointment(int id)
        {
           CustomerAppointment customerAppointment = db.CustomerAppointment.Find(id);
            return customerAppointment;
        }
        
        //保存预约的修改
        public void EditSaChangsCustomerAppointment(CustomerAppointment customerAppointment)
        {
            db.Entry(customerAppointment).State = System.Data.Entity.EntityState.Modified;
             db.SaveChanges();
        }
        //验证医生登录号
        public UserDoctorList SelectDoctorList(string DoctorAccount, string DoctorPassword)
        {
            UserDoctorList userDoctorList= db.UserDoctorList.SingleOrDefault(p=>p.DoctorAccount== DoctorAccount&&p.DoctorPassword== DoctorPassword);
            return userDoctorList;
        }
        //查看历史体检信息
        public List<ClientMdicalIformation> SelectClientMdical()
        {
            return db.ClientMdicalIformation.ToList();
           
        }
        //查看一个人的详细病史信息
        public MedicalHistory SelectCustomerDetails(int id)
        {
            return db.MedicalHistory.ToList().FirstOrDefault(p=>p.CustomerID== id);
        }
        //查看所有医生信息
        public List<UserDoctorList> SelectDoctorList()
        {
            return db.UserDoctorList.ToList();
            
        }

        //查找没有登记体检信息的客户预约信息单
        public List<CustomerAppointment> SelectAppointmentsUnregistered()
        {
            //预约表
            List<CustomerAppointment> customerAppointment = db.CustomerAppointment.ToList();

            return customerAppointment;
        }
        //新增外科信息
        public int AddSurgicalExamination(SurgicalExamination surgicalExamination)
        {
            db.SurgicalExamination.Add(surgicalExamination);
            db.SaveChanges();
            //利用方法查询到外科表的最后一条信息（上面新增的那条）
            SurgicalExamination surgicalExamination1 = db.SurgicalExamination.ToList().LastOrDefault();
            //拿到新增那条外科信息返回id
            int SurgicalExaminationID = surgicalExamination1.SurgicalExaminationID;
            return SurgicalExaminationID;
        }
        //新增内科信息
        public int AddMedicalExamination(MedicalExamination medicalExamination)
        {
            db.MedicalExamination.Add(medicalExamination);
            db.SaveChanges();
            //利用方法查询到内科表的最后一条信息（上面新增的那条）
            MedicalExamination medicalExamination1= db.MedicalExamination.ToList().LastOrDefault();
            //拿到新增那条内科信息返回id
            int MedicalExaminationID = medicalExamination1.MedicalExaminationID;
            return MedicalExaminationID;
        }
        //根据查询到的客户id在客户预约表中查询记录返回预约id
        public int selectAppointment(int id)
        {
            var customerAppointment = db.CustomerAppointment.Where(p => p.CustomerID == id).ToList().FirstOrDefault();
            int CustomerAppointmentID = customerAppointment.CustomerAppointmentID;
            return CustomerAppointmentID;
        }
        //根据查询到的客户id在客户预约表中查询记录返回所有预约记录
        public List<CustomerAppointment> selectAppointments(int id)
        {
            return  db.CustomerAppointment.Where(p => p.CustomerID == id).ToList();
            
        }
        //保存体检信息的表
        public void AddMdicalIformation(ClientMdicalIformation clientMdicalIformation)
        {
            db.ClientMdicalIformation.Add(clientMdicalIformation);
            db.SaveChanges();
        }

        //删除客户体检信息，外科也一并删除 
        public void DeleteSurgicalExamination(int id)
        {
            ClientMdicalIformation clientMdicalIformation= db.ClientMdicalIformation.Find(id);
            var SurgicalExamination = clientMdicalIformation.SurgicalExaminationID;
            SurgicalExamination surgicalExamination= db.SurgicalExamination.Find(SurgicalExamination);
            db.SurgicalExamination.Remove(surgicalExamination);
            db.SaveChanges();
        }
        //删除客户体检信息，内科也一并删除 
        public void DeleteMedicalExamination(int id)
        {
            //利用体检信息表拿到那一条数据中的内科id，再从内科中选择到了对应id，执行删除
            ClientMdicalIformation clientMdicalIformation = db.ClientMdicalIformation.Find(id);
            var MedicalExamination = clientMdicalIformation.MedicalExaminationID;
            MedicalExamination medicalExamination = db.MedicalExamination.Find(MedicalExamination);
            db.MedicalExamination.Remove(medicalExamination);
            db.SaveChanges();
        }
        //删除客户体检信息，内外科也一并删除 
        public void DeleteMdicalIformation(int  id)
        {
            ClientMdicalIformation clientMdicalIformation = db.ClientMdicalIformation.Find(id);
            db.ClientMdicalIformation.Remove(clientMdicalIformation);
            db.SaveChanges();
        }


        //利用体检表id查到并返回 
        public ClientMdicalIformation SelectClientMdicalIformation(int id)
        {
          return  db.ClientMdicalIformation.Find(id);
        }
        //利用体检表id查到对应外科并返回 
        public SurgicalExamination SelectSurgical(int id)
        {
            ClientMdicalIformation clientMdicalIformation= db.ClientMdicalIformation.Find(id);
            var SurgicalExaminationID = clientMdicalIformation.SurgicalExaminationID;
            SurgicalExamination surgicalExamination = db.SurgicalExamination.Find(SurgicalExaminationID);
            return surgicalExamination;
        }
        //利用体检表id查到对应内科并返回 
        public MedicalExamination SelectExamination(int id)
        {
            ClientMdicalIformation clientMdicalIformation = db.ClientMdicalIformation.Find(id);
            var MedicalExaminationID = clientMdicalIformation.MedicalExaminationID;
            MedicalExamination medicalExamination = db.MedicalExamination.Find(MedicalExaminationID);
            return medicalExamination;
        }

        //监控内外科表和体检信息表的变化并且保存 
        public void Monitor(ClientMdicalIformation clientMdicalIformation, SurgicalExamination surgicalExamination, MedicalExamination medicalExamination)
        {
            db.Entry(clientMdicalIformation).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            db.Entry(surgicalExamination).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            db.Entry(medicalExamination).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
}
