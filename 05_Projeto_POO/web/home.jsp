<%@page import="br.com.fatec.quiz.Question"%>
<%@page import="br.com.fatec.quiz.Quiz"%>
<%@page import="br.com.fatec.quiz.User"%>
<%@page import="br.com.fatec.quiz.DataUser"%>
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

   //adiciona o usuário
   User x = new User();
   x.setNome(request.getParameter("usuario"));
   x.setMedia(Double.toString(grade));
   DataUser.getUsuarios().add(x); 
}
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - web Quiz</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    <body>
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
        <h1>Web Quiz</h1>
        <h2>home</h2>
        <form method='post' action="quiz.jsp">
            <table>
                <tr>
                    <td>Usuário: <input type="text" name="usuario"  required><br></td>
                    <td><input type='hidden'  name='idsessao' value='<%= session.getId() %>' ></td>
                    <td><button type='submit'>Iniciar teste</button></td>
                </tr>
            </table>    
        </form>
        
 <!-- se o botão 'Enviar' da página quiz.jsp foi acionado...  -->        
        <%if(tested){%>
        <hr/>
        <h3>Sua nota foi: <%=grade%>%</h3>
        <hr/>
        <%}%>
        <br>
<!-- --------------------------------------------------------- --> 
    <n> Últimos 10 testes realizados</n><br>
<table border="1">
        <tr>
           <th>num</th>
           <th>Usuário</th>
           <th>Média</th>
        </tr>

        <% 
            int k = DataUser.getUsuarios().size();
            int z = 10;
            if( k < 10){ z=k;}
            
            for (int i=z; i>0; i--){ %>
           <tr>
                <td><%= k %></td>
                <td><%= DataUser.getUsuarios().get(k-1).getNome() %></td>
                <td><%= DataUser.getUsuarios().get(k-1).getMedia() %></td>
          </tr>
       <% k=k-1;} %>
</table>
    <br>    
   <!-- --------------------------------------------------------- --> 
<n> Ranking das 10 melhores notas</n><br>
<table border="1">
        <tr>
           <th>num</th>
           <th>Usuário</th>
           <th>Média</th>
        </tr>

        <% 
            //inicializa as variáveis
            double temp = 0;
            String tempnome;
            int tamanho = DataUser.getUsuarios().size();
            double[] mediauser = new double[tamanho];
            String[] nomeuser = new String[tamanho];
            boolean is_sorted;
            // popula nomeuser[] e mediauser[]
            for (int i=0; i<tamanho; i++){
            nomeuser[i]= DataUser.getUsuarios().get(i).getNome() ;
            mediauser[i]=Double.parseDouble(DataUser.getUsuarios().get(i).getMedia());   
            }
            //limita o valor de 'count' atá 10
            int count=tamanho;
            if (count>10){count=10;}
            
            // Buble Sort
            for (int i=0; i<count; i++){
                 for (int j=i+1; j< tamanho; j++){
                    if (mediauser[i] < mediauser[j]) {
                    temp = mediauser[i];
                    tempnome=nomeuser[i];
                    mediauser[i] = mediauser[j];
                    nomeuser[i]= nomeuser[j];
                    mediauser[j] = temp;
                    nomeuser[j]=tempnome;
                    } 
                }
        %><tr>
          <td><%= count-i %></td>
          <td><%= nomeuser[i] %></td>
          <td><%= mediauser[i] %></td>
        </tr>
        
        <%  }  %>


</table>     
<br><br>
</div>
    <div class="col-sm-2 sidenav"></div>
  </div>
</div>

<%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
