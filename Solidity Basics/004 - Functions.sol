// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

//function defined outside the contract
function messageFromOutsideTheContract() pure returns(string memory){
    return "This is a message from outside the contract!";
}



contract FunctionTesting {
    
    uint256 public param1 = 0;
    bool public receiveFuncionExecuted = false;
    bool public fallbackFuncionExecuted = false;
    

    //Call function from outside the contract
    function callOutsideWorld() public pure returns(string memory) {
        return messageFromOutsideTheContract();
    }

    //What happen with function parameters
    function showPrama1PlusOne () public view returns (uint256) {
        return addOne(param1);
    }
    function addOne (uint256 _param1) private pure returns (uint256) {
        _param1++; //what will happen to param1?
        return _param1;
    }

    //Returning multiple variables
    function addAndDeduct (uint256 a, uint256 b) public pure returns (uint256, uint256) {
        return (a+b,a-b);
    }

    function onePlusOne () public pure returns (uint256) {
        (uint256 result,/*empty space for second variable we don't need*/) = addAndDeduct (1,1);
        return result;
    }

    //Receive Ether Function
    receive() external payable {
        receiveFuncionExecuted = true;
     }

    // fallback function
    fallback (bytes calldata input) external payable returns (bytes memory output) {
        fallbackFuncionExecuted = true;
        
    }
 }