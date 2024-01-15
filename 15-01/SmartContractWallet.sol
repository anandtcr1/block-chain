// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract SmartContractWallet {
    address payable owner;
    mapping (address => uint) public allowance;
    mapping (address => bool) public isAllowedToSend;

    mapping (address => bool) public guardian;
    address payable nextOwner;
    uint guardianResetCount;
    uint constant public confirmationsFromGuardiansToReset = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    function proposeNewOwner(address payable _newOwner) public {
        require(guardian[msg.sender], "You are not the guardian, aborting");
        if(nextOwner != _newOwner) {
            nextOwner = _newOwner;
            guardianResetCount = 0;
        }

        guardianResetCount++;
        if(guardianResetCount >= confirmationsFromGuardiansToReset) {
            owner = nextOwner;
            nextOwner = payable (address(0));
        }
    }

    function setAllowance(address _from, uint _amount) public {
        require(msg.sender == owner, "You are not the owner, aborting");
        allowance[_from] = _amount;
        isAllowedToSend[_from] = true;
    }

    function denySending(address _from) public {
        require(msg.sender == owner, "You are not the owner, aborting");
        isAllowedToSend[_from] = false;
    }

    function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory) {
        require(_amount <= address(this).balance, "Can't send more than contract owns, aboring");
        if(msg.sender != owner) {
            require(isAllowedToSend[msg.sender], "You are not allowed to send transactions, aborting");
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you are allowed to, aborting");
            allowance[msg.sender] -= _amount;
        }
        
        (bool success, bytes memory returnData) = _to.call{value : _amount}(_payload);
        require(success, "Aborting, call was not successful");
        return returnData;
    }

    receive() external payable { }
}