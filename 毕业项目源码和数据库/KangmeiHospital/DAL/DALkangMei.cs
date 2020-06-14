using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
namespace DAL
{
    public class DALkangMei
    {
        KangmeiHospitalCRMEntities db = new KangmeiHospitalCRMEntities();
        //查询所有的客户
        public List<CustomerInformation> SelectInformation()
        {
            return db.CustomerInformation.ToList(); 
        }
        //新增一个用户的方法
        public void AddCustomerInformation(CustomerInformation customerInformation)
        {
            db.CustomerInformation.Add(customerInformation);
            db.SaveChanges();
        }
        //删除一个用户的方法
        public void DeleteCustomerInformation(int id)
        {
            CustomerInformation customerInformation = db.CustomerInformation.Find(id);
            db.CustomerInformation.Remove(customerInformation);
            db.SaveChanges();
        }
        //详细查看客户的方法
        public CustomerInformation DetailedCustomerInformation(int id)
        {
            return db.CustomerInformation.Find(id);
        }
        //详细查看客户的方法
        public int EditCustomerInformation(CustomerInformation customerInformation)
        {
            db.Entry(customerInformation).State = System.Data.Entity.EntityState.Modified;
            int res = db.SaveChanges();
            return res;
        }
        







        //查询所有预约信息
        public List<CustomerAppointment> SelectAppointments()
        {
            return db.CustomerAppointment.ToList();
           
        }
        //新增预约信息
        public void AddCustomerAppointment(CustomerAppointment customerAppointment)
        {
            db.CustomerAppointment.Add(customerAppointment);
            db.SaveChanges();

        }
        
        //利用名字查询单独的一个客户ID
        public int SelectInform(string name)
        {
            CustomerInformation customerInformation= db.CustomerInformation.FirstOrDefault(p=>p.CustomerName== name);
            int rez;
            if (customerInformation==null)
            {
                 rez = 1;
            }
            else
            {
                 rez = customerInformation.CustomerID;
            }
                return rez;
        }
        
        //删除预约信息
        public void DeleteCustomerAppointment(int id)
        {
            CustomerAppointment customerAppointment= db.CustomerAppointment.Find(id);
            db.CustomerAppointment.Remove(customerAppointment);
            db.SaveChanges();

        }
    }
}
