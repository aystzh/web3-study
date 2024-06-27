// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract HelloWeb3{
    string public _string="Hello Web3!!!";
    bool public flag = false;
    int public intnum=-111;
    uint public unitnumber=111;
    uint256 public unit256number=2323;
    uint256 public _number1 = unit256number+12;
    uint256 public _number2 =2**2;
    uint256 public _number3 = 7%2;
    bool public _number4 = _number2 < _number3;

    address  public address1_=0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    address payable public address_2 = payable(address1_);
    uint256 public balance1_= address_2.balance;
    bytes32 public byte1_ = "MiniSolidity";
    bytes1 public byte2_ = byte1_[0];
    enum ActionSet{Apple,Org}
    ActionSet action = ActionSet.Org;
    function enumToUint() external  view returns(uint){
        return uint(action);
    }
}
