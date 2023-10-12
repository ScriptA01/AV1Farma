<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>cadastro de medicamento</title>
    </head>
    <body>
        <%
            //Receber os dados digitados no formulário
            String i, n, c, q;
            i = request.getParameter("id");
            n = request.getParameter("nome");
            c = request.getParameter("composicao");
            q = request.getParameter("quantidadedia");
            try {
                // Conectar com o Banco de Dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicamento", "root", "1234");

                // Inserir os dados recebidos do cadcur.html na tabela curso do BD
                String sql = "INSERT INTO produtos VALUES(?,?,?,?)";
                PreparedStatement st = conexao.prepareStatement(sql);
                st.setString(1, i);
                st.setString(2, n);
                st.setString(3, c);
                st.setString(4, q);

                st.executeUpdate(); // Executa o INSERT gerado acima
                out.print("medicamento cadastrado com sucesso");
                
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                
                if (mensagemErro.contains("Duplicate entry")) {
                    out.print("<b>Este medicamento já está cadastrado<b>");
                } else {
                    out.print("Erro = " + mensagemErro);
                }
            }
           

        %> 
    </body>
</html>
