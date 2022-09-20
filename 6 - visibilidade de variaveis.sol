pragma solidity ^0.8.0;

//Para var só apenas esses 3 tipos, 1 parametro a menos q as func

//internal - Ele é visivel só dentro do prorpio contrato e contratos derivados, contratos q herda as func dele
//private - Vsisvel somente dentro do contract, porem, se a var esta priv e vc tem uma func public q le essa var, essa var esta publica, vc consegue ler de fora.. tomar cuidado em como usar o param private
//   ---- nn guardar dados sensiveis, senhas etc.. msm q vc construa ela toda privada, um miner consegue montar os upcodes ele consegue ver os valores salvos na var private
//public - public acessivel de tds os jeitos, dentro, importado e fora do contrato

//Alterar os tipos para testar no Remix

contract visibilidade {
    //string private nome;
    string public nome;
    //string internal nome; // uma var q só é visivel dentro desse contrato e derivados

    function salvaNome(string memory _nome) external {
        nome = _nome; // func externa q guarda dados dentro dessa var
    }

    // function qualNome() external view returns(string memory) { // essa é uma func externa publica, q vai ler uma var privada..
    //     return nome;
    // }

    // function qualNome() private view returns(string memory) { // como é uma func privada, ela é só acessivel dentro do contrato, nem contratos derivados
    //     return nome;
    // }

    function qualNomeIn() internal view returns(string memory) { // essa func nn é visivel de fora... 
        return nome;
    }

    // function qualNome() public view returns(string memory) { // func para ler os dados e visualizar.(return)
    //     return nome;
    // }
}

contract outro is visibilidade { // chama a func internal..
    function leQualNomeIn() external view returns(string memory) { // desse contrato nn temos visao da func 'qualNomeIn' porem acessamos ela, msm sendo interna a visibilidade dessa var esta reservada só p o contato e contracts derivados, como esse contrato derivado tem uma func publica, conseguimos acessar dados privados.
        return qualNomeIn(); // importando a func...
    }
}