//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "aave-v3-core/contracts/flashloan/base/FlashLoanReceiverBase.sol";
import "aave-v3-core/contracts/interfaces/IPoolAddressesProvider.sol";
import "aave-v3-core/contracts/interfaces/IPool.sol";
import "aave-v3-core/contracts/interfaces/IERC20WithPermit.sol";











contract FlashLoanV3 is FlashLoanReceiverBase, Withdrawable {
    constructor(address _addressProvider)
        public
        FlashLoanReceiverBase(_addressProvider){}

    // this _addressProvider is the Lending Pool's , where amount will be loaned from
    // I have the mainnet-fork, kovan and mainnet aave_lending_pool addresses in brownie-config.yaml

    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    )
        external
        override
        returns (
            bool 
        )

    {
//     ////// Here goes my arbitrage logic

//     /// and now it's time to approve the Lending pool for spending our tokens
//     ///and repay the pool with interests
    
        for (uint256 i = 0; i < assets.length; i++) {
            uint256 amountOwing = accounts[i].add(premiums[i]);
            IERC20(asserts[i]).approve(address(LENDING_POOL), amountOwing);
        }
        return true;
    }

//     /// _flashloan is the main function of this contract, it gathers everything together and calls the
//     /// LENDING.POOL.flashloan() function, which is the actual one that will trigger our flashloan to be laoned

//     function _flashloan(address[] memory assets, uint256[] memory amounts)
//         internal
//     {}

//     /// this function is taking the address (_asset) of the token to request a specified amount of that
//     ///token that he wants to get loaned to him
//     function flashloan(address _asset) public onlyOwner {
//         bytes memory data = "";
//         uint256 amount = 1 ether;
//         /// we want to get only 1 wrapped ETH

//         address[] memory assets = new address[](1);
//         assets[0] = _asset;
//         /// because we are able to flashloans different tokens at once, we need to specify
//         /// and add our the wrapped ether address to the list of assets' addresses

//         uint256[] memory amounts = new uint256[](1);
//         amounts[0] = _amount;
//         /// and we do the same for the amounts loaned
//         /// !!! the 0 position of assets must match the 0 position of amounts

//         /// then we call the _flashloan()
//         _flashloan(assets, amounts);
//     }
// }
