# ETH+AVAX Intermediate Course Module-1 Solution
## Understanding require, assert, and revert functions
This Solidity program is a “MyToken” program that shows how to use require, assert, and revert functions.
## Description
MyToken is a basic Solidity smart contract that lets you create and manage your own custom token on the Ethereum blockchain. The contract has token details like token name, token abbreviation and total supply. The contract is also having mapping variable and name of this mapping variable is accountBalance that maps an address to a balance. This keeps track of how many tokens each address has.
The contract has two functions : 
(i) mint: This function will increase the total supply and recipient’s balance. This function has parameters which are _address and _value. _address is the address to which tokens will be minted and _value is the number of tokens to mint. In the mint function, 'require' function makes sure that the number of tokens to add is more than 0. 
(ii) burn: This function will decrease the total supply and sender’s balance. This function has parameters which are _address and _value. _address is the address from which tokens will be burned and _value is the number of tokens to burn. In the burn function, 'require' function makes sure that the number of tokens to remove is more than 0 and that the user has enough tokens. In the burn function, 'revert' function checks for errors like trying to burn more tokens than the user has and stops the function if there is a problem. In both mint and burn functions, 'assert' function checks that the balances and total supply are updated correctly.
## Getting Started
### Executing program
In order to run the program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/. Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g. MyToken.sol). Copy and paste the following code into the file:
'''
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {

    string public tokenName = "Gursimar Singh Chahal";
    string public tokenAbbreviation = "GSC";
    uint public totalSupply = 0;

    mapping(address => uint) public accountBalance;

    function mint(address _address, uint _value) public {
        require(_value > 0, "Mint value must be greater than 0");
        
        uint previousBalance = accountBalance[_address];
        totalSupply += _value;
        accountBalance[_address] += _value;

        assert(accountBalance[_address] == previousBalance + _value);
        assert(totalSupply >= _value); 
    }

    function burn(address _address, uint _value) public {
        require(_value > 0, "Burn value must be greater than 0");
        require(accountBalance[_address] >= _value, "Insufficient balance to burn");

        uint previousBalance = accountBalance[_address];
        uint newTotalSupply = totalSupply - _value;
        uint newBalance = accountBalance[_address] - _value;

        if (newTotalSupply > totalSupply || newBalance > previousBalance) {
            revert("Underflow error detected");
        }

        totalSupply = newTotalSupply;
        accountBalance[_address] = newBalance;

        assert(accountBalance[_address] == previousBalance - _value);
        assert(totalSupply >= 0); 
    }
}
'''
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar and then click on the "Compile MyToken.sol" button. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button. Once the contract is deployed, you can interact with it by calling the mint and burn functions.
