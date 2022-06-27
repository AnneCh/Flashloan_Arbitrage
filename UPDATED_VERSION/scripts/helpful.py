from brownie import network, accounts, config, interface


def get_account():
    accountAnne = accounts.add(config["wallets"]["from_key"])
    print(accountAnne)
    return accountAnne


def get_wethInterface():
    return interface.WethInterface(config["networks"][network.show_active()]["weth"])
