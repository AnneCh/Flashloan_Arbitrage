from brownie import accounts, config, network


def main():
    get_account()


LOCAL_BLOCKCHAIN_ENVIRONMENTS = ["kovan", "ganache-local", "mainnet-fork"]


def get_account():
    if network.show_active() in LOCAL_BLOCKCHAIN_ENVIRONMENTS:
        return accounts[0]
    return accounts.add(config["wallets"]["from_key"])


# need to test it
