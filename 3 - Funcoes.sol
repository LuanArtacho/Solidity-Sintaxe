pragma solidity ^0.8.0;
//A estrutura das funções
//parametros - ela pode receber dados de fora, p fz um calc.. ou pode não receber dado nenhum
//visibilidade - como q essa func é acessivel, se só esse contrato pode acessar, se só de fora, ou privada.
//estado - modificador de estado, se ela altera dados da blockchain...se ela vai acessar dados da blockchain
//payable - funções q pode receber moedas, tokens, nfts..
//return - ela pode ou nn retornar dados.

contract funcoes { // _a -> significa q essas var nn são definidas, são temporarias, somente info q a func recebe dados.
    function soma(uint _a, uint _b) external pure returns(uint){// apos o returns passar o tipo de dado q ela retorna
        //external - é uma func visivel só de fora do contrato.
        //pure - como a func nn vai ler e alterar dados da blockchain, ela é pura.. nesse caso só realiza um calculo
        return _a + _b;
    }

    string nome = "Luan";

    function qualNome() external view returns(string memory){// precisa especificar onde o dado vai ser guardado, nesse caso memory
        //view - func q somente le dados.
        return nome;
    }

    mapping(address => uint) saldos;

    function investir() public payable returns(uint){
        //payble - a func esta habilitada a receber ethers, dinheiro..
        saldos[msg.sender]+= msg.value;
        return saldos[msg.sender];
    }
    //a func vai receber ether de fora do contrato, e vai att o saldo do contrato dentro do dicio..
}