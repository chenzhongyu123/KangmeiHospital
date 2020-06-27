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
        KangmeiHospitalCRMEntities4 db = new KangmeiHospitalCRMEntities4();

        BllService Bll = new BllService();
        // GET: ServiceManagement
        //客户服务
        public ActionResult CustomerService()
        {
            ViewBag.UserDoctorList = Bll.selectUserDoctorList();
            List<CustomerService> customerServices= Bll.selectCustomerService();
            return View(customerServices);
        }
        //删除咨询信息
        public ActionResult DeleteCustomerService(int id)
        {
            Bll.DeleteCustomerService(id);
            return RedirectToAction("CustomerService");
        }
        //新增咨询信息
        [HttpPost]
        public ActionResult AddCustomerService (CustomerService customerService)
        {
            Bll.AddCustomerService(customerService);
            return RedirectToAction("CustomerService");
        }


        //客户回访
        public ActionResult CustomerReturnVisit()
        {
            ViewBag.UserDoctorList = Bll.selectUserDoctorList();
            ViewBag.ClientMdicalIformation = Bll.SelectClientMdicalIformation();
            List<CustomerReturnVisit> customerReturnVisit = Bll.SelectCustomerReturnVisit();
            return View(customerReturnVisit);
        }

        //新增客户回访
        public ActionResult AddCustomerReturnVisit(CustomerReturnVisit customerReturnVisit)
        {
            Bll.AddCustomerReturnVisit(customerReturnVisit);
            return RedirectToAction("CustomerReturnVisit");
        }
        
        //删除客户回访
        public ActionResult DeleteCustomerReturnVisit(int id)
        {
            Bll.DeleteCustomerReturnVisit(id);
            return RedirectToAction("CustomerReturnVisit");
        }
        //修改户回访
        public ActionResult EditCustomerReturnVisit(int id)
        {
            ViewBag.UserDoctorList = Bll.selectUserDoctorList();
            ViewBag.ClientMdicalIformation = Bll.SelectClientMdicalIformation();
            CustomerReturnVisit customerReturnVisit= Bll.SelectCustomerReturnVisit(id);
            return View(customerReturnVisit);
        }
        [HttpPost]
        //修改户回访
        public ActionResult EditCustomerReturnVisit(CustomerReturnVisit customerReturnVisit)
        {
            Bll.EditCustomerReturnVisit(customerReturnVisit);
            return RedirectToAction("CustomerReturnVisit");
        }

        //客户关怀
        public ActionResult CustomerCare()
        {
            return View();
        }
        //客户关怀
        
        public ActionResult EditCustomerCare()
        {
            Bll.AddCustomerCare();
            return RedirectToAction("CustomerCare");
        }
    }
}