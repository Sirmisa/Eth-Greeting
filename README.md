# This project is to learn Solidity for ETH development

## This is the list of software
Software | Purpose
------------ | -------------
Truffle | TBD
Node | TBD
Openzepellin | TBD
Purity | TBD
Hyperledger Besu | TBD
Ganache | TBD
TBD | TBD


## This is a glosary

Concept | Definition/Meaning/Explanation
------------ | -------------
ABI (Application Binary Interface) | Describes the functions and events of our contract. The ABI will be the basis for the client-side abstraction used to interact with our contract. They are created after the compilation process and is part of a .json file in the **build/contracts** folder
Bytecode | The bytecode field contains the result of compiling your contract. This is the code the Ethereum network will execute when our contract has been invoked from a client. They are created after the compilation process and is part of a .json file in the **build/contracts** folder
concept | definition
concept | definition
concept | definition
concept | definition
concept | definition
concept | definition
concept | definition
concept | definition
concept | definition
concept | definition
concept | definition
concept | definition

## Here is the place for some definitions

### What happens during a contract deployment?
- We submit a transaction to the ethereum network
- The deployment transaction will need to set the receiving address to the **0x0 address**
- The deployment transaction includes the **bytecode** from the compilation and it will be sent as the **transaction data**
- The contract has to be mined before we will be able to interact with it.
- When the contract is mined it will execute the code in its constructor and will set the initial state for the contract