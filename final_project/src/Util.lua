--[[
Game development 50 Jungle Egg Rescue
Alex Park
]]

--[[
Dividing a picture with multiple sprites/textures within it into
quads, taking the tiles width and height
]]

function genQuads(picture, tilewidth, tileheight)
	local pictureWidth = picture:getWidth() / tilewidth
	local pictureHeight = picture:getHeight() / tileheight

	local pictureCounter = 1
	local pictureSheet = {}

	for y = 0, pictureHeight - 1 do
		for x = 0, pictureWidth - 1 do
			pictureSheet[pictureCounter] = 
				love.graphics.newQuad(x * tilewidth, y * tileheight, tilewidth,
				tileheight, picture:getDimensions())
			pictureCounter = pictureCounter + 1
		end
	end

	return pictureSheet
end

--[[
    Recursive table printing function.
    https://coronalabs.com/blog/2014/09/02/tutorial-printing-table-contents/
]]
function print_r ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end