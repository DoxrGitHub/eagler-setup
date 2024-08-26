const { exec, spawn } = require('child_process');

function wait(ms){ // because I'm not willing to properly wait for commands to be over
   var start = new Date().getTime();
   var end = start;
   while(end < start + ms) {
     end = new Date().getTime();
  }
}

console.log("[EAGSETUP] create script file")
exec('cd /tmp/ && touch script.sh')
wait(200)

console.log("[EAGSETUP] download & run script")
const dl_run = exec('rm -f /tmp/script.sh && curl -H \'Cache-Control: no-cache\' -s https://raw.githubusercontent.com/DoxrGitHub/eagler-setup/main/script.sh -o /tmp/script.sh && chmod +x /tmp/script.sh && cd /tmp/ && bash /tmp/script.sh && cp -r /tmp/eaglercraftx/ ' + process.cwd() + ' && cd ' + process.cwd())

dl_run.stdout.on('data', (data) => {
  if (`${data}` !== '[internal] completed') {
    console.log(`${data}`);
  } else {
    console.log("done!")
  }
});

dl_run.stderr.on('data', (data) => {
  console.error(`${data}`);
});

dl_run.on('error', (error) => {
  console.error(`error: ${error.message}`);
});