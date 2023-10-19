// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;


contract FunctionModifiers01 {

    string private message = "A message";

    modifier changeMessage {
        _; //It is where the main function code goes!
        message = "I have changed the message using modifier";
    }

    modifier doNotChangeMessage {
        message = "I have changed the message using modifier";
        _;
    }


    //public function - everyone can see
    function sayHelloChanged() public changeMessage returns(string memory) {
        message = "Hello I'm public function!";
        return message;
    }

    function sayHelloNotChanged() public doNotChangeMessage returns(string memory) {
        message = "Hello I'm public function!";
        return message;
    }

    function sayHello() public returns(string memory) {
        message = "Hello I'm public function!";
        return message;
    }

    function getMessage() public view returns(string memory) {
        return message;
    }
}

contract ModifiersWithParam {
    address owner;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender==owner,"Only owner ca accessed");
        _;
    }

    modifier validAddress(address _addr){
        require(_addr!=address(0),"This is not a valid address!");
        _;
    }

    function changeContractOwner (address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }
}

contract ReentrancyAttack {
    uint256 public myNumber = 0;
    bool locked = false;

    function AddNumber (uint256 x) public {
        myNumber += x;
        if(x>10){
            AddNumber(x-1);
        }
    }

    modifier noReentrancy(){
        require(!locked,"It is locked!");
        locked = true;
        _;
        locked = false;
    }

    function AddNumberModified (uint256 x) public noReentrancy {
        myNumber += x;
        if(x>10){
            AddNumberModified(x-1);
        }
    }
    function setToZero() public {
        myNumber = 0;
    }

}