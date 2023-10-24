// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

abstract contract Math {
    function Add (int a, int b) public virtual returns (int);

}

contract Owned {
    address payable owner;

    constructor (){
        owner = payable(msg.sender);
    }
    
    function sameName() public pure virtual returns (string memory){
        return "Owned";
    }
}

contract Parent {
    string private s_name;

    constructor (string memory _name){
        s_name = _name;
    }

    //to override function in child it has to be virtual
    function overrideMe() public pure virtual returns(string memory){
        return "Override this text!";
    }

    function getContractName () public view virtual returns(string memory){
        return s_name;
    }

    function sameName() public pure virtual  returns (string memory){
        return "Parent";
    }

}


contract Child is Parent, Owned{
    string public s_name;
    //Passing parameter to the parent constructor. Now I don't need to have string s_name here. It is in parent contract
    //But we still can if the parent variable is not visible by child
    constructor(string memory _name) Parent(_name) {
        s_name = string.concat("Contract name is: ", _name);
    }
    //you have to explicitly say that you are overriding function with keyword override
    function overrideMe() public pure override returns(string memory){
        return "Something new";
    }

    //But still I have access to parent function
    function overrideMeParent() public pure returns (string memory) {
        return Parent.overrideMe(); //super.overrideMe();
    }

    //if you change the parent function a little it is another function
    function overrideMe (string memory text) public pure returns(string memory){
        return text;
    }

    //function with same name must be overriden
    function sameName() public pure override(Owned, Parent) returns (string memory){
        return "Parent";
    }

}

