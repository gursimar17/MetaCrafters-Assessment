// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract myERC20Token is ERC20, Ownable {
     
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
