numbers     = (1..90).to_a  #90 numbers in the bingo set
cards       = (1..48)       #48 tickets will be printed
columns     = (1..5)        #5  each card has 5 columns
rows        = (1..5)        #5  each card has 5 rows

output = "<body><html>"

output += "
    <style>
    body,html{
        width: 210mm;
        height: 297mm;
        margin:0;
        padding:0
        font-family:verdana;
    }
    .card{
        width:100%
        height: 75mm;
    }
    h2{padding-top:45px}
    td{
        border:1px dotted black;
        padding:13px;
        font-size:16px;
    }
    @page {
        size: A4;
        margin: 0;
    }
    table{
        width:100%;
        border:1px solid black;

    }
    *{font-family:verdana; text-align:center}

    </style>
"
cards.each do |card_i|
    index = 0
    numbers.shuffle!
    output += "<div class='card'><h2>Bingo!</h2><table>"
    rows.each do |row_i|
        output += "<tr>"
        columns.each do |column_i|
            output += "<td>#{numbers[index]}</td>"
            index += 1
        end
        output += "</tr>"
    end
    output += "</table></div>"
end

output += "</body></html>"

File.open('output_bingo.html', 'w') { |file| file.write(output) }
