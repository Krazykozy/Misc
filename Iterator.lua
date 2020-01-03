--[[
    A library providing advanced iterator support and better optimizations for iterator-based operations.
]]

_libs = _libs or {}
_libs.iterators = true
_libs.tables = _libs.tables or require('tables')

_raw = _raw or {}
_raw.table = _raw.table or {}

iterator = {}

_meta = _meta or {}
_meta.I = {}

function class(o)
    local mt = getmetatable(o)

    return mt and mt.__class or type(o)
end

_meta.I.__index = function(l, k)
    if type(k) == 'number' then
        k = k < 0 and l.n + k + 1 or k

        return rawget(l, k)
    end

    return iterator[k] or table[k]
end
_meta.I.__newindex = function(l, k, v)
    if type(k) == 'number' then
        k = k < 0 and l.n + k + 1 or k

        if k >= 1 and k <= l.n then
            rawset(l, k, v)
        else
            (warning or print)('Trying to assign outside of iterator range (%u/%u): %s':format(k, l.n, tostring(v)))
        end

    else
        (warning or print)('Trying to assign to non-numerical iterator index:', k)

    end
end
_meta.I.__class = 'iterator'

function I(t)
    local l = {
            pos=1,
            n=0,
            v={}
        }
    if class(t) == 'table' then
        for i,v in pairs(t) do
            l.v[(#l.v + 1)] = v
        end
    end

    l.n = #l.v
	l.pos = 1
    return setmetatable(l, _meta.I)
end

function iterator.length(l)
    return l.n
end

function iterator.position(l)
    return l.pos
end

function iterator.current(l)
	if l.v[l.pos] ~= nil then
    	return l.v[l.pos]
    else
    	return false
    end
end

function iterator.next(l)
	l.pos = l.pos + 1
	if l.pos > #l.v then
		l.pos = 1
	end
    return l.pos
end

function iterator.previous(l)
	l.pos = l.pos - 1
	if l.pos < 1 then
		l.pos = l.n
	end
    return l.pos
end

function iterator.jumpTo(l, value)
	if l.v[value] ~= nil then
		l.pos = value
    	return true
    else
    	return false
    end
end

function iterator.setTo(l, value)
	for i,v in pairs(l.v) do
		if v == value then
			l.pos = i
			return true
		end
	end
	return false
end