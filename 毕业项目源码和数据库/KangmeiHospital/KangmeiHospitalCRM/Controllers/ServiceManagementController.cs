using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KangmeiHospitalCRM.Controllers
{
    public class ServiceManagementController : Controller
    {
        // GET: ServiceManagement
        public ActionResult CustomerService()
        {
            return View();
        }
        public ActionResult CustomerReturnVisit()
        {
            return View();
        }
        public ActionResult CustomerCare()
        {
            return View();
        }
    }
}