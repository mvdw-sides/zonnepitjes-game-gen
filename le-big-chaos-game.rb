games       = (1..18).to_a
groups      = (1..10)

output      = "<html><body>"

styling     = "
    <style>
        body,html{
            width: 210mm;
            height: 297mm;
            margin:0;
            padding:0
            font-family:verdana;
        }
        .page{
            width:100%
            width: 210mm;
            height: 297mm;
        }
        h2{padding-top:45px}
        td{
            border-bottom:1px dotted black;
            padding:13px;
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

output = "#{output}#{styling}"

groups.each do |group|
    output += "<div class='page'><h2>Groep: #{group}</h2><table>"
    output += "<td>Opdracht</td><td>Punten</td><td>Commentaar</td>"
    games.shuffle.each do |challenge|
        output += "<tr><td>#{challenge}</td><td></td><td></td></tr>"
    end
    output += "<td>Totaal</td><td></td><td></td>"
    output += '</table></div>'
end

File.open('output.html', 'w') { |file| file.write(output) }
