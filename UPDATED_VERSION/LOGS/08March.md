# 09.03.22

I realized finally that I've been complicating things way too much by wondering how the

today I'll try to move forward in understanding the functions that my flashloan contract is supposed to perform.

I'm still unsure of the underlying mechanism for my bot. I am watching several videos and trying to understand how everything is supposed to act both on my and the end-user, if my app were to go live
Furucombo seems to be an interesting platform to check and understand how it works, see what I could try to reproduce.

===> I think I understand NOW!! The key factor that I had failed to understand, is that my Bot, aka my smart contract, is the one holding the profit accumulated by any user! And that the user can withdraw their profit when they want.

that mean that for any function dealing with money, my smart contract is going to be the only interface, and their metamask wallet only comes into play when initiating the strategy and withdrawing the gains

## FURUCOMBO

- lets users create their own strategies by using a method of drag and drop of blocks taht represent actions like `flashloan` or `swap` on `uniswap`. It looks like Scratch but for investing strategies.

- inform users that they need to have a minimum (0.09% of the borrowed amount if performing a flashloan on Aave for example) funds :
  for example, they need to provide a minimum to initiate the transaction + have some ETH to pay the transaction fees

- need for the user to approve the app (my app, or Furucombo in this case)

### Ressources:

https://etherscan.io/tx/0x01afae47b0c98731b5d20c776e58bd8ce5c2c89ed4bd3f8727fad3ebf32e9481/
https://docs.aave.com/developers/v/2.0/guides/flash-loans
https://github.com/PatrickAlphaC/aave-flashloan-mix/blob/master/contracts/v2/FlashloanV2.sol
https://docs.furucombo.app/

### Functions:

1. Mandatory functions to conform with Aave's receiver base contract and to call the Lending Pool to get a flashloan :

executeOperation() / flashloan()

2. withdraw() external, called by the user when they want their gains withdrawn to their metamask

3. userFlashloan() external = the function that the user will trigger to ask our contract to call the flashloan() on the Lending Pool

---

# 08.03.22

Working on smart contract building by understanding through listing each component that my smart contract is made of.

Contract Flashloan_Logic | FlashLoanReceiverBaseV2, withdrawable | A contract that allows to get a flashloan, execute an arbitrage trade through exchanges PancakeSwap and Uniswap (and maybe Binance)

| Name | Type | Visibility | Description |

| -- | constructor | public | declares the \_addressProvider and set variable deadline |
| deadline | uint256 | -- | |
| amountOwing | uint256 | -- | |
| referralCode | uint256 | -- | |
| params | bytes | -- | In memory |
| params | bytes | -- | In calldata |
| onBehalfOf| address | -- | |
| receiverAddress | address | -- | |
| initiatior | address | -- | |
| assets | Array addresses | -- | In calldata |
| amounts | Array uint256 | -- | In calldata |
| premiums | Array uint256 | -- | In calldata |
| modes | Array uint256 | -- |In memory |
| | | -- | |
| | | -- | |
