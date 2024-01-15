// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract WillThrowError {
    error notAllowedError(string);

    function aFunction() public pure {
        revert("Not allowed");
    }
}

contract ErrorHandling {

    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorByteCode(bytes lowLevelData);

    function catchError() public {
        WillThrowError errorContract = new WillThrowError();
        try errorContract.aFunction() {

        }
        catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
        catch Panic(uint errorCode) {
            emit ErrorLogCode(errorCode);
        }
        catch(bytes memory lowLevelData) {
            emit ErrorByteCode(lowLevelData);
        }
    }
}