package br.edu.ifpb.pweb2.calendario.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifpb.pweb2.calendario.dao.DAOEvento;
import br.edu.ifpb.pweb2.calendario.dao.DAOUsuario;
import br.edu.ifpb.pweb2.calendario.dao.DAO;
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
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	private void cadastrarUsuario(String nome,String login, String senha) throws Exception{
		if(this.daousuario.readUsuario(login) != null) throw new Exception("Login já existente");
		
		Usuario usuario = new Usuario(login,nome,Util.convertPasswordToMD5(senha));
		
		DAO.begin();
		
		daousuario.create(usuario);
		
		DAO.commit();
	}
	
	private void efetuarLogin(String login, String senha, HttpServletRequest request) throws Exception{
		
		Usuario usuario = daousuario.authenticateUsuario(login,Util.convertPasswordToMD5(senha));
		
		
		if(usuario == null) throw new Exception("Usuário ou senha incorretos!");
		
		HttpSession session = request.getSession();
		session.setAttribute("usuario",usuario);	
	}
	
	private void alterarSenha(Usuario usuario, String senhaAnterior,String novaSenha) throws Exception{
		if(!Util.convertPasswordToMD5(senhaAnterior).equals(usuario.getSenha())) throw new Exception("Senha atual incorreta.");
		
		usuario.setSenha(Util.convertPasswordToMD5(novaSenha));
		
		DAO.begin();
		daousuario.update(usuario);
		DAO.commit();
		
	}
	
}

