// Set up global variables

// Table headers for different admin sections
var headers = {
    'questions': ['id', 'question'],
    'tokens': ['id', 'name'],
    'settings': ['id', 'key', 'value', 'description'],
}

$(document).ready(function() {

    loadData('questions');

    $('#menu li a').click(function() {
        // Get section from <a href> and remove the leading # sign
        var section = $(this).attr('href').substring(1);
        loadData(section);

        return false;
    });

    function loadHeaders(section) {
        $('#admin-table thead').html('');

        // Loop through headers for given section and build thead tags
        var html = '<tr>';
        for (var i in headers[section]) {
            html += '<th>'+headers[section][i].toUpperCase()+'</th>'
        }
        html += '</tr>';

        $('#admin-table thead').append(html);
    }

    function loadData(section) {
        loadHeaders(section);

        $('#admin-table tbody').html('');

        // Fetch data from the given section
        $.get('/'+section, function(data) {
            // Loop through each row of the result set
            for (var i in data.items) {
                var row = data.items[i];

                // Loop through headers for given section and pull relevant data out of result row
                var html = '<tr>';
                for (var j in headers[section]) {
                    html += '<td>'+row[headers[section][j]]+'</th>'
                }
                html += '</tr>';

                $('#admin-table tbody').append(html);
            }
        });
    }

});
