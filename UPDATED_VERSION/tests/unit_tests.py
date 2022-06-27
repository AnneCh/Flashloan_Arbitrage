from scripts.helpful import get_account

# unit tests
# test that the address of account deployed is my test_account address


def test_account():
    test_account = get_account()
    assert test_account == "0x4a8e4183709bb59E0807D64E46cFe7747479d371"


def weth_balance():
    # check that we have funded the contract with enough WETH
    pass


def borrow_ten_eth():
    # try to borrow 10ETH
    pass


# first test passed!
