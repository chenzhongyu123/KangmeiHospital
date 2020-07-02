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
            List<ClientMdicalIformation> clientMdicalIformation= db.ClientMdicalIformation.ToList();
            List<CustomerCare> customerCare = db.CustomerCare.ToList();
            //查询所有体检记录
            foreach (var item in clientMdicalIformation)
            {
                //查询所有关怀所有记录
                foreach (var item2 in customerCare)
                {
                    //计算item体检信息的日期>30天的体检记录true / false
                    DateTime time = item.InspectionTime;
                    DateTime dateTime = DateTime.Now;
                    //巧用C#里ToString的字符格式化更简便   
                    DateTime time2 = DateTime.Parse(time.AddMonths(1).ToShortDateString());

                    //现实时间比计算后的时间更晚，结果大于0才通过
                    if (DateTime.Compare(dateTime, time2)>0)
                    {
                    //判断item2体检id是否存在item的id 不存在就可以添加
                    if (db.CustomerCare.Where(p=>p.ConclusionID==item.ConclusionID).Count()>0)
                    {
                    }
                    else
                    {
                            CustomerCare customerCare1 = new CustomerCare();
                            customerCare1.ConclusionID = item.ConclusionID;
                            customerCare1.DoctorID = item.DoctorID;
                            customerCare1.ProcessedOrNot = 0;
                            db.CustomerCare.Add(customerCare1);
                            db.SaveChanges();
                    }
                    }
                }

            }

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








        //查询所有关怀信息
        public List<CustomerCare> SelectCustomerCare()
        {
           return db.CustomerCare.Where(p => p.ProcessedOrNot == 0).ToList() ;
        }
        //修改关怀信息状态
        public void EditCustomerCare(int id)
        {
            CustomerCare customerCare= db.CustomerCare.Find(id);
            if (customerCare.ProcessedOrNot ==0)
            {
                customerCare.ProcessedOrNot =1;
                db.SaveChanges();
            }
            else
            {
                customerCare.ProcessedOrNot = 0;
                db.SaveChanges();
            }
        }

        //查询所有关怀
        public List<CustomerCare> AllSelectCustomerCare()
        {
           return db.CustomerCare.Where(p=>p.ProcessedOrNot==1).ToList();
        }


    }
}
