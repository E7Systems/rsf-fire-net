//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RSFFireData.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ordinance
    {
        public Ordinance()
        {
            this.Fees = new HashSet<Fee>();
        }
    
        public int id { get; set; }
        public System.DateTime Created { get; set; }
        public Nullable<System.DateTime> Updated { get; set; }
        public string Number { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<Fee> Fees { get; set; }
    }
}
