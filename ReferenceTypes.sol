// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ReferenceTypes{

    //固定长度数组
    uint[8] array1;
    bytes1[12] array2;
    address[100] array3;
    

    //动态长度数组
    uint[] array4;
    bytes array5;
    address[] array6;
    bytes1[] array7;

    function memoryArray() public  returns (uint[] memory,bytes1[] memory) {
        uint[] memory array8 = new uint[](5);
        array4 = array8;
        array4.push(4);

        bytes1[]  memory array9 =new bytes1[](9);
        array7 = array9;
        array7.push();
        return (array8,array7);
    }

}
