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
    
    public partial class usp_FeesSelect_Result
    {
        public int id { get; set; }
        public string Description { get; set; }
        public int OrdinanceId { get; set; }
        public int ProjectId { get; set; }
        public decimal Fee1 { get; set; }
        public int Qty { get; set; }
        public decimal AmtPaid { get; set; }
        public string PaidWith { get; set; }
        public string Reference { get; set; }
        public int ContactId { get; set; }
        public bool OTRequest { get; set; }
        public int PlanCheckerId { get; set; }
        public bool PassFail { get; set; }
        public string PCKType { get; set; }
        public Nullable<System.DateTime> NotifiedOn { get; set; }
        public Nullable<System.DateTime> PickedUpOn { get; set; }
        public string PickedUpBy { get; set; }
        public string Notes { get; set; }
        public int Project_id { get; set; }
        public int Person_id { get; set; }
        public int Ordinance_id { get; set; }
    }
}
