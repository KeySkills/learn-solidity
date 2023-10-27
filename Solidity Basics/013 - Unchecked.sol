// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract Unchecked {
    //gas used: 989
    function add (int256 a, int256 b) public pure returns(int256){
        return a+b;
    }

    //gas used: 748
    function add_unchecked (int256 a, int256 b) public pure returns(int256){
        unchecked {return  a+b;}
    }
}