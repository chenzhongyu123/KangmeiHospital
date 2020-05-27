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
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Customer() {
            return View();
        }
    }
}