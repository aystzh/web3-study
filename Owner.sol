// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Owner {
    address public owner;

    //构造函数
    constructor (address initOwner){
        //在合约部署的时候将 owner的地址赋值为initOwner传入的地址
        owner=initOwner;
    }

    //装饰器
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    //带有onlyOner修饰符的函数只能被owner调用
    function changeOwner(address newOwner) external onlyOwner{
        owner=newOwner;
    }
}
