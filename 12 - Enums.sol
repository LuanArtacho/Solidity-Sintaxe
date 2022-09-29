pragma solidity ^0.8.0;

//Enums é bastante usados para criar categorias, como cores, estado de um Usuario como o exemplo abaixo, ao invés de ter uma lista e pegar pelo seu indice, o TIPO de dado Enum faz e facilita isso

contract Categorias {
    enum ESTADO {ATIVO, INATIVO, CANCELADO, CADASTRADO} //Definindo o Enum de ESTADO, são UpperCase
    mapping(address => ESTADO) usuarios; // cada endereço é uma key, e o Enum(ESTADO) sao os Values, ve qual o tipo de estado o usuario esta.

    function addUser() external {
        usuarios[msg.sender] = ESTADO.CADASTRADO; // add ao usuario o estado cadastrado, sempre que chamar a função addUser
    }

    function getUser() external view returns(ESTADO){ //retorna qual estado o usuario esta, do tipo estado.. Ira retornar a posição do indice, ex 0 = ATIVO..
        return usuarios[msg.sender];
    }

    function calcula(uint _a, uint _b) external returns(uint){ // funcao que calcula e retorna o valor, se o estado do user for cadastrado
        require(usuarios[msg.sender] == ESTADO.CADASTRADO, "Usuario nao cadastrado"); // require, é como se fosse um ternario, porem, se for verdadeira e passa pra frente o codigo, se nao ele recebe o parametro seguinte, no exemplo uma mensagem
        // se passar do require, user como cadastrado, segue o code abaixo
        uint resultado = _a + _b;
        usuarios[msg.sender] = ESTADO.ATIVO; // muda o estado do user para ativo
        return resultado;

        //se testar a funcao calcula com outra conta(User | no remix), se você nao add o user, ele ira retornar que nao esta cadastrado, e para olhar o calculo matematico da func, só olhar o output
    }
}



/**
 Enums
Servem para categorização de variáveis. Ao invés de gerenciarmos categorias de variáveis através de mappings usamos Enums por serem mais baratos. Veja alguns exemplos abaixo.

Declarando Enum
Quando declaramos um Enum estamos criando um tipo de dado, assim como string é o tipo de dado para textos, uint é o tipo de dado para inteiros e bool é o tipo verdadeiro ou falso.
Para criar tipo-categoria (Enums) declaramos primeiro seu nome e dentro de chaves os seus valores, como no exemplo abaixo.
*/

enum STATE {INATIVO, ATIVO, PRO, CANCELADO}

//---------------------------------------------------------------------

/**
Instanciando e Utilizando
Como todas as outras variáveis nós primeiros passamos o tipo e depois o nome. 
No exemplo anterior criamos o tipo STATE (upperacase) e agora iremos instancia-lo dentro da váriavel state(lowercase).
Em seguida, suponhamos que temos usuários cadastrados no sistema e um usuário será "marcado" como Ativo, 
para isso criamos uma função chamada setToAtivo que irá alterar a variável state para STATE.ATIVO
*/

//Instanciando uma variavel
STATE state;

//Usando Enums
function setToAtivo() external{
    state = STATE.ATIVO;
}

//Outro exemplo para alterar o estado de um usuário, criamos uma condição para somente mudar um usuário para INATIVO caso ele já esteja marcado como ATIVO.

function mudarParaInativo() external {
    if(state == STATE.ATIVO){ //se estiver ativo
        state = STATE.INATIVO; //muda pra inativo
    }
}

//---------------------------------------------------------------------

/**
Argumento em Funções
Enums podem ser passados como argumentos para funções e assim como qualquer outro tipo de variável primeiros passamos como parâmetro o seu tipo e depois a variável que conterá o Enum.
*/

function argumentoEmFuncao(STATE _state) external {
    //pode ser passado para funcoes
}

//---------------------------------------------------------------------

/**
Dentro de Structs
A essa altura você deve ter entendido que um Enum é um tipo de dado como outro qualquer então você pode utiliza-lo até mesmo dentro de Structs, Mappings ou ainda dentro de Arrays.
*/

struct User {
    STATE state;
    string nome;
    uint id;
}
