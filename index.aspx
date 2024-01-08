<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Series2I_37398.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="/css/estilo_index.css" runat="server"/>
    <title>Séries</title>
</head>
<body>
    <form id="form1" runat="server">
         <main>
        <header>
            <figure>
                <a href="index.aspx">
                    <img src="images/logo.png" alt="logo"/>
                </a>
            </figure>

            <div>
                <label for="pesquisa"></label>
                <input type="text" id="pesquisa" size="50" placeholder="Procurar por séries"/>
                <input type="submit" value="Procurar"/>
            </div>
        </header>

        <section>
            <div class="wrapper">
                <div class="series">
                    <div class="seriesDiv">
                        <asp:Literal ID="literalFigures" runat="server"></asp:Literal>
                    </div>                   
                </div>    
            </div>
        </section>
    </main>
    </form>
</body>
</html>
