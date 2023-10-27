// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {ERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

// interface IERC20 {
//     function name() public view returns (string);
//     function symbol() public view returns (string);
//     function decimals() public view returns (uint8);
//     function totalSupply() public view returns (uint256);
//     function balanceOf(address _owner) public view returns (uint256 balance);
//     function transfer(address _to, uint256 _value) public returns (bool success);
//     function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
//     function approve(address _spender, uint256 _value) public returns (bool success);
//     function allowance(address _owner, address _spender) public view returns (uint256 remaining);

//     event Transfer(address indexed _from, address indexed _to, uint256 _value);
//     event Approval(address indexed _owner, address indexed _spender, uint256 _value);
// }

contract myToken is ERC20 {
    constructor(string memory name_, string memory symbol_) ERC20(name_,symbol_) {
        _mint(msg.sender, 100*(10**uint(decimals())));
    }
}

contract EscrowAccount {
    myToken tokenA;
    myToken tokenB;
    address payable alice;
    address payable bob;

    error EscrowAccount__NotAEscrowParty();
    error EscrowAccount__NotEnoughMoneyAllowed(uint256 alliceAllowed, uint256 bobAllowed);

    constructor(address _tokenA, address _tokenB, address _alice, address _bob) {
        tokenA = myToken(_tokenA);
        tokenB = myToken(_tokenB);
        alice = payable(_alice);
        bob = payable (_bob);
    }

    function swapAssets(uint256 alicePay, uint256 bobPay) public {
        if ((msg.sender!=alice) && (msg.sender!=bob)) {
            revert EscrowAccount__NotAEscrowParty();
        }

        uint256 tokenA_alowance = tokenA.allowance(alice, address(this));
        uint256 tokenB_alowance = tokenB.allowance(bob, address(this));

        if ((tokenA_alowance>=alicePay) && (tokenB_alowance>=bobPay)){
            bool transferFromAllice = tokenA.transferFrom(alice, bob, alicePay);
            bool transferFromBob = tokenB.transferFrom(bob, alice, bobPay);

            if (!transferFromAllice || !transferFromBob) {
                revert("Transfered failed");
            }

        } else {
            revert EscrowAccount__NotEnoughMoneyAllowed({alliceAllowed:tokenA_alowance,
                                                        bobAllowed:tokenB_alowance});
        }


    }

}

