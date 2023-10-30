// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract Enum {
    enum Status {
        OPEN,CLOSED
    }

    Status private  status;

    constructor() {
        status = Status.OPEN;
    }

    function close () external {
        status = Status.CLOSED;
    }

    function getStatus() public view returns (Status){
        return status;
    }
}