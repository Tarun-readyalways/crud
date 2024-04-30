<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="emp.Employee" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
     <style>
        
        form {
            margin-bottom: 20px;
        }
        form input[type="text"] {
            width: 200px;
            margin-bottom: 10px;
        }
         button {
            padding: 10px 20px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            margin-right: 10px;
        }
        button:hover {
            background-color: #45a049;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
           background-color: #efd087;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center">Employee Management System</h2>

   
 <form action="crudserve" method="post">
        Employee ID: <input type="text" name="Empid"><br><br>
        Employee Name: <input type="text" name="Empname"><br><br>
        Job: <input type="text" name="job"><br><br>
        Department: <input type="text" name="Department"><br><br>
        Salary: <input type="text" name="Sal"><br><br>
 <button type ="submit" name="action" value="add">Add</button>
 <button type ="submit" name="action" value="delete">Delete</button>
 <button type ="submit" name="action" value="update">Update</button>

 </form>
  <button id="nextButton" type="button">Next</button>
  <button type="button" id="prevbutton">Previous</button>
  <br><br>

    <!-- Table to display employee records -->
    <table id="employeeTable" border="1">
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Job</th>
            <th>Department</th>
            <th>Salary</th>
        </tr>
        <% 
            List<Employee> emp1 = (List<Employee>) request.getAttribute("ed");
            if (emp1 != null) {
                for (Employee emp2 : emp1) {
        %>
        <tr id="data">
            <td><%= emp2.getEmpid() %></td>
            <td><%= emp2.getEmp_name() %></td>
            <td><%= emp2.getJob() %></td>
            <td><%= emp2.getDept()%></td>
            <td><%= emp2.getSalary() %></td>
            
            
        </tr>
        <%
                }
            }
        %>
    </table>

<script>
var rowIndex=1;
var index = 1; 
var rows; 

document.addEventListener("DOMContentLoaded", function() {
    var table = document.getElementById("employeeTable");
    rows = table.getElementsByTagName("tr");

   
    function updateFormFields(row, rowIndex) {
        var cells = row.getElementsByTagName("td");
        document.getElementsByName("Empname")[0].value = cells[1].innerHTML;
        document.getElementsByName("Empid")[0].value = cells[0].innerHTML;
        document.getElementsByName("job")[0].value = cells[2].innerHTML;
        document.getElementsByName("Department")[0].value = cells[3].innerHTML;
        document.getElementsByName("Sal")[0].value = cells[4].innerHTML;
        index = rowIndex; 
    }

   
    for (var i = 1; i < rows.length; i++) {
        rows[i].addEventListener("click", function() {
            rowIndex = Array.prototype.indexOf.call(rows, this);
            updateFormFields(this, rowIndex); 
        });
    }

    
    function moveToNext() {
        if (rowIndex < rows.length - 1) {
        	rowIndex++;
            updateFormFields(rows[rowIndex], rowIndex);
        }
    }

    
    function moveToPrev() {
        if (rowIndex > 1) {
        	rowIndex--;
            updateFormFields(rows[rowIndex], rowIndex);
        }
    }

   
    document.getElementById("prevbutton").addEventListener("click", function() {
        moveToPrev();
        console.log('Moving back');
    });


    document.getElementById("nextButton").addEventListener("click", function() {
        moveToNext();
        console.log('Moving forward');
    });
});
   
    
</script>
    
</body>
</html>