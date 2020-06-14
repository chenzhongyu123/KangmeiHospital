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
             Dal.AddCustomerInformation(customerInformation); 
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
    }
}
