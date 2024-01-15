// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleExceptionRequire {
    mapping (address => uint) balanceReceived;

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough funds, Aborting");
        balanceReceived[msg.sender] += _amount;
        _to.transfer(_amount);
    }
}