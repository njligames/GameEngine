StackQueue = require("Stack")

function StackQueue:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end


local t = StackQueue:new()
print(t:isempty())
