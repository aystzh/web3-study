// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Mapping{
    mapping(uint => address) public  idToAddress;//id映射到地址
    mapping (address => address) public addressToAddress;//币对的映射 地址到地址

    struct Student{
        uint256 id;
        uint256 source;
    }
    //mapping(Student => address) public studentToAddress;

    function writeMap(uint _id,address _address) public {
        idToAddress[_id]=_address;
    }
}
