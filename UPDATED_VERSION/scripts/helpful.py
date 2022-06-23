from brownie import network, accounts, config, interface


def get_account():
    return accounts.add(config["wallets"]["from_key"])


def get_wethInterface():
    return interface.WethInterface(config["networks"][network.show_active()]["weth"])
