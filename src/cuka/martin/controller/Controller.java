package cuka.martin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Parameter, nazaciatku je NULL, ked kliknem na obrazok na zaklade neho ziskam parameter...
		String action = request.getParameter("action");
		
		Map<String, String> actionMap = new HashMap<>();
		actionMap.put("image", "/image.jsp");
		actionMap.put("home", "/home.jsp");
		
		// ak user na nic neklikol alebo sa nieco posralo (hodnota action parametra sa nerovna image alebo home tak...)
		if (action == null || !actionMap.containsKey(action)){
			action = "home";
		}
		// ak je action == null tak ho nastavim na home a ten vrati z hashMapy /home.jsp...
		request.getRequestDispatcher(actionMap.get(action)).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
