///with this instruction we load the contract to interact with it
//its the name of the contract, not the file
const GreeterContract = artifacts.require("Greeter");

/**
 * The funciton "contract" is the same as the "describe" for
 * mocha. This guaratees the contracts are loaded before the
 * test execution
 * **Update 1
 * ****Added the "accounts" parameter, this parameter holds the accounts 
 */
contract("Greeter", (accounts) => {
    /**
     * the interacions with the blockchain are async
     */
    describe("deployment", () => {
        it("has been deployed successfully", async () => {
            const greeter = await GreeterContract.deployed();
            //If the greeter is truthy (exists), our test will pass.
            assert(greeter, "contract was not deployed");
          });
    })

    describe("greet()", () => {
        it("returns 'Hello, World!'", async () => {
          const greeter = await GreeterContract.deployed();
          const expected = "Hello, World!";
          const actual = await greeter.greet();
      
          assert.equal(actual, expected, "greeted with 'Hello, World!'");
        });
      });

      describe("owner()", () => {
        it("returns the address of the owner", async () => {
          const greeter = await GreeterContract.deployed();
          const owner = await greeter.owner();
    
          assert(owner, "the current owner");
        });

        it("matches the address that originally deployed the contract", async () => {
            const greeter = await GreeterContract.deployed();
            const owner = await greeter.owner();
            const expected = accounts[0];
      
            assert.equal(owner, expected, "matches address used to deploy contract");
          });
      });
  
});

/**
 * We are creating a new contract block to avoid the test getting confused
 * with the other test instances, in this block we are isolated from the rest
 * **Update - we pass in the "accounts" parameter to the contract callback function 
 * to make them available to our test cases.
 */
 contract("Greeter: update greeting", (accounts) => {
    describe("setGreeting(string)", () => {
      describe("when message is sent by the owner", () => {
        it("sets greeting to passed in string", async () => {
          const greeter = await GreeterContract.deployed()
          const expected = "The owner changed the message";
  
          await greeter.setGreeting(expected);
          const actual = await greeter.greet();
  
          assert.equal(actual, expected, "greeting updated");
        });
      });
  
    describe("when message is sent by another account", () => {
      it("does not set the greeting", async () => {
        const greeter = await GreeterContract.deployed()
        const expected = await greeter.greet();
  
        try {
          await greeter.setGreeting("Not the owner", { from: accounts[1] });
        } catch(err) {
          const errorMessage = "Ownable: caller is not the owner"
          assert.equal(err.reason, errorMessage, "greeting should not update");
          return;
        }
        assert(false, "greeting should not update");
      });
    });
  })
});