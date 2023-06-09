local t = Def.ActorFrame {}
-- Controls the song search relevant children of the ScreenSelectMusic decorations actorframe

local active = false
local lastsearchstring = ""
local searchstring = ""
local whee

-- imagine making a text input field just a regex char match of keyboard presses
local function searcher(event)
        if event.type ~= "InputEventType_Release" and active == true then
                if event.button == "Back" then
                        searchstring = ""
                        whee:SongSearch(searchstring)
                        MESSAGEMAN:Broadcast("EndingSearch")
                elseif event.button == "Start" then
                        if not instantSearch then
                                whee:SongSearch(searchstring)
                        end
                        MESSAGEMAN:Broadcast("EndingSearch")
                elseif event.DeviceInput.button == "DeviceButton_space" then -- add space to the string
                        searchstring = searchstring .. " "
                elseif event.DeviceInput.button == "DeviceButton_backspace" then
                        searchstring = searchstring:sub(1, -2) -- remove the last element of the string
                elseif event.DeviceInput.button == "DeviceButton_delete" then
                        searchstring = ""
                else
                        local CtrlPressed = INPUTFILTER:IsControlPressed()
                        if event.DeviceInput.button == "DeviceButton_v" and
                            CtrlPressed then
                                searchstring = searchstring ..
                                                   Arch.getClipboard()
                        elseif -- if not nil and (not a number or (ctrl pressed and not online))
                        event.char and event.char:match(
                            '[%%%+%-%!%@%#%$%^%&%*%(%)%=%_%.%,%:%;%\'%"%>%<%?%/%~%|%w%[%]%{%}%`%\\]') and
                            (not tonumber(event.char) or CtrlPressed) then
                                searchstring = searchstring .. event.char
                        end
                end
                if lastsearchstring ~= searchstring then
                        MESSAGEMAN:Broadcast("UpdateString")
                        if instantSearch then
                                whee:SongSearch(searchstring)
                        end
                        lastsearchstring = searchstring
                end
        elseif event.type == "InputEventType_FirstPress" and active == false then
                if tonumber(event.char) == 4 then
                        MESSAGEMAN:Broadcast("StartingSearch")
                end
        end
end

t[#t + 1] = LoadActor(THEME:GetPathG("ScreenSelectMusic", "SearchBG")) .. {
        InitCommand = function(self)
                self:Center()
                self:visible(true)
                self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
                self:diffusealpha(0.8)
        end
}

t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
                self:xy(SCREEN_WIDTH - QuarkUnit(192).Horz, QuarkUnit(96).Vert)
        end,
        OnCommand = function(self)
                SCREENMAN:GetTopScreen():AddInputCallback(searcher)
                whee = SCREENMAN:GetTopScreen():GetMusicWheel()
        end,
        EndingSearchMessageCommand = function(self)
                active = false
                self:playcommand("Set")
                SCREENMAN:set_input_redirected(PLAYER_1, false)
        end,
        StartingSearchMessageCommand = function(self)
                active = true
                self:playcommand("Set")
                SCREENMAN:set_input_redirected(PLAYER_1, true)
        end,

        LoadFont("Common Normal") .. {
                InitCommand = function(self)
                        self:zoom(FontSizes.Small)
                        self:settext("Title Filter (4)")
                end
        },
        Def.BitmapText {
                Font = "Common normal",
                Name = "SearchInput",
                InitCommand = function(self)
                        self:y(QuarkUnit(16).Vert)
                        self:maxwidth(QuarkUnit(486).Horz)
                        self:zoom(FontSizes.Small)
                end,
                SetCommand = function(self)
                        self:settext(searchstring)
                end,
                UpdateStringMessageCommand = function(self)
                        self:playcommand("Set")
                end
        },
        LoadFont("Common Normal") .. {
                Name = "SearchActive",
                InitCommand = function(self)
                        self:y(QuarkUnit(32).Vert):zoom(FontSizes.XSmall)
                            :settext("ACTIVE"):visible(false)
                end,
                SetCommand = function(self) self:visible(active) end
        }
}

return t
