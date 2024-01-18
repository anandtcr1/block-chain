// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleSeleDestruct {
    receive() external payable { }

    function selfDestructContract() public  {
        selfdestruct(payable(msg.sender));
    }
}