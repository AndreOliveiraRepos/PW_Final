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
            db.ServicoSet.Find(indiceServico).Estado = "Encerrado";
            db.OficinaSet.Find(indiceOficina).TotalAvaliacao = db.OficinaSet.Find(indiceOficina).TotalAvaliacao + 1;
            db.OficinaSet.Find(indiceOficina).Avaliacao = (db.OficinaSet.Find(indiceOficina).Avaliacao + a) / db.OficinaSet.Find(indiceOficina).TotalAvaliacao;
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
        public void EliminaTodasPorCliente(string userId) {
            var cont = db.AvaliacaoClienteSet.Where(a=>a.AspNetUsersId == userId).Count();
            if (cont > 0)
            {
                var respostas = db.AvaliacaoClienteSet.Where(a => a.AspNetUsersId == userId).ToList();
                foreach (var item in respostas)
                {

                    db.AvaliacaoClienteSet.Remove(item);
                }

                db.SaveChanges();
            }

        }
        public void EliminaTodasPorOficina(int indiceOficina) { }
    }
}