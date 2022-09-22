pragma solidity ^0.8.0;


//Controladores de Fluxo (if, for, while)
//A parte mais importante de toda programação é a lógica de como um script é programado e controladores de fluxo são os tijolos dessa construção.

//Verifica se endereco esta em uma lista
contract controladores {
    address[] depositos;

    function salvaEnderecos(address _endereco) external {
        depositos.push(_endereco); // apenas salva na lista depositos.. caso duvidas veja o conteudo 8, sobre arrays/listas
    }

    function verificaEndereco(address _endereco) external view returns(bool) {
        for(uint i; i<depositos.lenght; i++){ // O For tbm é pouco usado, tem q ser mto necessario, pois inclui alto preço de taxa.. 
            if(depositos[i] == _endereco){
                return true;
            }
        }
        return false;
    }// em resumo a func verifica o end, percorendo a lista de end 'depositos' pelo tamanho dela, no If verifica se o endereço passado e o msm, se for, retorna true, se nao false

    // while (true) { // While é pouco usado, pois na blockchain tem um tempo dos blocos, e o limite de GAS disponivel, de computação disponivel
    //     if ...
    //     break
    // }

}


//If & else
//Usado para criar condições que devem ser atendidas para que um determinado trecho de código seja executado. Já o else é uma condição que será executado caso a primeira não seja.

//Loop for
//Quando precisamos fazer interações por vários itens dentro de um array ou mapping, ou então executar algo por um número definido de vezes podemos usar loops for.

//loop While
//Se precisarmos repetir um trecho de código por um número indefinido de vezes ou até que uma condição seja atingida usamos loops while.