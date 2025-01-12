// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Pair {
    //工厂合约地址
    address public factory;
    //token代币地址
    address public token0;
    address public token1;

    constructor() payable  {
        factory=msg.sender;
    }

    //call onece by the factory at time of deployement
    function initlizer(address _token0,address _token1) external {
        require(msg.sender==factory,'uniswap:forbidden');
        token0=_token0;
        token1=_token1;
    }

}


contract  PairFactory2{
    mapping (address=>mapping (address=>address)) public getPair;

    address[] public allPairs;

    
}