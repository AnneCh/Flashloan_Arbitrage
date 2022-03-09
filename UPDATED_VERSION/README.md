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

| Name | Type | Visibility | Description |

| -- | constructor | public | declares the \_addressProvider and set variable deadline |
| deadline | uint256 | -- | |
| amountOwing | uint256 | -- | |
| referralCode | uint256 | -- | |
| params | bytes | -- | In memory -The byte array containing, in this case, the arrays of aTokens and aTokenAmounts. |
| params | bytes | -- | In calldata |
| onBehalfOf| address | -- | |
| receiverAddress | address | -- | |
| initiatior | address | | The address that initiated the flash loan, unused. |
| assets | Array addresses | -- | In calldata - The array of flash loaned assets used to repay debts |
| amounts | Array uint256 | | In calldata - The array of flash loaned asset amounts used to repay debts. |
| premiums | Array uint256 | | In calldata - premiums The array of premiums incurred as additional debts. |
| modes | Array uint256 | -- |In memory |

### Functions

1. Mandatory functions to conform with Aave's receiver base contract and to call the Lending Pool to get a flashloan :

executeOperation() / flashloan()

2. withdraw() external, called by the user when they want their gains withdrawn to their metamask

3. userFlashloan() external = the function that the user will trigger to ask our contract to call the flashloan() on the Lending Pool
