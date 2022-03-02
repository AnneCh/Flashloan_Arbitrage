## 01 March

I want to figure out what is the minimum requirements regarding what I need to write in Smart Contracts.
Because, as per my understanding, Smart Contracts (solidity) only are useful when we want to interact with the BlockChain in general.

But to interact with platforms that interact with the BlockChain, I do not beleive that it needs to be a smart contract, as we don't interact directly.

It would save gas to have as many offline functions as possible, connecting to the APIs to find the fetch the latest prices shouldn't be a Smart Contract piece of code to write.

There seem to be a lot of different pieces to put together and I'm not fully getting which piece of code/element/actor is doing what.

I need to redraw the big picture of the App that I'm trying to build, figure out the research that I have to do

# Actors

- My smart contracts (this very same bot)
- The Lending Pool and Flashloan service from Aave (into smart contract)
- Exchanges
- Users

# Actions

- User selects asset, amount to be flashloaned, % in price difference and exchanges to perform the buy/sell action
- 'Uploads' strategy to the bot and that triggers our bot to kick start fetching prices from selected Exchanges on selected Tokens

- my smart contract calls the lending pool
- my smart contract pays back the lending pool
- the lending pool only interact with my smart contract

- lended asset will be used to buy an amount of other asset (or same?) on selected exchange

# Permissions

### QUESTIONS

- When the trades are successful, where are the benefits stored? Is it in some escrow contract that the `User` can call a withdraw function from in order to have his benefits deposited into his Metamask?
