from scripts.helpful import get_account, get_wethInterface


def main():
    get_weth()


def get_weth():
    accountA = get_account()
    weth = get_wethInterface()
    tx = weth.deposit({"from": accountA, "value": 10000000000000000})
    print("Yeah you made it!")
    return tx
