pragma solidity ^0.8.0;

// eventos são como as blockchains se comumica com o mundo, eventos não são acessiveis por outros contratos outras carteiras, somente de fora

contract Eventos {
    event Transferencia(address _dequem, address _paraonde, uint256 _quantidade); // Declarando o evento e seus parametros...
    event Transferencia2(address indexed _dequem, uint256 _quantidade); //indexed é um parametro que ajuda o Front-end a filtrar os eventos que acontece
    // Ele ajuda a fazer filtros, no parametro que deseja filtrar só passar o parametro indexed, ele só vai escutar o filtro.. no caso a carteira _dequem..

    function transfer(address _praquem, uint256 _quantidade) public { // só a titulo de exemplo, não é assim uma funcao de transferencia
        //codigo das verificacoes

        //Toda transferencia depois de sua lógica de codigo e verificações, ela emite um evento..
        emit Transferencia(msg.sender, _praquem, _quantidade); // emitindo o evento transferencia, e passa os parametros
        //Bacana você executar comentando o emit, e depois vc deployar e executar novamente vendo o evento, ele tera um LOG, e ira mostrar os parametros..
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
