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
    }
}
