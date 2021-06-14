

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet006
 */
@WebServlet("/Servlet006")
public class Servlet006 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String item_id="006";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet006() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String username = (String) request.getSession().getAttribute("current_user");
		CartDao cDao = new CartDao();
		
		String result = cDao.removeItem(username, item_id);
		request.getSession().setAttribute("items_in_cart", cDao.updateCart(username));
		System.out.println(result);
		response.sendRedirect("view_cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String username = (String) request.getSession().getAttribute("current_user");
		CartDao cDao = new CartDao();
		String item_name = cDao.getName(item_id);
		float item_price = cDao.getPrice(item_id);
		
		
		String result = cDao.addToCart(username, item_id, item_name, item_price);
		request.getSession().setAttribute("items_in_cart", cDao.updateCart(username));
		
		System.out.println(result);
		response.sendRedirect("home.jsp");
	}

}
