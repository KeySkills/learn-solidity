// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;


contract EtherUnits {

    uint256 constant WEI = 1;
    uint256 constant GWEI = 1e9;
    uint256 constant ETHER = 1e18;


    function testWei () public pure returns (bool) {
        return WEI == 1 wei;
    }

    function testGei () public pure returns (bool) {
        return GWEI == 1 gwei;
    }

    function testEther () public pure returns (bool) {
        return ETHER == 1 ether;
    }

}