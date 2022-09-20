pragma solidity ^0.8.0;

contract meuContrato {
    uint minhaidade = 21; // nn armazena nums inteiros negativos
    uint256 ate256; // qq num que cabe em 256bits

    string nome = "Luan";
    address carteira = msg.sender; // Endereços de carteiras ou contrato | (msg.sender) é qm chama o contrato
    bool estaAtivo = false;

    bytes32 data32; //armazena qq tipo de dado(num, texto..) até 32bytes
    bytes data; // utilizado bastante p otimização de GAS(custo de mineração)

    //Arrays são listas de 1 unico tipo de dado
    uint[] saldos; // lista de nums inteiros
    //p add valores em listas ex: saldos.push(1);
    string[] clientes; // lista de texto
    address[] carteiras; // lista de endereços

    //mappins são como os dicionary
        //     key ..  value
    mapping(address => uint) saldoss;// percorre a lista de endereços procurando os valores..(chave -> valor)
    
    struct Usuario { // Estrutura..muito usadas p criar um padrão dados..
        uint id;
        string name;
        address endereco_carteira;
    }

    //enums são como categorias
    enum Cores {
        VERMELHO,
        PRETO,
        VERDE
    }
    //pode ter enums de varios tipos de categoria, deixamos pré-definido o tipo de dado p usar dps
    //EX generico:
    //Cores.VERMELHO


}