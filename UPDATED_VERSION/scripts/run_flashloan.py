from brownie import Flashloan_logic
from scripts.helpful import get_account, get_wethInterface

# set up global variables that will reflect the minimum WETH balance required in order for the
# caller to have enough WETH to pay the fees
# and one to ge the URL base to display the transaction when sucessful
MINIMUM_FLASHLOAN_WETH_BALANCE = 10000000000000000
ETHERSCAN_TX_URL = "https://kovan.etherscan.io/tx/{}"


def main():
    accountCaller = get_account()
    print("Getting the flashloan contract for ya!")
    flashloan = Flashloan_logic[
        len(Flashloan_logic) - 1
    ]  # get the latest version of the contract
    weth = get_wethInterface()  # connect avec l'interface WETH for the transactions
    if (
        weth.balanceOf(flashloan) < MINIMUM_FLASHLOAN_WETH_BALANCE
    ):  # check that our wallet (accountCaller) has enough WETH for the gas fees
        print("Giving some of your WETH away to the contract, for gas.")
        weth.transfer(
            flashloan, "20 ether", {"from": accountCaller}
        )  # borrow 20ETH in flashloan
    print("Executing flashloan...Be Patient!!")
    tx = flashloan.flashloan(
        weth, {"from": accountCaller}
    )  # approve the contract to transfer back the borrowed tokens
    print(
        "Youhouuuuuuuuuu!!! Here is the link to your transaction: "
        + ETHERSCAN_TX_URL.format(
            tx.txid
        )  # give the user the link to see their transaction
    )
    return flashloan
