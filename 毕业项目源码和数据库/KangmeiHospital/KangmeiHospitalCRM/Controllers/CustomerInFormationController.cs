using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using BLL;
namespace KangmeiHospitalCRM.Controllers
{
    public class CustomerInFormationController : Controller
    {
        KangmeiHospitalCRMEntities db = new KangmeiHospitalCRMEntities();
        // GET: CustomerInFormation
        //首页
        public ActionResult Index()
        {
            return View();
        }
        //登陆界面
        public ActionResult Login()
        {
            return View();
        }
        //客户信息页
        public ActionResult Customer() {
            return View();
        }
        //客户预约管理
        public ActionResult CustomerAppointment()
        {
            return View();
        }
        //客户体检信息管理
        public ActionResult ClientMdicalIformation()
        {
            return View();
        }
        //客户信息的更详细内容，包括病史
        public ActionResult CustomerDetails()
        {
            return View();
        }
    }
}