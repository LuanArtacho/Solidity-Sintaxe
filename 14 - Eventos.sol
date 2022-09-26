pragma solidity ^0.8.0;

contract Eventos {
    event Transferencia(address indexed _dequem, address _paraonde, uint256 _quantidade);

    function transfer(address _praquem, uint256 _quantidade) public {
        //codigo das verificacoes

        emit Transferencia(msg.sender, _praquem, _quantidade);
    }
}


