<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Electricity Bill Calculator</title>

    <link rel="stylesheet"
          href="css/style.css">

</head>

<body>

<div class="container">

    <div class="card">

        <div class="header">

            <div class="icon">
                ⚡
            </div>

            <div>

                <h1>
                    Electricity Bill Calculator
                </h1>

                <p>
                    Calculate your electricity bill instantly
                </p>

            </div>

        </div>


        <div class="content">


            <!-- Calculator -->

            <div class="calculator">

                <h2>
                    Enter Consumption
                </h2>


                <form action="calculate"
                      method="post"
                      onsubmit="return validateForm()">


                    <label for="units">
                        Electricity Units Consumed
                    </label>


                    <div class="input-wrapper">

                        <input
                            type="number"
                            id="units"
                            name="units"
                            min="0"
                            step="1"
                            placeholder="e.g. 180"
                            required
                            value="<%= request.getAttribute("units") != null
                                    ? request.getAttribute("units")
                                    : "" %>"
                        >

                        <span>
                            units
                        </span>

                    </div>


                    <p id="clientError"
                       class="error">
                    </p>


                    <button type="submit">
                        Calculate Bill
                    </button>

                </form>


                <% if (request.getAttribute("error") != null) { %>

                    <div class="server-error">

                        <%= request.getAttribute("error") %>

                    </div>

                <% } %>


                <% if (request.getAttribute("bill") != null) { %>

                    <div class="result">

                        <span>
                            Estimated Electricity Bill
                        </span>

                        <strong>
                            ₹ <%= request.getAttribute("bill") %>
                        </strong>

                        <small>
                            For
                            <%= request.getAttribute("units") %>
                            units consumed
                        </small>

                    </div>

                <% } %>

            </div>


            <!-- Tariff -->

            <div class="slabs">

                <h2>
                    Tariff Slabs
                </h2>


                <div class="slab">

                    <span>
                        First 50 units
                    </span>

                    <strong>
                        ₹3.50 / unit
                    </strong>

                </div>


                <div class="slab">

                    <span>
                        Next 100 units
                    </span>

                    <strong>
                        ₹4.00 / unit
                    </strong>

                </div>


                <div class="slab">

                    <span>
                        Next 100 units
                    </span>

                    <strong>
                        ₹5.20 / unit
                    </strong>

                </div>


                <div class="slab">

                    <span>
                        Above 250 units
                    </span>

                    <strong>
                        ₹6.50 / unit
                    </strong>

                </div>


                <div class="note">

                    <strong>
                        How it works:
                    </strong>

                    The calculator applies each rate
                    only to the units falling within
                    that consumption slab.

                </div>

            </div>

        </div>


        <footer>

            JSP Dynamic Web Project
            • Electricity Bill Calculator

        </footer>

    </div>

</div>


<script src="js/script.js"></script>

</body>

</html>
