//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ISIT_420_ClassProject
{
    using System;
    using System.Collections.Generic;
    
    public partial class CensusBureau
    {
        public int ID { get; set; }
        public int YearID { get; set; }
        public int Population { get; set; }
    
        public virtual Year Year { get; set; }
    }
}
