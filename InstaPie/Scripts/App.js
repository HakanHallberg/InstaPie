 //COPYRIGHT © 2017 Peter Borg & Håkan Hallberg

'use strict';

$(function()
{
    $(".dragThis").draggable();
});

function updatePie()
{
    var pie = new d3pie("pie", {
        size: {
            pieOuterRadius: "100%",
            canvasHeight: 360
        },
        data: {
            sortOrder: "value-asc",
            smallSegmentGrouping: {
                enabled: true,
                value: 2,
                valueType: "percentage",
                label: "Pies",
                color: "#999999"
            },
            content: [
                { label: document.getElementById("instaStuff1").innerHTML, value: 1 },
                { label: document.getElementById("instaStuff2").innerHTML, value: 1 },
                { label: document.getElementById("instaStuff3").innerHTML, value: 1 },
                { label: document.getElementById("instaStuff4").innerHTML, value: 1 },
                { label: document.getElementById("instaStuff5").innerHTML, value: 1 },
                { label: document.getElementById("instaStuff6").innerHTML, value: 1 },
                { label: document.getElementById("instaStuff7").innerHTML, value: 1 },
                { label: document.getElementById("instaStuff8").innerHTML, value: 1 },
                { label: document.getElementById("instaStuff9").innerHTML, value: 1 },
                { label: document.getElementById("instaStuff10").innerHTML, value: 1 }
            ]
        }
    });
}


function testFunc()
{
    document.getElementById("instaStuff1").innerHTML = "HELLO WORLD!!";
}

function clearAll() {
    $("input[type=text]").val('');
    $("input[type=number]").val('');
}