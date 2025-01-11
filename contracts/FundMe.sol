// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {

    uint public minUsd = 50;

    function fundMe() public payable{
        //set minimum fund amount
        require(msg.value > minUsd, "Didn't send enough");
    } 
    //function withdraw() {}
}