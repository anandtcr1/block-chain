// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import "./Ownerable.sol";
/*
// can add modifier using contract inheritance
contract Owner {
    address owner;
    
    constructor() {
        owner = msg.sender;
    }


    modifier onlyOwner() {
        require(owner == msg.sender, "You are not the owner, aborting");
        _;
    }
}
*/

contract ExampleModifier is Owner {
    mapping(address => uint) public tokenBalance;
    //address owner;
    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

/*
    // We can use modifier here also
    modifier onlyOwner() {
        require(owner == msg.sender, "You are not the owner, aborting");
        _;
    }
    */

    function createToken() public onlyOwner {
        tokenBalance[msg.sender]++;
    }

    function burnToken() public onlyOwner {
        tokenBalance[msg.sender]--;
    }


    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");

        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}