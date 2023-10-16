// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract BasicTypes {

   //Always specify type of data
   uint256 i; //unsigned integer
   int j; //signed integer
   address sender_address;
   string public text = "Hello World!";
   bool text_changed = false;

   function get_uint256_range() public pure returns (uint256,uint256) {
    return (type(uint256).min, type(uint256).max);
   }

   function get_int_range() public pure returns (int,int) {
    return (type(int).min, type(int).max);
   }

   function who_am_i () public view returns (address) {
    return msg.sender;
   }

   function is_text_changed() public view returns(bool){
    return text_changed;
   }

   function set_text(string memory _text) public {
    text = _text;
    if (!text_changed) {text_changed=true;}
   }



}