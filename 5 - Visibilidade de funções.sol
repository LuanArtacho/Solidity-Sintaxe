pragma solidity ^0.8.0;

//external  - é uma func q vai ser chamada somente de fora. 
//internal  - é uma func somente dentro do contrato. Só ele e os contratos filhos(importando)..herança
//public    - é uma func acessivel a todos.
//private   - é uma func onde somente o contrato em q esta escrito.

//Jogar code no Remix, e fz deploy, p ver a visibilidade das func

contract visibilidade {
    string meuNome = "Luan";

    function qualNomeP() public view returns(string memory){ // Visivel
        return "public";
    }

    function qualNomeE() external view returns(string memory){ // Visivel
        return "external";
    }

    function qualNomePri() private view returns(string memory){ // só esse contrato acessa, nem derivados. 
        return "private";
    }

    function qualNomeIn() internal view returns(string memory){ // a internal só esse contrato e derivados..
        return "internal";
    }
}

contract B is visibilidade {
    function callInternal() external view returns(string memory) {// essa é uma func externa q chama a func interna(q é visivel p ela e p essa func)..
        return qualNomeIn();
    }
}