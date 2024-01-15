// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract BlockchainMessenger {
    uint public changeCounter;
    address public owner;
    string public theMessage;

    constructor() {
        owner = msg.sender;
    }

    function updateTheMessage(string memory _theMessage) public {
        if(owner == msg.sender) {
            theMessage = _theMessage;
            changeCounter = changeCounter + 1;
        }
    }
}