Stack =
{
    __top = 0,
    __data = {},
}

function Stack:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Stack:push(value)
    self.__top = self.__top + 1
    self.__data[self.__top] = value
end

function Stack:pop()
    local value = nil
    if self.__top > 0 then
        value = self.__data[self.__top]
        self.__top = self.__top - 1
    end
    return value
end

function Stack:top()
    local value = nil
    if self.__top > 0 then
        value = self.__data[self.__top]
    end
    return value
end

function Stack:isempty()
    return (#self.__data == 0)
end


return Stack

