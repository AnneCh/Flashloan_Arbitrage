from brownie import accounts, config, network, interface


def main():
    get_weth()


# can replace the accounts.add
def get_weth():
    myAccount = accounts.add(config["wallets"]["from_key"])
    weth = interface.WethInterface(config["networks"][network.show_active()]["weth"])
    tx = weth.deposit({"from": myAccount, "value": 1000000000000})
    print("Received 0.000001 WETH")
    return tx
