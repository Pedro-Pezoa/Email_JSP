function apareceInputX(X)
{
    if (naoEstaEditando())
    {
        var divao = $('#dInfNome'+X);
        var str = '<form method="post" class="numalinha">'+
        '<input type="text" value="'+divao[0].innerHTML+'" name="altN" class="form-control estaEditando" required>'+
        '<input type="number" value="'+X+'" name="altNID" class="form-control" style="visibility:hidden; position:absolute;" required>'+
        '<button type="submit" class="btn btn-default form-control botaoAntes numalinha" style="visibility:hidden; position:absolute;"><span class="glyphicon glyphicon-search"></span></button></form>';
        divao[0].innerHTML = str;
    }
}

function apareceProfX(X)
{
    if (naoEstaEditando())
    {
        var divao = $('#dInfProf'+X);
        var str = '<form method="post" class="numalinha">'+
        '<input type="text" value="'+divao[0].innerHTML+'" name="altP" class="form-control estaEditando" required>'+
        '<input type="number" value="'+X+'" name="altPID" class="form-control" style="visibility:hidden; position:absolute;" required>'+
        '<button type="submit" class="btn btn-default form-control botaoAntes numalinha" style="visibility:hidden; position:absolute;"><span class="glyphicon glyphicon-search"></span></button></form>';
        divao[0].innerHTML = str;
    }
}

function naoEstaEditando()
{
    return ($('.estaEditando')[0] === undefined);
}

function mudarNome()
{
    $('#FtxtNome').val($('#txtNome').val());
}

function mudarProf()
{
    $('#FtxtProf').val($('#txtProf').val());
}