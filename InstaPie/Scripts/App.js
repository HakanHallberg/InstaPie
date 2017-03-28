 //COPYRIGHT © 2017 Peter Borg & Håkan Hallberg

'use strict';

var totalValue = 0;
var noOfValues = 0;
var maxValue = 100;

var testVal = document.getElementById('instaNumber1');
var pieTitle = "The Pie";
var pieItems = [
    ['ArrayText0', 10],
    ['ArrayText1', 10],
    ['ArrayText2', 10],
    ['ArrayText3', 10],
    ['ArrayText4', 10],
    ['ArrayText5', 10],
    ['ArrayText6', 10],
    ['ArrayText7', 10],
    ['ArrayText8', 10],
    ['ArrayText9', 10]
];
var pieItem = { text: "PieText", value: "pieValue" };

google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);


function updatePie()
{
   

    //google.charts.load('current', { 'packages': ['corechart'] });
    //google.charts.setOnLoadCallback(drawChart);


    //pieItems.push("document.getElementById('instaStuff1').value", document.getElementById('instaNumber').value);
    //pieItems[0][0] = document.getElementById('instaStuff1').value;
    //pieItems[0][1] = document.getElementById('instaNumber1').value;
    //pieText = document.getElementById('instaStuff1').value;
    drawChart();
}

function clearAll() {
    $("input[type=text]").val('');
    $("input[type=number]").val('');
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

    totalValue = 0;
    noOfValues = 0;

    if (document.getElementById('instaNumber1').value) {
        noOfValues += 1;
        pieItems[0][1] = document.getElementById("instaNumber1").value;
    }
    if (document.getElementById('instaNumber2').value) {
        noOfValues += 1;
        pieItems[1][1] = document.getElementById("instaNumber2").value;
    }
    if (document.getElementById('instaNumber3').value) {
        noOfValues += 1;
        pieItems[2][1] = document.getElementById("instaNumber3").value;
    }
    
    totalValue = eval(document.getElementById('instaNumber1').innerHTML + document.getElementById("instaNumber2").innerHTML);
    totalValue = eval(document.getElementById("instaNumber1").innerHTML);

    var data = google.visualization.arrayToDataTable([
        ['Text', 'number'],
        [pieItems[0][0], pieItems[0][1]],
        [pieItems[1][0], pieItems[1][1]],
        [pieItems[2][0], pieItems[2][1]],
        [pieItems[3][0], pieItems[3][1]],
        [pieItems[4][0], pieItems[4][1]],
        [pieItems[5][0], pieItems[5][1]],
        [pieItems[6][0], pieItems[6][1]],
        [pieItems[7][0], pieItems[7][1]],
        [pieItems[8][0], pieItems[8][1]],
        [pieItems[9][0], pieItems[9][1]]

        //pieString
    ]);

    var options = {
        title: pieTitle,
        width: '800'
    };

    document.getElementById('testResults').innerHTML = "Antal poster: " + pieItems.length + "<br />Antal värden: " + noOfValues + "<br />TotalVal: " + totalValue;

    var chart = new google.visualization.PieChart(document.getElementById('instaPie'));
    chart.draw(data, options);
}