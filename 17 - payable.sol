// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Pagaveis { //Veriificar a moeda nativa da blockchain usada... Ether, BNB, Matic... 
    //Para vc enviar dinheiro pra fora do contrato seja pra outro protocolo, contrato, pessoa.. esses endereços precisam ser pagaveis usando o payable

    function deposit() external payable returns(bool) { // função payable, indica que vc vai estar recebendo ethers...
        require(msg.value >= 1 ether, "Não Aceito"); // se a função passar, maior ou igual a 1 ether(nn é != p outras blockchains) ela retorna true, se nn cai no require, nao aceito (CASO DUVIDAS OLHAR FILE 7 | variaveis built-in)
        return true; // o msg.value só acessivel em funções payable
    }

    function balance() external view returns(uint256) { // função pra ver o saldo, ela nn altera nada por isso é tipo view
        return address(this).balance; // assim que acessa o saldo de um endereço, se passase na funcao o endereço é só substituir no address(this) para acessar..
    }

    // retorna um true ou false qnd a transação passar ou não... Envia direto pra quem chamou a transação
    function withdrawSend(uint256 _amount) external returns(bool){ //função de sacar, passando a quantidade (_amount)
        if (payable(msg.sender).send(_amount)){ // o end de qm ta enviando esta guardado dentro da var (msg.sender), porem transformamos ele em um endereço payable para que possa receber ethers
            return true; // se passar ela envia a quantidade desejada; .send(_amount)
        } else {
            return false;
        }
    }

    //QUANDO FOR EXECUTAR A FUNÇÕES DE WITHDRAW(SAQUE) ELA ESTA EM WEY... https://eth-converter.com/, caso queira sacar um 1ether jogue no site e converta

    // não retorna nada, somente reverte tudo caso tenha dado falha... Ela vai sacar para o endereço que foi passado pra ela
    function withdrawTransfer(uint _amount, address payable _endereco) external { // precisa passar a quantidade que vai enviar e dizer que o endereço é pagavel(payable) 
        _endereco.transfer(_amount); // a função transfer tenta transferir p endereço passado, caso nao consiga ela reverte todo o processo, Ex.. caso seja uma lista e ja envio p X endereços um falha ela reverte tudo
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
