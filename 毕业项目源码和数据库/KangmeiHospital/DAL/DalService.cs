using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
namespace DAL
{
  public  class DalService
    {
        KangmeiHospitalCRMEntities4 db = new KangmeiHospitalCRMEntities4();
        //拿到所有的客户服务记录
        public List<CustomerService> selectCustomerService()
        {
            List<CustomerService> customerServices= db.CustomerService.ToList();
            return customerServices;
        }
        //拿到所有的客户服务记录
        public List<UserDoctorList> selectUserDoctorList()
        {
            List<UserDoctorList> userDoctorLists= db.UserDoctorList.ToList();
            return userDoctorLists;
        } 
        //信息客户服务记录
        public void AddCustomerService(CustomerService customerService)
        {
            db.CustomerService.Add(customerService);
            db.SaveChanges();
        }
        //删除信息客户服务记录
        public void DeleteCustomerService(int id)
        {
            CustomerService customerService= db.CustomerService.Find(id);
            db.CustomerService.Remove(customerService);
            db.SaveChanges();
        }



        public List<CustomerReturnVisit> SelectCustomerReturnVisit()
        {
            List<CustomerReturnVisit> customerReturnVisit = db.CustomerReturnVisit.ToList();
            return customerReturnVisit;
        }
        //拿到所有的客户的信息
        public List<ClientMdicalIformation> SelectClientMdicalIformation()
        {
            return db.ClientMdicalIformation.ToList();
        }
        //增加回访记录
        public void AddCustomerReturnVisit(CustomerReturnVisit customerReturnVisit)
        {
            db.CustomerReturnVisit.Add(customerReturnVisit);
            db.SaveChanges();
        }
        //删除回访记录
        public void DeleteCustomerReturnVisit(int id)
        {
            CustomerReturnVisit customerReturnVisit= db.CustomerReturnVisit.Find(id);
            db.CustomerReturnVisit.Remove(customerReturnVisit);
            db.SaveChanges();
        }

        //新增关怀
        public void AddCustomerCare()
        {
        
        }

        //修改回访记录
        public CustomerReturnVisit SelectCustomerReturnVisit(int id)
        {
            return db.CustomerReturnVisit.Find(id);
        }
        //修改回访记录
        public void EditCustomerReturnVisit(CustomerReturnVisit customerReturnVisit)
        {
            db.Entry(customerReturnVisit).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
}
