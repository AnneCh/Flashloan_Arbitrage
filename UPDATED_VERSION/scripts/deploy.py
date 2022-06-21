from brownie import accounts


def main():
    deploy_flashloan()


def deploy_flashloan():
    account = accounts.load("flashloan-project")
    print(account)


def prinnt():
    print("hi")
