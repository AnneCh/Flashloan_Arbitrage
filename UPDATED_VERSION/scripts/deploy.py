from brownie import accounts, config, Flashloan_logic


def main():
    deploy_flashloan()


def deploy_flashloan():
    # accountAnne = accounts.load("flashloan-project")
    accountAnne = accounts.add(config["wallets"]["from_key"])
    Flashloan_logic.deploy({"from": accountAnne})
    print(accountAnne)
