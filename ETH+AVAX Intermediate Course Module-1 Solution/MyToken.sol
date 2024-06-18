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
