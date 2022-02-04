//SPDX-License-Identifier: MIT

pragma solidity >=0.6.6;

//contract communicates with blockchain to execute flashloans and trades
// find a way to communicate with Aave
// find a way to communicate with Binance and Kraken
// => got an account on both platforms and have access to API keys

// make sure to keep the number of functions to a minimum to avoid too much gas fees

contract SmartBot {
    // Define which state the robot is in. Is its next move to SELL or BUY?
    // State will be used a boolean conditions
    enum STATE {
        BUY,
        SELL
    }

    function executeTrade() external {
        // connect to Aave to get loan
        // make sure our contract is the one calling the loan
        // get loan
        // connect to exchange A to buy X amount of tokens with loan
        // connect to exchange B to sell same tokens for higher price than the buy price
        // verify that X amount of profit has been made => if not, cancel the trade
        // pay the loan back
    }
}
