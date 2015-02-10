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
    
    public partial class Parcel
    {
        public Parcel()
        {
            this.Documents = new HashSet<Document>();
            this.Projects = new HashSet<Project>();
        }
    
        public int id { get; set; }
        public System.DateTime Created { get; set; }
        public Nullable<System.DateTime> Updated { get; set; }
        public string APN { get; set; }
        public int OwnerId { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
    
        public virtual ICollection<Document> Documents { get; set; }
        public virtual Person Person { get; set; }
        public virtual ICollection<Project> Projects { get; set; }
    }
}