<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // declara��o
            String i, sql;
            Connection conexao;
            PreparedStatement st;
            ResultSet resultado;
            // Receber o codigo do curso digitado no form altcur
            i = request.getParameter("id");
            try {
                // Conectar com o Banco de Dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicamento", "root", "1234");
                // Buscar o curso pelo C�digo na tabela do BD
                sql = "SELECT * FROM produtos WHERE id =?";
                st = conexao.prepareStatement(sql);
                st.setString(1, i);
                resultado = st.executeQuery(); //Executa o SELECT  
                if (resultado.next()) { //Se o curso foi encontrado na tabela
                    //Carregar os dado do curso em um formul�rio HTML

        %>

        <form method="action" action="altcur.jsp">
            <form>    
                <p>
                    <label for="id">ID:</label>
                    <input readonly id="id" type="text" name="id" size="5" maxlength="5" required value="<%= resultado.getString("id")%>">
                </p>
                <p>
                    <label for="nom">Nome:</label>
                    <input id="nom" type="text" name="nome" size="50" maxlength="30" required value="<%= resultado.getString("nome")%>">
                </p>
                <p>
                    <label for="com">composicao:</label>
                    <input id="com" type="text" name="composicao" size="50" maxlength="30" required value="<%= resultado.getString("composicao")%>">
                </p>
                <p>
                    <label for="quan">quantidadedia:</label>
                    <input id="quan" type="text" name="quantidadedia" size="15" maxlength="90" required value="<%= resultado.getString("quantidadedia")%>">
                </p>
                <p>
                     <input type="submit" value="Salvar altera��es">
                </p>

            </form> 
            <%                    
                } else { //Se o medicamento n�o foi encontrado na tabela
                        out.print("Este curso de c�digo " + i + " n�o est� cadastrado");
                    }

                } catch (SQLException erro) {
                    out.print("Entre em contato com o suporte e informe o c�digo de erro:" + erro.getErrorCode());
                }


            %>


    </body>
</html>
