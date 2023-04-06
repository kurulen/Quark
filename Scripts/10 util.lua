-- cannibalized from Rebirth-kl
-- basically an implementation of fold(1)
function fold(given, interval)
    local t={}
    for range=1,string.len(given),interval do
        if range+interval > string.len(given) then
            table.insert(t, string.sub(given, range, -1))
        else
            table.insert(t, string.sub(given, range, (range+interval)-1))
        end
    end
    return table.concat(t,"\n")
end

-- transforms a number to a quark unit
-- quark units are measurements of distance in this theme
--     mainly used for positioning things easier
function QuarkUnit(num)
   return {
      Horz = (num / (SCREEN_WIDTH - SAFE_WIDTH))*500,
      Vert = (num / (SCREEN_HEIGHT - SAFE_HEIGHT))*500
   }
end
