using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
namespace DAL
{
   public class KnowledgeBaseDal
    {
        KangmeiHospitalCRMEntities4 db = new KangmeiHospitalCRMEntities4();
        //查询所有的类型
        public List<KnowledgeBaseTypeManagement> SelectKnowledgeBaseTypeManagement()
        {
            return db.KnowledgeBaseTypeManagement.ToList();
        }
         //新增题库
        public void AddKnowledgeBaseTypeManagement(KnowledgeBaseTypeManagement knowledgeBaseTypeManagement)
        {
            db.KnowledgeBaseTypeManagement.Add(knowledgeBaseTypeManagement);
            db.SaveChanges();
        }
        //修改题库状态
        public void EditKnowledgeBaseTypeManagement(int id)
        {
            KnowledgeBaseTypeManagement knowledgeBaseTypeManagement= db.KnowledgeBaseTypeManagement.Find(id);
            string rez = knowledgeBaseTypeManagement.OpenOrNot;
            if (rez=="0")
            {
                knowledgeBaseTypeManagement.OpenOrNot = "1";
                db.SaveChanges();
            }
            else
            {
                knowledgeBaseTypeManagement.OpenOrNot = "0";
                db.SaveChanges();
            }
        }
        //查找知识库
        public List<View_KnowledgeBase> SelectKnowledgeBaseContentManagement()
        {
           List<View_KnowledgeBase> view_KnowledgeBases= db.View_KnowledgeBase.Where(p=>p.OpenOrNot=="1").OrderBy(s=>s.KnowledgeBaseType).ToList();
            return view_KnowledgeBases;
        }
        //查找医生
        public List<UserDoctorList> SelectUserDoctorList()
        {
            return db.UserDoctorList.ToList();
        }
        //添加题目
        public void AddKnowledgeBaseContentManagement(KnowledgeBaseContentManagement knowledgeBaseContentManagement)
        {
            db.KnowledgeBaseContentManagement.Add(knowledgeBaseContentManagement);
            db.SaveChanges();
        }
        //删除题目
        public void DeleteKnowledgeBaseContentManagement(int id)
        {
            KnowledgeBaseContentManagement knowledgeBaseContentManagement= db.KnowledgeBaseContentManagement.Find(id);
            db.KnowledgeBaseContentManagement.Remove(knowledgeBaseContentManagement);
            db.SaveChanges();
        }
        //修改题目
        public KnowledgeBaseContentManagement EditKnowledgeBaseContentManagement(int id)
        {
            return db.KnowledgeBaseContentManagement.Find(id);
        }
        //修改题目保存
        public void EditKnowledgeBaseContentManagementsavchangs(KnowledgeBaseContentManagement knowledgeBaseContentManagement)
        {
            db.Entry(knowledgeBaseContentManagement).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
    }
}
