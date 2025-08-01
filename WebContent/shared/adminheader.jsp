<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");

    if (user == null || !"admin".equals(role)) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String name = (String) session.getAttribute("name");
%>

<style>
    .topbar {
        background-color: #004466;
        color: white;
        padding: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .menu {
        display: flex;
        align-items: center;
    }
    .menu > div {
        position: relative;
        margin-right: 20px;
    }
    .menu a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        padding: 10px 15px;
        display: inline-block;
    }
    .menu a:hover {
        background-color: #006699;
    }
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    .dropdown-content a {
        color: #004466;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dropdown-content a:hover {
        background-color: #ddd;
    }
    .dropdown:hover .dropdown-content {
        display: block;
    }
    .user-info {
        display: flex;
        align-items: center;
    }
    .user-info span {
        margin-right: 15px;
        font-weight: bold;
    }
    .user-info button {
        padding: 6px 12px;
        background-color: #ff4d4d;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .user-info button:hover {
        background-color: #e60000;
    }
</style>

<div class="topbar">
    <div class="menu">
        <div class="dropdown">
            <a href="<%=request.getContextPath()%>/Home/adminhome.jsp">Dashboard</a>
        </div>
        <div class="dropdown">
            <a href="<%=request.getContextPath()%>/Bills/AddBill.jsp">Billing</a>
            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/Bills/AddBill.jsp">AddBill</a>
            </div>
        </div>
        <div class="dropdown">
            <a href="<%=request.getContextPath()%>/active">Complaints</a>
            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/active">View Active Complaints</a>
                <a href="<%=request.getContextPath()%>/Complaint/changestatus.jsp">Resolve Complaint</a>
            </div>
        </div>
    </div>

    <div class="user-info">
        <span>Welcome Admin, <%= name %></span>
        <form action="<%=request.getContextPath()%>/LogoutServlet" method="post" style="margin: 0;">
            <button type="submit">Logout</button>
        </form>
    </div>
</div>

<script>
    function logout() {
        window.location.href = '<%=request.getContextPath()%>/LogoutServlet';
    }
</script>
