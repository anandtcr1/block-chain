// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract Sender {
    receive() external payable { }
    function withdrawTransfer (address payable _to) public  {
        _to.transfer(10);
    }

    function withdrawSend(address payable _to) public  {
        bool isSent = _to.send(10);
        require(isSent, "Sending the funds was unsuccessful");
    }
}

contract receiverNoAction {
    receive() external payable { }

    function balance() public view returns (uint) {
        return address(this).balance;
    }
}

contract receiverAction {
    uint public balanceReceived;

    receive() external payable { 
        balanceReceived += msg.value;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}