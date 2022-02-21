//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

// import flashloan receiver base from github or ...?
// import lending pool 
// import safemath
 

contract FlashLoanV3 is FlashLoanReceiverBase, Withdrawable {
    constructor(address _addressProvider)
        public
        FlashLoanReceiverBase(_addressProvider)
    {}

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
            uint256 amountOwing = amounts[i].add(premiums[i]);
            IERC20(assets[i]).approve(address(LENDING_POOL), amountOwing);
        }
        return true;
    }

    // FLASHLOAN FUNCTION - flashloan()

    //     /// _flashloan is the main function of this contract, it gathers everything together and calls the
    //     /// LENDING.POOL.flashloan() function, which is the actual one that will trigger our flashloan to be laoned

    //     /// this function is taking the address (_asset) of the token to request a specified amount of that
    //     ///token that he wants to get loaned to it => this present contract is where the loaned amount is to be recieved

    // takes several parameters :
    //     1.receiverAddress (address receiving the amount loaned - must comply with flashLoanReceiver Interface.)
    //     2.assets (Array of addresses of the reserves to flashloan)
    //     3.amounts (uint256 amounts of assets to flashloan, must be the same number of elements as `assets`)
    //     4.modes (uint 256 type of debt to open if the flashloan is not returned: 0 is revert)
    //     5.onBehalfOf (address, matters if mode is NOT 0)
    //     6.params (bytes, to be used bu the receiverAddress)
    //     7.referralCode (uint16, for aave referral program)

    // 1. address(this) because it is this FlashLoanV3.sol contract that will receive the flashloaned amount
    // 2.

    // the function takes 2 parameters, which are what the user will be entering, aka TOKEN (asset)
    // and how much of that token (amount)
    // internally, the function will add the rest of the parameters and call LENDING_POOL.flashloan()
    function flashLoanCall(address[] memory assets, uint256[] memory amounts)
        internal
    {
        address receiverAddress = address(this);
        uint256 modes = 0;
        bytes memory params = "";
        uint16 referralCode = 0;

        LENDING_POOL.flashloan(
            receiverAddress,
            assets,
            amounts,
            modes,
            params,
            referralCode
        );
    }
}
