// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//通过文件相对地址导入
import './YeYe.sol';

//通过全局符号导入特定的合约
import {YeYe} from './YeYe.sol';

//通过网址引用
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol';

//引用openzeppelin合约
import '@openzeppelin/contracts/access/Ownable.sol';

contract Import {
    using Address for address;

    YeYe yeye =  new YeYe();

    function test() external {
        yeye.hip();
    }
}
