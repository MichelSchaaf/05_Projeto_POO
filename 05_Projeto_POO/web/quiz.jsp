<!-- importa as classes Question e Quiz -->
<%@page import="br.com.fatec.quiz.Question"%>
<%@page import="br.com.fatec.quiz.Quiz"%>
<%@page import="br.com.fatec.quiz.User"%>
<%@page import="br.com.fatec.quiz.DataUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>         

<!DOCTYPE html>
<%@ page import="java.util.*" %>

<% 
//configura o tempo em segundos que a sessão ficará aberta    
session.setMaxInactiveInterval(60);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QUIZ - Web Quiz</title>
        <script src="js/countdown.js"></script>
    </head>
    <!-- inicializa contagem regressiva -->
    <body onload=startCountdown()>       
        
    O tempo para responder as questões acaba em <n id=numberCountdown ></n> segundos

        <% //compara as duas
        if (!request.getParameter("idsessao").equals(session.getId())){ 
        session.invalidate(); %>
        <script> document.location.href='expirou.jsp'</script>
        <% } %>
        <h1>Web Quiz</h1>
        <h2>Quiz</h2>
        <form action="home.jsp">
            <%
            for(int i=0; i<Quiz.getTest().size(); i++){  
            Question q = Quiz.getTest().get(i); 
            %>
            <h3> Q<%= q.getNumquest()%></h3>
            <h3><%= q.getQuestion() %></h3>
            <%for(int i2=0; i2<q.getAlternatives().length; i2++){%>
            <input type="radio" name="<%= q.getQuestion() %>"
                   value="<%= q.getAlternatives()[i2] %>"/>
            <%= q.getAlternatives()[i2] %>
                <%}%>
            <%}%>
            <hr/>
            <input type="submit" name="tested" value="Enviar" />
            <input type='hidden'  name='idsessao' value='<%= session.getId() %>' >
            <input type='hidden'  name='usuario' value='<%=request.getParameter("usuario")%>' >
        </form> 
    </body>
</html>

