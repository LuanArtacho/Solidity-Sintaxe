// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Luan is ERC20 {
    constructor() ERC20("Luan", "LAA") {}
    
    //Tokens ERC-20
    //Possuem 6 funções obrigatórias e outras opcionais e dispara 2 Eventos obrigatórios.


    //Funções Obrigatórias:

    //totalSupply: Retorna a quantidade de tokens disponíveis.
    function totalSupply() public view returns (uint256){}

    //balanceOF: retorna o saldo de um endereço passado como _owner
    function balanceOf(address _owner) public view returns (uint256 balance){}

    //transfer: Transfere uma quantidade _value de tokens da para a conta _to.
    function transfer(address _to, uint256 _value) public returns (bool success){}
    
    //transferFrom: Permite que endereços autorizados façam transferências "em seu nome" (Função usada pelas DEX para fazer compra e venda).
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){}
    
    //approve: Dá autorização para que um endereço _spender possa sacar até o valor passado em _value.
    function approve(address _spender, uint256 _value) public returns (bool success){}

    //allowance: Retorna o valor que o _spender ainda está autorizado a sacar.
    function allowance(address _owner, address _spender) public view returns (uint256 remaining){}

    //Funções Opcionais:

    //name: Retorna o nome do Token.
    function name() public view returns (string){}

    //symbol: Retorna o symbolo do Token.
    function symbol() public view returns (string){}

    //decimals: Retorna a quantidade de casas decimais que o Token possui.
    function decimals() public view returns (uint8){}

    //Extensões:

    //ERC20Mintable: Permite que endereços autorizados criem novos tokens.
    modifier onlyMinter(uint _valor){}

    function mint(account, amount) onlyMinter(_valor) {}

    //ERC20Burnable: Irá queimar tokens do endereço que chamar essa função.
    function burn(amount){}

    function burnFrom(account, amount){}
    
    //ERC20Pausable: Permite que as operações de compra e venda sejam pausadas.
    /*
    Modifiers:
    onlyPauser()
    whenNotPaused()
    whenPaused()
    */
    // ERC20Capped: Há um limite de tokens que podem ser criados.
    constructor(cap) {}

    require(totalSupply().add(amount) <= _cap); //inserir na função mint

    //Eventos
    // event Approval: Sempre que um endereço autorizar que outros endereços movimentem seu saldo.
    event Approval(address indexed _owner, address indexed _spender, uint256 _value)

    // event Transfer: Sempre que houver uma transferência ou queima de tokens.
    event Transfer(address indexed _from, address indexed _to, uint256 _value)
    
}