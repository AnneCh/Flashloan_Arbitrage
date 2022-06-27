from scripts.helpful import get_account
import pytest
from brownie import Flashloan_logic

# unit tests
# test that the address of account deployed is my test_account address

# use fixture to automatically run function prior to other tests - good for initialisation
@pytest.fixture(autouse=True)
def setup(fn_isolation):
    """
    Isolation setup fixture.
    This ensures that each test runs against the same base environment.
    """
    acct = get_account()


@pytest.fixture(scope="module")
def aave_lending_pool_v2(Contract):
    """
    Yield a `Contract` object for the Aave lending pool address provider. KOVAN ADDRESS
    """
    yield Contract("0x88757f2f99175387ab4c6a4b3067c77a695b0349")


@pytest.fixture(scope="module")
def flashloan(Flashloan_logic, aave_lending_pool_v2, acct):
    """
    Deploy a `Flashloan_logic` contract and yields the generated object.
    """
    yield Flashloan_logic.deploy(aave_lending_pool_v2, {"from": acct})


def test_account():
    assert test_account == "0x4a8e4183709bb59E0807D64E46cFe7747479d371"


# first test passed!


def weth_balance():
    # check that we have funded the contract with enough WETH
    pass


def borrow_ten_eth():
    # try to borrow 10ETH
    pass


def add_index():
    # make sure new address is added to the index
    pass


def withdraw_funds():
    pass
