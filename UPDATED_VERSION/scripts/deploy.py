from brownie import accounts
import os


def main():
    deploy_flashloan()


def deploy_flashloan():
    # account = accounts.load("flashloan-project")
    # print(account)
    accountAnne = accounts.add(os.getenv("PRIVATE_KEY"))
    print(accountAnne)
