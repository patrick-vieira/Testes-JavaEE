import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.csDados;

@WebServlet(urlPatterns={"/mainPage", "/AXUR", "/addLista"})
public class meuPrimeiroServlet extends HttpServlet {
	
	List<csDados> listaDados = new ArrayList<>();
	
	public meuPrimeiroServlet() {
		
		System.out.println("Passou pelo Construtor");
	}
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Passou pelo init da super classe");
		super.init();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Passo pelo service");
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Chamado pelo metodo get");
		//resp.setCharacterEncoding("UTF-8");
		//resp.getWriter().println("<h1>Chamou pelo método GET!</h1>");
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");

		req.setAttribute("listaDados", listaDados);
		
		dispatcher.forward(req, resp);	
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("Chamado pelo metodo post");
		
		String nome = req.getParameter("nome"); 
		String observacao = req.getParameter("observacao");
		
		csDados oDados = new csDados();
		oDados.setNome(nome);
		oDados.setObservacao(observacao);
				
		listaDados.add(oDados); 
		
		//resp.setCharacterEncoding("UTF-8");
		//resp.getWriter().print("esta tela foi carregada pelo método doPost!");
		//resp.getWriter().print("\nO nome digitado no formulario foi: " + nome + " e a observação: " + observacao);
		
		resp.sendRedirect("mainPage");
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doDelete(req, resp);
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPut(req, resp);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Vai ser destruido");
		super.destroy();
	}
}
