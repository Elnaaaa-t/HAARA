<%-- 
    Document   : AjaxFurniture
    Created on : 1 Apr, 2024, 4:52:11 PM
    Author     : Admin
--%>

<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <table>  
        <tr>
            <th>Furniture</th>
            <th>Details</th>
            <th>Price</th>                       
        </tr>
    <%
        String word=request.getParameter("word");
//        out.print(word);
        String sel = "SELECT * FROM tbl_furniture WHERE furniture_price LIKE '%" + word + "%'";
//        out.print(sel);
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
    %>


    <tr>
        <td><img src="../Assets/Files/<%=rs.getString("furniture_image")%>" width="200" height="200"/></td>
        <td><%=rs.getString("furniture_description")%></td>
        <td><%=rs.getString("furniture_price")%></td>


    </tr>
    <tr align="right">
        <td><a href="ViewMoreFur.jsp?fid=<%=rs.getString("furniture_id")%>">View More</a></td>
        <td colspan="4"><a href="FurnitureReview.jsp?id=<%=rs.getString("furniture_id")%>">Review</a></td>

    </tr>
    <%
        }
    %>
</table>