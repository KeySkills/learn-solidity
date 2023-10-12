// SPDX-License-Identifier: MIT
//Above: choosing SPDX license

/*
Always set solidity compiler with keyword "pragma solidity". 
pragma solidity means what version of solidity to use while compling the contract
you can use:
 a) exact version pragma solidity 0.8.7;
 b) range of versions pragma solidity >=0.6.0 <0.9.0;
 c) all versions above pragma solidity ^0.8.7; but with 0.8 at the begining
*/
pragma solidity ^0.8.7;

//Contract definition
contract HelloWorld {

    //variable text definition
    string public text = "Hello World!";
/*
Keyword "public" is the variable visibility declaration.
State Variable Visibility:
a) public - Public state variables differ from internal ones only in that the compiler automatically generates getter functions for them, 
             which allows other contracts to read their values. 
b) internal - can only be accessed from within the contract they are defined in and in derived contracts. 
             This is the default visibility level for state variables.
c) private - like internal ones but they are not visible in derived contracts

no visibility declaration hence "internal"

*/

}