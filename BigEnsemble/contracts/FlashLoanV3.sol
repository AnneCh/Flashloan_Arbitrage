//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import {FlashLoanReceiverBase} from "../aave/contracts/flashloan/base/FlashLoanReceiverBase.sol";
import {IPoolAddressesProvider} from "../aave/contracts/interfaces/IPoolAddressesProvider.sol";
import {IPool} from "../aave/contracts/interfaces/IPool.sol";
import {IERC20WithPermit} from "../aave/contracts/interfaces/IERC20WithPermit.sol";

contract FlashLoanV3 is FlashLoanReceiverBase, Withdrawable {
    // constructor(address _addressProvider)
    //     public
    //     FlashLoanReceiverBase(_addressProvider){}

    // this _addressProvider is the Lending Pool's , where amount will be loaned from
    // I have the mainnet-fork, kovan and mainnet aave_lending_pool addresses in brownie-config.yaml

    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    ) external override returns (bool) {
        //     ////// Here goes my arbitrage logic

        //     /// and now it's time to approve the Lending pool for spending our tokens
        //     ///and repay the pool with interests (premiums paid in WETH, need script to exchange
        /// 1 of my ETH to WETH adn store WETH in my metamask)

        for (uint256 i = 0; i < assets.length; i++) {
            uint256 amountOwing = accounts[i].add(premiums[i]);
            IERC20(asserts[i]).approve(address(LENDING_POOL), amountOwing);
        }
        return true;
    }

    //     /// _flashloan is the main function of this contract, it gathers everything together and calls the
    //     /// LENDING.POOL.flashloan() function, which is the actual one that will trigger our flashloan to be laoned

    //     /// this function is taking the address (_asset) of the token to request a specified amount of that
    //     ///token that he wants to get loaned to it => this present contract is where the loaned amount is to be recieved
}
