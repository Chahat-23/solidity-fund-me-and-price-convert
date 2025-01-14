// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint public minUsd = 50 * 1e18;

    function fundMe() public payable{
        //set minimum fund amount
        require(msg.value > minUsd, "Didn't send enough");
        //18 decimals
    } 

    function getPrice() public view returns (uint) {
        //address - 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI - 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int price,,,) = priceFeed.latestRoundData();
        //8 decimals
        return uint(price * 1e10);
    }

    function getVersion() public view returns (uint) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint ethAmount) public view returns (uint) {
        uint ethPrice = getPrice();
        uint ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        //36 decimals because of *, so we half it to match msg.value decimals
        return ethAmountInUsd;
    }
    //function withdraw() {}
}