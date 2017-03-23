'use strict';

google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

    var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['Work', 1],
       
    ]);

    var options = {
        title: 'InstaPie'
    };

    var chart = new google.visualization.PieChart(document.getElementById('instaPie'));

    chart.draw(data, options);
}