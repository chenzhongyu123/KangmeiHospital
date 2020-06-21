using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;
namespace BLL
{
   public class BllSystem
    {
         DalSystem Dal = new DalSystem();
        //拿到所有的医生信息
        public List<UserDoctorList> SelectUserDoctorList()
        {
            return Dal.SelectUserDoctorList();
        }
        //新增医生
        public void CreateUserDoctorList(UserDoctorList userDoctorList)
        {
            Dal.CreateUserDoctorList(userDoctorList);
        }

        //修改状态
        public void IsAdministratorOrNot(int id)
        {
            Dal.IsAdministratorOrNot(id);
        }
        //查找单个医生信息
        public UserDoctorList EditUserDoctorList(int id)
        {
          return  Dal.EditUserDoctorList(id);
        }
        //保存修改
        public void EditUserDoctorList(UserDoctorList userDoctorList)
        {
             Dal.EditUserDoctorList(userDoctorList);
        }
    }
}
