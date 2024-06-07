# MyToken 

This Solidity program is a “MyToken” program that demonstrates the basic syntax and functionality of the Solidity programming language. MyToken provides a starting point for those who are interested in learning the concepts of Solidity. 

## Description 

MyToken is a basic Solidity smart contract that lets you create and manage your own custom token on the Ethereum blockchain. The contract has token details like token name, token abbreviation and total supply. The contract is also having mapping variable and name of this mapping variable is accountBalance that maps an address to a balance. This keeps track of how many tokens each address has.  
The contract has two functions : 
(i) mint: This function will increase the total supply and recipient’s balance. This function has parameters which are _address and _value. _address is the address to which tokens will be minted and _value is the number of tokens to mint. 
(ii) burn: This function will decrease the total supply and sender’s balance.  This function has parameters which are _address and _value. _address is the address from which tokens will be burned and _value is the number of tokens to burn. 
 

## Getting Started 

### Executing program 

In order to run the program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/. 
Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g. MyToken.sol). Copy and paste the following code into the file: 

```javascript 
pragma solidity ^0.8.18; 
contract MyToken { 

    // public variables here 
   string public tokenName="Gursimar Singh Chahal"; 
   string public tokenAbbreviation="GSC"; 
   uint public totalSupply=0;

    // mapping variable here 
   mapping(address=>uint) public accountBalance; 

    // mint function 
    function mint(address _address, uint _value) public { 
      totalSupply += _value; 
      accountBalance[_address] += _value; 
    } 

    // burn function 
    function burn(address _address, uint _value) public { 
      if(accountBalance[_address] >= _value){ 
        totalSupply -= _value; 
        accountBalance[_address] -= _value; 
      } 
    } 
} 
```  

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar and then click on the "Compile MyToken.sol" button. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button. Once the contract is deployed, you can interact with it by calling the mint and burn functions. 
