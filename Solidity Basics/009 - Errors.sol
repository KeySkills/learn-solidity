// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract ErrorExamples {

    /*
    1) assert
    2) revert
    3) revert with custom error
    */
    error ErrorExamples_EvenNumber (uint number, string message);

    function assertTrue() public pure {
        uint newVariabble; //it should equal to 0;
        assert(newVariabble==0);
    }

    function requireTesting (uint _oddNumber) public pure returns (string memory) {
        require(_oddNumber%2==1,"This is an even number!");
        return "Very good this is an odd number. Well done!";

    }

    function revertTesting (uint _oddNumber) public pure returns (string memory) {
        if (_oddNumber%2==0){
            revert("This is an even number!");
        }
        
        return "Very good this is an odd number. Well done!";

    }

    function revertWithCustomErrorTesting (uint _oddNumber) public pure returns (string memory) {
        if (_oddNumber%2==0){
            revert ErrorExamples_EvenNumber ({number: _oddNumber, message : "This is an even number!"});
        }
        
        return "Very good this is an odd number. Well done!";

    }

   }