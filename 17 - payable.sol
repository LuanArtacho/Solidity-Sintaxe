// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Pagaveis {

    function deposit() external payable returns(bool) {
        require(msg.value >= 1 ether, "Não Aceito");
        return true;
    }

    function balance() external view returns(uint256) {
        return address(this).balance;
    }

    function withdrawSend(uint256 _amount) external returns(bool){
        if (payable(msg.sender).send(_amount)){
            return true;
        } else {
            return false;
        }
    }

    function withdrawTransfer(uint _amount, address payable _endereco) external {
        _endereco.transfer(_amount);
    }
}

/**
Funções e Endereços pagáveis (payable)

Para que um contrato possa receber Ether ou o Token nativo da Blockchain EVM que estiver sendo executado ele precisa ter funções payable e para enviar é necessário utilizar endereços do tipo payable.

#Funções pagáveis
Somente funções que NÃO sejam do tipo view podem receber Ether.

#Enviando Ether para o contrato
O parâmetro payable serve para que o contrato possa receber e manipular saldos. Lembrando que estamos falando Ether ou token nativo como BNB, MATIC entre outros e não de Tokens no formato ERC-20.
 */

function invest() external payable {
    //se enviarem menos de 1000 wei a transacao sera revertida e nao aceita
    if(msg.value < 1000){
        revert();
    }
}

// Consultando saldo do contrato
// Para saber qual o saldo do contrato em que está sendo executado a função utiliza-se a instrução built-in address(this).balance;

//funcao para verificar se recebeu o dinheiro
function balanceOf() external view returns(uint){
    return address(this).balance;
    //this -> faz referencia a esse smart contract
    // ira retornar o saldo desse smart contract
}


// Payable como Parâmetro

// Anteriormente você viu que para contrato possa RECEBER Ether é preciso o parâmetro payable esteja presente no cabeçalho da função.
// Para que o contrato possa ENVIAR ele precisa lidar com endereços do tipo payable. No exemplo abaixo inserimos esse parâmetro como instrução adicional ao endereço que será passado para função.

function recebeEth() external payable {
    //Recebe ETH
}

function enviaEth(address payable quemRecebe) external {
    //Envia ETH
}

//------------------------------------------------------------------------------------------------------

// Endereços pagáveis

// No exemplo abaixo será transferido 1 ether que sairá do saldo do contrato para o endereço passado como parâmetro _quemrecebe _ para a função.

function sendEth(address payable quemRecebe) external {
    quemRecebe.transfer(1 ether);
    //transfere 1 ether desse smart contract para o endereco
}

//Já nesse caso, será uma transferência que irá para quem está chamando (msg.sender) a função do saque do contrato.

function saque(uint256 _amount) external {
    payable(msg.sender).send(_amount); //retorna true ou false
    payable(msg.sender).transfer(_amount); //nao retorna nada, reverte a transação se falhar
}

// Há duas formas de fazer transferências: usando a função send() ou a função transfer() e a diferença entre elas é que a função send() irá retornar true ou false 
// e a função transfer() não retorna nada caso a transferência tenha acontecido e irá reverter toda a transação caso tenha falhado.
