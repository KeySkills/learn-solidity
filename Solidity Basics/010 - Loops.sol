// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;


contract Loops {

    function whileLoop (uint n) public pure returns(uint){
        uint j = 0;
        uint i = 1;
        while (i<=n) 
                {
                    j+=i;
                    i++;
                }
        return j;
    }

    function doWhileLoop (uint n) public pure returns(uint){
        uint j = 0;
        uint i = 1;
        do {
             j+=i;
             i++;
        } 
        while (i<=n);
        return j;
    }


    function forLoop (uint n) public pure returns(uint) {
        uint j = 0;

        //when writing a loop make sure there is an upper bound and you have enought gas :-)
        for (uint i=1; i<=n; i++) {
            j+=i;
        }
        return  j;
    }

    //example of break and continue
    function onlyEven (uint n) public pure returns (uint) {
        uint j = 0;
        for (uint i=1; i<=n; i++) {
            if (i%2!=0){continue;}
            j+=i;
            if ((n%2!=0) && (i+1==n)) {break;}//if n is an odd number do not try the last loop just break now!
        }
        return  j;
    }
}