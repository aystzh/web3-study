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

contract PairFactory {
    mapping(address => mapping (address => address)) public getPair;
    address[] public allPairs;

    function createPair(address tokenA,address tokenB) external returns(address pairAddr){
        //创建新合约
        Pair pair =   new Pair();
        //调用新合约的initlizer函数
        pair.initlizer(tokenA, tokenB);
        pairAddr = address(pair);
        allPairs.push(pairAddr);
        getPair[tokenA][tokenB] =pairAddr;
        getPair[tokenB][tokenA]=pairAddr;
    }   
}