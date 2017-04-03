 //COPYRIGHT © 2017 Peter Borg & Håkan Hallberg

'use strict';

$(function()
{
    $(".ui-widget-content").draggable();
});


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
				label: "Other birds",
				color: "#999999"
			},
			content: [
				{label: "Bushtit", value: 5 },
				{label: "Chickadee", value: 2 },
				{label: "Elephants", value: 6 },
				{label: "Killdeer", value: 3 },
				{label: "Caspian Tern", value: 2 },
				{label: "Blackbird", value: 1 },
				{label: "Song Sparrow", value: 6 },
				{label: "Blue Jay", value: 5 },
				{label: "Black-throated Gray warbler", value: 1 },
				{label: "Pelican", value: 6 },
				{label: "Bewick's Wren", value: 5 },
				{label: "Cowbird", value: 1 },
				{label: "Fox Sparrow", value: 6 },
				{label: "Common Yellowthroat", value: 5 },
				{label: "Virginia Rail", value: 1 },
				{label: "Sora", value: 1 },
				{label: "Osprey", value: 1 },
				{label: "Merlin", value: 1 },
				{label: "Kestrel", value: 1 }
			]
		}
	});
