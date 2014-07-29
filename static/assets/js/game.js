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
        updateScore();
    });

    // Fetch the questions for this round and load them into the queue
    $.get('/game/begin', function(data) {
        for (var i in data.items) {
            queue.push(data.items[i]);
        }
        loadNextQuestion();
    });

    // Advance the question upon clicking a button
    $('#yes').click(function() {
        for (var i in queue[index].tokens) {
            tokens[i].score += queue[index].tokens[i].yes_points;
        }
        loadNextQuestion();
    })
    $('#no').click(function() {
        for (var i in queue[index].tokens) {
            tokens[i].score += queue[index].tokens[i].no_points;
        }
        loadNextQuestion();
    })

    function loadNextQuestion() {
        index++;
        if (index == queue.length) {
            $('#question').text('Thanks for playing!');
            $('#buttons').fadeOut('fast');
        } else {
            $('#question').html(queue[index].question);
        }

        updateScore();
    }

    function updateScore() {
        $('#score').html('');

        var html = '';
        for (var i in tokens) {
            html += '<h4>' + tokens[i].name + ': ' + tokens[i].score + '</h4>';
        }

        $('#score').html(html);
    }

});
