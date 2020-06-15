﻿using System;
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

        KangmeiHospitalCRMEntities3 db = new KangmeiHospitalCRMEntities3();

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
        //登录验证
        [HttpPost]
        public ActionResult Login(string DoctorAccount,string DoctorPassword)
        {
          UserDoctorList userDoctorList=  Bll.SelectDoctorList(DoctorAccount, DoctorPassword);
            if (userDoctorList==null)
            {
                return Content("<script>alert('账号或密码错误！');history.go(-1);</script>");
            }
            else
            {
                return RedirectToAction("Index");
            }
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
        //客户体检信息查询显示，按照记录倒序排列
        public ActionResult ClientMdical()
        {

            List<ClientMdicalIformation> list = Bll.SelectClientMdical();
            return View(list);
        }
        //客户体检详细+修改信息
        public ActionResult ClientMdicalIformation(int id)
        {
            List<UserDoctorList> list = Bll.SelectDoctorList();

            ViewBag.ClientMdicalIformation = Bll.SelectClientMdicalIformation(id);
            //外
            ViewBag.SurgicalExamination = Bll.SelectSurgical(id); 
            //内
            ViewBag.MedicalExamination = Bll.SelectExamination(id);
            return View(list);
        }
        //客户体检详细+修改信息提交
        [HttpPost]
        public ActionResult ClientMdicalIformation(ClientMdicalIformation clientMdicalIformation, SurgicalExamination surgicalExamination, MedicalExamination medicalExamination)
        {
            Bll.Monitor(clientMdicalIformation,surgicalExamination, medicalExamination);
            return RedirectToAction("ClientMdical");
        }
        //新增客户体检信息
        public ActionResult AddClientMdicalIfor()
        {
            List<UserDoctorList> list = Bll.SelectDoctorList();
            return View(list);
        }
        [HttpPost]
        public ActionResult AddClientMdicalIfor(ClientMdicalIformation  clientMdicalIformation, SurgicalExamination surgicalExamination, MedicalExamination  medicalExamination,string CustomerName)
        {
            //利用客户名字查询到客户的id
            int rez=  Bll.SelectInform(CustomerName);
            if (rez!=1)
            {

                //利用客户id查到最近一条预约体检
                int CustomerAppointmentID =  Bll.selectAppointment(rez);
                //新建外科，拿到新建信息的id
                int SurgicalExaminationID=   Bll.AddSurgicalExamination(surgicalExamination);
                //新建内科，拿到新建信息的id
                int MedicalExaminationID = Bll.AddMedicalExamination(medicalExamination);
                //以上拿到的三个id都是体检信息表的外键字段，将他们放入体检信息
                clientMdicalIformation.CustomerAppointmentID = CustomerAppointmentID;
                clientMdicalIformation.SurgicalExaminationID = SurgicalExaminationID;
                clientMdicalIformation.MedicalExaminationID = MedicalExaminationID;
                //新建体检信息
                Bll.AddMdicalIformation(clientMdicalIformation);

                return RedirectToAction("ClientMdical");
            }
            else
            {
                return Content("<script>alert('注册客户无此人，请检查名字是否正确！');history.go(-1);</script>");
            }
        }


        //删除客户体检信息，内外科也一并删除 EditMdicalIformation
        public ActionResult DeleteMdicalIformation(int id)
        {
              Bll.DeleteMdicalIformation(id);
            return RedirectToAction("ClientMdical");
        }
        //客户信息的更详细内容，包括病史
        public ActionResult CustomerDetails(int id)
        {
            MedicalHistory medicalHistory = Bll.SelectCustomerDetails(id);
            return View(medicalHistory);
        }
        //病史表的修改提交
        [HttpPost]
        public ActionResult CustomerDetails(MedicalHistory medicalHistory)
        {
             Bll.EditCustomerDetails(medicalHistory);
            return RedirectToAction("Customer");
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
        //修改客户
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
        
        //修改客户预约

        public ActionResult EditCustomerAppointment(int id)
        {
            return View(Bll.EditCustomerAppointment(id));
        }
        //保存修改
        [HttpPost]
        public ActionResult EditCustomerAppointment(CustomerAppointment customerAppointment)
        {
            Bll.EditSaChangsCustomerAppointment(customerAppointment);
            return RedirectToAction("CustomerAppointment");
        }
    }
}