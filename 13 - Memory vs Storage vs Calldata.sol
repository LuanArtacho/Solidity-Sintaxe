pragma solidity ^0.8.0;

/*
Vamos falar de armazenamento, no solidity ha 3 tipos, Storage, memory e calldata
Dependedo da forma que vc armazena na blockchain, vc gasta mais, menos ou nada de GAS.
Memory e Calldata NÃO ARMAZENA OS DADOS, SÃO VARIAVEIS TEMPORARIAS | Memory é o 2 mais caro mas é muito mais barato que o storage, e o calldata é o mais barato de todos.
Storage é quando ele realmente vai ser guardado na blockchain, é o mais caro.
*/

contract Armazenamento {
    //Por padrao toda variavel que é declarada fora de função ela é guardada na blockchain
    string qualquerTexto;

    function lerNumero() public returns(string memory) {// o solidity exige que passamos o memory quando vamos retornar uma string, quando é int/bool ele não exige...
        return qualquerTexto;
    }

    function guardaNumero(string calldata _texto) public returns(string memory) {// O parametro calldata não permite que seja alterado, da mesma maneira que o dado veio ele vai sair, se sair..
        qualquerTexto = _texto;
        //_texto = "outra coisa"; //para alterar o valor mude para memory o parametro
        //uint memory qualquerNumero = 10; // qualquer varialvel declarada dentro de função não é armazenada, por padrao é tratada como memory
        // Tudo que estiver em memory não é armazenado e sera perdido depois que a função ou metodo for executado.
        //uint storage qualquerNumero = 10; // para salvar mesmo tem que passar o parametro storage
        return _texto;
        
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