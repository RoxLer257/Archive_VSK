//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ArchiveVSK.Classes
{
    using System;
    using System.Collections.Generic;
    
    public partial class Policies
    {
        public int PolicyID { get; set; }
        public string PolicyNumber { get; set; }
        public Nullable<int> ClientID { get; set; }
        public Nullable<int> InsuranceTypeID { get; set; }
        public Nullable<int> CarID { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
        public int CostPolicy { get; set; }
    
        public virtual Cars Cars { get; set; }
        public virtual Clients Clients { get; set; }
        public virtual InsuranceTypes InsuranceTypes { get; set; }
    }
}
