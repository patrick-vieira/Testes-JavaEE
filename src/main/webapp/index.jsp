<!DOCTYPE html>
<%@page import="models.csDados"%>
<%@page import="java.util.List"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pagina index</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		
		
	</head>
	<body>
	<div class="container">
		<h1>Oi Java.</h1>
		
		<p class="lead">Minha primeira experi�ncia com java.</p>
		
		<blockquote>
		  <p>Essa aplica��o foi criada para testar o java web.</p>
		  <p>Para esse teste criei um servidor Apache Tomcat e fiz deploy na plataforma Azure da Microsoft.</p>
		  <p>O formul�rio abaixo faz um POST, o servlet do servidor da aplica��o adiciona os dados do formul�rio em uma lista.</p>
		  <p>Essa lista � composta de objetos da classe csDados que criei, contendo os campos nome e observa��o.</p>
		  <p>Ap�s a inser��o dos dados no POST ele redireciona para um GET que vai retornar a pagina.jsp</p>
		  <p>Na p�gina os dados no grid utilizando codifica��o em java</p>
		  
		  <footer>Fiz esse exemplo para me preparar para entrevista na AXUR. <cite title="Link do github"><a href="https://github.com/patrick-vieira/Testes-JavaEE" target="_blank">veja o c�digo no Github</a></cite></footer>
		  
		</blockquote>

		<br/>
		
	</div>
		
	<div class="container">
		<form method="post" action="addLista">
			
			<h3>testar o servlet do apache passando um nome e uma observa��o:</h3>
			<br/>
			<div class="form-group">
			    <label for="idNome">Nome:</label>
			    <input type="text" class="form-control" id="idNome" name="nome" placeholder="nome">
			  </div>
			<br/>
			<div class="form-group">
			    <label for="idObs">Observa��o:</label>
			    <input type="text" class="form-control" id="idObs" name="observacao" placeholder="Observa��o">
			  </div>
			<br/>	
			<button type="submit" class="btn btn-default">adicionar na lista do Servlet</button>	
		
		</form>
	</div>	
	
	<br/>
	
	<div class="table-responsive container">	
	<table class="table table-striped table-hover">
<% 
	List<csDados> oDados = (List<csDados>)request.getAttribute("listaDados");
	try {
		
			for (csDados oDado: oDados){
				out.print("<tr><td>" + oDado.getNome() + "</td><td>" + oDado.getObservacao() + "</td></tr>");
			}
	 }catch(NullPointerException e)
	 {
		 
	 }
%>
	</table>
	</div>
	</body>
</html>