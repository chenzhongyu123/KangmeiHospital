using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
namespace DAL
{
   public class DalSystem
    {
        KangmeiHospitalCRMEntities4 db = new KangmeiHospitalCRMEntities4();
        //拿到所有的医生信息
        public List<UserDoctorList> SelectUserDoctorList()
        {
          return  db.UserDoctorList.ToList();
        }
        //新增医生
        public void CreateUserDoctorList(UserDoctorList userDoctorList)
        {
            db.UserDoctorList.Add(userDoctorList);
            db.SaveChanges();
        }

        public void IsAdministratorOrNot(int id)
        {
            UserDoctorList userDoctorList= db.UserDoctorList.Find(id);
            if (userDoctorList.AdministratorOrNot=="0")
            {
                userDoctorList.AdministratorOrNot = "1";
                db.SaveChanges();
            }
            else if (userDoctorList.AdministratorOrNot == "1")
            {
                userDoctorList.AdministratorOrNot = "2";
                db.SaveChanges();
            }
            else
            {

                userDoctorList.AdministratorOrNot = "0";
                db.SaveChanges();
            }
        }

        public UserDoctorList EditUserDoctorList(int id)
        {
           return db.UserDoctorList.Find(id);
        }
        //保存修改
        public void EditUserDoctorList(UserDoctorList userDoctorList)
        {
            db.Entry(userDoctorList).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
}
