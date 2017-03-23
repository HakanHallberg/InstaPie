//COPYRIGHT © 2017 Peter Borg & Håkan Hallberg

'use strict';

var testVal = document.getElementById('instaNumber');
var pieTitle = "No title";
var pieText = "No text";

testVal = 1;

google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);


function updatePieTitle() {
    pieTitle = document.getElementById('instaStuff');
    pieText = document.getElementById('instaStuff');
    drawChart();
}

function drawChart() {
    
    var data = google.visualization.arrayToDataTable([
        ['Text', 'pieValue'],
        [pieText, testVal]
    ]);

    var options = {
        title: pieTitle
    };

    var chart = new google.visualization.PieChart(document.getElementById('instaPie'));
    chart.draw(data, options);
}

function test()
{
    //testtext = document.getElementById('instaStuff');
    document.getElementById('instaTest').innerHTML = document.getElementById('instaStuff').value;
}


