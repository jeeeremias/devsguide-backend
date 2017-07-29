export default function sayHello(server) {
  server.get('/hello', (req, res, next) => {
    res.send('Hello World!');
    return next();
  });
}
