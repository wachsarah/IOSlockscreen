const WebSocket = require('ws');
const readline = require('readline');
const wss = new WebSocket.Server({ port: 8080 });

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function eingabe() {
  rl.question('Eingabe: ', function (number) {
      wss.clients.forEach(function (ws) {
          if (ws.readyState === WebSocket.OPEN) {
              ws.send(number);
          }
      });

      eingabe();
  });
}

wss.on('connection', function (ws) {
  console.log("\nNeue Verbindung geöffnet\n");
});

eingabe();
