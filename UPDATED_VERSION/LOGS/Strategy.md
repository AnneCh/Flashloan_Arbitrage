**_Calculations_**

AAVE
takes 0.09% of the amount

**_LOGIC_**

\*\* The user needs to have a minimum of the currency they want to do an arbitrage with, in order to pay gas fees

The logic that the user follows to build their bot is such `createBot` :

1. which pair of assets to look at (ie ETH/BNB), `_assets[]`
2. how big of a difference, in %, should there be between ETH/BNB on DEX1 and DEX2 (needs a reminder that every transaction incurs fees and that they need to take that into account) `margin`
3. How often should the Bot run the strategy `regularity`
4. how long should the strategy run for (hours and days)`activeTime`
   Then the user can add another strategy `addBot` (calls `createBot`)
   or choose to withdraw their gains `withdrawGains`
5. How much ETH to flashloan every time the bot sees an opportunity (ie 10ETH) `_asset` `_amount`
   (6. Implement an option that allows automatic transfers to the user's wallet above a certain amount?)

The logic that my scripts need to follow:

- gathers the `botParams` from user input `_assets[]`, `_asset`,`margin`, `regularity`, `activeTime`, `_amount`
- when the `botParams` are saved (user clicking on a button to confirm their strategy), an event `botCreated` is created
- a function `initBot` will be listening for the event `botCreated`, collect `botParams` and initiate functions that will check the prices of Uniswap and SushiSwap accordind to the params input
- those functions take parameters that match those input by the user, and include them into some kind of `if` loop that could look something like that:

  if (price.asset1.DEX1 > price.asset1.DEX2){

  - flashloan(asset2.\_amount)
  - grab the bool from `executeOperation`
  - grab flashloaned asset2
  - exchange asset2 against asset1 on DEX2
  - withdraw asset1.DEX2
  - exchange asset1 against asset2 on DEX1
  - withdraw asset2
    }
    // need more insights to develop this part, how it really works\

- then the executeOperation will automatically accept or reverse the function if there are not enough funds
- the profit will remain on the smart contract until it's withdrawn => or should I automatically send the profit on the user's wallet so no tokens remain on the smart contract ?
