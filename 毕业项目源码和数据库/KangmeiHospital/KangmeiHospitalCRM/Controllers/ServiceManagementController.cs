using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using BLL;
namespace KangmeiHospitalCRM.Controllers
{
    public class ServiceManagementController : Controller
    {
        KangmeiHospitalCRMEntities3 db = new KangmeiHospitalCRMEntities3();

        BllService Bll = new BllService();
        // GET: ServiceManagement
        //客户服务
        public ActionResult CustomerService()
        {
            ViewBag.UserDoctorList = Bll.selectUserDoctorList();
            List<CustomerService> customerServices= Bll.selectCustomerService();
            return View(customerServices);
        }




        //客户回访
        public ActionResult CustomerReturnVisit()
        {
            return View();
        }
        //客户关怀
        public ActionResult CustomerCare()
        {
            return View();
        }
    }
}