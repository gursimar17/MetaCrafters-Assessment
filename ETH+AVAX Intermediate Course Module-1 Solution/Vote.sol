// SPDX-License-Identifier: MIT
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
