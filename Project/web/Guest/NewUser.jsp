<%-- 
    Document   : NewUser.jsp
    Created on : 16 Mar, 2024, 8:08:28 PM
    Author     : mariy
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <%if (request.getParameter("btnsubmit") != null) {
            String email = request.getParameter("txtemail");
            String selQry = "select user_email from tbl_user where user_email='" + email + "'";
            ResultSet rs1 = con.selectCommand(selQry);

            if (rs1.next()) {
    %>
    <script>
        alert("Email already taken");
        window.location = "NewUser.jsp";
    </script> <%
    }
    }
    %>



    <body>
        <%@include file="Head.jsp" %>
        <h2>New User</h2>
        <form name="frmNewUser" method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserUploadAction.jsp">
            <table border="2" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" placeholder="enter name"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="number" max="9999999999" name="txtcontact" required=""> </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" placeholder="enter email"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required name="txtpwd" /></td>

                </tr>
                <tr>
                    <td>Re-Password</td>
                    <td><input type="password" required name="txt_repass" /></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                            <option value="">-----Select------</option>
                            <%
                                String sel = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%}%>
                        </select>                       
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="sel_place" id="sel_place">
                            <option value="">-----Select-----</option>
                        </select>                       
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea name="txtaddress" rows="6" cols="20" placeholder="enter address"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="file_proof"></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file_photo"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Submit" name="btnsubmit"></td>
                </tr>
            </table>
        </form>
        <%@include file="Foot.jsp" %>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                            function getPlace(did)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                    success: function(html) {
                                        $("#sel_place").html(html);

                                    }
                                });

                            }
    </script>
</html>