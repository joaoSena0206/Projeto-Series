using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Series2I_37398.lib
{
    public partial class buscarTemporadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (MySqlConnection conexao = new MySqlConnection("SERVER=localhost; UID=root; PASSWORD=root; DATABASE=serie2i_37398"))
            {
                Response.ContentType = "application/json";

                conexao.Open();

                if (String.IsNullOrEmpty(Request["serie"]))
                {
                    Response.Redirect("index.aspx");
                }

                string cdSerie = Request["serie"];
                string temporada = "";
                string registrosJSON = "";

                string comando;
                MySqlCommand CSQL;


                if (String.IsNullOrEmpty(Request["t"]))
                {
                    registrosJSON = "{'temporadas': [";
                    temporada = "1";

                    comando = $"SELECT DISTINCT(cd_temporada) FROM episodio WHERE cd_serie = {cdSerie}";
                    CSQL = new MySqlCommand(comando, conexao);

                    using (MySqlDataReader dados = CSQL.ExecuteReader())
                    {
                        while (dados.Read())
                        {
                            registrosJSON += dados.GetString(0) + ",";
                        }

                        registrosJSON = registrosJSON.Substring(0, registrosJSON.Length - 1) + "], 'eps': [";
                    }           
                }
                else
                {
                    temporada = Request["t"];
                    registrosJSON = "{'eps': [";          
                }

                comando = $@"SELECT 
                                cd_temporada,
                                cd_episodio,
                                nm_original_episodio,
                                nm_adotado_episodio,
                                DATE_FORMAT(dt_exibicao_episodio, '%d/%m/%Y'),
                                ii_duracao_episodio,
                                ds_sinopse_episodio,
                                ds_obs_episodio
                            FROM episodio
                            WHERE 
                                cd_serie = {cdSerie} 
                                AND cd_temporada = {temporada}
                            ORDER BY cd_episodio";
                CSQL = new MySqlCommand(comando, conexao);

                using (MySqlDataReader dados = CSQL.ExecuteReader())
                {
                    while (dados.Read())
                    {
                        string observacao = "";
                        string nmOriginal = dados.GetString(2).Replace("'", "!!!");
                        string nmAdotado = dados.GetString(3).Replace("'", "!!!"); ;
                        string sinopse = dados.GetString(6).Replace("'", "!!!"); ;

                        try
                        {
                            observacao = "Não há";
                        }
                        catch
                        {
                            observacao = dados.GetString(7);
                        }

                        

                        registrosJSON += "{'cdTemporada': '" + dados.GetInt32(0) + "'," +
                                            "'cdEpisodio': '" + dados.GetInt32(1) + "'," +
                                            "'nmOriginalEp': '" + nmOriginal + "'," +
                                            "'nmAdotadoEp': '" + nmAdotado + "'," +
                                            "'dtExibicaoEp': '" + dados.GetString(4) + "'," +
                                            "'duracaoEp': " + dados.GetInt32(5) + "," +
                                            "'sinopseEp': '" + sinopse + "'," +
                                            "'obsEp': '" + observacao + "'},";
                    }

                    registrosJSON = registrosJSON.Substring(0, registrosJSON.Length - 1);
                    registrosJSON += "]}";
                    registrosJSON = registrosJSON.Replace("'", "\"");
                    registrosJSON = registrosJSON.Replace("!!!", "'");

                    Response.Write(registrosJSON);
                }
            }
        }
    }
}