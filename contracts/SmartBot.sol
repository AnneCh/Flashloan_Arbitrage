//SPDX-License-Identifier: MIT

pragma solidity >=0.6.6;

// first, connect contract to binance API

contract SmartBot {
    // Define which state the robot is in. Is its next move to SELL or BUY?
    // State will be used a boolean conditions
    enum STATE {
        BUY,
        SELL
    }
    // Constants of thresholds
    uint256 public upwardThreshold;
    uint256 public dipThreshold;
    uint256 public profitThreshold;
    uint256 public stopLossThreshold;
}
