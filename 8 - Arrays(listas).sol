pragma solidity ^0.8.0;

//Abaixo segue um Ex de CRUD

//Create
//Read
//Update
//Delete

//Arrays são listas de um único tipo de dado e as utilidades e aplicações são praticamente infinitas.
//Arrays no Solidity pode ter somente um tipo de dado na lista, uma lista de nums, uma lista de strings..

//Arrays de Arrays

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

    
    //Arrays Multidimencionais
    //Parecido com tabelas ou outras estruturas multidi-mencionais como tensores, também é possível construir "listas de listas" em solidity.

    //Lista de listas de shitcoins

    string[][] listas_de_shitcoins;

    listas_de_shitcoins.push(["Safemoon", "Elomoon"])
    listas_de_shitcoins.push(["SafeUniverse", "Elondoge", "REAU"])

    listas_de_shitcoins[0][0] == "Safemoon";
    listas_de_shitcoins[1][2] == "REAU";

    //Nesse caso temos uma lista que contém outras listas de shitcoins.
    //Para acessar um valor guardado em uma lista de listas precisamos encontrá-lo pelos indices da seguinte forma: 
    //nomedalista[primeiro_indice][segundo_indice].
}
