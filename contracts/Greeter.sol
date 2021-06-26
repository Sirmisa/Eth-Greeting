//This defines de compatibility with the compiler version
pragma solidity >= 0.4.0 <= 0.8.0;

//By leveraging this OpenZeppelin file we will have available globally many objects that
//should be more secure and tested for our objective
import "openzeppelin-solidity/contracts/access/Ownable.sol";

/**
 * Definition of a contract
 * ***Update we are not inheriting from Ownable, this is inheritance
 */
contract Greeter is Ownable{
    //Declaring this means that we have information that will be stored
    //in the in the contracts persisted storage as a STATE VARIABLE
    //These variables are available to all functions in the contract
    string private _greeting = "Hello, World!";
    
    //This will hold the owner's address
    //  ***Update as I am using openzepellin contract to validate ownership..
    //  ***..I dont need this method
    // address private _owner;

    // /**
    //  * This constructor will set at the contract initialization
    //  * the address that created the contract. In this case
    //  * it will be de deployer to the blockchain and will be handled as the 
    //  * owner
    //  ***Update as I am using openzepellin contract to validate ownership..
    //  ***..I dont need this method
    //  */
    // constructor() public {
    //     _owner = msg.sender;
    // }

    // /**
    //  * This is a modifier, it is added to the functions to perform an action
    //  * either before the function execution or at the end of the execution
    //  ***Update as I am using openzepellin contract to validate ownership..
    //  ***..I dont need this method
    //  */
    // modifier onlyOwner() {
    //     //The require function is like an IF sentence
    //     //in this case it is checking if the current address taking action in the contract
    //     //aka msg.sender is the same address as the _owner that was defined
    //     //at the contract deployment to the blockchain.
    //     //WHEN the "require" condition is not met the program stops the execution
    //     //and reverts completely the transaction
    //     require(
    //         msg.sender == _owner,
    //         "Ownable: caller is not the owner"
    //     );
    //     //This line below is where the function that is being modified will be called.
    //     //If you put anything after this line, it will be run after the function body completes.
    //     _;
    // }

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
     * persisted storage.
     ****Update - by adding "onlyOwner" modifier we are checking first what is defined in that
     ****modifier before 
     */
    function setGreeting(string calldata greeting) external onlyOwner {
        _greeting = greeting;
    }

    /**
     * This function will return the owner's address
     * the returned address is just address
     * the other one is address payable but we are not using it
     ***Update as I am using openzepellin contract to validate ownership..
     ***..I dont need this method
     */
    // function owner() public view returns(address){
    //     return _owner;
    // }
}