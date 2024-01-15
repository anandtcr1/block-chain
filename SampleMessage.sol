
// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleMessage {
    string public myString = "Hello World";

    function updateMyString(string memory _newString) public {
        myString = _newString;
    }
}