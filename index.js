var koa = require('koa');
var router = require('koa-router');
var mount = require('koa-mount');
var route = new router();
var app = koa();

// logger
app.use(function *(next){
  var start = new Date;
  yield next;
  var ms = new Date - start;
  console.log('%s %s - %s', this.method, this.url, ms);
});

var home = function *(next){
  this.body = 'Hello World';
};

var status = function *(next){
  this.type = 'json';
  this.status = 200;
  this.body = {status: 'ok'};
};

route.get('/', home);
route.get('/status', status);

app.use(mount('/', route.middleware()));

app.listen(3000);