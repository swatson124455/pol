import os, time, threading
from .wallet import execute_trade

INTERVAL = int(os.getenv("BET_INTERVAL_SECONDS", "60"))

def _poll_loop():
    while True:
        try:
            # your automated bet logic
            execute_trade(...)
        except Exception as e:
            print("Poller error:", e)
        time.sleep(INTERVAL)

def start_poller():
    thread = threading.Thread(target=_poll_loop, daemon=True)
    thread.start()
