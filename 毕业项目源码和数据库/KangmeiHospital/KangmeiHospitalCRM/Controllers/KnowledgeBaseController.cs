using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KangmeiHospitalCRM.Controllers
{
    public class KnowledgeBaseController : Controller
    {
        // GET: KnowledgeBase
        public ActionResult KnowledgeBaseTypeManagement()
        {
            return View();
        }
        public ActionResult KnowledgeBaseContentManagement()
        {
            return View();
        }
    }
}