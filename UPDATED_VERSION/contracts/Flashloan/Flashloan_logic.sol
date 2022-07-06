//SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

import "./aave/FlashLoanReceiverBaseV2.sol";
import "../../interfaces/v2/ILendingPoolAddressesProviderV2.sol";
import "../../interfaces/v2/ILendingPoolV2.sol";

contract Flashloan_logic is FlashLoanReceiverBaseV2, Withdrawable {
    constructor(address _addressProvider)
        public
        FlashLoanReceiverBaseV2(_addressProvider)
    {}

    //mapping(address => mapping(address => uint256)) private singleUserIndex;
    // mapping(address => uint256) public usersIndex;
    // uint256 indexUsers;
    // address[] public Users;
    // address newUser;

    // function addIndex(address x) public returns (uint256) {
    //     newUser = x;
    //     uint256 i;
    //     for (i = 0; i < Users.length; i++) {
    //         indexUsers += i;
    //         usersIndex[newUser] = indexUsers;
    //     }
    //     return indexUsers;
    // }

    /**
     * @dev This function must be called only by the LENDING_POOL and takes care of repaying
     * active debt positions, migrating collateral and incurring new V2 debt token debt.
     *
     * @param assets The array of flash loaned assets used to repay debts.
     * @param amounts The array of flash loaned asset amounts used to repay debts.
     * @param premiums The array of premiums incurred as additional debts.
     * @param initiator The address that initiated the flash loan, unused.
     * @param params The byte array containing, in this case, the arrays of aTokens and aTokenAmounts.
     * Lending Pool only
     */

    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    ) external override returns (bool) {
        //
        // This contract now has the funds requested.
        // My logic goes here.

        // Approve the LendingPool contract allowance to *pull* the owed amount
        for (uint256 i = 0; i < assets.length; i++) {
            uint256 amountOwing = amounts[i].add(premiums[i]);
            IERC20(assets[i]).approve(address(LENDING_POOL), amountOwing);
        }

        return true;
    }

    function _flashloan(address[] memory assets, uint256[] memory amounts)
        internal
    {
        address receiverAddress = address(this);

        address onBehalfOf = address(this);
        bytes memory params = "";
        uint16 referralCode = 0;

        uint256[] memory modes = new uint256[](assets.length);

        // 0 = no debt (flash), 1 = stable, 2 = variable
        for (uint256 i = 0; i < assets.length; i++) {
            modes[i] = 0;
        }

        LENDING_POOL.flashLoan(
            receiverAddress,
            assets,
            amounts,
            modes,
            onBehalfOf,
            params,
            referralCode
        );
    }

    function userFlashloan(address _asset, uint256 _amount) public onlyOwner {
        address[] memory assets = new address[](1);
        assets[0] = _asset;

        uint256[] memory amounts = new uint256[](1);
        amounts[0] = _amount;

        flashloan(assets, amounts);
    }

    function flashloan(address[] memory assets, uint256[] memory amounts)
        public
        onlyOwner
    {
        _flashloan(assets, amounts);
    }

    // modifier nonZeroValue() { if (!(msg.value > 0)) throw; _; }

    function withdraw() external onlyOwner {
        //will need to be modif to make safer
        msg.sender.transfer(address(this).balance);
    }
}
