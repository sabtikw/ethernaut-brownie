/* 

In this challenge we'll create a contract using Yul language to ensure minium gas consumption.

please refer to Solidity Doc (https://docs.soliditylang.org/en/v0.8.6/yul.html#complete-erc20-example) 


copy below code and create a new sol file in remix , then in the compile tab languge option choose Yul , then deploy

object "Attack" {
    code {
        
        // Deploy the contract
        datacopy(0, dataoffset("runtime"), datasize("runtime"))
          
        return(0, datasize("runtime"))
    }
   object "runtime" {
        code {
        
        mstore(0,0x2a) // store 42 at memory 0
        return(0,0x20) // return 32-bytes where 42 is stored
         
            }
    
        }
   }

# call setSolver with above contract address

mn = interface.MagicNum("MagicNumAddress")
mn.setSolver("AddressOfYulContract")

# submit

 */


// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

interface MagicNum {

  function setSolver(address _solver) external;

    }