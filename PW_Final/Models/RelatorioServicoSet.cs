//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PW_Final.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RelatorioServicoSet
    {
        public int Id { get; set; }
        public int OficinaSetId { get; set; }
        public int ServicoSet_Id { get; set; }
        public string DescricaoServico { get; set; }
    
        public virtual OficinaSet OficinaSet { get; set; }
        public virtual ServicoSet ServicoSet { get; set; }
    }
}