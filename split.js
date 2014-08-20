
var output_file = "test1";
var input_file = "res/N225.csv";

var LineByLineReader = require('line-by-line');
var fs = require('fs');

var lr = new LineByLineReader(input_file);

lr.on('error', function (err) {
	console.log("read file error !");
});

lr.on('line', function (line) {
	lr.pause();

	fs.appendFile(output_file, line.replace(/\s/g, ",") + "\n", function(err) {
		if(err) {
			console.log(err);
		} 
	});

    setTimeout(function () {

        // ...and continue emitting lines.
        lr.resume();
    }, 1);
});

lr.on('end', function () {
	console.log("complete !");
});

