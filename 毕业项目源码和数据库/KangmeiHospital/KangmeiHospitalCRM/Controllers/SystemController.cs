using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using BLL;
using System.Web.WebPages;

namespace KangmeiHospitalCRM.Controllers
{
    public class SystemController : Controller
    {
        KangmeiHospitalCRMEntities4 db = new KangmeiHospitalCRMEntities4();
        BllSystem Bll = new BllSystem();
        // GET: System
        public ActionResult CreateDoctor()
        {
            List<UserDoctorList> userDoctorList = Bll.SelectUserDoctorList();
            return View(userDoctorList);
        }
        [HttpPost]
        //新增医生
        public ActionResult CreateDoctor(UserDoctorList userDoctorList)
        {
            string IDCard = userDoctorList.DoctorIdentity;
            string BirthDay = "";
            string strYear;
            string strMonth;
            string strDay;
            if (IDCard.Length == 15)
            {
                strYear = IDCard.Substring(6, 4);
                strMonth = IDCard.Substring(10, 2);
                strDay = IDCard.Substring(12, 2);
                BirthDay = strYear + "-" + strMonth + "-" + strDay;
                userDoctorList.DoctorDateOfBirth = BirthDay.AsDateTime();
            }
            if (IDCard.Length == 18)
            {
                strYear = IDCard.Substring(6, 4);
                strMonth = IDCard.Substring(10, 2);
                strDay = IDCard.Substring(12, 2);
                BirthDay = strYear + "-" + strMonth + "-" + strDay;
                userDoctorList.DoctorDateOfBirth = BirthDay.AsDateTime();
            }


            Bll.CreateUserDoctorList(userDoctorList);
            return RedirectToAction("CreateDoctor");
        }


        //切换是否管理
        public ActionResult IsAdministratorOrNot(int id)
        {
             Bll.IsAdministratorOrNot(id);
            return RedirectToAction("CreateDoctor");
        }

        
        //详细+修改
        public ActionResult EditUserDoctorList(int id)
        {
          UserDoctorList userDoctorList= Bll.EditUserDoctorList(id);
            return View(userDoctorList);
        }
        //详细+修改
        [HttpPost]
        public ActionResult EditUserDoctorList(UserDoctorList userDoctorList)
        {
            Bll.EditUserDoctorList(userDoctorList);
            return RedirectToAction("CreateDoctor");
        }

        
        //退出系统
        public ActionResult TuiChu()
        {
            Session["Doctor"] = "";
            return RedirectToAction("Login", "CustomerInFormation"); 
        }
    }
}