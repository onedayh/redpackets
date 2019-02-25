const WebSocket = require('ws');
var fs = require('fs');
var config = require('../../configuration.json');
class LitecoderWSServer {
    constructor() {
        this.socketInstance = null;
        this.serverInstance = null;
        this.socketConfig = config.socket;
        this.httpServ = (this.socketConfig.ssl) ? require('https') : require('http');
    }
    createServer(){
        if (this.serverInstance!=null) return;
        var app = null;
        if (this.socketConfig.ssl) {
            app = this.httpServ.createServer({
                // providing server with  SSL key/cert
                key: fs.readFileSync(this.socketConfig.ssl_key),
                cert: fs.readFileSync(this.socketConfig.ssl_cert)
            }, this.processRequest).listen(this.socketConfig.port);
        } else {
            app = this.httpServ.createServer(this.processRequest).listen(this.socketConfig.port);
        }
        this.serverInstance = new WebSocket.Server({ server: app });
        this.serverInstance.on('connection', wsConnect=>{
            console.log('client connected server');
            wsConnect.on("close", function (code, reason) {
                this.socketInstance = null;
                console.log("关闭连接")
            });
            wsConnect.on("error", function (code, reason) {
                this.socketInstance = null;
            });
            this.socketInstance = wsConnect;
            this.broadcastMessage('hello,this is a broadcast message');
            wsConnect.on('message', message =>{
                 wsConnect.send('welcome to join us!');
            });
        });
    }

    processRequest(req, res) {
        res.writeHead(200);
        res.end('All glory to WebSockets!\n');
    };

    getServer() {
        return this.serverInstance;
    }
    
    /**
     * 
     * @param {*} options 
     * options = { businessType: -1, businessId: -1, message: "", target: "" }
     */
    sendMessage(message) {
        //需要将对象转成字符串。WebSocket只支持文本和二进制数据
        if (this.instanceSocket != null)
            if (typeof message == "string")
                instanceSocket.send(message);
            else
                instanceSocket.send(JSON.stringify(message));
    }
    /*
    options = { businessType: -1, businessId: -1, message: "", target: "" }
    */
    broadcastMessage(message) {
        // Broadcast to everyone else.
        console.log('start broatcast message');
        console.log(this.serverInstance);
        if (this.serverInstance != null)
            this.serverInstance.clients.forEach(function each(client) {
                if (client.readyState === WebSocket.OPEN) {
                    if (typeof message == "string")
                        client.send(message);
                    else
                        client.send(JSON.stringify(message));
                }
            });
    }
}
exports = module.exports = new LitecoderWSServer();