from time import sleep
from binance import ThreadedWebsocketManager
from binance.client import Client
from os import dotenv

client = Client(API_KEY, API_SECRET, testnet=True)
