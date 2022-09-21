pragma solidity ^0.8.0;

//Variaveis implicitas, não precisa crialas, ja ta na linguagem.
//Variáveis build-in são dados de algum contexto que queremos usar tais como dados de bloco ou transações. Essas variáveis são acessíveis através de instruções que foram construídas junto com a linguagem solidity.

contract variaveis {

    uint    public id;              // Cada rede possui um número único de identificação e através da variável 'block.chainid' é possível identificar a rede atual. A Ethereum mainnet, que é a principal, possui o id 1. Já a Rinkeby, uma de suas redes de teste, possui o id 3. Você pode ver uma lista completa de Chain IDs em https://chainlist.org/.
    address public endereco_miner;  // Quando for feito o deploy do contrato que estiver sendo escrito, um minerador irá incluí-lo na blockchain e através desse parâmetro é possível interagir com esse minerador. Ou até mesmo depois quando for feita uma interação com esse contrato poderá acessar o minerador que processou essa interação.
    uint    public dificuldade;     // O parâmetro dificuldade é o que "regula" a emissão de novas moedas dentro de uma rede baseado na quantidade de mineradores que estão trabalhando nisso e esse parâmetro está sempre sendo ajustado de acordo com a oferta e demanda de poder computacional para realizar os testes de hash. Atráves de block.difficulty é possível acessar a dificuldade de mineração no bloco atual.
    uint    public limit;           // Quanto mais cálculos e operações um smart contract tiver, mais gas ele irá consumir. Usando esse parâmetro é possível acessar a quantidade de gas disponível no bloco atual para saber se seu contrato irá ser processado ou não.
    uint    public numero_bloco;    // Retorna o número do bloco atual, pode ser usado para muitas coisas e uma das mais comuns é travar dinheiro até determinado bloco.
    uint    public timestamp;       // Timestamp é um formato muito conhecido para encodar data e hora em um formato númerico, por exemplo o timestamp de agora é: 1635696570.
    
    address public chamou;          // Deve-se ficar muito atento ao uso que será feito dessa instrução pois no caso de criação do contrato, msg.sender será o criador do contrato mas depois em uma interação com esse contrato msg.sender será a carteira ou outro contrato que interagiu com ele.
    uint    public valor;           // Irá acessar a quantidade de Ethers (ou outra moeda se for outra blockchain) que foi enviada em uma transação.

    uint public precoGas;           // Irá retornar o preço de gas da transação.
    address public enviou;          // Muito parecido com msg.sender porém refere-se somente a endereços de carteira enquanto msg.sender pode referir-se também a contratos.

    constructor() payable {
        id              = block.chainid;    //retorna o id da cadeia de blocos
        endereco_miner  = block.coinbase;   //endereço do minerador do bloco
        dificuldade     = block.difficulty; //dificuldade de mineração do bloco
        limit           = block.gaslimit;   //consultar o limite de gas do bloco
        numero_bloco    = block.number;     //pega o numero do bloco atual
        timestamp       = block.timestamp;  //data e hora atual no formato uint

        chamou = msg.sender;                //quem chamou aquela transação
        valor  = msg.value;                 //quantidade de ethers que contém na transação, quando nós enviamos dinheiro pro contrato

        precoGas = tx.gasprice;             //preço de gas da transação
        enviou = tx.origin;                 //endereço que enviou a transação
    }

    // msg.value -> quanto foi enviado para o contrato em wei (unidades muito pequenas de eth que sao usadas para computacao) 1wei - 10^ (-1)
    // msg.sender -> quem enviou a transacao

    //DIFERENÇA ENTRE tx.origin e msg.sender:
    // Alice => Smart Contract A                 => Smart Contract B                    => Smart Contract C
    //         tx.origin = Alice                 tx.origin = Alice                      tx.origin = Alice
    //         msg.sender = Alice                msg.sender = Smart Contract A          msg.sender = Smart Contract B
    //msg.sender é sempre o ultimo que fez a chama, então se você tem um contrato que interage com.. e com outro.. o msg.sender fica sendo sempre o endereço que chama esse proximo contrato.. digamos assim.. msg.sender pode ser um contrato ou uma wallet
}