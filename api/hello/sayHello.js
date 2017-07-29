import server from '../../config/server';

export default function sayHello() {
  server.get('/hello', (req, res, next) => {
    res.send('Hello World!');
    return next();
  });
}
