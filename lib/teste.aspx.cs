using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Series2I_37398.lib
{
    public partial class teste : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/json";
            string codigoSerie = Request["c"].ToString();

            try
            {
                string LinhaConexao = "SERVER=localhost; UID=root; PASSWORD=root; DATABASE=Series_37383";
                using (MySqlConnection conexao = new MySqlConnection(LinhaConexao))
                {
                    conexao.Open();
                    string comando = $@"Select distinct(cd_temporada) FROM episodio where cd_serie = {codigoSerie}";
                    MySqlCommand CSQL = new MySqlCommand(comando, conexao);
                    using (MySqlDataReader dados = CSQL.ExecuteReader())
                    {
                        string Json = "";

                        while (dados.Read())
                        {
                            int temporada = dados.GetInt32(0);
                            Json += "{'temporada': " + temporada + ",";
                        }

                        Json = Json.Substring(0, Json.Length - 1);
                        Json = "[" + Json + "]";
                        Json = Json.Replace("'", "\"");
                        Response.Write(Json);
                    }
                }
            }
            catch(Exception erro)
            {
                Response.Write(erro.Message);
            }
        }
    }
}