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
    
    public partial class CustomerService
    {
        public int CustomerServiceID { get; set; }
        public Nullable<int> DoctorID { get; set; }
        public Nullable<int> ConclusionID { get; set; }
        public string ConsultationContent { get; set; }
        public string ConsultationTime { get; set; }
    
        public virtual ClientMdicalIformation ClientMdicalIformation { get; set; }
        public virtual UserDoctorList UserDoctorList { get; set; }
    }
}
