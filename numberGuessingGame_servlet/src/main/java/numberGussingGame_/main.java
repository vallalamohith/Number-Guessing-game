package numberGussingGame_;

import java.io.IOException;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/main")
public class main extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Integer targetNumber = (Integer) session.getAttribute("targetNumber");
		if (targetNumber == null) {
			Random random = new Random();
			targetNumber = random.nextInt(100) + 1;
			session.setAttribute("targetNumber", targetNumber);
		}

		String input = req.getParameter("number");
		String message = "";

		try {
			int userGuess = Integer.parseInt(input);

			if (userGuess == targetNumber) {
				message = "🎉 Congratulations! You guessed the number.";
				session.removeAttribute("targetNumber");
			} else if (userGuess < targetNumber) {
				if (Math.abs(userGuess - targetNumber) <= 5) {
					message = "Too low, but you're very close! 🔥";
				} else {
					message = "Too low! Try again.";
				}
			} else {
				if (Math.abs(userGuess - targetNumber) <= 5) {
					message = "Too high, but you're very close! 🔥";
				} else {
					message = "Too high! Try again.";
				}
			}
		} catch (NumberFormatException e) {
			message = "⚠️ Please enter a valid number between 1 and 100.";
		}

		req.setAttribute("key", message);

		RequestDispatcher dispatcher = req.getRequestDispatcher("Home.jsp");
		dispatcher.forward(req, resp);
	}
}
