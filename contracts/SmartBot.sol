//SPDX-License-Identifier: MIT

pragma solidity >=0.6.6;

//contract communicates with blockchain to execute flashloans and trades
// find a way to communicate with Aave
// find a way to communicate with Binance (where )

contract SmartBot {
    // Define which state the robot is in. Is its next move to SELL or BUY?
    // State will be used a boolean conditions
    enum STATE {
        BUY,
        SELL
    }

    function getFloashLoan()
}
