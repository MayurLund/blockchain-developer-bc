// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";
//token->name;symbol,decimals and total supply
//public can be read outside contract

contract Token {
    string public name;
    //state variable belongs to smart contracts and that value gets directly written to blockchain
    //first in contract and after deployed it fetches from blockchain
    string public symbol;
    //uint256 is a number and unsigned integer
    uint256 public decimals = 18;
    uint256 public totalSupply;
    //constructor gets run at first time
    //name pass it and solidity will deploy with that name 
    constructor(string memory _name,string memory _symbol,uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply * (10**decimals); 

    }
}



