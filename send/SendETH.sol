// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SendETH {
    
     // 构造函数，payable使得部署的时候可以转eth进去
    constructor() payable {    
    }
    
    //eceive方法，接收eth时被触发
    receive() external payable { }

    //用transfer发送eth
    function transferETH ( address payable _to,uint256 amount) external payable{
        _to.transfer(amount);
    }

    
    

    error SendFaild();

    function sendETH(address payable _to,uint256 amout) external payable {
       bool success =  _to.send(amout);
       // 处理下send的返回值，如果失败，revert交易并发送error
        if (!success){
            revert SendFaild();
        }
    }

    error CallFaild();

    function callETH(address payable _to,uint256 amount) external payable {
        (bool succuss,)  = _to.call{value:amount}("");
        // 处理下call的返回值，如果失败，revert交易并发送error
        if(!succuss){
            revert CallFaild();
        }
    }

}
