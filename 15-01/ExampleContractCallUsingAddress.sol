// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ContractOne {
    mapping (address => uint) public balanceReceived;

    function deposit() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    receive() external payable {
        deposit();
     }
}

contract ContractTwo {
    receive() external payable { }

    function depositOnContractOnd(address _contractOne) public {
        (bool success, )  = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }
}