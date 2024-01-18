// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract ERC20 {
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool);
    function decimals() public virtual view returns(uint8);
}

contract TokenSale {
    uint tokenPriceInWei = 1 ether;
    ERC20 token;
    address public tokenOwner;

    constructor(address _token){
        tokenOwner = msg.sender;
        token = ERC20(_token);
    }

    function purchaseACoffee() public payable {
        require(msg.value >= tokenPriceInWei, "Not enough money sent");
        uint tokenToTransfer = msg.value / tokenPriceInWei;
        token.transferFrom(tokenOwner, msg.sender, tokenToTransfer);
        uint reminder = msg.value - tokenToTransfer * tokenPriceInWei;
        payable (msg.sender).transfer(reminder);
    }

}