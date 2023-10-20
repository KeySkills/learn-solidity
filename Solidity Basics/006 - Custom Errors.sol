// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract CustomErrors {
    
    error ExampleOfError(string message);

    
    function revertWithCustomError () public pure {
        if (true) {
            revert ExampleOfError({
                                    message : "Somethig went wrong"
                                    });
        }
    }

    
    function revertWithRequire () public pure {
        require(false,"Somethig went wrong");
    }
}