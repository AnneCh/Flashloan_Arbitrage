from brownie import accounts, config, Flashloan_logic, network


def main():
    deploy_flashloan()


def deploy_flashloan():
    # accountAnne = accounts.load("flashloan-project")
    accountAnne = accounts.add(config["wallets"]["from_key"])
    flashloan = Flashloan_logic.deploy(
        config["networks"][network.show_active()]["aave_lending_pool_v2"],
        {"from": accountAnne},
    )

    print(accountAnne)
