// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract FunctionTypes{
    uint256 public number = 256;

    function add() external {
        number+=number+1;
    }

    function addPure(uint256 _number) external pure returns(uint256 new_number){
        new_number =_number+1;
    }

    function addView() external view returns (uint256 new_number){
        new_number=number+1;
    }

    function minis() internal {
        number=number-1;
    }

    function minisCal() external {
        minis();
    }


    function minisPayable() external payable returns(uint256 balance){
        minis();
        balance = address(this).balance;
    }
}

