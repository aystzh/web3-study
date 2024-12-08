// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Falback {
      /* 触发fallback() 还是 receive()?
           接收ETH
              |
         msg.data是空？
            /  \
          是    否
          /      \
receive()存在?   fallback()
        / \
       是  否
      /     \
receive()  fallback   
    */
    event receiveCallBack(address seeder,uint money);

    event fallbackCallBack(address sender,uint money,bytes data);

    receive() external payable { 
        emit receiveCallBack(msg.sender,msg.value);
    }

    fallback() external payable{
        emit fallbackCallBack(msg.sender, msg.value, msg.data);
    }
}
