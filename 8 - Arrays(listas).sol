pragma solidity ^0.8.0;

//Create
//Read
//Update
//Delete

//Arrays de Arrays

//Arrays no Solidity pode ter somente um tipo de dado na lista, uma lista de nums, uma lista de strings..

contract listas {
    string[] nomes; // assim é uma lista infinita..
    string[10] test; // assim a lista tem um tamanho definido
    string[][] nomes2; // lista de lista, 

    function salvaNomes(string memory _nome) external {
        nomes.push(_nome); // para salvar usamos o push, ele salva no ultimo endereço da lista...
        test[2] = 'add na 3 position'; // para salvar com a lista definida, tem q passar a posição, nn precisa do push
        //nomes2.push([a, b]); //o 'a' é a posicao da 1 lista, e o 'b' a posicao da 2 lista
    }

    function lerNome(uint _position) external view returns(string memory) {// o param view, quer dizer p compilador q vai retornar um dado
        return nomes[_position]; // só visualiza a posição e retorna.
    }

    function atualizaNome(uint _position, string memory _newName) external {
        nomes[_position] = _newName; // ve a posição e substitui
    }

    function deletaNome(uint _position) external {
        delete nomes[_position]; // ve a posicao e deleta
    }
}
