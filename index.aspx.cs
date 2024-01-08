using System;
using MySql;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.ComponentModel;

namespace Series2I_37398
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (MySqlConnection conexao = new MySqlConnection("SERVER=localhost; UID=root; PASSWORD=root; DATABASE=serie2i_37398"))
            {
                conexao.Open();

                string comando = @"
                    SELECT
	                    s.cd_serie,
	                    nm_adotado_serie,
	                    nm_original_serie,
	                    aa_lancamento_serie,
	                    GROUP_CONCAT(nm_genero SEPARATOR ', ')
                    FROM serie s 
                    JOIN serie_genero sg ON (s.cd_serie = sg.cd_serie)
                    JOIN genero g ON (sg.cd_genero = g.cd_genero)
                    GROUP BY nm_adotado_serie
                    ORDER BY nm_adotado_serie";
                MySqlCommand CSQL = new MySqlCommand(comando, conexao);

                using (MySqlDataReader dados = CSQL.ExecuteReader())
                {
                    while (dados.Read())
                    {
                        int cdSerie = dados.GetInt32(0);
                        string nmAdotado = dados.GetString(1);
                        string nmOriginal = dados.GetString(2);
                        int anoLancamento = dados.GetInt32(3);
                        string genero = dados.GetString(4);

                        literalFigures.Text += $"<figure>" +
                             $"<a href='serie.aspx?serie={cdSerie}'> <img src='images/{cdSerie}.png' alt='{nmAdotado}'> </a>" +
                             "<div class='info'>" +
                             $"<h1>{nmAdotado}</h1>" +
                             $"<p>{nmOriginal} - {anoLancamento} - {genero} </p>" +
                             "</div>" +
                             "</figure> ";
                        
                    }
                }
            }
        }
    }
}