using PW_Final.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PW_Final.Controladores
{
    public class ClientReview
    {
        private EntitiesConnection db = new EntitiesConnection();
        public void AdicionaNova(string userId, int indiceOficina,int indiceServico, string desc, int a)
        {
            db.AvaliacaoClienteSet.Add(new AvaliacaoClienteSet {
                OficinaSetId = indiceOficina,
                AspNetUsersId = userId,
                ServicoSetId = indiceServico,
                Comentario = desc,
                Avaliacao = a

            });
            db.SaveChanges();
        }
        public void EditaDescricao(int indiceAvaliacao,string desc) { }
        public void EditaAvaliacao(int indiceAvaliacao, int a) { }
        public ArrayList ListarPorCliente(string userID) {
            ArrayList list = new ArrayList();
            var reviews = (from p in db.AvaliacaoClienteSet
                           where p.AspNetUsersId == userID
                           select new
                           {
                               idPedido = p.ServicoSetId,
                               idOficina = p.OficinaSetId,
                               idAvaliacao = p.Id,
                               Avaliacao = p.Avaliacao,
                               Comentario = p.Comentario,
                               Tipo = p.OficinaSet.TipoReparacaoSet.Descricao,
                               NomeOficina = p.OficinaSet.Nome
                               

                           }).ToList();
            list.AddRange(reviews);
            return list;
        }
        public ArrayList ListarPorOficina(int indiceOficina) {
            ArrayList list = new ArrayList();
            var reviews = (from p in db.AvaliacaoClienteSet
                           where p.OficinaSetId == indiceOficina
                           select new
                           {
                                Utilizador = p.AspNetUsers.Email,
                                Avaliacao = p.Avaliacao,
                                Comentario = p.Comentario


                           }).ToList();
            list.AddRange(reviews);
            return list;
        }
        public void EliminaAvaliacao(int indiceAvaliacao) { }
        public void EliminaTodasPorCliente(string userId) { }
        public void EliminaTodasPorOficina(int indiceOficina) { }
    }
}