 //COPYRIGHT © 2017 Peter Borg & Håkan Hallberg

'use strict';

$(function()
{
    $(".dragThis").draggable();
});

//function initiatePie()
//{
//    var pie = new d3pie("pie", {
//        size: {
//            pieOuterRadius: "100%",
//            canvasHeight: 360
//        },
//        data: {
//            sortOrder: "value-asc",
//            smallSegmentGrouping: {
//                enabled: true,
//                value: 2,
//                valueType: "percentage",
//                label: "Pies",
//                color: "#999999"
//            },
//            content: [
//                { label: document.getElementById("instaStuff1").value, value: 1 },
//                { label: document.getElementById("instaStuff2").value, value: 0 },
//                { label: document.getElementById("instaStuff3").value, value: 0 },
//                { label: document.getElementById("instaStuff4").value, value: 0 },
//                { label: document.getElementById("instaStuff5").value, value: 0 },
//                { label: document.getElementById("instaStuff6").value, value: 0 },
//                { label: document.getElementById("instaStuff7").value, value: 0 },
//                { label: document.getElementById("instaStuff8").value, value: 0 },
//                { label: document.getElementById("instaStuff9").value, value: 0 },
//                { label: document.getElementById("instaStuff10").value, value: 0 }
//            ]
//        }
//    });
//}

function updatePieNow()
{
    var elementExists = document.getElementById("instaPie");
    if (elementExists !== null)
    {
        var elem = document.getElementById("instaPie");
        elem.parentNode.removeChild(elem);
    }


    var pie = new d3pie("pie", {
        size: {
            pieOuterRadius: "100%",
            canvasHeight: 360
        },
        data: {
            sortOrder: "value-dec",
            smallSegmentGrouping: {
                enabled: true,
                value: 2,
                valueType: "percentage",
                label: "Pies",
                color: "#999999"
            },

     
            content: [
                { label: document.getElementById("instaStuff1").value, value: parseInt(document.getElementById("instaNumber1").value) },
                { label: document.getElementById("instaStuff2").value, value: parseInt(document.getElementById("instaNumber2").value) },
                { label: document.getElementById("instaStuff3").value, value: parseInt(document.getElementById("instaNumber3").value) },
                { label: document.getElementById("instaStuff4").value, value: parseInt(document.getElementById("instaNumber4").value) },
                { label: document.getElementById("instaStuff5").value, value: parseInt(document.getElementById("instaNumber5").value) },
                { label: document.getElementById("instaStuff6").value, value: parseInt(document.getElementById("instaNumber6").value) },
                { label: document.getElementById("instaStuff7").value, value: parseInt(document.getElementById("instaNumber7").value) },
                { label: document.getElementById("instaStuff8").value, value: parseInt(document.getElementById("instaNumber8").value) },
                { label: document.getElementById("instaStuff9").value, value: parseInt(document.getElementById("instaNumber9").value) },
                { label: document.getElementById("instaStuff10").value, value: parseInt(document.getElementById("instaNumber10").value) }
            ]
        }
    });
}


function testFunc()
{
    document.getElementById("instaStuff1").value = "HELLO WORLD!!";
    document.getElementById("instaNumber1").value = 2;
    document.getElementById("instaStuff2").value = "Test2";
    document.getElementById("instaNumber2").value = 1;

    var testObj = document.getElementById("instaPie");
    //testObj.size.canvasHeight = 500;
}

function clearAll() {
    $("input[type=text]").val('');
    $("input[type=number]").val('');
}