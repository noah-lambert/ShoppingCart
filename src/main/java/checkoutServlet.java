

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class checkoutServlet
 */
@WebServlet("/checkout")
public class checkoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String username = (String) request.getSession().getAttribute("current_user");
		
		String card = request.getParameter("card");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip_code = request.getParameter("zip_code");
		
		CheckoutDao cDao = new CheckoutDao();
		String result =cDao.checkout(username, card, address, city, state, zip_code);
		
		if(result == "success") {
			CartDao cartDao = new CartDao();
			request.getSession().setAttribute("items_in_cart", cartDao.updateCart(username));
			response.sendRedirect("checkout_success.jsp");
		}
	}

}
