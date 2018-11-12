sound = true
music = true
width = love.graphics.getWidth()
height = love.graphics.getHeight()
unit = math.floor(width/30)
radius = unit/2.5
reswapCost = 50
updateCost = 100

function string:split(delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end
