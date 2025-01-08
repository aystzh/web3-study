// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract OtherContract {
    uint256 private _x = 0;//状态变量x

    //收到eth事件 记录收到的金额和本次消耗的gas
    event Log(uint amout,uint gas );

     fallback() external payable{}
     receive() external payable { }

    //返回合约eth的剩余金额
    function getBalance() public view returns (uint){
        return address(this).balance;
    }


    //可以调整状态变量x的函数  并且可以往合约转入eth
    function setX(uint256 x) external payable  {
        _x = x;
        //如果转入eth  则释放Log事件
        if (msg.value>0){
            emit Log(msg.value, gasleft());
        }
    }

    //读取X
    function getX() external view returns(uint256 x){
        x=_x;
    }
}


contract Call {
    //定义Response事件 记录call返回的数据
    event Response(bool success,bytes data);

    function callSetX(address payable _addr,uint256 x) public payable {
      (bool success,bytes memory data) =  _addr.call{value:msg.value}(
            abi.encodeWithSignature("setX(uint256)", x)
            );
        emit Response(success, data);
    }


    function callGetX(address _addr) external returns (uint256){
        (bool success,bytes memory data) =  _addr.call(
            abi.encodeWithSignature("getX()")
        );
        emit Response(success, data);
        return abi.decode(data, (uint256));
    }

    function callNotExistFunc(address _addr,uint256 x) external {
        (bool success,bytes memory data) = _addr.call(
            // call 不存在的函数
            abi.encodeWithSignature("getX2222(uint256)",x)
        );
        emit Response(success, data);
    } 
}
