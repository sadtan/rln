$(document).ready(function()
{
    console.log("ready.");
    //$("form#changeQuote").on('submit', function(e)
    $("#target").keyup(function()
    {
        
        //e.preventDefault();
        if ($('input[name=fondo_id_ajax]').val() != "")
        {
            $('#fondo').html("Cargando...");
        data = {
            data: $('input[name=fondo_id_ajax]').val()
        }
        $.ajax({
            type: 'post',
            url: '/fondos',
            data: data,
            dataType: 'JSON',
            success: function(data)
            {
                //console.log(data);
                //data = JSON.parse(data);
                $('#fondo').html("");
                if(data[0] != undefined) {
                   
                    for(var i in data[0])
                    {
                        $('#fondo').html($('#fondo').html() + "<strong>" + i  + ":  </strong>" + data[0][i] + "<br>");
                    }
                    $('#fondo').html($('#fondo').html() + '<hr> <a href= "/fondos/json/' + $('input[name=fondo_id_ajax]').val() + '" class="btn btn-primary" > ver en formato json </a> <br>');
                }
                else 
                {
                    $('#fondo').html("Fondo no encontrado");
                }
            },
            error: function(req, status, error)
            {
                console.log(error);
            }
        })
        .done(function(data){
            console.log(">> Request Done");
        });
        } 
        else{
            $('#fondo').html("");
        }
    });
});