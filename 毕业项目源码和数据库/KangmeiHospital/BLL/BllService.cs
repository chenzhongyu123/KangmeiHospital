using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;
namespace BLL
{
  public  class BllService
    {
        DalService Dal = new DalService();
        //拿到所有的客户服务记录
        public List<CustomerService> selectCustomerService()
        {
            return Dal.selectCustomerService();
        }
        //拿到所有的客户服务记录
        public List<UserDoctorList> selectUserDoctorList()
        {
            return Dal.selectUserDoctorList();
        }
        
        //新增信息客户服务记录
        public void AddCustomerService(CustomerService customerService)
        {
           Dal.AddCustomerService(customerService);
        }
        //删除信息客户服务记录
        public void DeleteCustomerService(int id)
        {
            Dal.DeleteCustomerService(id);
        }





        //拿到所有的客户回访记录
        public List<CustomerReturnVisit> SelectCustomerReturnVisit()
        {
            return Dal.SelectCustomerReturnVisit();
        }
        //拿到所有的客户的信息
        public List<ClientMdicalIformation> SelectClientMdicalIformation()
        {
            return Dal.SelectClientMdicalIformation();
        }
        //增加回访记录
        public void AddCustomerReturnVisit(CustomerReturnVisit customerReturnVisit)
        {
             Dal.AddCustomerReturnVisit(customerReturnVisit);
        }
        
        //删除回访记录
        public void DeleteCustomerReturnVisit(int id)
        {
            Dal.DeleteCustomerReturnVisit(id);
        }
        //修改回访记录
        public CustomerReturnVisit SelectCustomerReturnVisit(int id)
        {
           return Dal.SelectCustomerReturnVisit(id);
        }
        
        //修改回访记录
        public void EditCustomerReturnVisit(CustomerReturnVisit customerReturnVisit)
        {
             Dal.EditCustomerReturnVisit(customerReturnVisit);
        }
    }
}
