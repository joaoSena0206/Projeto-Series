<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="serie.aspx.cs" Inherits="Series2I_37398.serie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilo_serie.css">
    <title>Série</title>
</head>
<body>
    <form id="form1" runat="server">
    <main>
        <header>
            <figure>
                <a href="index.aspx">
                    <img src="images/logo.png" alt="logo">
                </a>           
            </figure>

            <div>
                <label for="pesquisa"></label>
                <input type="text" id="pesquisa" size="50" placeholder="Procurar por séries">
                <input type="submit" value="Procurar">
            </div>
        </header>


        <section>
            <div class="wrapper">
                <div class="serie">
                    <figure>
                        <asp:Literal ID="LiteralImg" runat="server"></asp:Literal>

                        <div class="informacoes">
                            <asp:Literal ID="LiteralTituloAdptd" runat="server"></asp:Literal>                    

                            <div>
                                <asp:Literal ID="LiteralTituloOrg" runat="server"></asp:Literal>
                               
                                <asp:Literal ID="LiteralAnoEstreia" runat="server"></asp:Literal>
                               
                                <asp:Literal ID="LiteralCategorias" runat="server"></asp:Literal>
                               
                                <asp:Literal ID="LiteralTempsEps" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </figure>
                    
                       
                    <div class="menuzinho">
                        <a href="#sinopse">
                            <h3>Sinopse</h3>
                        </a>
                        <a href="#temporadasEP">
                            <h3>Temporadas e Episódios</h3>
                        </a>
                    </div>
                </div>

                <div class="sinopse" id="sinopse">
                    <h1>Sinopse</h1>
                   
                    <asp:Literal ID="LiteralSinopse" runat="server"></asp:Literal>
                </div>

                <div class="temporadasEP" id="temporadasEP">
                    <h1>Temporadas e Episódios</h1>

                    <form action="">
                        <label for="temporada">Selecione: </label>
                        <select name="temporadas" id="temporadas">

                        </select>
                    </form>

                    <h3 id="temporada">1° Temporada</h3>

                    <div class="episodios">
                        <asp:Literal ID="LiteralEps" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </section>
    </main>
    </form>

    <script src="javascript/script.js"></script>
</body>
</html>
