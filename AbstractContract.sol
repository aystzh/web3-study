// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//抽象类必须用abstract关键词修饰
abstract contract Base{
    string public name = "Base";

    //未实现的函数需要加上virtual关键字
    function doLog() public pure virtual returns(string memory);
}

contract BaseImpl is Base{
    //实现类上需要加上override关键字
    function doLog() public pure override returns(string memory){
        return "BaseImpl";
    }
}
