from fastapi import FastAPI
from .services.poller import start_poller

app = FastAPI()

@app.on_event("startup")
async def on_startup():
    start_poller()

@app.get("/")
async def hello():
    return {"status": "OK"}
