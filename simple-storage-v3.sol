// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//The storage in v2 was very ineffective. We had to loop over the array to find notes of the owner
//mapping solve this problem

contract SimpleStorage {

    mapping (address => string[]) contractNotes;

    function writeNote (string memory _note) public {
        contractNotes[msg.sender].push(_note);
    }

    function readMyNotes() public view returns (string[] memory){
        return contractNotes[msg.sender];
    }
}