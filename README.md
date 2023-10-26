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

#### Constructor
- special function called only once when creating contract


### [006 - Custom Errors](/Solidity%20Basics/006%20-%20Custom%20Errors.sol)
Starting from Solidity v0.8.4, there is a convenient and gas-efficient way to explain to users why an operation failed through the use of custom errors. 
Custom errors are defined using the ```error``` statement, which can be used inside and outside of contracts (including interfaces and libraries).

Source: [Custom Errors in Solidity](https://soliditylang.org/blog/2021/04/21/custom-errors/)


### [007 - Inheritance](/Solidity%20Basics/007%20-%20Inheritance.sol)

- When a contract inherits from other contracts, only a single contract is created on the blockchain, and the code from all the base contracts is compiled into the created contract.
- State variable shadowing is considered as an error. A derived contract can only declare a state variable x, if there is no visible state variable with the same name in any of its bases.
- Base functions can be overridden by inheriting contracts to change their behavior if they are marked as virtual. The overriding function must then use the override keyword in the function header.


See [Inheritance Docs](https://docs.soliditylang.org/en/v0.8.21/contracts.html#inheritance)

### [008 - Events](/Solidity%20Basics/008%20-%20Events.sol)
- Solidity events give an abstraction on top of the EVM’s logging functionality. Applications can subscribe and listen to these events through the RPC interface of an Ethereum client.
- You can add the attribute indexed to up to three parameters which adds them to a special data structure known as “topics” instead of the data part of the log. A topic can only hold a single word (32 bytes) so if you use a reference type for an indexed argument, the Keccak-256 hash of the value is stored as a topic instead.
- All parameters without the indexed attribute are ABI-encoded into the data part of the log.


See [Events Docs](https://docs.soliditylang.org/en/latest/contracts.html#events)

### [009 - Errors](/Solidity%20Basics/009%20-%20Errors.sol)
- Errors allow you to define descriptive names and data for failure situations. Errors can be used in revert statements. 


[Solidity Docs on error handling](https://docs.soliditylang.org/en/v0.8.21/structure-of-a-contract.html#errors)

## Solidity Hacks
### [001 - Reentrancy Attack](/Hacks/001%20-%20Reentrancy%20Attack.sol)
Here are the steps of a reentrancy attack:
1) The bad actor makes a call on the vulnerable contract, "X," to transfer funds to the malicious contract, "Y."

2) Contract X determines whether the attacker has the necessary funds, then proceeds to transfer the funds to contract Y.

3) Once contract Y receives the funds, it executes a callback function which calls back into contract X before the balance is updated.

4) This recursive process continues until all funds have been exhausted and transferred.

Types of reentrancy attacks:
1) **A single reentrancy attack** occurs when the vulnerable function is the same function the attacker is trying to recursively call. Single reentrancy attacks are simpler and easier to prevent than cross-function reentrancy attacks. 
2) **A cross-function reentrancy attack** is feasible only when a vulnerable function shares state with another function that has a desirable effect for the attacker. Cross-function attacks are harder to detect and more difficult to prevent.
3) **A cross-contract reentrancy attack** occurs when a state from one contract is called in another before it is fully updated. Cross-contract reentrancy attacks usually occur when multiple contracts manually share the same variable and some update the shared variable insecurely.

Source: [Alchemy page on reentrancy attack](https://www.alchemy.com/overviews/reentrancy-attack-solidity)

The code in the file will not work in ```pragma solidity >=0.8.0;``` since arithmetic operations revert on underflow and overflow. As the balance of the bank's client is of type ```uint256``` decreasing it below 0 will revert the attack. See discussion [here](https://stackoverflow.com/questions/67722470/reentrancy-hack-in-solidity-no-longer-working-on-pragma-0-8-0)
