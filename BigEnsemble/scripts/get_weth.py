# mints WETH by depositing ETH
# I need WETH to pay for Aave's premium fees for using their pool through flashloans
# This script will have me use my metamask wallet through the rinkeby test network
# to get 1 WETH
# I'm still wondering how to write that to not involve my own wallet, but whoever's
# wallet will be connected as a user of the Bot
from brownie import accounts, config, network, interface


def main():
    get_weth()


def get_weth():
    acc = accounts.add(config["wallets"]["from_key"])
    weth = interface.WethInterface(config["networks"][network.show_active()]["weth"])
    tx = weth.deposit({"from": acc, "value": 1000000000000000000})
    print("Received 1 WETH")
    return
