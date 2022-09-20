pragma solidity ^0.8.0;

//padrao - ela é executada no modo transaction.. temos 2 metodos p interagir -CALL eTRANSACTION(Paga o GAS, tem custo de mineração), Call nn aletra o estado, Transaction altera o estado da blockchain, qnd nn define nd..por default é transaction
//view - só visualiza, somente le o estado da blockchain
//pure - quando nn vai nem ler nem alterar o estado da blockchain

contract parametros {
    uint numero = 10;

    function qualNumero() external returns(uint) { // ela é executada como transação, gasta eths
        return numero;
    }
    //parametro - view
    function qualNumeroView() external view returns(uint) { // nn gasta eth da blockchain..
        return numero;
    }
    //parametro - pure
    function calcula(uint a, uint b) external pure returns(uint) { // retorno em modo CALL, sem custo..
        return a + b;
    }
}