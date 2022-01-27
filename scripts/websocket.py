import websockets

ws = websockets.WebSocket()
ws.connect("ws://echo.websocket.org", origin="testing_websockets.com")
ws.send("Hello, Server")
print(ws.recv())
ws.close()
