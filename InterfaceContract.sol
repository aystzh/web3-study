// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface BaseInterface {
    //接口当中所有的函数必须使用external且不能有函数体
    function processOne() external pure returns(string memory);

    function processTwo() external pure returns(string memory);
}


//继承接口的非抽象合约必须实现接口定义的所有功能
contract BaseImpl is BaseInterface{
    
    function processOne() external pure override  returns(string memory){
        return "processOne";
    }

     function processTwo() external pure override  returns(string memory) {
        return "processTwo";
     }
}
