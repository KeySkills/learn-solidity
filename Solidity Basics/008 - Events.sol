// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract Events {
    //event declaration
    event Log(address indexed sender, string message);

    string constant private secretString = "Everything on blockchain is visible";

    function getSecretString () public returns (string memory){
        emit Log(msg.sender,secretString);
        return secretString;
    }


}