//SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

import "./aave/FlashLoanReceiverBaseV2.sol";
import "../../interfaces/v2/ILendingPoolAddressesProviderV2.sol";
import "../../interfaces/v2/ILendingPoolV2.sol";

contract Flashloan_logic is FlashLoanReceiverBaseV2, Withdrawable {
    //mapping(address => mapping(address => uint256)) private singleUserIndex;
    mapping(address => uint256) public usersIndex;
    uint256 indexUsers;
    address[] public Users;
    address newUser;

    function addIndex(newUser) {
        for (i = 0; i < Users[].length; i++) {
            indexUsers += i;
            usersIndex[newUser] = indexUsers;
            return indexUsers;
        }
    }

    constructor(address _addressProvider)
        public
        FlashLoanReceiverBaseV2(_addressProvider)
    {
        newUser = msg.sender;
        Users.push[newUser];
        addIndex(newUser);
    }

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

        // At the end of my logic above, my contract owes the flashloaned amounts + premiums.
        // Therefore I need to make sure that my contract has enough to repay
        // these amounts, through a script get_weth to fund this contract with some WETH
        // as the lending pool only accepts wrapped ETH. In production, the user will have to fund
        // our contract with some ETH (or send directly WETH if he has)
        //  and we will make sure to transfer to WETH and to the LENDING_POOL

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

    function flashloan(address[] memory assets, uint256[] memory amounts)
        public
        onlyOwner
    {
        _flashloan(assets, amounts);
    }

    function withdraw() external onlyOwner {
        // onlyOwner makes it that only the address who deployed the contract will be able to call this function
        // function called by the user to withdraw his gains
    }
}
