package ElectricityBillJSP;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/calculate")
public class ElectricityBillServlet extends HttpServlet {

    private double calculateBill(int units) {

        double bill = 0;

        if (units <= 50) {

            bill = units * 3.50;

        } else if (units <= 150) {

            bill = (50 * 3.50)
                    + ((units - 50) * 4.00);

        } else if (units <= 250) {

            bill = (50 * 3.50)
                    + (100 * 4.00)
                    + ((units - 150) * 5.20);

        } else {

            bill = (50 * 3.50)
                    + (100 * 4.00)
                    + (100 * 5.20)
                    + ((units - 250) * 6.50);
        }

        return bill;
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String unitsInput =
                request.getParameter("units");

        try {

            int units =
                    Integer.parseInt(unitsInput);

            if (units < 0) {

                request.setAttribute(
                        "error",
                        "Units cannot be negative."
                );

            } else {

                double bill =
                        calculateBill(units);

                request.setAttribute(
                        "units",
                        units
                );

                request.setAttribute(
                        "bill",
                        String.format("%.2f", bill)
                );
            }

        } catch (NumberFormatException e) {

            request.setAttribute(
                    "error",
                    "Please enter a valid whole number of units."
            );
        }

        request.getRequestDispatcher(
                "index.jsp"
        ).forward(request, response);
    }
}
