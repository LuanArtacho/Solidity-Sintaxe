// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Typecasting {

    function addressToUint(address _address) external pure returns(uint160) {
        return uint160(_address);
    }


}