pragma solidity ^0.8.0;

/**
Já pensou ter que gerenciar um sistema inteiro usando Dicionários e mais Dicionários? Seria confuso e provavelmente não escalável.

Structs são muito parecidos com Objetos de outras linguagens, mas somente parecidos mesmo porque não tem métodos ou tanta liberdade.

com Structs podemos definir uma estrutura de variáveis. Imagine que você precisa cadastrar um usuário e cada usuário terá nome, 
endereço da carteira, id, saldo e outros dados... gerenciar muitos usuários e cada um tendo tantos dados... sem Structs eu não sei como você faria!
*/

//Struct são como objetos, é uma estrutura de variaveis..

contract marketplace {
    
    struct Usuario { //definindo a estrutura, e criando os tipos de dados da estrututa.
        address wallet;
        uint id;
        string name;
    }
    // address, é um tipo de dado, uint é um tipo de dado, struct é uma colecao de dados mas tambem é um tipo de dado,
    // agora precisamos instanciar esse dado.

    Usuario[] usuarios; // lista de Struct
    // Forma 1 - GAS FOI 92057 WEI
    function addUsuarioImplicit(uint _id, string memory _name) external { //passamos os dados implicitamente.. sem definir.. gasta um pouco mais de GAS
        Usuario memory usuario1 = Usuario(msg.sender, _id, _name); // instanciando a struct, a wallet é pega do msg.sender | memory é usado pois estamos dentro de uma funcao e vamos usalo 'temporariamente'.. nn vamos guardalo na blockchain
        usuarios.push(usuario1); // adicionando na lista de struct
    }

    // Forma 2 - GAS FOI 94852 WEI
    function addUsuarioExplicit(uint _id, string memory _name) external{ // inserçao de forma explicita
        Usuario memory usuario2 = Usuario({wallet: msg.sender, id: _id, name: _name}); ///passando de forma explicita, chave->valor
        usuarios.push(usuario2);
    }
    
    // Forma 3 - Modo mais economico(SEMPRE SEJA ECONOMICO!) - GAS FOI 94908 WEI
    function addUsuarioBarato(uint _id, string memory _name) external {
        usuarios.push(Usuario(msg.sender, _id, _name)); // passando direto pra lista
    }

    function nome(uint _position) external view returns(string memory){ // funcao apenas pra ler o nome..
        return usuarios[_position].name; //pega o indice da lista e retorna o nome...
    }
}

/**
Struct
Structs são semelhantes a classes, quem já conhece POO sabe do que estou falando. 
Usando Structs podemos criar um padrão de variáveis a serem usadas pelo smart contract.

Declarando estrutura
Nesse caso temos um struct chamado Usuario e esse "objeto" usuário é composto pelas seguintes variáveis: 
um endereço (tipo address), um nome (tipo string) e uma pontuação (tipo uint).
*/

struct Usuario {
    address endereco_wallet;
    uint pontuacao;
    string nome;
}

/**
Instanciando e inserindo dados.
Para usar uma estrutura precisamos instancia-la em uma outra variável e passamos os valores para as variáveis contidas na estrutura na hora em que criamos a instância. 
No exemplo abaixo temos uma função chamada foo e dentro dela instanciamos o struct Usuario dentro da variável usuario1 e usuario2 usando posições implícitas, 
que nesse caso são o primeiro parâmetro é o endereço, segundo parâmetro é a pontuação e o terceiro parâmetro o nome_._
O usuario3 foi instanciado usando dados explícitos, passamos os dados no formato dicionário com chave e valor para indicar em qual variável (chave) será guardado cada dado (valor).

Ler, Atualizar e Deletar dados
Para deletar dados é como qualquer outra variável, basta colocar o nome da variável que possuim um struct instanciado logo após a palavra delete, como no exemplo abaixo.
Para ler e atualizar acessamos os dados como parâmetros de objetos, ou seja, usando um ponto: " . ",
como no exemplo abaixo para acessar o endereço guardado em endereco_wallet que esta_ dentro da struct Usuario instanciada na variável usuario3 nós usamos a instrução_: usuario3.enderecowallet_
*/

function foo(string _nome, uint _pontuacao) external{
    //instanciando a estrutura
    Usuario memory usuario1 = Usuario(msg.sender, _pontuacao, _nome);
    Usuario memory usuario2 = Usuario(outro_endereco, 10, _nome);

    //inserção explicita
    Usuario memory usuario3 = Usuario({nome: _nome, pontuacao: _pontuacao, endereco_wallet: msg.sender});

    usuario3.endereco_wallet; //Lendo dados de uma estrutura
    usuario3.pontuacao = 20; //Atualizando dados
    delete usuario3; //deletando dados
}

//---------------------------------------------------------------------

/**
Lista de estruturas
Funciona da mesma forma como outra lista pois quando instanciamos um struct dentro de uma variável estamos criando um tipo de dado e para inseri-lo em um array basta usar o comando nomedoarray.push(variavel_instanciada)
*/

Usuario[] users;

function fool(string calldata _name) external {
    //instanciando a estrutura
    Usuario usuario4 = Usuario(msg.sender, 0, _name);

    users.push(usuario4); //Adicionando usuario criado na lista de Estruturas

    users.push(Usuario(msg.sender, 0, _name)); //adicionando diretamente
}

//---------------------------------------------------------------------

/**
Dicionário de Estruturas
No exemplo abaixo instanciamos um usuario5 com a estrutura que criamos anteriormente do tipo Usuario e depois guardamos esse usuario5 dentro da chave msg.sender em um dicionario**.**
*/

mapping(address => Usuario) listaDeUsuarios;

function foo2(string calldata _name) external {
    //instanciando a estrutura
    Usuario memory usuario5 = Usuario(msg.sender, 0, _name);

    //adicionando usuario criado na lista de Estruturas
    listaDeUsuarios[msg.sender] = usuarios5;
    //adicionando diretamente
    listaDeUsuarios[msg.sender] = Usuario(msg.sender, 0, _name);
}
