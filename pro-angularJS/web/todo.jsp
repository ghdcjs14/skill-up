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
        };

        var todoApp = angular.module("todoApp", []);

        todoApp.run(function($http) {
            $http.get("todo.json").success(function(data) {
                model.items = data;
            });
        });

        todoApp.filter("checkedItems", function() {
            return function(items, showComplete) {
                var resultArr = [];
                angular.forEach(items, function(item) {
                    if(item.done == false || showComplete == true) {
                        resultArr.push(item);
                    }
                });
                return resultArr;
            }
        })

        todoApp.controller("ToDoCtrl", function($scope) {
            $scope.todo = model;

            $scope.incompleteCount = function() {
                var count = 0;
                angular.forEach($scope.todo.items, function(item) {
                    if(!item.done) { count++ }
                });
                return count;
            }

            $scope.warningLevel = function() {
                return $scope.incompleteCount() < 3 ? "label-success" : "label-warning";
            }

            $scope.addNewItem = function(actionText) {
                $scope.todo.items.push({action: actionText, done: false });
            }
        });
    </script>
</head>
<body ng-controller="ToDoCtrl">
    <div class="page-header">
        <h1>{{todo.user}}'s To Do List
            <span class="label label-default" ng-class="warningLevel()" ng-hide="incompleteCount() == 0">
                {{incompleteCount()}}
            </span>
        </h1>
    </div>
    <div class="panel">
        <div class="input-group">
            <input class="form-control" ng-model="actionText"/>
            <span class="input-group-btn">
                <button class="btn btn-default" ng-click="addNewItem(actionText)">Add</button>
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
                <tr ng-repeat="item in todo.items | checkedItems: showComplete | orderBy: 'action'">
                    <td>{{item.action}}</td>
                    <td><input type="checkbox" ng-model="item.done" /></td>
                    <td>{{item.done}}</td>
                </tr>
            </tbody>
        </table>

        <div class="checkbox-inline">
            <label><input type="checkbox" ng-model="showComplete"> Show Complete</label>
        </div>
    </div>
</body>
</html>
