// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Constants{

    //值类型初始值
    bool public _bool;

    string public _string;

    int public _int;

    uint public _uint;

    address public _address;

    enum ActionSet{BLUE,HOLD,SELL}

    ActionSet public _enum;
    
    function fi() internal {}

    function fe() external {}

    //引用类型的初始值
    uint[8] public _staticArrary;

    uint[] public _dynaticArray;

    mapping(uint => address) public _mapping;

    struct Student{
        uint256 id;
        string name;
        uint256 score;
    }

    Student public student;



    //delete a
    bool public _bool3 =true;
    
    function d() external {
        delete _bool3;
    }
    
    
}
