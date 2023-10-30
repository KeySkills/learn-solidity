// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract Mappings {
    //create mapping: mapping(key=>value) name;
    mapping (address=>uint256) private deposits;
    //nested mappings
    mapping  (address => mapping (uint256 => bool) ) favouriteNumbers;


    //get mapping
    function getDeposit (address _addr) public view returns(uint256) {
        return deposits[_addr]; //if there is no address then solidity will return defult value i.e. 0 in this case
    }

    //set mapping
    function setDeposit (address _addr, uint256 _value) public {
        deposits[_addr]+=_value;
    }

    //delete mapping
    function removeDeposit (address _addr) public {
        delete deposits[_addr]; //set to default
    }

    function setFavoriteNumber (address _addr, uint _num) public{
        favouriteNumbers[_addr][_num] = true;
    }

    function getFavoriteNumber (address _addr, uint _num) public view returns (bool){
        return favouriteNumbers[_addr][_num];
    }

}