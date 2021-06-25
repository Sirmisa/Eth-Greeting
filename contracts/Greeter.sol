//This defines de compatibility with the compiler version
pragma solidity >= 0.4.0 < 0.7.0;
//Definition of a contract
contract Greeter {
    //Declaring this means that we have information that will be stored
    //in the in the contracts persisted storage as a STATE VARIABLE
    //These variables are available to all functions in the contract
    string private _greeting = "Hello, World!";

    /**
     * function = the way a method is called
     * greet() = the name of the method that takes no parameters
     * external = indicates is an external function that is part of the contract
     * but can only be called from outside the contract by other contracts or transactions
     * pure = defines that the function will not alter the state of the blockchain and 
     * will read only from the info existing in the contract, not from the blockchain
     * returns = specifies what we expect to return. We are specifying that
     * the value is not referencing anything from the blockchain with the keyword
     * memory and the value is a string.
     ****UPDATE: Later we updated the function from pure to view due to we are going
     * to read data from the blockchain.
     */
    function greet() external view returns(string memory) {
        return _greeting;
    }

    /**
     * This function with the external keyword and that means this will be called externally
     * calldata = this is because the data passed to the function is not part of the contract's
     * persisted storage
     */
    function setGreeting(string calldata greeting) external {
        _greeting = greeting;
    }
}