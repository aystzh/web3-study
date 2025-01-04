// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    // 声明状态变量
    address public admin; // 管理员地址
    mapping(address => uint256) public balances; // 存储每个地址的存款金额
    address[] public depositors; // 记录所有存款者的地址
    
    // 用于记录存款金额前 3 名
    struct Depositor {
        address user;
        uint256 amount;
    }
    Depositor[] public top3Depositers;

    // 构造函数，设置管理员为合约部署者
    constructor() {
        admin = msg.sender;
    }

    // 存款函数，可以通过 Metamask 向合约存款
    function deposit() external payable {
        require(msg.value > 0, "Deposit must be greater than 0");

        // 更新存款余额
        balances[msg.sender] += msg.value;

        // 记录存款地址（如果是第一次存款）
        if (balances[msg.sender] == msg.value) {
            depositors.push(msg.sender);
        }

        // 更新存款金额前 3 名
        updateTop3(msg.sender);
    }

    // 更新存款金额前 3 名
    function updateTop3(address user) internal {
        uint256 userBalance = balances[user];
        
        // 插入或更新该地址在 top3Depositers 中的位置
        bool updated = false;
        for (uint i = 0; i < top3Depositers.length; i++) {
            if (top3Depositers[i].user == user) {
                // 如果该用户已经在前 3 名中，更新其存款金额
                if (userBalance > top3Depositers[i].amount) {
                    top3Depositers[i].amount = userBalance;
                }
                updated = true;
                break;
            }
        }

        // 如果用户不在前 3 名中，则尝试将其插入到合适位置
        if (!updated) {
            top3Depositers.push(Depositor(user, userBalance));
        }

        // 排序并更新前 3 名
        sortTop3();
    }

    // 排序并保持前 3 名
    function sortTop3() internal {
        // 对存款金额排序
        for (uint i = 0; i < top3Depositers.length; i++) {
            for (uint j = i + 1; j < top3Depositers.length; j++) {
                if (top3Depositers[i].amount < top3Depositers[j].amount) {
                    // 交换
                    Depositor memory temp = top3Depositers[i];
                    top3Depositers[i] = top3Depositers[j];
                    top3Depositers[j] = temp;
                }
            }
        }

        // 保证只保留前 3 名
        if (top3Depositers.length > 3) {
            top3Depositers.pop();
        }
    }

    // 提取合约中所有 ETH，只有管理员可以调用
    function withdraw() external {
        require(msg.sender == admin, "Only admin can withdraw");
        uint256 balance = address(this).balance;
        payable(admin).transfer(balance);
    }

    // 获取前 3 名存款人地址
    function getTop3Depositers() external view returns (address[3] memory) {
        address[3] memory top3;
        for (uint i = 0; i < top3Depositers.length && i < 3; i++) {
            top3[i] = top3Depositers[i].user;
        }
        return top3;
    }

    // 查看某个地址的存款金额
    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }
}

