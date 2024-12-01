// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Overloading {
    function eat(string memory food) public pure returns (bool isHungry){
        return false;
    }

    function eat() public pure returns(string memory isHungry) {
        return isHungry;
    }


    function multyParams(uint8 params) public pure returns(uint8 reParams){
        return params;
    }

    function multyParams(uint256 params) public pure  returns(uint256 reParams){
       return params;
    }

    function calMultyParams() public pure returns(uint res){
        //因为50既可以转换为uint8 也可以转换为uint256 所以报错
        //res = this.multyParams(50);
        return 1;
    }
}
