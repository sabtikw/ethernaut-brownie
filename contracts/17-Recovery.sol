/*

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# call destroy() function in Recovery contract with your account address as input. selfdestruct will recover ETH to
your account

recovery_contract  = interface.Recover("RecoveryContractAddress")

recovery_contract.destroy(a[0].address, {'from': a[0]})

*/

// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

interface Recovery {
  
  function destroy(address payable _to) external;
  
}