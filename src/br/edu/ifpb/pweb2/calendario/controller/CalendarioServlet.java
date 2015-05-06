package br.edu.ifpb.pweb2.calendario.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import br.edu.ifpb.pweb2.calendario.dao.DAO;
import br.edu.ifpb.pweb2.calendario.dao.DAOEvento;
import br.edu.ifpb.pweb2.calendario.dao.DAOUsuario;
import br.edu.ifpb.pweb2.calendario.model.Evento;
import br.edu.ifpb.pweb2.calendario.model.Usuario;
import br.edu.ifpb.pweb2.calendario.utils.Util;



@WebServlet({ "/CalendarioServlet", "/Calendario.do" })
public class CalendarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAOUsuario daousuario = (DAOUsuario) this.getServletContext().getAttribute("daousuario");
	private DAOEvento daoevento = (DAOEvento) this.getServletContext().getAttribute("daoevento");
       
    public CalendarioServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session;
		if(action != null){
			switch(action){
			case "1": //Cadastrar Usuário
				try{
					task_cadastrarUsuario(request.getParameter("nome"),request.getParameter("login"),request.getParameter("senha"));
					
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}catch(Exception e){
					request.setAttribute("error", e.getMessage());
					request.getRequestDispatcher("cadastro.jsp").forward(request, response);
				}
				break;
			case "2":// Fazer login
				try{
					Usuario usuario = task_efetuarLogin(request.getParameter("login"),request.getParameter("senha"));
					session = request.getSession();
					session.setAttribute("usuario",usuario);
					
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}catch(Exception e){
					request.setAttribute("error", e.getMessage());
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				break;
			case "3":// Alterar senha
				session = request.getSession(false);
				if(session != null){
				  try{
					task_alterarSenha((Usuario)session.getAttribute("usuario"),request.getParameter("senhaAnterior"),request.getParameter("novaSenha"));
					
					request.getRequestDispatcher("index.jsp").forward(request, response);
				  }catch(Exception e){
					request.setAttribute("error", e.getMessage());
					request.getRequestDispatcher("alterarsenha.jsp").forward(request, response);	
				  }
				}
				break;
			case "4"://Registrar evento
				session = request.getSession(false);
				if(session != null){
				  try{
					String dataInicial = request.getParameter("dataInicial");
					String dataFinal = request.getParameter("dataFinal");
					
					DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/mm/YYYY").withOffsetParsed();
						
					DateTime dateTime = formatter.parseDateTime(dataInicial);
					DateTime dateTime2 = formatter.parseDateTime(dataFinal);
					
					task_registrarEvento(dateTime.toGregorianCalendar(),dateTime2.toGregorianCalendar(),(Usuario)session.getAttribute("usuario"));  
				  }catch(Exception e){
					  request.setAttribute("error", e.getMessage());
					  request.getRequestDispatcher("gerenciaevento.jsp").forward(request, response);
				  }
				}
			case "5"://Excluir evento
				session = request.getSession(false);
				if(session != null){
					task_excluirEvento(Integer.parseInt(request.getParameter("id")));
					
					request.getRequestDispatcher("gerenciaevento.jsp").forward(request, response);
				}	
			}
		}

	}

	
	private void task_cadastrarUsuario(String nome,String login, String senha) throws Exception{
		if(this.daousuario.readUsuario(login) != null) throw new Exception("Login já existente");
		
		Usuario usuario = new Usuario(login,nome,Util.convertPasswordToMD5(senha));
		
		DAO.begin();
		
		daousuario.create(usuario);
		
		DAO.commit();
	}
	
	private Usuario task_efetuarLogin(String login, String senha) throws Exception{
		
		Usuario usuario = daousuario.authenticateUsuario(login,Util.convertPasswordToMD5(senha));
		
		
		if(usuario == null) throw new Exception("Usuário ou senha incorretos!");
		
		return usuario;
	}
	
	private void task_alterarSenha(Usuario usuario, String senhaAnterior,String novaSenha) throws Exception{
		if(!Util.convertPasswordToMD5(senhaAnterior).equals(usuario.getSenha())) throw new Exception("Senha atual incorreta.");
		
		usuario.setSenha(Util.convertPasswordToMD5(novaSenha));
		
		DAO.begin();
		daousuario.update(usuario);
		DAO.commit();
		
	}
	
	private void task_registrarEvento(GregorianCalendar dataInicial, GregorianCalendar dataFinal,Usuario usuario){
			Calendar dataI = dataInicial;
			Calendar dataF = dataFinal;
			
			Evento evento = new Evento();
			
			usuario.addEvento(new Evento(dataI.get(Calendar.DAY_OF_MONTH) ,dataI.get(Calendar.MONTH),dataI.get(Calendar.YEAR),dataInicial,dataFinal));
			
			DAO.begin();
			daousuario.update(usuario);	
			DAO.commit();

	}
	
	private void task_excluirEvento(Integer id){
		DAO.begin();
		Evento evento = daoevento.read(id);
		Usuario usuario = daousuario.read(evento.getUsuario().getId());
		usuario.getEventos().remove(evento);
		daousuario.update(usuario);
		daoevento.delete(evento);
		DAO.commit();
	}
	private List<Evento> task_buscarEventos(Usuario usuario){
		return daoevento.readEventoByUser(usuario);
	}
	
}

