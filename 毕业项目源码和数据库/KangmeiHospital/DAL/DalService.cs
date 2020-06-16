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
    }
}
