using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model;
using BLL;
namespace KangmeiHospitalCRM.Controllers
{
    public class KnowledgeBaseController : Controller
    {
        KangmeiHospitalCRMEntities4 db = new KangmeiHospitalCRMEntities4();

        KnowledgeBaseBll Bll = new KnowledgeBaseBll();
        // GET: KnowledgeBase
        public ActionResult KnowledgeBaseTypeManagement()
        {
           List<KnowledgeBaseTypeManagement> knowledgeBaseTypeManagement=   Bll.SelectKnowledgeBaseTypeManagement();
            return View(knowledgeBaseTypeManagement);
        }

        //新增题库类型
        [HttpPost] 
            public ActionResult AddKnowledgeBaseTypeManagement(KnowledgeBaseTypeManagement knowledgeBaseTypeManagement)
        {
            Bll.AddKnowledgeBaseTypeManagement(knowledgeBaseTypeManagement);
            return RedirectToAction("KnowledgeBaseTypeManagement");
        }
            //修改题库状态
            public ActionResult EditKnowledgeBaseTypeManagement(int id)
        {
            Bll.EditKnowledgeBaseTypeManagement(id);
            return RedirectToAction("KnowledgeBaseTypeManagement");
        }

        //查找题目
        public ActionResult KnowledgeBaseContentManagement()
        {
            List<UserDoctorList> userDoctorLists = Bll.SelectUserDoctorList();
            ViewBag.list = userDoctorLists;
            List<KnowledgeBaseTypeManagement> knowledgeBaseTypeManagement = Bll.SelectKnowledgeBaseTypeManagement();
            ViewBag.list2 = knowledgeBaseTypeManagement;
            List<View_KnowledgeBase> View_KnowledgeBase = Bll.SelectKnowledgeBaseContentManagement();
            return View(View_KnowledgeBase);
        }
        
        //新增题目
        [HttpPost]
            public ActionResult AddKnowledgeBaseContentManagement(KnowledgeBaseContentManagement knowledgeBaseContentManagement)
        {
            Bll.AddKnowledgeBaseContentManagement(knowledgeBaseContentManagement);
            return RedirectToAction("KnowledgeBaseContentManagement");
        }
        
        //删除题目
            public ActionResult DeleteKnowledgeBaseContentManagement(int id)
        {
            Bll.DeleteKnowledgeBaseContentManagement(id);
            return RedirectToAction("KnowledgeBaseContentManagement");
        }
        
            //修改题目
            public ActionResult EditKnowledgeBaseContentManagement(int id)
        {
            List<UserDoctorList> userDoctorLists = Bll.SelectUserDoctorList();
            ViewBag.list = userDoctorLists;
            List<KnowledgeBaseTypeManagement> knowledgeBaseTypeManagement = Bll.SelectKnowledgeBaseTypeManagement();
            ViewBag.list2 = knowledgeBaseTypeManagement;
            KnowledgeBaseContentManagement knowledgeBaseContentManagement  =   Bll.EditKnowledgeBaseContentManagement(id);
            return View(knowledgeBaseContentManagement);
        }

        //修改题目
        [HttpPost]
        public ActionResult EditKnowledgeBaseContentManagement(KnowledgeBaseContentManagement knowledgeBaseContentManagement )
        {
            Bll.EditKnowledgeBaseContentManagementsavchangs(knowledgeBaseContentManagement);
            return RedirectToAction("KnowledgeBaseContentManagement");
        }
    }
}