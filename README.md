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

### [003 - Ether Units](/Solidity%20Basics/003%20-%20Ether%20Units.sol)

Ether's units (in wei)

<table>
    <thead>
        <tr>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Unit's name</td>
            <td>wei value</td>
        </tr>
        <tr>
            <td>wei</td>
            <td>1 wei</td>
        </tr>
        <tr>
            <td>Kwei (babbage)</td>
            <td>1e3 wei</td>
        </tr>
        <tr>
            <td>Mwei (lovelace)</td>
            <td>1e6 wei</td>
        </tr>
        <tr>
            <td>Gwei (shannon)	</td>
            <td>1e9 wei</td>
        </tr>
        <tr>
            <td>microether (szabo)	</td>
            <td>1e12 wei</td>
        </tr>
        <tr>
            <td>milliether (finney)</td>
            <td>1e15 wei</td>
        </tr>
        <tr>
            <td>ether</td>
            <td>1e18 wei</td>
        </tr>
    </tbody>
</table>

As it is stated in solidity docs:
>   A literal number can take a suffix of wei, gwei or ether to specify a subdenomination of Ether, where Ether numbers without a postfix are assumed to be Wei. The denominations finney and szabo have been removed in version 0.7.0.

See [Ether Units in Solidity Docs](https://docs.soliditylang.org/en/v0.8.21/units-and-global-variables.html#ether-units)


### [004 - Functions](/Solidity%20Basics/004%20-%20Functions.sol)

- Functions can be **defined inside and outside of contracts**. Functions outside of a contract, also called “free functions”, always have implicit internal visibility. Their code is included in all contracts that call them, similar to internal library functions. The main difference to functions defined inside a contract is that free functions do not have direct access to the variable this, storage variables and functions not in their scope.

- what do you send to function? Temporary variable or the address to main variable?

- returning **multiple variables**

- Functions can be declared **view** in which case they promise not to modify the state.

- Functions can be declared **pure** in which case they promise not to read from or modify the state.

- **Receive** Ether Function - A contract can have at most one receive function. The receive function is executed on a call to the contract with empty calldata.

- **Fallback Function** - A contract can have at most one fallback function

- **Function Overloading** - A contract can have multiple functions of the same name but with different parameter types. This process is called “overloading” and also applies to inherited functions. It is an error if two externally visible functions differ by their Solidity types but not by their external types.


See [Function - Solidity Docs](https://docs.soliditylang.org/en/latest/contracts.html#functions)

### [005 - Functions](/Solidity%20Basics/005%20-%20Functions.sol)

#### Function's visibility
- public: visible externally and internally (creates a getter function for storage/state variables)
- private: only visible in the current contract
- external: only visible externally (only for functions) - i.e. can only be message-called (via this.func)
- internal: only visible internally
Source: [Solidity Docs](https://docs.soliditylang.org/en/latest/cheatsheet.html#function-visibility-specifiers)

#### Function modifiers
Modifiers can be used to change the behavior of functions in a declarative way. For example, you can use a modifier to automatically check a condition prior to executing the function.

- example of simple modifiers and the use of ```_;``` 
- modifiers with parameter
- Reentrancy Attack