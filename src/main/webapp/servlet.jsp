<%-- 
    Document   : servlet
    Created on : 8/03/2016, 10:31:51 PM
    Author     : fercris
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Google Charts con Servlets</title>
        <!-- <script type="text/javascript" src="https://www.google.com/jsapi"></script>-->
        <script type="text/javascript" src="js/DibujarGrafico.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart', 'table']});


            // Set a callback to run when the Google Visualization API is loaded.
            //google.setOnLoadCallback(drawChart);
            //google.setOnLoadCallback(drawChartBarra);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
            <c:forEach items="${pieDataList}" var="entry">
                    [ '${entry.key}', ${entry.value} ],
            </c:forEach>
                ]);

                // Set chart options
                var options = {
                    'title': 'Area-wise Top Seven Countries in the World', //title which will be shown right above the Google Pie Chart
                    is3D: true, //render Google Pie Chart as 3D
                    pieSliceText: 'label', //on mouse hover show label or name of the Country
                    tooltip: {showColorCode: true}, // whether to display color code for a Country on mouse hover
                    'width': 900, //width of the Google Pie Chart
                    'height': 500 //height of the Google Pie Chart
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);

                // Crear tabla de datos.

                var table = new google.visualization.Table(document.getElementById('tabla_divtorta'));

                table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});

            }

            function drawChartBarra() {

                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
            <c:forEach items="${pieDataList}" var="entry">
                    [ '${entry.key}', ${entry.value} ],
            </c:forEach>
                ]);

                // Set chart options
                var options = {
                    'title': 'Area-wise Top Seven Countries in the World', //title which will be shown right above the Google Pie Chart
                    is3D: true, //render Google Pie Chart as 3D
                    //pieSliceText: 'label', //on mouse hover show label or name of the Country
                    tooltip: {showColorCode: true}, // whether to display color code for a Country on mouse hover
                    'width': 900, //width of the Google Pie Chart
                    'height': 500 //height of the Google Pie Chart
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.BarChart(document.getElementById('chart_div_bar'));
                chart.draw(data, options);
                
                var table = new google.visualization.Table(document.getElementById('tabla_divtorta'));

                table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
            }

            function drawChartLineas() {

                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
            <c:forEach items="${pieDataList}" var="entry">
                    [ '${entry.key}', ${entry.value} ],
            </c:forEach>
                ]);

                // Set chart options
                var options = {
                    'title': 'Area-wise Top Seven Countries in the World', //title which will be shown right above the Google Pie Chart

                    //pieSliceText: 'label', //on mouse hover show label or name of the Country
                    tooltip: {showColorCode: true},
                    // whether to display color code for a Country on mouse hover
                    'width': 900, //width of the Google Pie Chart
                    'height': 500 //height of the Google Pie Chart
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.LineChart(document.getElementById('chart_div_lin'));
                chart.draw(data, options);
                
                var table = new google.visualization.Table(document.getElementById('tabla_divtorta'));

                table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
            }
        </script>
    </head>
    <body>
        <div style="width: 600px;">
            <label for="mostrartorta">Mostrar torta</label>
            <input type="checkbox"  name="mostrarbarra" id="mostrartorta"  onchange="dibujarGraficos();"/>
            <label for="mostrarbarra">Mostrar barra</label>
            <input type="checkbox" value="Mostrar barras" id="mostrarbarra" onchange="dibujarGraficos();"/>
            <label for="mostrarlineas">Mostrar lineas</label>
            <input type="checkbox" value="Mostrar lineas" id="mostrarlineas" onchange="dibujarGraficos();"/>
            <div id="chart_div"></div>
            <div id="tabla_divtorta"></div>
            <div id="chart_div_bar"></div>
            <div id="chart_div_lin"></div>
        </div>
    </body>
</html>
