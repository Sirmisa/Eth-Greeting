//This defines de compatibility with the compiler version
pragma solidity >= 0.4.0 < 0.7.0;
//Definition of a contract
contract Greeter {

    /**
     * function = the way a method is called
     * greet() = the name of the method that takes no parameters
     * external = indicates is an external function that is part of the contract
     * but can only be called from outside the contract by other contracts or transactions
     * pure = defines that the function will not alter the state of the blockchain and 
     * will read only from the info existing in the contract, not from the blockchain
     * returns = specifies what we expect to return. We are specifying that
     * the value is not referencing anything from the blockchain with the keyword
     * memory and the value is a string
     */
    function greet() external pure returns(string memory){
        return "Hello, World!";
    }
}