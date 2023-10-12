<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de medicamentos</title>
        <link rel="stylesheet" href="tabelalist.css"
    </head>
    <body>
        <%
            // Conectar com o Banco de Dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicamento", "root", "1234");
            //Buscar todos os cursos da tabela curso do BD
            String sql = "SELECT * FROM produtos";
            PreparedStatement st = conexao.prepareStatement(sql);
            ResultSet resultado = st.executeQuery(); //Executa o SELECT  
        %>
        <table 
            <tr>
                <th> id </th>
                <th> Nome </th>
                <th> composicao </th>
                <th> quantidadedia </th>
                <th>Alteração</th>
                <th>Exclusão</th>


            </tr>
            <%
                //Exibir os cursoos um por um
                while (resultado.next()) {

            %>

            <tr>
                <td> <%= resultado.getString("id")%> </td>
                <td> <%= resultado.getString("nome")%> </td>
                <td> <%= resultado.getString("composicao")%> </td>
                <td> <%= resultado.getString("quantidadedia")%> </td>
                <td> <a href="excur.jsp?id=<%= resultado.getString("id")%>"> Excluir </a> </td>
                <td> <a href="carregacurso.jsp?id=<%= resultado.getString("id")%>"> Alterar </a> </td>

            </tr>





            <%
                }
            %>

        </table>       
    </body>
</html>
