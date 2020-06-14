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

        BLLkangMei Bll = new BLLkangMei();
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
            List<CustomerInformation> list = Bll.SelectInformation();
            return View(list);
        }
        //客户预约管理
        public ActionResult CustomerAppointment()
        {
            List<CustomerAppointment> customerAppointments = Bll.SelectAppointments();
            return View(customerAppointments);
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





        //以上为静态初始界面 以下为提交和转跳界面

            [HttpPost]
            //新增客户
        public ActionResult AddCustomerInformation(CustomerInformation customerInformation)
        {
            Bll.AddCustomerInformation(customerInformation);
            return RedirectToAction("Customer");
        }

        //删除客户，以及下面的数据

        public ActionResult DeleteCustomerInformation(int id)
        {
            Bll.DeleteCustomerInformation(id);
            return RedirectToAction("Customer");
        }
        
        //详细客户资料

        public ActionResult DetailedCustomerInformation(int id)
        {
            CustomerInformation customerInformation = Bll.DetailedCustomerInformation(id);
             return View(customerInformation);
        }
        
       [HttpPost]
        //修改客户
        public ActionResult EditCustomerInformation(CustomerInformation customerInformation)
        {
           Bll.EditCustomerInformation(customerInformation);
            return RedirectToAction("Customer");
        }

                [HttpPost]
        //新增客户
        public ActionResult AddCustomerAppointment(CustomerAppointment  customerAppointment,string CustomerName)
        {

            //利用名字查询到对应客户的ID
            int CustomerID = Bll.SelectInform(CustomerName);
            if (CustomerID==1)
            {
                return Content("<script>alert('注册客户无此人，请检查名字是否正确！');history.go(-1);</script>");
            }
            else
            {
                customerAppointment.CustomerID = CustomerID;
                Bll.AddCustomerAppointment(customerAppointment);
                return RedirectToAction("CustomerAppointment");
            }
        }
        //删除客户预约

        public ActionResult DeleteCustomerAppointment(int id)
        {
            Bll.DeleteCustomerAppointment(id);
            return RedirectToAction("CustomerAppointment");
        }

    }
}