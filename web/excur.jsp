<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Medicamentos</title>
    </head>
    <body>
        <%
        // Declaração de variaveis
            String i;
            

            // Receber o código digitado no form excur.html
             i = request.getParameter("id");
            try { 
             
            // Conectar com o Banco de Dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/medicamento", "root", "1234");
            //Excluir o curso de código informado
            PreparedStatement st = conexao.prepareStatement("DELETE FROM produtos WHERE id = ?");
            st.setString(1, i);// Completa o Delete no lugar do ?
            int resultado = st.executeUpdate(); // Executa o comando delete
            if (resultado == 1) {
            //mostra a mensagem da confirmação de exclusão
            out.print("O medicamento " + i + " foi apagado com sucesso");
            } else {
              out.print("O medicamento de código " + i + " não está cadastrado");
            }
         } catch (SQLException x) {
                out.print("Entre em contato com o suporte e informe o erro: " + x.getErrorCode());
            }
        
        
        
        
        
        
        
        
        
        
        
        %>
        
        
        
        
        
    </body>
</html>
