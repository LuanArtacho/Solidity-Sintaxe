pragma solidity ^0.8.0;

contract modificadores {
    uint supply = 10;
    address admin = msg.sender;

    function getSupply() external view returns(uint){
        return supply;
    }

    function mint(uint _valor) external onlyAdmin() somenteValor(_valor) {
        supply += _valor;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Não eh o admin");
        _;
    }

    modifier somenteValor(uint _valor){
        require(_valor == 10);
        _;
    }
}


/**
Modificadores
São trechos de códigos que serão executados antes das funções. Uma das aplicações mais conhecidas é a de controle de acesso para que somente endereços específicos possam executar uma função.

Declarando um modifier
No nosso exemplo vamos criar um modifier que irá verificar se o endereço que está chamando a função é o endereço que está salvo como administrador na variável admin. Se a instrução require retornar um true então será executado o código _; que significa: execute o que vem depois.
Isso quer dizer que se o código quebrar no require não irá executar a instrução underline, logo, não irá executar o código da função que vem depois.
*/

function saqueEth() external onlyAdmin() {
    //...
}

modifier onlyAdmin(){
    require(msg.sender == admin);
    _; // Ira chamar a funcao na qual está contido
}

//-------------------------------------------------------------------------------------

/**
Passando parâmetros
Para que modifiers possam receber parâmetros eles devem ser passados para as funções nas quais estão inseridos e ter seus nomes de variáveis idênticos.
*/

//O valor de _a recebido pela funcao sera encaminhado para o midificador
function foo(uint _a) external meuModificador(_a) {
    //...
}

modifier meuModificador(uint a) {
    require(a == 10, "mensagem de erro");
    _; // place holder que representa a funcao
}

//-------------------------------------------------------------------------------------


/**
Combinando mais de um Modifier.
É possível até mesmo encadear modifiers e passar dados entre eles, deve seguir a mesma nomenclatura para os parâmetros que serão passados.
*/

function bar(uint _a)external modificador1(_a) modificador(_a){
    //...
}

modifier modificador1(uint a){
    require(a == 10);
    _; //Ira chamar o modificador 2
}

modifier modificador2(uint a){
    require(a == 10);
    _;
}

//Modifiers são verificações então para ter mais de uma verificação/condição para que uma função possa ser executada basta inserir mais modifiers.