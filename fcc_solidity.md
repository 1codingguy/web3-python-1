## what is a smart contract
- code gets executed on a blockchain
- like micro services on the web, accessible for everyone on the blockchain, able to see and use, read and write data with it
- something publicly accessible

## constructor 
- gets called when a contract is instantiated/ created/ deployed to the blockchain
- why constructor needs a public modifier? 

## `constant` is a variable modifier
e.g. `string public constant someConst`
- note the constant modifier after public and before the name of variable

## enum - enumerated list
- keep track of set list of things
`enum State {Waiting, Ready, Active}` - why no `;` is needed at the end of line? if there is one compiler complains?


## array
- dynamic array, can't read the whole array because the size is unknown?
- need to reference the item in an array by index?
- but there's `array.length` attribute, then why need to keep a counter? Maybe because it's teaching an older version of solidity?

## function modifiers
- public, internal - these are modifiers
- we can also customize modifiers with `modifier` keyword, e.g. `onlyOwner` in cryptoZombies

## Time
- timestamps are expressed in 'seconds' in Solidity
- current block timestamp - global variable - `block.timestamp`
- ? but there's a `now` keyword, is it because it's teaching an older version again?

## `payable` modifier
- which is used to declare a function to accept Ether
- address that accepts Ether also need `payable` modifier, 
  - e.g. `address payable wallet`
  - [address keyword] [payable keyword] [name of variable]

## units - wei, gwei, ether
- Wei is the smallest unit of Ether, 18 decimal places, 10**18


## library and Math
`library` keyword
- organize code in Solidity
- don't have the full behavour of a smart contract
- don't have storage 
`using SafeMath for uint256`


---
# Long video

first line: Solidity version
  - changing version - constantly updating language, switching version is important
- `contract` - like `class` in other OOP language

### Visibility
in Remix IDE, under "Deployed Contract", able to see a "store" button because the `store` function defined is a public function.
  - it means anything defined `public`, we will be able to see it under the "deployed contract" tab, not just function, but variables and other things
`public` keyword defines the visibility of variables or functions
- public functions can be called by anybody, including variable

### Transaction
- state-changing function calls are transactions
- "function call", "smart contract interaction" and "transaction" are (somewhat) interchangable
  - because on a blockchain, calling a function, or making a state change on the blockchain, it's also making a transaction
- `view` and `pure` functions are non state changing functions
  - `view` means to read some state of the blockchain, no state change = no transactions
* public variables are also `view` functions

### Scope
- variables (and functions?) defined inside contract are in 'global scope'
  - can be accessed outside the contract
  - entire contract knows these global scope variables
  - and gonna be stored in blockchain storage


## struct - creating new object
- same as `Type` in TypeScript?
- storing variables in Solidity always work in numeric index fashion
```
  struct People {
      uint256 favoriteNumber;
      string name;
  }
```
In the above example, `favoriteNumber` has the index of 0, `name` has the index of 1.

2 ways of constructing a struct"
1. `People(_favouriteNumber, name)`
2. `People({favoriteNumber: 167, name: "7Head"})`


## array - a way of storing a list of object or type

### syntax in general:
type of variable - visibility of the variable - name of the variable

### memory vs. storage
memory: data will only be stored during the execution of the function
storage: data will persist even after function is executed
string are actually an object: an array of bytes
  - because it's an array, we need to decide where to store it 
  - memory creates a new copy of the variable during execution 

## mapping
key-value pair

## EVM
all the Solidity code is compiled down to EVM 
EVM compatible - Solidity code can compiled to EVM and deploy on these compatible blockchain


# Factory pattern
- Both `SimpleStroage.sol` and `StorageFactory.sol` need to be in the same folder.
- import "./SimpleStorage"
- problem: after creating a `SimpleStorage` contract, there's no way to check other than checking the EtherScan
- solution: add an array, push the new instance of `SimpleStorage` every time when one is created
- that is to "deploy a contract from another contract"

## interact with contract
any time you want to interact with a contract, you need two things:
1. address
2. abi - application binary interface

```
// It seems both line returns a `SimpleStorage` contract, so why need to wrap it in address() and SimpleStorage()?
SimpleStorage targetContract2 = simpleStorageArray[_index];
SimpleStorage targetContract = SimpleStorage(address(simpleStorageArray[_index]));
```

- with `import`, all the functions (and variables) are imported
- with inheritance, all the function and variables are available to the children scope

# Lesson 3 - Fund me

payable - able to accept some type of payment
- this function can be used to pay for things, specifically payable with ETH/ Ethereum
- when you call a function, every function call has an associated value with it, when you make a transaction you can always append a value

Two keywords in every contract call/ every transaction (or global available variables?):
- msg.sender - is the sender of the function call
- msg.value - is how much they sent

* Remember: variables of type uint is initialized with "0".
So it's ok to write `+=` to the initialized unit variables.

What does `import` actually do?
- take whatever code importing, stick it at the top of your project
- actually importing @chainlink npm package

### Interfaces
- Interfaces don't have full function implementations
- Interfaces compile down to ABI.
- ABI (Application binary interface) tells solidity and other programming languages how it can interact with another contract. 
- anytime you want to interact with an already deployed smart contract, you will need an ABI.
  - always need an ABI to interact with a contract.

## Why is getting Ether on test net so troublesome?
- Why need to go through all these website, make a request by posting a tweet, and then wait??
- why can't we just get the amount we want since it's only test net?
https://www.rinkebyfaucet.com/
- this one works better, almost gave me 0.1ETH instantly

## tuple 
- a list of objects of potentially different types whose number is a constant at compile time.

## common unit
Wei = 18 decimals
Gwei = 9 decimals

## overflow check from version 0.8
- automatically check for uint overflow, with more gas fee

## SafeMath
`using SafeMathChainlink for uint256;`
  - but I thought SafeMath is included in Solidity from 0.8?
`using keyword`
- The directive using A for B; can be used to attach library functions (from library A) to any type (B) in the context of a contract.

## Library
A library is similar to contracts, but their purpose is that they are deployed only once at a specific address and their code is reused.

## Blockchain demo
https://andersbrownworth.com/blockchain/


## `this` keyword
`msg.sender.transfer(address(this).balance)`
- calling address(this) - returns the `address` of this contract
- every address has a `balance` attribute
- msg.sender is also an address
- whoever calls this withdraw function, transfer that caller all of the money in this contract

## what was done with the fund and withdraw function inside this FundMe contract?
What was done previously in the `fund()` function is that, when I call `fund()`, I am transferring money to that contract. And when I call `withdraw()`, I withdraw the money from that contract back to my own wallet.


## Modifier
- A modifier is used to change the behaviour of a function in a declarative way.
- `_;` means to run the content of the function, when this line is placed at the end of the modifier, that means to run the content of the modifiers, then run the content of the calling function.


## problem: cannot loop through all the keys in a mapping
- "when a mapping in initialized, every single key is initialized".
- solution: create an array to record the key
- there's an `array.length` attribute for array in Solidity




---
Job hunting about me
- found something I love to do with programming


---
learning note on solidity
- stressing my background on JS and Python, dynamic typed language. No prior experience in strongly typed language except learning a bit of TypeScript


---
shifting my focus onto building something with Solidity
- something that tells the recruiters that what I can do, no need to be perfect
- a project modified from some online course

Now mainly something that connects the frontend and smart contract?
- so I can advertise my front end React skill as well