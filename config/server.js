import restify from 'restify';

const server = restify.createServer();

server.listen(3001, () => console.log('%s listening at %s', server.name, server.url));

export default server;
