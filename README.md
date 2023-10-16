# Learn Solidity

These are my solidity files and notes I wrote when learning solidity. Hope you enjoy them and they help you with learning.

## Sources of information
There are plenty of places where you can learn from. 

### Tutorials
 - [Blockchain Developer, Solidity, Foundry Full Course 2023 by Patrick Collins](https://youtube.com/playlist?list=PL4Rj_WH6yLgWe7TxankiqkrkVKXIwOP42&si=Q8mRN3O_ig8xAPDQ)
 - [Solidity by Example](https://solidity-by-example.org/)
 - [Speedrun Ethereum](https://speedrunethereum.com/)

### Forums

### Other sites
- [Solidity Documentation](https://docs.soliditylang.org/en/v0.8.21/)

## Solidity Basics

### [001 - Hello World](/Solidity%20Basics/001%20-%20Hello%20World.sol)
Things to remember:
- The SPDX License List is a list of commonly found licenses and exceptions used in free and open or collaborative software, data, hardware, or documentation. The SPDX License List includes a standardized short identifier, the full name, the license text, and a canonical permanent URL for each license and exception. See more at [SPDX License List](https://spdx.org/licenses/)
- ```pragma solidity``` declaration
- contract declaration
- State Variable Visibility - see [Solidity Docs](https://docs.soliditylang.org/en/latest/contracts.html#state-variable-visibility) for more info.

### [002 - Basic Types](/Solidity%20Basics/002%20-%20Basic%20types.sol)
#### Data storage
There are three data locations: 
- memory - only accessed while executing a function, 
- storage - permanently stored, we call such data state variables
- calldata - non-modifiable, non-persistent area where function arguments are stored, and behaves mostly like memory.
Every reference type has an additional annotation, the “data location”, about where it is stored. Most of the time compiler knows what to do and we omit that part.
More about data types --> [see Types in Solidity Docs](https://docs.soliditylang.org/en/v0.8.21/types.html)

