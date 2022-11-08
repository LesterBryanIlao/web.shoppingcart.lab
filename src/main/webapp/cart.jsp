
<%@page import="com.webshoppe.ecommerce.bean.CartItem"%>
<%@ page language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.webshoppe.ecommerce.bean.Cart" %>
<%
Cart cart = (Cart) session.getAttribute("cart");
%>
<html>
    <head>
        <title>Webshoppe::Cart</title>
        <style type="text/css">
            body {
                margin: 50px;
            }
        </style>
    </head>
    <body>
        <h2>Shopping Cart</h2>
        <br/>
        <a href="./toy-catalog">Toy Catalog</a>
        <br/>
        <hr/>
        <%
        if(cart.countItems() == 0) {
        %>
            <b>No cart items found!</b>
        <%
        }
        %>
        
         <%
        if(cart.countItems() > 0) {
        %>
        <table>
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Description</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Total Price</td>
                    <td>Action</td>
                </tr>
            </thead>
            <tbody>
                <%
                for(CartItem item: cart.getItemsAsList()) {
                %>
                    <tr>
                        <td><%= item.getId() %></td>
                        <td><%= item.getName() %></td>
                        <td><%= item.getDescription() %></td>
                        <td><%= item.getPrice() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td><%= item.getTotalPrice() %></td>
                        
                        <td>
                       	   <form action="./cart" method="POST">
	                           <input type="hidden" name="id" value="<%= item.getId() %>">
	                           <input type="hidden" name="action" value="removeItem">
	                           <input type="submit" value="Remove">
                           </form>
	                    </td>
                    </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <%
        }
        %>
        <hr/>
        <h2>Grand Total: <%= cart.getGrandTotal() %></h2>
    </body>
</html>