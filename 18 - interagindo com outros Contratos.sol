// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "./18.1 - IERC20Mine.sol";

//https://youtu.be/cMXLnSiBg5Q

//basicamente a interação de 1 contrato com outro, precisa de 2 coisas, uma interface e um endereço aonde ele vai realçizar essas chamadas

// contract A {
//     function retorna10() external pure returns(uint256) { //ela somente retorna 10, pure pq nn acessa nenhum dado da blockchain
//         return 10;
//     }
// }

// contract B {
//     function retorna10() external pure returns(uint256) {
//         return 20;
//     }
// }

// contract C {
//     function chamaOutro(address _contrato) external returns(uint256) {
//         return A(_contrato).retorna10(); //retorna o valor dos contratos A e B(pelo fato da função ser identica, se alterar o nome ja nao vai..)
//     }
// }

//para interagir com outro contrato vc precisa interagir com a interface dele, ou criar uma, pore, vc precisa saber os parametros passados, recebidos, ai vc cria a assinatura da função..

contract A {
    address _contract;
    IERC20 myInstance; // criando uma instancia da interface erc20

    constructor(IERC20 contracto){
        myInstance = contracto;
    }
    //exite 3 maneiras de interagir com outros Contratos como ERC20, 1 é mais verbosa, passando o endereço e a interface, como e onde(como é o contrato que vc esta chamando, onde o endereço) 
    //quando vc faz uma chamada ou outra nos contratos, como a função 'getSaldo'
    // 2 forma é instaciar o objeto dentro do seu contrato, porem, tem duas formas, voce pode criar seu objeto diretamente no constructor, entao vc não altera mais ele depois disso ou implementa uma função de atualização. A outra forma é passar o objeto como parametro de função, onde vc pode att com mais frequencia

    function getSaldo(address _contrato) external view returns(uint256){ // verifica saldo da carteira, recebendo o contrato do token ERC20
        return IERC20Mine(_contrato).balanceOf(msg.sender); // Caso tenha o token na sua carteira ele retornara o saldo dela
    }
    
    function getSaldo() external view returns(uint256){
        return myInstance.balanceOf(msg.sender); // ao inves de passar interface e o endereço, eu ja tenho o objeto instaciado aqui dentro, só chamar a função desejada do ERC20.. no caso balanceOf
    }

    function supply() external view returns(uint256){ // retorna o supply do token que vc passar no address...
        return myInstance.totalSupply(); // pegando a função totalSupply da instacia ERC20
    }

    function setAddress(address newAddress) external {
        _contract = newAddress;
    }

}