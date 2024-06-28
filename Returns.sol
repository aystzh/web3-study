// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Returns {
    function returnMultiplel()
        //数组类型返回值默认必须用memory修饰
        public pure returns (uint256,bool,uint256[3] memory){
        return (1, false, [uint256(1), 2, 5]);
    }

    //命名式返回
    function returnNamed() public pure  returns(uint256 _number1,bool _flag,uint256[3] memory _arrays){
        _number1=2;
        _flag=false;
        _arrays=[uint256(1),2,4];
    }

    //命名式返回 依然支持return
    function returnNamed2() public pure returns(uint256 _number1,bool _flag,uint256[3] memory _arrays){
        return (1,true,[uint256(1),2,3]);
    }

    //读取返回值 结构式赋值
    function returnStruct() public pure {
        uint256 _number;
        bool flag ;
        uint256[3] memory _arrays;
       (_number,flag,_arrays)=  returnNamed();
       ( ,flag, )= returnNamed2();
    }
}
