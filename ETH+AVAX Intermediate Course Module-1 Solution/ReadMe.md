# ETH+AVAX Intermediate Course Module-1 Solution
## Understanding require, assert, and revert functions
This Solidity program is a “Vote” program that shows how to use require, assert, and revert functions.
## Description
This smart contract lets people register as voters, check voter status, and remove voters.
This contract has three functions:-
1. enrollVoter: People can sign up as voters by giving their age, name, and a unique ID. Voters must be older than 17. Each voter ID must be unique and not used before.
2. voterStatus: You can check if an address is registered as a voter.
3. removeVoter: Registered voters can be removed from the list. This process frees up the used ID and marks the voter as not registered.
## Getting Started
### Executing program
In order to run the program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/. Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g. Vote.sol). Copy and paste the following code into the file:

```  
pragma solidity ^0.8.18;
contract Vote {
    struct Voter {
        bool registeredVoter;
        uint age;
        string name;
        uint id; 
    }

    mapping(address => Voter) public voters;
    mapping(uint => bool) public usedIds; 
    address[] public voterAddresses; 

    function enrollVoter(uint _age, string memory _name, uint _id) public {
        require(_age > 17, "Voter must be greater than 17 years of age");
        require(!usedIds[_id], "ID must be unique");

        if (voters[msg.sender].registeredVoter) {
            revert("Voter is registered already");
        }

        voters[msg.sender] = Voter(true, _age, _name, _id);
        voterAddresses.push(msg.sender); 
        usedIds[_id] = true; 

        assert(voters[msg.sender].registeredVoter == true);
    }

    function voterStatus(address _address) public view returns (bool) {
        return voters[_address].registeredVoter;
    }

    function removeVoter(address _address) public {
        require(voters[_address].registeredVoter, "Voter not registered");

        uint id = voters[_address].id;
        voters[_address].registeredVoter = false;
        usedIds[id] = false; 

        for (uint i = 0; i < voterAddresses.length; i++) {
            if (voterAddresses[i] == _address) {
                voterAddresses[i] = voterAddresses[voterAddresses.length - 1];
                voterAddresses.pop();
                break;
            }
        }
    }
}
```  

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar and then click on the "Compile Vote.sol" button. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Vote" contract from the dropdown menu, and then click on the "Deploy" button. Once the contract is deployed, you can interact with it by calling the enrollVoter, voterStatus and removeVoter functions.
