// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

//constructors sao trechos de codigos que são executados na hora da criação do contrato.
//constructor só vai ser executado no momento de criação do contrato, é comum definir variaveis que não serao alteradas
//como admin, supply, decimais do token... geralmente são valores imutaveis

contract A {
    uint _totalSupply;
    uint _decimals;
    address admin;

    constructor (uint initialSupply){ // criando um constructor, as variaveis são criadas fora dele, mas definida nele...
        _decimals = 18; // padrao é 18
        admin = msg.sender; // qm criou o contrato é o dono..
        _totalSupply = initialSupply;
    }

    function getSupply() external view returns(uint){
        return _totalSupply;
    }
}

contract B is A { // tudo que tem no contrato A ele puxa. 
    constructor(uint initialSupply, uint _valorB) A(initialSupply){ // 
        //o constructor do contrato B vai receber o parametro que vai passar para o contrato A, no ex acima 'initialSupply' e alem do seus próprios parametros
    }
}




//--------------------------------------------------

/*
Constructors são trechos de códigos que serão executados somente uma vez quando o contrato está sendo implementado.

#Declarando Constructor
É muito comum definir variáveis que não serão alteradas, tais como o Supply de um token ou o administrador de um contrato. É muito comum que a inicialização de todas as variáveis seja feita dentro do constructor.
*/

contract exConstructor {

    address admin;

    constructor(uint _a) public {
        a = _a; // inicialização de variaveis
        
        admin = msg.sender;
    }
}
// Argumentos de Herança
// A sintaxe na imagem abaixo descreve a situação onde é criado um contrato que é extensão de outro e ambos tenham constructors.

contract ContratoPai {
    constructor(uint a) internal {
        //...
    }
}

contract ContratoFilho is ContratoPai {
    constructor(uint _a) ContratoPai(_a) public {
        //...
    }
}
