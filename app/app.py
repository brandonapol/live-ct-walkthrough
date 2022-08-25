from fastapi import FastAPI, Request
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse


app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")


@app.get('/')
async def root():
    return FileResponse("index.html")

@app.get('/getdata')
async def getdata():
    return {'hello': 'Lucas'}
