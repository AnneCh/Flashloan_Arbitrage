1. Get API from Binance
   Problem: don't want to connect with my actual Binance account which has actual BTC
   Find a way to get a fake Binance API : Found Binance Test Net
   https://docs.binance.org/guides/testnet.html
   a. Successfully added Binance Test net to my metamask
   b. Successfully got 1BNB credited into my test account
   **Now how do I get an API?**
   c. Downloaded a VPN to circumvent the geolocation
   d. Now looking where I'm getting the API from
   => learning about websockets/https://www.youtube.com/watch?v=z2ePTq-KTzQ/https://pypi.org/project/websocket-client/
   **candlestick data are used to show how the market is moving, with open price, close price, highprice, low price**

   - using websocket instead of API?
   - Spot trading instead of futures : spot allows instant trades => will select spot trading for this project

   https://testnet.binance.vision/

   => got my API_KEY and API_SECRET from Binance Spot testnet
   => now looking at how to set that whole thing up

   => Should I use CCXT library and forget about Websockets?
   => Explore https://www.freqtrade.io/en/stable/ and see if it's worth adding it

2. Start defining which kinds of functions are going to be necessary
   as well as starting my boiler plate: - SmartBot.sol - deployBot.py - .env file with sensitive variables - helpful_scripts.py to get the account used for testing and other recurring functions
   => do I write a script for each connection ? Like one script to get exchange 1, one script for exchange 2, one script for flashloans
   => still struggle defining what goes into the .sol and what goes into .py files
   => .sol interacts with the blockchain, that means it creates blocks, it deals with transactions
   => in that sense, SmartBot.sol's functions are used to trigger flashloan/buy/sell
   => SmartBot.sol is also used to connect with other contracts that I'll need to use
   => does that mean that the python scripts are for?:
   => getting prices, checking if prices are different enough to trigger flashloans
   => connect to account

--31.01.22--

- Pick up a defined strategy, which platform am I going to make the trades on

ressource N1 : https://comparebrokers.co/compare/crypto-arbitrage/

=> triangular trade is basically the arbitrage method I'm going to use
=> There are several data that I need to gather in order to choose which exchanges I'll be dealing with
=> Fees incurred with each transactions _will determine the gross and net profit_
=> ease to subscribe/use/KYC
=> popularity (can define trends), inc number of transactions/trades, users on the paltform etc.
=> is the protocol only working with this exchange or can I use the same protocol for different platforms? (like Sushiswap and cant remember the name)

/// Research to be made: are all the KYC procedures on exchanges only for the contract's owner, or
are those regulations needed for each user of my bot? ///
=> posted the question on twitter

    **additional thought:
    Need to build a strategy that is the safest possible :
        => if prices fluctuate outside of a certain margin, transaction must be reversed:
         => figure out what this margin is taking into account fees already incurred by the process
         => How much does my wallet need to possess in order for flashloans and arbitrage system
            to work out? What is the minimum effective dose?
    **

    => ALWAYS KEEP IN MIND to consider the speed of each movement, as the swiftness of the entire process
        is a shock absorber to the volatility of prices' effect on the opportunities for profit.
            => BTC transactions are known to take up a lot of time, for ex

/// LOOK UP hedging strategies as a backup, as an "insurance" for the arbiter? ///

\*\* Should I try to include a function that keeps an eye on new tokens' creations, and incurr a trigger
of a new trade to look for? => that can be a function for later to implement, when I want to refine the bot

ressource N2 https://www.coindesk.com/learn/crypto-arbitrage-trading-how-to-make-low-risk-gains/

- A arbitrage can be cross-exchange without being triangular
  => triangular would be better, but I may stick witha simple cross-exchange for now
  => If I find out that triangular strategy isn't that much different to implement from cross-exchange
  => then I'll opt for it.

- It is possible to mitigate the fees of borrowing, buying, exchanging, selling, paying back by
  possessing some amount in a wallet on each of the platforms
  => I can see that if it's simple cross-exchange, but wouldn't that be way too much to spare
  if we are dealing with 100 exchanges?

\*\* Many things can make it so an exchange is suddenly offline or faulty.
=> what are the strategies/code that will safeguard huge sudden losses?
=> some kind of automatic OFF switch that put a hold on/revert every trade until the exchange is back online?

//// FIGURE OUT if I cna use https://bybit-exchange.github.io/docs/testnet/inverse/?python--pybit#t-ipratelimits
for testing, what advantages would that provide to the bot's strategy? ///

---01.02.22---

/// I've read more about exchanges and APIs, tried to gather some data to get fee numbers and
KYC regulations and rate limits.
Got some answers but not enough to draw an inclusive big picture.

        Got a list of coins that tends to be the most volatile
        => gives me the desire to include more functionalities to the bot, like tracking trends and
        new coins on several exchanges and trigger other kinds of strategies, but
        I know I need to focus on what is within my reach first.

        I am tempted to use UniSwap/SushiSwap as they seem to have the same API system and functions to call
        or it it making my life just a bit too easy?

---04.02.22---
//// didn't log yesterday as I was doing more research on exchanges and didn't learn much new

- created account on Kraken
- KYC was pretty seamless and I got a confirmation that my account got to Intermediate level in less than 5mn
- look into Aave and which protocol to take, V3 is the latest and seems to be stable enough to use
- reopening Patrick's video on Aave Flashloan
- studying Aave documentation and https://github.com/aave/aave-v3-core
- looks like I need to instal somethinh called Docker in order to use Aave's contract properly when trying to deploy on a testnet
- trying to get docker to work
- docker is installed but my connection request is dropping
- I ran the installation again through different commands (redid the entire path, I think the docker engine wasn't installed properly)
  Now Docker works. I can move on to Aave connection to my smart contract

**\*** Aave takes 0.09% of the flashloaned amount as a fee to pay the depositors **\***
--- Look up Efficiency mode from Aave and how to implement it, being able to borrow a category of assets can make transactions more diversified with less code ? ---

--- Look up isolation mode and if would need to offer the possibility to use it ---

I'm trying to follow Patrick's video on Aave flashloan implementation, but I've chosen to download the latest version and still try to implement
**=> In the end, it's all the same idea and logic, it's just different names and pathways to get to those names.**

See familiar things in the cloned repo, like how this project has open Zeppelin and Chainlink dependencies, for making mocks like I coded along with the FCC tutorial video, tha AggregatorInterface etc.
