// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract OtherContract {
    uint256 private _x = 0;//状态变量x

    //收到eth事件 记录收到的金额和本次消耗的gas
    event Log(uint amout,uint gas );

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

contract CallContract {
    //仅仅是调用外部函数 不进行转账 不是 payable
    function callSetX(address _Address,uint256 x) external {
        OtherContract(_Address).setX(x);
    }

    function callGetX(OtherContract _Address) view  external  returns(uint x){
        x = _Address.getX();
    }

    function callGetX2(address _Address) view external returns (uint x){
      OtherContract o =  OtherContract(_Address);
      x = o.getX();
    }

    //调用外部合约并且能转账的函数
    function calSetXPayable(address _Address,uint256 x) external payable {
        OtherContract(_Address).setX{value:101}(x);
    }

}
