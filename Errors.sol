// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//error是solidity 0.8.4版本新加的内容，方便且高效（省gas）地向用户解释操作失败的原因，同时还可以在抛出异常的同时携带参数，帮助开发者更好地调试
error TransferError(string message);

contract Errors {
    //一组映射 记录每个tokenid的owner
    mapping(uint256 => address) private _owners;

    //error
    function transferOwner1(uint256 tokenId,address newOwner) public {
        if (_owners[tokenId] != msg.sender){
            revert TransferError("error validate error!tokenid not owner!");
        }
        _owners[tokenId]=newOwner;
    }


    //require命令是solidity 0.8版本之前抛出异常的常用方法，目前很多主流合约仍然还在使用它。它很好用，唯一的缺点就是gas随着描述异常的字符串长度增加，比error命令要高。
    function transferOwner2(uint256 tokenId,address newOwner) public  {
        require(_owners[tokenId] == msg.sender, "require validate error!tokenid not owner!");
         _owners[tokenId]=newOwner;
    }

    //assert命令一般用于程序员写程序debug，因为它不能解释抛出异常的原因（比require少个字符串）
    function transferOwner3(uint256 tokenId,address newOwner) public  {
        assert(_owners[tokenId] == msg.sender);
        _owners[tokenId] = newOwner;
    }
}
