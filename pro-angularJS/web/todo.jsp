<%--
  Created by IntelliJ IDEA.
  User: hong
  Date: 2016. 7. 9.
  Time: 오후 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="todoApp">
<head>
    <title>TO DO List</title>
    <link href="resource/bootstrap.css" rel="stylesheet"/>
    <link href="resource/bootstrap-theme.css" rel="stylesheet"/>
    <script src="resource/angular.js"></script>
    <script>

        var model = {
            user: "Adam",
            items: [{ action: "Buy Flowers", done: false},
                        { action: "Get Shoes", done: false},
                        { action: "Collect Tickets", done: true},
                        { action: "Call Joe", done: false}]
        };

        var todoApp = angular.module("todoApp", []);

        todoApp.controller("ToDoCtrl", function($scope) {
            $scope.todo = model;
        });
    </script>
</head>
<body ng-controller="ToDoCtrl">
    <div class="page-header">
        <h1>{{todo.user}}'s To Do List
            <span class="label label-default">{{todo.items.length}}</span>
        </h1>
    </div>
    <div class="panel">
        <div class="input-group">
            <input class="form-control"/>
            <span class="input-group-btn">
                <button class="btn btn-default">Add</button>
            </span>
        </div>
        <table class="table table-stripe">
            <thead>
                <tr>
                    <td>Description</td>
                    <td>Done</td>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="item in todo.items">
                    <td>{{item.action}}</td>
                    <td>{{item.done}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
