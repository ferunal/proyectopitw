/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function dibujarGraficos() {
    var mostrartorta = document.getElementById('mostrartorta');
    var mostrarbarra = document.getElementById('mostrarbarra');
    var mostrarlineas = document.getElementById('mostrarlineas');
    if (mostrartorta.checked === true) {
        drawChart();

    } else {
        document.getElementById("chart_div").innerHTML = "";
    }

    if (mostrarbarra.checked === true) {
        drawChartBarra();

    } else {
        document.getElementById("chart_div_bar").innerHTML = "";
    }
    if (mostrarlineas.checked === true) {

        drawChartLineas();
    } else {
        document.getElementById("chart_div_lin").innerHTML = "";

    }

}