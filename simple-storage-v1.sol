// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//Defining the contract that store a some string
contract SimpleStorage {
    //main simple types in solidity language:
    // a) boolean
    // b) uint, int
    // c) address, payable
    // d) bytes
    // e) string

    string myNote; 
    
    //when using string as parameter you must delace if it is memory or calldata
    function store(string memory _myNote) public {
        myNote = _myNote;
    }

    //Note: I could change visibility myNote to public and the compilor would generate get function for me
    // View function only reads state and does not change anything in the contract
    // Pure function cannot even read from the contract
    function getMyNote () public view returns (string memory) {
        return myNote;
    }

}
