# Readme Structure

## Introduction

## Installation

## Smart Contracts

## Other relevant documents

# Introduction

My first decentralized application will be a simple interface connecting individuals' crypto wallets to a trading bot that they can use to perform abritrage trades of any amount of a selected currency, through flashloans services provided by the Aave protocol.

The user will have to connect his metamask wallet

# Installation

_/_/ later/_/_

# Smart Contracts

Each smart contract has its own chapter, with a list of `variables`, `modifiers` and `functions` created for each smart contract

## Flashloan_logic.sol

### Variables

| Name | Type | Visibility | Description |

| -- | constructor | public | declares the \_addressProvider and set variable deadline |
| deadline | uint256 | -- | ? |
| owner | address | public | this contract's address |
| assets | Array addresses | -- | In calldata - The array of flash loaned assets used to repay debts |
| amounts | Array uint256 | | In calldata - The array of flash loaned asset amounts used to repay debts. |
| premiums | Array uint256 | | In calldata - premiums The array of premiums incurred as additional debts. |
| initiator | address | -- | The address that initiated the flash loan, unused |
| params | bytes | -- | In memory -The byte array containing, in this case, the arrays of aTokens and aTokenAmounts. |
| amountOwing | uint256 | -- | |
| receiverAddress | address | -- | this contract's address |
| onBehalfOf| address | -- | this contract's address |
| referralCode | uint256 | -- |
| modes | Array uint256 | -- |In memory |

### Functions

1. Mandatory functions to conform with Aave's receiver base contract and to call the Lending Pool to get a flashloan :

- executeOperation() is an external and override function returning a `boolean` confirming or not that the transaction has gone through (and that the flashloan has correctly been executed)

- \_flashloan() is the internal function that takes in the assets(tokens) and their amounts and calls the .flashloan() function from the LENDING_POOL

2. flashloanOwner() is the function that will be called by this contract; it's the intermediary function between userFlashloan() and \_flashloan. It takes in the params that the user enters and calls \_flashloan()

3. withdraw() external, called by the user when they want their gains withdrawn to their metamask wallet

4) userFlashloan() external = the function that the user will trigger to ask our contract to call the flashloan() on the Lending Pool

### Modifiers

1. onlyOwner() makes sure the person performing the transaction is the owner of the present contract
