# GSC Token
This Solidity program is a “myERC20Token” program. The objective of this solidity program is to create a customizable ERC20 token. The GSC Token is a digital token named "Gursimar Singh Chahal" with the symbol "GSC". This contract allows the owner to create new tokens, users to transfer tokens, and anyone to destroy their tokens.
## Description & Features
Token Name: Gursimar Singh Chahal,
Token Symbol: GSC,
Minting: Only the contract owner can create new tokens,
Transferring: Users can send tokens to others,
Burning: Users can destroy their own tokens,
Ownership: The contract owner has special permissions.
## Getting Started
### Executing program
In order to run the program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/. Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g. myERC20Token.sol). Copy and paste the following code into the file:
```
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract myERC20Token is ERC20, Ownable {
    constructor() ERC20("Gursimar Singh Chahal", "GSC") Ownable(msg.sender){}

    function mint(address to, uint amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferToken(address to, uint amount) public {
        bool transfered = transfer(to, amount);
        require(transfered, "Transfer unsuccessful ! Try Again");
    }

    function burn(uint amount) public {
        _burn(msg.sender, amount);
    }
}
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar and then click on the "Compile myERC20Token.sol" button. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "myERC20Token" contract from the dropdown menu, and then click on the "Deploy" button. Once the contract is deployed, you can interact with it by calling the mint, transferToken and burn functions.
