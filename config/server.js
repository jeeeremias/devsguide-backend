import restify from 'restify';

import routes from './routes';

const server = restify.createServer();

routes(server);

server.listen(3001, () => console.log('%s listening at %s', server.name, server.url));

export default server;
