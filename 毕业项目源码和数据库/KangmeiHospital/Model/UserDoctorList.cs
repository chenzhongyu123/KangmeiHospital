//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserDoctorList
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public UserDoctorList()
        {
            this.ClientMdicalIformation = new HashSet<ClientMdicalIformation>();
            this.CustomerReturnVisit = new HashSet<CustomerReturnVisit>();
            this.CustomerService = new HashSet<CustomerService>();
            this.KnowledgeBaseContentManagement = new HashSet<KnowledgeBaseContentManagement>();
        }
    
        public int DoctorID { get; set; }
        public string DoctorOfName { get; set; }
        public string DoctorMajor { get; set; }
        public string DoctorGender { get; set; }
        public System.DateTime DoctorDateOfBirth { get; set; }
        public string DoctorIdentity { get; set; }
        public int DoctorAge { get; set; }
        public string DoctorAccount { get; set; }
        public string DoctorPassword { get; set; }
        public string DoctorSubject { get; set; }
        public string AdministratorOrNot { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientMdicalIformation> ClientMdicalIformation { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomerReturnVisit> CustomerReturnVisit { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomerService> CustomerService { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KnowledgeBaseContentManagement> KnowledgeBaseContentManagement { get; set; }
    }
}
