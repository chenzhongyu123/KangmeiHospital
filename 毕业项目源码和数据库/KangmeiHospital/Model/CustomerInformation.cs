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
    
    public partial class CustomerInformation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CustomerInformation()
        {
            this.CustomerAppointment = new HashSet<CustomerAppointment>();
            this.MedicalHistory = new HashSet<MedicalHistory>();
        }
    
        public int CustomerID { get; set; }
        public string CustomerName { get; set; }
        public string CustomerIDCard { get; set; }
        public string CustomerGender { get; set; }
        public System.DateTime dateOfBirth { get; set; }
        public string CustomerNationality { get; set; }
        public string ClientsMaritalStatus { get; set; }
        public string CustomerBloodGroup { get; set; }
        public string CustomerOccupation { get; set; }
        public string CustomerEducation { get; set; }
        public string CustomerBelief { get; set; }
        public string CustomerContactNumber { get; set; }
        public string CustomerEmergencyContactNumber { get; set; }
        public string CustomerHomeAddress { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomerAppointment> CustomerAppointment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MedicalHistory> MedicalHistory { get; set; }
    }
}
