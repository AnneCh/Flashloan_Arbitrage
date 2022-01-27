==> WILL FIRST CREATE A SIMPLE ROBOT BTC/USD, THEN THE NEXT PROJECT WILL BE USING FLASHLOANS AND ARBITRAGE

0. This is my first portoflio project.

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

https://github.com/jaggedsoft/node-binance-api

USEFUL DATA

- withdrawal fees for ERC20 tokens tend to be very high
- make sur about the withdrawal limits/KYC for the exchange platforms chosen
- OpenOcean
- pick up a server that allows me to run my bot 24/7 (Digital Ocean, AWS, Azure, CGS)
