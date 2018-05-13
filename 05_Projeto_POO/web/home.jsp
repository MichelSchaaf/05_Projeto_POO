<%@page import="br.com.fatec.quiz.Question"%>
<%@page import="br.com.fatec.quiz.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
 //inicializa as variáveis   
 boolean tested = false;
 double grade = 0.0;
 String idsessao="";
 
 //se o botão 'Enviar' da página quiz.jsp foi acionado...
 if(request.getParameter("tested")!=null){
     
        //compara as duas
        if (!request.getParameter("idsessao").equals(session.getId())){ 
        session.invalidate();
        %><script> document.location.href='expirou.jsp'</script><%
         } 
     
   tested = true;
   int count = 0;
   for ( int i=0; i< Quiz.getTest().size(); i++){
   Question q = Quiz.getTest().get(i);
   String userAnswer = request.getParameter(q.getQuestion());
   if(q.getAnswer().equals(userAnswer)) count++;
   }
   grade = 100.0 * ((double)(count) / (double)(Quiz.getTest().size()));
}
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - web Quiz</title>
    </head>
    <body>
        <h1>Web Quiz</h1>
        <h2>home</h2>
        <form method='post' action='quiz.jsp'>
            Usuário:<input type='text'  name='usuario' value='' >
                    <input type='hidden'  name='idsessao' value='<%= session.getId() %>' >
            <h3><button>Iniciar teste</button></h3>
        </form>

<!-- se o botão 'Enviar' da página quiz.jsp foi acionado...  -->        
        <%if(tested){%>
        <hr/>
        <h3>Sua nota foi: <%=grade%>%</h3>
        <hr/>
        <%}%>
<!-- --------------------------------------------------------- -->        
        
    </body>
</html>
