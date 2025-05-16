import os
from dotenv import load_dotenv
from web3 import Web3

load_dotenv()  # reads .env from cwd
RPC_URL = os.getenv("RPC_URL")
PRIVATE_KEY = os.getenv("WALLET_PRIVATE_KEY")

w3 = Web3(Web3.HTTPProvider(RPC_URL))
account = w3.eth.account.from_key(PRIVATE_KEY)

def execute_trade(...):
    # your signing logic here, e.g.
    tx = {...}
    signed = account.sign_transaction(tx)
    return w3.eth.send_raw_transaction(signed.rawTransaction)
