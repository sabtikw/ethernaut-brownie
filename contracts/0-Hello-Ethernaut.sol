/*

Note : function info() name conflicts with brownie info function.


# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# after creating your contract instance, copy the address below

Instance.at("address of current contract instance")

Instance[0].info1()

Instance[0].info2("hello")

Instance[0].infoNum()

Instance[0].info42()

Instance[0].theMethodName()

Instance[0].method7123949()

Instance[0].password()

Instance[0].authenticate('ethernaut0',{'from': a[0]})

# submit the solution

*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Instance {

  string public password;
  uint8 public infoNum = 42;
  string public theMethodName = 'The method name is method7123949.';
  bool private cleared = false;

  // constructor
  constructor(string memory _password) public {
    password = _password;
  }


  function info1() public pure returns (string memory) {
    return 'Try info2(), but with "hello" as a parameter.';
  }

  function info2(string memory param) public pure returns (string memory) {
    if(keccak256(abi.encodePacked(param)) == keccak256(abi.encodePacked('hello'))) {
      return 'The property infoNum holds the number of the next info method to call.';
    }
    return 'Wrong parameter.';
  }

  function info42() public pure returns (string memory) {
    return 'theMethodName is the name of the next method.';
  }

  function method7123949() public pure returns (string memory) {
    return 'If you know the password, submit it to authenticate().';
  }

  function authenticate(string memory passkey) public {
    if(keccak256(abi.encodePacked(passkey)) == keccak256(abi.encodePacked(password))) {
      cleared = true;
    }
  }

  function getCleared() public view returns (bool) {
    return cleared;
  }
}