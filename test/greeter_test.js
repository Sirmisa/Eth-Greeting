///with this instruction we load the contract to interact with it
//its the name of the contract, not the file
const GreeterContract = artifacts.require("Greeter");

/**
 * The funciton "contract" is the same as the "describe" for
 * mocha. This guaratees the contracts are loaded before the
 * test execution
 */
contract("Greeter", () => {
    /**
     * the interacions with the blockchain are async
     */
  it("has been deployed successfully", async () => {
    const greeter = await GreeterContract.deployed();
    //If the greeter is truthy (exists), our test will pass.
    assert(greeter, "contract was not deployed");
  });
});