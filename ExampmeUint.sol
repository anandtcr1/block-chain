// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampmeUint {
    uint256 public myUint;

    uint8 public myUnit8 = 250;

    int public myInt = -10;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    } 

    function incrementUint8() public  {
        myUnit8++;
    }

    function incrementInt() public {
        myInt++;
    }

    function decrementMyUint() public {
        myUint--;
    }
}