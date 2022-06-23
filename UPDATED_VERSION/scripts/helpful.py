from brownie import network, accounts, config


def get_account():
    return accounts.add(config["wallets"]["from_key"])
