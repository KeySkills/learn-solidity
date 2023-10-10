// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
//pragma solidity means what version of solidity to use while compling the contract
//you can use:
// a) exact version ragma solidity 0.8.7;
// b) range of versions pragma solidity >=0.6.0 <0.9.0;
// c) all versions above pragma solidity ^0.8.7; but with 0.8 at the begining


//Defining the contract that store a some string

contract SimpleStorage {
    //main simple types in solidity language:
    // a) boolean
    // b) uint, int
    // c) address, payable
    // d) bytes
    // e) string

    string myNote; //no visibility declaration hence "internal"
    //State Variable Visibility:
    // a) public - Public state variables differ from internal ones only in that the compiler automatically generates getter functions for them, 
    //             which allows other contracts to read their values. 
    // b) internal - can only be accessed from within the contract they are defined in and in derived contracts. 
    //               This is the default visibility level for state variables.
    // c) private - like internal ones but they are not visible in derived contracts
    
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
