//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "aave-v3-core/contracts/flashloan/base/FlashLoanReceiverBase.sol";
import "aave-v3-core/contracts/interfaces/IPoolAddressesProvider.sol";
import "aave-v3-core/contracts/interfaces/IPool.sol";

contract FlashLoanV3 is FlashLoanReceiverBase, Withdrawable {}
