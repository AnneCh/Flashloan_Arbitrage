from brownie import accounts, config, network


def main():
    get_account()


LOCAL_BLOCKCHAIN_ENVIRONMENTS = ["kovan", "development", "mainnet-fork"]


def get_account():
    if network.show_active() == "development":
        return accounts[0]
    else:
        return accounts.add(config["wallets"]["from_key"])


# need to test it
