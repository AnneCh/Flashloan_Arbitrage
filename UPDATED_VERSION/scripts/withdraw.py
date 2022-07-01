from scripts.helpful import get_account
from brownie import Flashloan_logic

ETHERSCAN_TX_URL = "https://kovan.etherscan.io/tx/{}"


def main():
    acct = get_account()
    flashloan = Flashloan_logic[len(Flashloan_logic) - 1]
    tx = flashloan.withdraw(acct)
    print("Your transaction can be seen here :" + ETHERSCAN_TX_URL.format(tx.txid))
