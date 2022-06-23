from brownie import accounts, config, Flashloan_logic, network
from scripts.helpful import get_account


def main():
    deploy_flashloan()


def deploy_flashloan():
    accountAnne = get_account()
    flashloan = Flashloan_logic.deploy(
        config["networks"][network.show_active()]["aave_lending_pool_v2"],
        {"from": accountAnne},
    )
    # print(accountAnne)
