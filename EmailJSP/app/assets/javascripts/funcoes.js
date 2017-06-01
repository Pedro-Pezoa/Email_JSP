function apareceSenhaX(X, id)
{
    if (naoEstaEditando())
    {
        if (confirm("Deseja alterar sua senha?"))
        {
            var nomeEmail = document.getElementById('dInfNome'+X);
            var divao = $('#dInfSenha'+X);

            var str = '<form action="/emails/edit" method="post" class="numalinha">'+
            '<input type="text" value="'+nomeEmail.innerHTML+'" name="email[email]" class="form-control" style="visibility:hidden; position:absolute;">'+
            '<input type="text" name="email[user_id]" value="'+id+'" class="form-control" style="visibility:hidden; position:absolute;" />'+
            '<input type="password" id="altS" name="email[senha]" class="form-control estaEditando botaoDepoisSenha numalinha" required>'+
            '<button type="submit" class="btn btn-default form-control botaoAntes numalinha" style="visibility:hidden; position:absolute;"><span class="glyphicon glyphicon-search"></span></button></form>';
            divao[0].innerHTML = str;
        }
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

function mudarSenha()
{
    $('#FtxtSenha').val($('#txtSenha').val());
}

function trocarSenha(o)
{
    var password = document.getElementById('dInfSenha' + o);
    var length = password.innerHTML.length;
    password.innerHTML = "";
    for (var i = 0; i < length; i++) 
      password.innerHTML += '•';
}

function trocarCaracter(o)
{
    var password = document.getElementById('altS');
    var length = password.value.length;
    password.value = "";
    for (var i = 0; i < length; i++) 
      password.value += '•';
}

function alterarUsuario(id,nome, senha)
{
    if (naoEstaEditando())
    {
        var btnAlterar = document.getElementById('btnAlterar');
        btnAlterar.hidden = true;

        var divao = $('#alterar');

        var str = '<form action="/account/edit" method="post" class="numalinha">'+
        '<input type="text" value="'+id+'" name="email[user_id]" class="form-control" style="visibility:hidden;">'+
        '<input type="text" value="'+nome+'" name="user[nome]" class="form-control">'+
        '<input type="password" name="senhaAntiga" value="'+senha+'" class="form-control"/>'+
        '<input type="password" id="senhaNova" name="user[senha]" class="form-control"/>'+
        '<input type="password" id="senhaConf" name="senhaConfirmada" class="form-control"/>'+
        '<button type="submit" class="btn btn-default form-control botaoAntes numalinha" onclick="verificaSenha()">Confirmar</button></form>';
        divao[0].innerHTML = str;
    }
}

function verificaSenha()
{
    if ($('#senhaNova').val() == $('#senhaConf').val() && confirm("Deseja alterar sua conta?"))
    {
        alert('Conta alterada com sucesso');
    }

    else
    {
        var senhaAntiga = document.getElementById('senhaAntiga');
        var senhaNova = document.getElementById('senhaNova');
        senhaNova.value = senhaAntiga.value;
        
        alert('Confirmação de senha inválida');
    }
}