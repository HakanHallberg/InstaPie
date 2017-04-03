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
                { label: "Bushtit", value: 1 },
                { label: "Chickadee", value: 1 },
                { label: "Kestrel", value: 1 }
            ]
        }
    });
}
