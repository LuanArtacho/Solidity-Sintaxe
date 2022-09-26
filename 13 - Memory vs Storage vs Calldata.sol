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