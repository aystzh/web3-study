// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Event {
    //定义balance映射变量  记录每个地址的持币数量
    mapping (address => uint256) public _balance;

    //定义Transfer event，记录transfer交易的转账地址，接收地址和转账数量
    event Transfer(address indexed from,address indexed to,uint256 amount);

    //定义转账函数，用于执行转账逻辑
    function _transfer(address from,address to,uint256 amount) external {
        _balance[from] =10000;

        _balance[from] -=100;
        _balance[to] +=100;
        emit Transfer(from, to, amount);
    }
}
