pragma solidity ^0.8.0;

//OS CONTRATOS PRECISAM SER EXECUTADOS NO REMIX

contract mappings {
    mapping(address => uint) saldos; // um dicionario endereco que armazena saldos

    function deposit() external payable { // um contrato que recebe depositos | payable, significa que ele recebe dinheiro, ethers
        saldos[msg.sender] += msg.value; // a carteira que envio a transacao, agr tem o valor. A func deposita o dinheiro e atualiza o saldo da carteira
    }

    function balanceOf() external view returns(uint256) { // func que consulta o saldo
        return saldos[msg.sender]; // se depositarmos, o valor retornado sera em wei | https://www.eth-to-wei.com/
    }

    // Exemplo de Dicionario com Lista, Ex de um contrato de um jogo que guarda a pontuacao de partidas..
    mapping(address => uint[]) pontuacao; // o endereco guarda uma lista.

    function salvaPontuacao(uint _pontos) external {
        pontuacao[msg.sender].push(_pontos); // salva o numero de pontos, adicionando na lista
    }

    function premioEmTokens() external view returns(uint) { // func que retorna a soma da pontuacao
        uint somaPontuacao;

        for(uint i; i < pontuacao[msg.sender].lenght; i++){ // percorre a lista, pelo tamanho
            somaPontuacao += pontuacao[msg.sender][i]; // faz a soma dos valores da lista
        }

        return somaPontuacao;
    }

}

/**
Mappings (Dicionários)
Não é incorreto afirmar que mappings são como dicionários de outras linguagens pois também se armazena dados utilizando uma estrutura de chave-valor. 
Você verá eu usar as duas palavras nesse tutorial

Criando um dicionário.
Assim como todas as outras variáveis em solidity(arquivo 2) nós primeiros definimos o tipo do dicionário e depois seu nome. 
No nosso exemplo, temos um dicionário em que as chaves são endereços e os valores são números inteiros que representam os saldos e o mapping se chama balances.
*/

mapping(address => uint) balances; //address = chave, uint = tipo, balances = nome.

/**
Adicionando dados.
Diferente das listas(arquivo 8) onde indicamos o nome e a posição, com dicionários indicamos o nome e a chave. 
Nesse caso abaixo, dicionario balances no endereço de quem chamar a transação (msg.sender - var built-in | file 7) terá o valor 100 guardado.
*/

balances[msg.sender] = 100;

/**
Ler dados.
Também muito parecido com listas mas ao invés de passar a posição-da-lista onde estão os dados, passamos a chave que nesse caso também é aquele que chamar a transação. 
*/

balances[msg.sender];

/**
Atualizar dados.
Praticamente a mesma coisa que adicionar um novo dado, se no dicionário não existir nada no endereço de chave passado será adicionado pela primeira vez, se já existir algo será então substituído.
*/

balances[msg.sender] = 200;

/**
Deletar dados.
Esse sim é exatamente como em listas, basta passar a chave do dicionário após a instrução delete.
*/

delete balances[msg.sender];

//-------------------------------------------

/**
Valor padrão
Listas e Dicionários tem um valor padrão caso tentemos acessar uma chave ou posição-de-lista que não exista, esse valor é 0.
*/

balances[algumEnderecoQueNaoExiste] => 0; //ja que o valor padrao de vazio é 0.

//-------------------------------------------

/**
Tipos Exóticos de Mappings.

Dicionário de dicionários.
É possível armazenar outros dicionários dentro de um dicionário. 
Imagine que você constrói um contrato em que é possível que outras pessoar guardem dinheiro e disponibilizem para outras pessoas além delas mesmas. 
Essa situação é representada no nosso exemplo abaixo onde temos um dicionario de endereços (chaves) principais (que guardam dinheiro no contrato) 
e os valores dentro desses endereços há outra lista de endereços que são chaves e dentro dessas chaves há valores bool, que podem ser positivo ou negativo.
Resumidamente, temos uma lista de endereços que guarda outros endereços e valors true ou false para indicar se esses endereços podem ou não realizar uma determinada ação.
*/

mapping(address => mapping(address => bool)) aprovado; //dicionario dentro de dicionario

//Adiocionar Dados
aprovado[msg.sender][outro_endereco] = true;

//Ler Dados
aprovado[msg.sender][outro_endereco];

//Atualizar dados
aprovado[msg.sender][outro_endereco] = false;

//Deletar dados
delete aprovado[msg.sender][outro_endereco];


/**
Listas dentro de dicionários
Se estivermos contruíndo um jogo onde cada jogador pode jogar várias partidas e armazenar sua pontuação de cada partida para no final realizar um calcúlo.
Nesse caso, pode haver um dicionário que guarda endereços como chave e dentro de cada endereço há uma lista de valores.
 */

mapping(address => uint[]) scores;

//Adicionando dados
scores[msg.sender].push(1);
scores[msg.sender].push(2);

//Lendo Dados
scores[msg.sender][1];

//Atualizando dados
scores[msg.sender][1] = 3;

//Deletando dados
delete scores[msg.sender][1];
