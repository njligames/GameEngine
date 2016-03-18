
--Test the functions for AbstractClock
local Test = {}

local function AbstractClock_AbstractClock_()
--//! [AbstractClock_AbstractClock_]
-- @TODO: Test: AbstractClock:AbstractClock()
--//! [AbstractClock_AbstractClock_]

end

local function AbstractClock_AbstractClock_copy()
--//! [AbstractClock_AbstractClock_copy]
-- @TODO: Test: AbstractClock:AbstractClock(copy)
--//! [AbstractClock_AbstractClock_copy]

end

local function AbstractClock_operator=_copy()
--//! [AbstractClock_operator=_copy]
-- @TODO: Test: AbstractClock:operator=(copy)
--//! [AbstractClock_operator=_copy]

end

local function AbstractClock_setRawTime_milliseconds()
--//! [AbstractClock_setRawTime_milliseconds]
-- @TODO: Test: AbstractClock:setRawTime(milliseconds)
--//! [AbstractClock_setRawTime_milliseconds]

end

local function AbstractClock_getRawTime_()
--//! [AbstractClock_getRawTime_]
-- @TODO: Test: AbstractClock:getRawTime()
--//! [AbstractClock_getRawTime_]

end

local function AbstractClock_update_milliseconds()
--//! [AbstractClock_update_milliseconds]
-- @TODO: Test: AbstractClock:update(milliseconds)
--//! [AbstractClock_update_milliseconds]

end


function Test:testAll()
	AbstractClock_AbstractClock_()
	AbstractClock_AbstractClock_copy()
	AbstractClock_operator=_copy()
	AbstractClock_setRawTime_milliseconds()
	AbstractClock_getRawTime_()
	AbstractClock_update_milliseconds()
end

return Test