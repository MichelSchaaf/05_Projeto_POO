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
        <title>Home - web Quiz</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="js/countdown.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
        
    </head>

    <!-- inicializa contagem regressiva -->
    <body onload=startCountdown()>  
        
            <nav class="navbar navbar-inverse">
    <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">KX's WEB Quiz</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><img class="rounded-circle img" src="imagens/githubbutton.gif" alt="gitkitty"> Github</a></li>
    </ul></div></div>
    </nav>
  
    <div class="container-fluid text-center">    
    <div class="row content">
    <div class="col-sm-2 sidenav"></div>
    <div class="col-sm-8 text-left"> 
        

        <% //compara as duas
        if (!request.getParameter("idsessao").equals(session.getId())){ 
        session.invalidate(); %>
        <script> document.location.href='expirou.jsp'</script>
        <% } %>
        <h1>Web Quiz</h1>
        <h4>Qual a capital dos seguintes países: (tempo - <n id=numberCountdown ></n> segundos )</h4>
        <form action="home.jsp">
            <%
            for(int i=0; i<Quiz.getTest().size(); i++){  
            Question q = Quiz.getTest().get(i); 
            %>
            <h3> Q<%= q.getNumquest()%>: <%= q.getQuestion() %></h3>

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

