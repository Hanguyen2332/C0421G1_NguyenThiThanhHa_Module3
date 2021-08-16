    <%--
      Created by IntelliJ IDEA.
      User: This PC
      Date: 8/10/2021
      Time: 9:57 PM
      To change this template use File | Settings | File Templates.
    --%>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>
        <head>
        <title>Title</title>
            <style>
        .list-group-item {
        background-color: #0d6efd;
        }
            a{
            color: black;
            }
            li:hover {
            background-color: #86b7fe;
            }
            </style>
        <link rel="stylesheet" href="../assert/css/bootstrap.min.css">
        </head>

        <body>
<%--        <div class="col-4">--%>
        <div class="list-group" id="list-tab" role="tablist">
        <a class="list-group-item list-group-item-action active" id="list-home-list" data-bs-toggle="list" href="#list-home" role="tab" aria-controls="list-home">Home</a>
        <a class="list-group-item list-group-item-action" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">Profile</a>
        <a class="list-group-item list-group-item-action" id="list-messages-list" data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="list-messages">Messages</a>
        <a class="list-group-item list-group-item-action" id="list-settings-list" data-bs-toggle="list" href="#list-settings" role="tab" aria-controls="list-settings">Settings</a>
        </div>
<%--        </div>--%>

<%--        <div class="card"  style="width: 100%; height:25rem">--%>
<%--        <ul class="list-group list-group-flush">--%>
<%--        <li class="list-group-item"><a href="">Item One</a></li>--%>
<%--        <li class="list-group-item"><a href="">Item Two</a></li>--%>
<%--        <li class="list-group-item"><a href="">Item Three</a></li>--%>
<%--        </ul>--%>
<%--        </div>--%>
        <script src="../assert/jquery/jquery-3.5.1.min.js"></script>
        <script src="../assert/jquery/popper.min.js"></script>
        <script src="../assert/js/bootstrap.min.js"></script>
        </body>

        </html>
