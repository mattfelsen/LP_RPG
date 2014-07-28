$(document).ready(function() {

$.get('/questions', function(data) {
    for (var i in data.items) {
        var row = data.items[i];
        var html = '<tr><td>'+row.id+'</td><td>'+row.question+'</td></tr>';

        $('#questions tbody').append(html);
    }

});

});
