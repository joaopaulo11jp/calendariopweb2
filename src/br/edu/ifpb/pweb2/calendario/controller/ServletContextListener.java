package br.edu.ifpb.pweb2.calendario.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

import br.edu.ifpb.pweb2.calendario.dao.*;




@WebListener
public class ServletContextListener implements javax.servlet.ServletContextListener {

    public ServletContextListener() {
    }

    public void contextInitialized(ServletContextEvent e)  { 
    	ServletContext context = e.getServletContext();
    	context.setAttribute("daousuario", new DAOUsuario());
    	context.setAttribute("daoevento", new DAOEvento());
    }

    public void contextDestroyed(ServletContextEvent e)  { 
    }
	
}
