pragma solidity ^0.8.0;

contract mappings {
    mapping(address => uint) saldos;
    mapping(address => uint[]) pontuacao;

    function deposit() external payable {
        saldos[msg.sender] += msg.value;
    }

    function balanceOf() external view returns(uint256) {
        return saldos[msg.sender];
    }

    function salvaPontuacao(uint _pontos) external {
        pontuacao[msg.sender].push(_pontos);
    }

    function premioEmTokens() external view returns(uint) {
        uint somaPontuacao;

        for(uint i; i < pontuacao[msg.sender].lenght; i++){
            somaPontuacao += pontuacao[msg.sender][i];
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
Essa situação é representada no nosso exemplo abaixo onde temos um dicionario de endereços (chaves) principais (que guardam dinheiro no contrato) e os valores dentro desses endereços há outra lista de endereços que são chaves e dentro dessas chaves há valores bool, que podem ser positivo ou negativo.
Resumidamente, temos uma lista de endereços que guarda outros endereços e valors true ou false para indicar se esses endereços podem ou não realizar uma determinada ação.
*/



