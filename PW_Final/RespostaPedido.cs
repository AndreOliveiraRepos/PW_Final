//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PW_Final
{
    using System;
    using System.Collections.Generic;
    
    public partial class RespostaPedido
    {
        public int Id { get; set; }
        public double Valor { get; set; }
        public bool Aceite { get; set; }
        public int PedidoReparacaoId { get; set; }
    
        public virtual PedidoReparacao PedidoReparacao { get; set; }
        public virtual Oficina Oficina { get; set; }
    }
}
