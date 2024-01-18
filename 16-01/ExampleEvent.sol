// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleEvent {
    mapping (address => uint) tokenBalance;
    event TokenSend(address _from, address _to, uint _amount);

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public  returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough balance, aborting");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        emit TokenSend(msg.sender, _to, _amount);
        return true;
    }
}