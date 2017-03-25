//COPYRIGHT © 2017 Peter Borg & Håkan Hallberg

'use strict';

var testVal = document.getElementById('instaNumber');
var pieTitle = "Chart";
var pieItems = [['ArrayText0', 70], ['ArrayText1', 30]];

google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);


function updatePieTitle() {

    pieItems.push("document.getElementById('instaStuff').value", document.getElementById('instaNumber').value);
    pieItems[0][0] = document.getElementById('instaStuff').value;
    pieItems[0][1] = document.getElementById('instaNumber').value;
    //pieText = document.getElementById('instaStuff').value;
    drawChart();
}

function drawChart() {
    /*var pieString = "";
    for (var arrRow = 0; arrRow <= pieItems.length; arrRow++)
    {
        pieString += pieItems[arrRow][0] + "," + pieItems[arrRow][1] + ",";
    }

    var data = google.visualization.arrayToDataTable([
        ['Text', 'number'],

        //for (var arrRow = 0; arrRow <= pieItems.length; arrRow++) {
        //    data.addRows([pieItems[arrRow][0], pieItems[arrRow][1]]);
        //}
    ]);*/

    var data = google.visualization.arrayToDataTable([
        ['Text', 'number'],
        [pieItems[0][0], pieItems[0][1]],
        [pieItems[1][0], pieItems[1][1]]

        //pieString
    ]);

    var options = {
        title: pieTitle,
        width: '800'
    };

    document.getElementById('testResults').innerHTML = "Antal poster: " + pieItems.length;

    var chart = new google.visualization.PieChart(document.getElementById('instaPie'));
    chart.draw(data, options);
}