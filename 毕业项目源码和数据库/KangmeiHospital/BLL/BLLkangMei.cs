using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;
namespace BLL
{
    public class BLLkangMei
    {
        //客户层
        DALkangMei Dal = new DALkangMei();
        //查询所有的客户
        public List<CustomerInformation> SelectInformation()
        {
            return Dal.SelectInformation(); 
        }
        //新增一个用户的方法
        public void AddCustomerInformation(CustomerInformation customerInformation)
        {
            //先建立了客户表信息
           int CustomerID =  Dal.AddCustomerInformation(customerInformation);
            //立马建立一个空病史表
            Dal.AddCustomerDetails(CustomerID);
        }
        
         //删除客户
         public void DeleteCustomerInformation(int id)
        {
            Dal.DeleteCustomerInformation(id);
        }
        
         //详细客户资料
         public CustomerInformation DetailedCustomerInformation(int id)
        {
            return Dal.DetailedCustomerInformation(id);
        }
        
         //修改客户资料
         public int EditCustomerInformation(CustomerInformation customerInformation)
        {
            return Dal.EditCustomerInformation(customerInformation);
        }
        






         //查看客户预约信息
         public List<CustomerAppointment> SelectAppointments()
        {
            return Dal.SelectAppointments();
        }
        
         //新增客户预约信息
         public void AddCustomerAppointment(CustomerAppointment customerAppointment)
        {
            Dal.AddCustomerAppointment(customerAppointment);
        }
        

         //利用名字查询单独的一个客户ID
         public int SelectInform(string name)
        {
           return Dal.SelectInform(name);
        }
        //删除预约
        public void DeleteCustomerAppointment(int id)
        {
            Dal.DeleteCustomerAppointment(id);
        }
        
        //修改预约的查询
        public CustomerAppointment EditCustomerAppointment(int id)
        {
            CustomerAppointment customerAppointment= Dal.EditCustomerAppointment(id);
            return customerAppointment;
        }
        
        //修改预约保存
        public void EditSaChangsCustomerAppointment(CustomerAppointment customerAppointment)
        {
             Dal.EditSaChangsCustomerAppointment(customerAppointment);
        }
        //验证医生登录号
        public UserDoctorList SelectDoctorList(string DoctorAccount, string DoctorPassword)
        {
          return  Dal.SelectDoctorList(DoctorAccount, DoctorPassword);
        }
        //修改一个客户的病史表
        public void EditCustomerDetails(MedicalHistory medicalHistory)
        {
             Dal.EditCustomerDetails(medicalHistory);
        }

        //查看历史体检信息
        public List<ClientMdicalIformation> SelectClientMdical()
        {
            return Dal.SelectClientMdical();
        }
        
        //查看一个人的详细体检信息
        public MedicalHistory SelectCustomerDetails(int id)
        {
            return Dal.SelectCustomerDetails(id);
        }
        
        //查看所有医生信息
        public List<UserDoctorList> SelectDoctorList()
        {
            return Dal.SelectDoctorList();
        }

        //查找没有登记体检信息的客户预约信息单
        public List<CustomerAppointment> SelectAppointmentsUnregistered()
        {
            return Dal.SelectAppointmentsUnregistered();
        }
        //新增外科信息
        public int AddSurgicalExamination(SurgicalExamination surgicalExamination)
        {
           return  Dal.AddSurgicalExamination(surgicalExamination);
        }
        //新增内科信息
        public int AddMedicalExamination(MedicalExamination medicalExamination)
        {
          return  Dal.AddMedicalExamination(medicalExamination);
        }
        
        //根据查询到的客户id在客户预约表中查询记录返回预约id
        public int selectAppointment(int id)
        {
           return Dal.selectAppointment(id);
        }
        //保存体检信息的表
        public void AddMdicalIformation(ClientMdicalIformation clientMdicalIformation)
        {
             Dal.AddMdicalIformation(clientMdicalIformation);
        }
        //删除客户体检信息，内外科也一并删除 
        public void DeleteMdicalIformation(int id)
        {
            Dal.DeleteMdicalIformation(id);
        }
        
        //利用体检表id查到并返回 
        public ClientMdicalIformation SelectClientMdicalIformation(int id)
        {
          return  Dal.SelectClientMdicalIformation(id);
        }
        //利用体检表id查到对应外科并返回 
        public SurgicalExamination SelectSurgical(int id)
        {
            return Dal.SelectSurgical(id);
        }
        //利用体检表id查到对应内科并返回 
        public MedicalExamination SelectExamination(int id)
        {
            return Dal.SelectExamination(id);
        }
        
        //监控内外科表和体检信息表的变化并且保存 
        public void Monitor(ClientMdicalIformation clientMdicalIformation, SurgicalExamination surgicalExamination, MedicalExamination medicalExamination)
        {
             Dal.Monitor(clientMdicalIformation, surgicalExamination, medicalExamination);
        }
    }
}
