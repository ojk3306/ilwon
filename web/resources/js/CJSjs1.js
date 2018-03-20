$.extend( $.ui.slider.prototype.options, { 
    animate: 300
});

$("#flat-slider-vertical-1")
    .slider({
        max: 10,
        min: 0,
        range: "min",
        value: 25,
        orientation: "vertical"
    });

    $("#flat-slider-vertical-2")
    .slider({
        max: 10,
        min: 0,
        range: "min",
        value: 12,
        orientation: "vertical"
    });

$("#flat-slider-vertical-3")
    .slider({
        max: 10,
        min: 0,
        range: "min",
        value: 0,
        orientation: "vertical"
    });

    $("#flat-slider-vertical-1, #flat-slider-vertical-2, #flat-slider-vertical-3")
    .slider("pips", {
        first: "pip",
        last: "pip"
    })
    .slider("float");