--
-- Created by IntelliJ IDEA.
-- User: hocklo
-- Date: 29/11/17
-- Time: 21:37
-- To change this template use File | Settings | File Templates.
--
dofile 'luvit-loader.lua'

greeting_controller = {}

local store = {}
local json = require('json').use_lpeg()

function greeting_controller.routes(server)

    return server.route({ method = 'GET', path = '/books/' }, function(req, res)
        res.body = getAll()
        res.code = 200
        res.headers['Content-Type'] = 'application/json'
    end).route({ method = 'POST', path = '/books/' }, function(req, res)
        res.body = set(req.body)
        res.code = 201
        res.headers['Content-Type'] = 'application/json'
    end).route({ method = 'GET', path = '/books/:id' }, function(req, res)
        res.body = get(req.params.id)
        res.code = 200
        res.headers['Content-Type'] = 'application/json'
    end).route({ method = 'DELETE', path = '/books/:id' }, function(req, res)
        res.body = delete(req.params.id)
        res.code = 200
        res.headers['Content-Type'] = 'application/json'
    end)
end

function getAll()
    return json.stringify(store)
end

function get(id)
    return json.stringify(store[tostring(id)])
end

function set(content)
    local obj = json.parse(content)
    store[tostring(obj.id)] = obj
end

function delete(id)
    table.remove(store, id)
end

return greeting_controller
