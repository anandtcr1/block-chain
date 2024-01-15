
// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleMessageSender {
    address public someAddress;

    function updateSomeAddress() public {
        someAddress = msg.sender;
    }
}