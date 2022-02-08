MORE ADVANCED VERSION OF THE BOT

I want to create a Trading Bot that includes two principles: - flashloans - arbirtrage

1. I want this bot to be simple, to offer few options so to be suitable for people who have no idea
   how to trade, how to build a trading strategy, so they can just click a few buttons and have
   their bot start working for them.

2. DEFINE LOGIC

Every X seconds :

- Analyze both platforms (API Calls?) => Is there more than a 2% difference on the price of BTC
  between platform X and platform Y ? => IF YES1, trigger a flashloan contract => place the Buy Order on platform X => Get latest price on platform Y => is price still at or above 2% higher than what I just bought? => IF YES2, Sell => Withdraw => trigger contract to payback the flashloan / IF NO2 => Cancel trade

=> IF NO1, do nothing

3. WHAT THE BOT NEEDS TO DO

- needs to listen to two markets, get prices for a few currencies, and execute trades
  Ideally, it needs to execute trades using flashloans, so to avoid high deposits of FIAT or crypto in advance

- needs to be cloud based so the bot doesn't stop when shutting the computer

Ensure that before I start coding, I have:

- Registered and been approved to use an exchange
- Enabled API usage on the exchange and have an API key
- Decided how I will be hosting my bot

"- The bot will only ever be in one of two states: BUY or SELL. It will not place various buy or sell orders consecutively at multiple price points. If its last operation was a sale, it will try to buy next.

- It will use fixed thresholds for buying and selling. A smarter bot might be able to tinker with the thresholds based on various indicators, but my bot will have its strategy and thresholds set manually.
- It will only trade one currency pair e.g. BTC/USD." (yakkomajuri.medium)

4. FRONT END

- connect user wallet to the bot
- disconnect user wallet from the bot
- choose strategy amongst a few (which ones to list?)

USEFUL LINKS
https://airtable.com/shrMmgI2ljeugMbQX/tblW0ecPm3y8jZlSz
https://yakkomajuri.medium.com/a-step-by-step-guide-to-building-a-trading-bot-in-any-programming-language-d202ffe91569
https://docs.google.com/spreadsheets/d/1HM_AvNBAHOvac6ECkl1E-0r8rNZbml6-BVRGA8MroPE/edit#gid=0
https://www.coingecko.com/en/exchanges
https://startbootstrap.com/themes
https://medium.com/@bneiluj/flash-boys-arbitrage-dao-c0b96d094f93
youtube.com/watch?v=Aw7yvGFtOvI : aave example of code

https://github.com/jaggedsoft/node-binance-api

USEFUL DATA

- withdrawal fees for ERC20 tokens tend to be very high
- make sur about the withdrawal limits/KYC for the exchange platforms chosen
- OpenOcean
- pick up a server that allows me to run my bot 24/7 (Digital Ocean, AWS, Azure, CGS)

IF FLASHLOANS : Can I connect to a platform like DEFI PULSE get the best price for flashloans?
Or is it better to just get into Aave or Compound

Flashloan logic through Aave:

- Contract.sol calls the `LendingPool` contract, requesting a flash loan of a certain `amounts` of `reserves` using `flashloans()`
- await for the `LendingPool` to transfer the requested `amounts` of the `reserves` to my contract, then calls `executeOperation()` on my contract (or whatver contract I specify as being the `_receiver`)
- Now that my contract has the holding flash loaned `mounts`, I need to execute the code that will buy from an exchange and sell onto another one
  => if the buy/sell has worked properly, aka, if I made profit, then I transfer the flash loaned `amounts` of `reserves` back to the `LendingPool`
  => the `LendingPool` contract updates the relevant details of the reserves and pulls the flash loaned amount + fee
  => if the `amount` owed is not available (due to a lack of balance or approval) then the transaction reverts

What I need:
=> addresses, abi and fee information for each exchange
=> all token assets that I want to monitor, and their configuration
=> amount of money to risk for each trade

Smart contract used to buy one token on one exchange and sell the same token ona different exchange.
With a smart contract, only if both transactions are successfull is the strategy executed
https://cryptomarketpool.com/can-you-make-money-creating-an-arbitrage-bot-running-on-the-ethereum-blockchain/
https://cryptomarketpool.com/flash-loan-arbitrage-on-uniswap-and-sushiswap/

About using Ethereum logs as event (python):
https://cryptomarketpool.com/how-to-listen-for-ethereum-events-using-web3-in-python/