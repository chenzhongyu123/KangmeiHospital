using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;
namespace BLL
{
   public class KnowledgeBaseBll
    {
        KnowledgeBaseDal Dal = new KnowledgeBaseDal();
        
        //查询所有的类型
        public List<KnowledgeBaseTypeManagement> SelectKnowledgeBaseTypeManagement()
        {
            return Dal.SelectKnowledgeBaseTypeManagement();
        }
        
        //新增题库
        public void AddKnowledgeBaseTypeManagement(KnowledgeBaseTypeManagement knowledgeBaseTypeManagement)
        {
             Dal.AddKnowledgeBaseTypeManagement(knowledgeBaseTypeManagement);
        }
        
        //修改题库状态
        public void EditKnowledgeBaseTypeManagement(int id)
        {
            Dal.EditKnowledgeBaseTypeManagement(id);
        }




        
        //查找知识库
        public List<View_KnowledgeBase> SelectKnowledgeBaseContentManagement()
        {
           return Dal.SelectKnowledgeBaseContentManagement();
        }
        
        //查找医生
        public List<UserDoctorList> SelectUserDoctorList()
        {
            return Dal.SelectUserDoctorList();
        }
        //添加题目
        public void AddKnowledgeBaseContentManagement(KnowledgeBaseContentManagement knowledgeBaseContentManagement)
        {
             Dal.AddKnowledgeBaseContentManagement(knowledgeBaseContentManagement);
        }
        
        //删除题目
        public void DeleteKnowledgeBaseContentManagement(int id)
        {
            Dal.DeleteKnowledgeBaseContentManagement(id);
        }
        
        //修改题目
        public KnowledgeBaseContentManagement EditKnowledgeBaseContentManagement(int id)
        {
          return Dal.EditKnowledgeBaseContentManagement(id);
        }
        
        //修改题目保存
        public void EditKnowledgeBaseContentManagementsavchangs(KnowledgeBaseContentManagement knowledgeBaseContentManagement)
        {
             Dal.EditKnowledgeBaseContentManagementsavchangs(knowledgeBaseContentManagement);
        }
    }
    
}
