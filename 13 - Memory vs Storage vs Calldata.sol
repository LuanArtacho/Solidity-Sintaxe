pragma solidity ^0.8.0;

contract Armazenamento {
    string qualquerTexto;

    function lerNumero() public returns(string memory) {
        return qualquerTexto;
    }

    function guardaNumero(string calldata _texto) public returns(string memory){
        qualquerTexto = _texto;
        // _texto = "outra coisa";
        //uint memory qualquerNumero = 10;
        uint storage qualquerNumero = 10;

    }
}

/**
Memory vs Storage
Há certas formas de manipular os dados dentro das blockchains e cada uma é feita de formas diferentes pelo minerador que vai executar o contrato, isso implica em diferentes custos de gás.

Storage
Dados que irão persistir na blockchain e serão armazenados por tempo indefinido (ou definido) dentro dos registros distribuídos entre todos os nós da rede.
Toda variável definida fora de funções será armazenada dessa forma por padrão. Variáveis dentro de funções precisam do parâmetro storage para que sejam gravadas na blockchain.
*/

contract meuContrato {
    uint a;
    string x;

    function funcaoExemplo() public{
        string storage exemplo;
    }
}

//-------------------------------------------------------------------------------------

/**
Memory & Calldata
Esse tipo de armazenamento será temporário e somente durante tempo de execução, ou seja esse dado só irá existir enquanto a função ou instrução estiver sendo executada, dados guardados em variáveis do tipo memory ou calldata não serão armazenados. Há uma diferença relevante entre as duas operações e abaixo veremos quando usar uma ou outra.

memory: pode ser alterado.
Quando passamos parâmetros para uma função e utilizamos memory como indicador de tipo de armazenamento nós temos permissão para alterar esse dado dentro da função caso seja do nosso interesse.
*/

function memoryTest(string memory _exemploTexto) public returns (string memory) {
    _exemploTexto = "dado alterado";
    return _exemploTexto;
}

//calldata: não pode ser alterado.
//Já quando utlizamos calldata não temos permissão para alterar o dado que foi passado para a função.

function calldataTest(string calldata _dadoExemplo) external returns (string memory) {
    // Mão podemos alterar mas pode retornar
    return _dadoExemplo;
}

//-------------------------------------------------------------------------------------

//Custos: Storage vs Memory vs Calldata.
//Storage é o mais caro pois guarda os dados dentro da blockchain, seguido de memory que é bem mais barato pois não armazena nada mas utiliza mais OPCODES que calldata que acaba por ser o mais barato de todos os tipos de armazenamento.