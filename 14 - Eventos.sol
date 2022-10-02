pragma solidity ^0.8.0;

contract Eventos {
    event Transferencia(address indexed _dequem, address _paraonde, uint256 _quantidade);

    function transfer(address _praquem, uint256 _quantidade) public {
        //codigo das verificacoes

        emit Transferencia(msg.sender, _praquem, _quantidade);
    }
}


/**
Eventos
Blockchains são sistemas isolados do resto da internet e sistemas convencionais e eventos são utilizados para "comunicar ao mundo" o que está acontecendo.

Declarando o Evento
Possuem uma estrutura básica e padrão para que outros sistemas possam "falar todos a mesma lingua" e resumem-se à: quando, onde, quem e oque aconteceu. 
Para isso usamos a palabra chave event antes do nomeDoEvento e entre parênteses os seus argumentos obrigatórios.
O parâmetro indexed permite que outros sistemas possam aplicar filtros, no exemplo abaixo um sistema que estiver ouvindo esses eventos poderá filtrar por data, endereço de envio e recebimento.
*/

event NovoTrade (

    // Parametro indexed ajuda a filtrar eventos no front end.
    uint indexed date,
    address indexed de_onde,
    address indexed para_onde,
    uint quantidade
);

//-------------------------------------------------------------------------------------

/**
Emitindo o Evento
Após declaramos um evento podemos emiti-lo dentro de qualquer função através do parâmetro emit nomeDoEvento() e então passamos os argumentos que são necessários.
*/

function tradeAconteceu(address de_onde, uint _quantidade) external {
    emit NovoTrade(now, msg.sender, de_onde, _quantidade);
}

//-------------------------------------------------------------------------------------

//Exemplo real: Transação.
//No exemplo abaixo um evento será emitido contendo quem enviou, para quem enviou e quanto enviou.

event Transfer(address indexed from, address indexed to, uint256 value);
