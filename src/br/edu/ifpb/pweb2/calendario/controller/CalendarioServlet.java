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
import br.edu.ifpb.pweb2.calendario.dao.DAOAnotacao;
import br.edu.ifpb.pweb2.calendario.dao.DAOUsuario;
import br.edu.ifpb.pweb2.calendario.model.Anotacao;
import br.edu.ifpb.pweb2.calendario.model.Usuario;
import br.edu.ifpb.pweb2.calendario.utils.Util;



@WebServlet({ "/CalendarioServlet", "/Calendario.do","/index.jsp" })
public class CalendarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DAOUsuario daousuario;
	private static DAOAnotacao daoanotacao;
       
	
	static{
		daousuario = new DAOUsuario();
		daoanotacao = new DAOAnotacao();
	}
	
    public CalendarioServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(request.getParameter("logout") != null){
			if(request.getParameter("logout").equals("true") && session != null){
					session.invalidate();
					
					request.getRequestDispatcher("calendario.jsp").forward(request, response);
			}else{
					request.getRequestDispatcher("calendario.jsp").forward(request, response);
			}
		}else if(request.getParameter("gerenciaanotacoes") != null){
			Usuario usuario = null;
			if(session != null){
			usuario = (Usuario) session.getAttribute("usuario");
			}
			
			request.setAttribute("usuario",usuario);
			request.getRequestDispatcher("gerenciaanotacoes.jsp").forward(request, response);
			
		}else if(request.getParameter("mudasenha") != null){
			if(session != null){
				request.setAttribute("usuario", (Usuario) session.getAttribute("usuario"));
				request.getRequestDispatcher("alterarsenha.jsp").forward(request,response);
			}else{
				request.getRequestDispatcher("calendario.jsp").forward(request, response);
			}
		}else if(request.getParameter("exclui") != null){
			if(session != null){
				task_excluirUsuario(daousuario.read((Integer)((Usuario)session.getAttribute("usuario")).getId()));
				
				session.invalidate();
				request.getRequestDispatcher("calendario.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("calendario.jsp").forward(request, response);
			}
		}else{
		
			session = request.getSession(false);
		
			if(session != null) request.setAttribute("usuario", (Usuario) session.getAttribute("usuario"));
			
			request.getRequestDispatcher("calendario.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session;
		if(action != null){
			switch(action){
			case "1": //Cadastrar Usuário
				try{
					task_cadastrarUsuario(request.getParameter("nome"),request.getParameter("login"),request.getParameter("senha"));
					
					request.getRequestDispatcher("calendario.jsp").forward(request, response);
				}catch(Exception e){
					request.setAttribute("error", e.getMessage());
					request.getRequestDispatcher("cadastro.jsp").forward(request, response);
				}
				break;
			case "2":// Fazer login
				try{
				    
				    	Usuario usuario = task_efetuarLogin(request.getParameter("login"),request.getParameter("senha"));
				    	
				    	session = request.getSession();
				    	session.setAttribute("usuario", usuario);
				    	request.setAttribute("usuario",usuario);
				    	request.getRequestDispatcher("calendario.jsp").forward(request, response);
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
					
					session.setAttribute("usuario", daousuario.read((Integer) ((Usuario) session.getAttribute("usuario")).getId()));
					request.setAttribute("usuario", (Usuario)session.getAttribute("usuario"));
					request.getRequestDispatcher("calendario.jsp").forward(request, response);
				  }catch(Exception e){
					request.setAttribute("error", e.getMessage());
					request.setAttribute("usuario", (Usuario) session.getAttribute("usuario"));
					request.getRequestDispatcher("alterarsenha.jsp").forward(request, response);	
				  }
				}
				break;
			case "4"://Registrar anotacao
				session = request.getSession(false);
				if(session != null){
				 try{	
					DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/MM/YYYY").withOffsetParsed();
					DateTime dateTime = formatter.parseDateTime(request.getParameter("data"));
					GregorianCalendar data = dateTime.toGregorianCalendar();
					
					task_registrarAnotacao(data,request.getParameter("titulo"),request.getParameter("texto"),(Usuario) session.getAttribute("usuario"));
					session.setAttribute("usuario", daousuario.read((Integer) ((Usuario) session.getAttribute("usuario")).getId()));
					request.setAttribute("usuario", (Usuario)session.getAttribute("usuario"));
					request.getRequestDispatcher("gerenciaanotacoes.jsp").forward(request, response);
				 }catch(Exception e){
					 request.setAttribute("error", e.getMessage());
					 request.getRequestDispatcher("calendario.jsp").forward(request, response);//TODO Rever dps
				 }
				}	
				break;
			case "5"://Excluir evento
				session = request.getSession(false);
				if(session != null){
					task_excluirAnotacao(Integer.parseInt(request.getParameter("id")));
					session.setAttribute("usuario", daousuario.read((Integer) ((Usuario) session.getAttribute("usuario")).getId()));
					request.setAttribute("usuario", (Usuario)session.getAttribute("usuario"));
					request.getRequestDispatcher("gerenciaanotacoes.jsp").forward(request, response);
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
	
	private void task_registrarAnotacao(GregorianCalendar dataAnot,String titulo,String texto,Usuario usuario){
			Calendar data = dataAnot;
			
			Anotacao anotacao = new Anotacao(data.get(Calendar.DAY_OF_MONTH),data.get(Calendar.MONTH)+1,data.get(Calendar.YEAR),data,titulo,texto);
			Usuario user = daousuario.read((Integer)usuario.getId());
		    anotacao.setUsuario(user);
			user.getAnotacoes().add(anotacao);
			DAO.begin();
			daoanotacao.create(anotacao);
			daousuario.update(user);
			DAO.commit();

	}
	
	private void task_excluirAnotacao(Integer id){
		DAO.begin();
		Anotacao anotacao = daoanotacao.read(id);
		Usuario usuario = daousuario.read(anotacao.getUsuario().getId());
		usuario.getAnotacoes().remove(anotacao);
		daousuario.update(usuario);
		daoanotacao.delete(anotacao);
		DAO.commit();
	}
	private List<Anotacao> task_buscarEventos(Usuario usuario){
		return daoanotacao.readAnotacaoByUser(usuario);
	}
	
	private void task_excluirUsuario(Usuario usuario){
		
		DAO.begin();
		 daousuario.delete(usuario);
		DAO.commit();
	}
	
	
}

