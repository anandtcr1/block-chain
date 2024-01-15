// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;
contract MyContract {
    string public myString = "Hello World";

    function updateMyString(string memory _updateString) public {
        myString = _updateString;
    }
}