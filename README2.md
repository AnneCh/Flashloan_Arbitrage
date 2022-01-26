Other version of the bot, if we make it very simple

Bot would only trade BTC/USD
It would have only two state : BUY or SELL
It would use fixed thresholds for buying and selling

Strategy:

Every X seconds:

- What is the next operation?
    If BUY => Has the price dropped according to our threshold?
        If YES => place a buy order and update the next operation to SELL
        If NO => Has the price gone up enough to indicate a trend?
            => if YES => place a buy order and update the next operation to SELL
            => If NO => do nothing
    If SELL => Have I made the profit I want ? (threshold) 
        if YES => place SELL order and update state for next operation to be BUY
        if NO => has the price gone down enough to indicate a trend?
            if YES => place SELL order and update state for next operation to be BUY
            if NO => do nothing


State of the bot:
enum STATE { BUY, SELL}

I need 4 thresholds, two for each states 

If bot STATE = SELL, then next operation is to buy:
    DIP_THRESHOLD = buy the asset if price has decreased by more than the threshold (buy low, sell high)
    UPWARD_TREND_THRESHOLD = buy the asset if its price has increased by more than the threshold (dont want to miss an opportunity to buy before it goes even higher)

If bot STATE = BUY, then next operation is to sell:
    PROFIT_THRESHOLD = sell asset if price has increased above the threshold since we bought it
    STOP_LOSS_THRESHOLD = sell if the price keeps going down


FUNCTIONS NEEDED :
    getBalances(): get request to exchange API for my account's balances
                    returns BALANCE
    getMarketPrice(): get request to exchange API for current price of the asset
                        return MARKET PRICE
    placeSellOrder(): 1. calculate amount to sell (based on set threshold, ex 50% of total balance)
                      2. send a POST request to exchange API to do a SELL operation
                      RETURN price at operation execution
    placeBuyOrder(): 1. calculate the amount to buy (based on threshold, ex 50% of balance)
                     2. send a POST request to exchange API to do a BUY operation
                     RETURN Price at operation execution

    getOperationDetails(string operationId): GET request to API for the details of an operation
                                             RETURN details of the operation


LOOP
*need an infinite loop with some sleep time, example 30sec*

Example :
    function startBot():
        Inifinite LOOP:
            attemptToMakeTrade()
            sleep(30 seconds)

bool isNextOperationBuy = True

const UPWARD_TREND_THRESHOLD = 1.5
const DIP_THRESHOLD = -2

const PROFIT_THRESHOLD = 1.25
const STOP_LOSS_THRESHOLD = -2

float lastOpPrice = 100.00



function attemptToMakeTade():
    float currentPrice = getMarketPrice()
    float percentageDiff = (currentPrice - lastOpPrice)/lastOpPrice*100
    if isNextOperationBuy:
        tryToBuy(percentageDiff)
    Else:
        tryToSell(percentageDiff)

function tryToBuy(float percentageDiff):
    IF percentageDiff >= UPWARD_TREND_THRESHOLD OR percentageDiff <= DIP_THRESHOLD:
        lastOpPrice = placeBuyOrder()
        isNextOperationBuy = False

function tryToSell(float percentageDiff):
    if percentageDiff >= PROFITE_THRESHOLD or percentageDiff <= STOP_LOSS_THRESHOLD:
        lastOpPrice = placeSellOrder()
        isNextOperationBuy = True


**LOGS are important to have to keep track of the bot's operations** 
EXAMPLE :
[BALANCE] USD Balance = 22.15$
[BUY] Bought 0.002 BTC for 22.15 USD
[PRICE] Last Operation Price updated to 11,171.40 (BTC/USD)
[ERROR] Could not perform SELL operation - Insufficient balance
+ add a timestamp to it

function createLog(string msg): prints a message to terminal + appends message to log file with timestamp

**in order to identify trends, I need to keep a light database of the price fluctuations, it can be a .txt or .json file depending on how many values to store** 

Also need a dashboard to visualize operations 
    => requires the bot to be connected to a web server/API

*Many exchanges will offer you access to past price data, as well as you can usually easily get that data elsewhere if you need to.*
*This is very useful if you want to test your strategy before putting it to action. You can run a simulation of your bot with past data and “fake money” to see how well your defined thresholds would have worked and adjust them for the real deal.* 

RESEARCH on the difference between MARKET ORDERS and LIMIT ORDERS