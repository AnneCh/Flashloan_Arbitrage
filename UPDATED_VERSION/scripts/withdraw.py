from scripts.helpful import get_account, get_wethInterface
from brownie import Flashloan_logic

ETHERSCAN_TX_URL = "https://kovan.etherscan.io/tx/{}"


def main():
    acct = get_account()
    weth = get_wethInterface()
    flashloan = Flashloan_logic[len(Flashloan_logic) - 1]
    weth.transfer(
        flashloan,
        "0.1 ether",
        {"from": acct, "gas_limit": 1200000, "allow_revert": True},
    )
    print("Successfully deposited 0.1ETH into contract")
    print(weth.balanceOf(flashloan))
    print("Now let`s withdraw those 0.1 back into our wallet")
    tx = flashloan.withdraw(
        acct, {"from": flashloan, "gas_limit": 1200000, "allow_revert": True}
    )
    print("Your transaction can be seen here :" + ETHERSCAN_TX_URL.format(tx.txid))
