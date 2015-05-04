package br.edu.ifpb.pweb2.calendario.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/CalendarioServlet", "/Calendario.do" })
public class CalendarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalendarioServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	private void cadastrarUsuario(String nome,String login, String senha){
		
		if(readUsuario(login))
	}
}

