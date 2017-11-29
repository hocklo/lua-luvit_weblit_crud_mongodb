local weblit = require('weblit')
local greeting_controller = require('controllers.greeting_controller')

-- Add controllers to the server instace.
function addControllers(server)
    server = greeting_controller.routes(server)
    return server
end

-- Init server
local server = weblit.app
  .bind({host = '127.0.0.1', port = 1337})
  -- Configure weblit server
  .use(weblit.logger)
  .use(weblit.autoHeaders)

-- Configure the controllers.
server = addControllers(server)

-- Start the server
server.start()
