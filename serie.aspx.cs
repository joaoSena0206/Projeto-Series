using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Series2I_37398
{
    public partial class serie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request["serie"]))
            {
                Response.Redirect("index.aspx");
            }


            string cdSerie = Request["serie"];
            string nmAdotadoSerie = "";
            string nmOriginalSerie = "";
            int anoLancamentoSerie = 0;
            string generos = "";
            int qtTemps = 0;
            int qtEps = 0;
            string sinopseSerie = "";

            using (MySqlConnection conexao = new MySqlConnection("SERVER=localhost; UID=root; PASSWORD=root; DATABASE=serie2i_37398"))
            {
                conexao.Open();

                string comando = $@"SELECT 
                                    nm_adotado_serie,
	                                nm_original_serie,
	                                aa_lancamento_serie,
	                                GROUP_CONCAT(nm_genero SEPARATOR ', '),
                                    ds_sinopse_serie
                                FROM serie s
                                JOIN serie_genero sg ON (s.cd_serie = sg.cd_serie)
                                JOIN genero g ON (sg.cd_genero = g.cd_genero)
                                WHERE s.cd_serie = {cdSerie}";
                MySqlCommand CSQL = new MySqlCommand(comando, conexao);

                using (MySqlDataReader dados = CSQL.ExecuteReader())
                {
                    while (dados.Read())
                    {
                        nmAdotadoSerie = dados.GetString(0);
                        nmOriginalSerie = dados.GetString(1);
                        anoLancamentoSerie = dados.GetInt32(2);
                        generos = dados.GetString(3);
                        sinopseSerie = dados.GetString(4);
                    }
                }

                comando = $@"SELECT
                            COUNT(DISTINCT(cd_temporada)),
	                        COUNT(cd_episodio)
                        FROM episodio
                        WHERE cd_serie = {cdSerie};";
                CSQL = new MySqlCommand(comando, conexao);

                using (MySqlDataReader dados = CSQL.ExecuteReader())
                {
                    while (dados.Read())
                    {
                        qtTemps = dados.GetInt32(0);
                        qtEps = dados.GetInt32(1);
                    }
                }
            }

            LiteralImg.Text = $"<img src='images/{cdSerie}.png' alt='{nmAdotadoSerie}'>";
            LiteralTituloAdptd.Text = $"<h1>{nmAdotadoSerie}</h1>";
            LiteralTituloOrg.Text = $"<p>Título Original: {nmOriginalSerie}</p>";
            LiteralAnoEstreia.Text = $"<p>Ano de Estréia: {anoLancamentoSerie}</p>";
            LiteralCategorias.Text = $"<p>Categorias: {generos}</p>";
            LiteralTempsEps.Text = $"<p>Temporadas: {qtTemps} | Episódios: {qtEps}</p>";
            LiteralSinopse.Text = $"<p>{sinopseSerie}</p>";    
        }
    }
}