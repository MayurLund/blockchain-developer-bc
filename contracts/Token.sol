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
    //name,sym,ts->pass it and solidity will deploy with that name 
    
    //Track balances
    
    //mapping is a ds that stores info inside it and reads info from it
    //it stores in key,value pair
    //mapping ->store variable so directly on block stored
    // mapping of address(key) with balance(value) and assign it to variable balanceOf
    mapping (address => uint256) public balanceOf;



    //Send Tokens

    constructor(string memory _name,string memory _symbol,uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply * (10**decimals); 
        //msg.sender is an address but its a special add and its a global variable i.e it can be accessed anywhere. here it is the one which is deploying
        //update the balanceOf deployer with total supply
        balanceOf[msg.sender] = totalSupply;
    }


}



