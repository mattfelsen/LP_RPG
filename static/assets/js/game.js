// Set up global variables
var index = -1;
var queue = [];
var tokens = [];

$(document).ready(function() {

    // Fetch the tokens and initialize the score for each to 0
    $.get('/tokens', function(data) {
        tokens = data.items;
        for (var i in tokens) {
            tokens[i].score = 0;
        }
    });

    // Fetch the questions for this round and load them into the queue
    $.get('/game/begin', function(data) {
        for (var i in data.items) {
            queue.push(data.items[i]);
        }
        loadNextQuestion();
    });

    // Advance the question upon clicking a button
    $('a.btn').click(function() {
        loadNextQuestion();
    });

    function loadNextQuestion() {
        index = ++index % queue.length;
        $('#question').text(queue[index].question)
    }

});
