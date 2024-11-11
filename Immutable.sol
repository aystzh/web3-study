// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Immutable{
    //常数  constant修饰  必须在声明的时候初始化 之后不能改变 尝试改变的话会编译报错
    uint256 constant CONSTANT_NUM = 11;

    string constant CONSTANT_STRING ="string";

    bytes constant CONSTANT_BYTE="a";

    address constant CONSTATN_ADDRESS = 0xAe95b0FA49d93AfD59D06AF654DB2A1378a1Eb87;

    //常数 immutable修饰 声明的时候可以不初始化
    int256 immutable IMMUTABLE_NUM;

    address immutable IMMUTABLE_ADDRESS;

    uint256 immutable IMMUTABLE_BLACK = 111;

    uint256 immutable IMMUTABLE_TEST;

    constructor (){
        IMMUTABLE_NUM =122;
        IMMUTABLE_ADDRESS = 0xAe95b0FA49d93AfD59D06AF654DB2A1378a1Eb87;
        IMMUTABLE_TEST=test();
    }

    function test() public  pure returns (uint256 a){
        uint256 what = 444 +a;
        return what;
    }
}
