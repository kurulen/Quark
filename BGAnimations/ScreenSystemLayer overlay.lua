local t = Def.ActorFrame {}
-- Controls the overlay ScreenSystemLayer
-- meant more for critical messages
-- this is mostly identical to the Til Death instance of this file
-- but is not stored in fallback in this condition due to the possibility of not supporting some features of this overlay
-- for example, we may not want to display downloads on the overlay or something else

-- Updates the frametime based on data in the globals script.
t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
                self:SetUpdateFunction(function(self)
                        TickSum = TickSum + 1
                        if TickSum >= MaxTicks then
                                TickSum = 1
                        end
                        FrameTime = TickSum / MaxTicks
                end)
                self:SetUpdateRate(TickRate)
        end
}
t[#t + 1] = Def.ActorFrame {
        Def.Sound {
                File = THEME:GetPathS("Common", "system message"),
                SoundSystemMessageMessageCommand = function(self)
                        self:play()
                end
        },
        Def.Quad {
                InitCommand = function(self)
                        self:zoomtowidth(SCREEN_WIDTH):zoomtoheight(50)
                            :horizalign(left):vertalign(top):y(SCREEN_TOP)
                            :diffuse(color("0,0,0,0"))
                end,
                OnCommand = function(self)
                        self:finishtweening():diffusealpha(0.85)
                end,
                OffCommand = function(self)
                        self:sleep(3):linear(0.5):diffusealpha(0)
                end
        },
        Def.BitmapText {
                Font = "Common Normal",
                Name = "Text",
                InitCommand = function(self)
                        self:maxwidth(SCREEN_WIDTH * 0.8):horizalign(left)
                            :vertalign(top):y(SCREEN_TOP + 10):x(SCREEN_LEFT +
                                                                     10)
                            :diffusealpha(0)
                end,
                OnCommand = function(self)
                        self:finishtweening():diffusealpha(1):zoom(0.5)
                end,
                OffCommand = function(self)
                        self:sleep(3):linear(0.5):diffusealpha(0)
                end
        },
        SystemMessageMessageCommand = function(self, params)
                self:GetChild("Text"):settext(params.Message)
                MESSAGEMAN:Broadcast("SoundSystemMessage")
                self:playcommand("On")
                if params.NoAnimate then self:finishtweening() end
                self:playcommand("Off")
        end,
        HideSystemMessageMessageCommand = function(self)
                self:finishtweening()
        end
}

-- song reload
local www = 1366 * 0.8
local hhh = SCREEN_HEIGHT * 0.8
local rtzoom = 0.6

local function dooting(self)
        if self:IsVisible() then
                self:GetChild("BGQframe"):queuecommand("dooting")
        end
end

local translated_info = {
        ItemsDownloading = "Downloading",
        ItemsLeftInQueue = "In Queue"
}

local dltzoom = 0.5
-- download queue/progress
t[#t + 1] = Def.ActorFrame {
        PausingDownloadsMessageCommand = function(self)
                self:visible(false)
        end,
        ResumingDownloadsMessageCommand = function(self)
                self:visible(false)
        end,
        AllDownloadsCompletedMessageCommand = function(self)
                self:visible(false)
        end,
        DLProgressAndQueueUpdateMessageCommand = function(self)
                self:visible(true)
        end,
        BeginCommand = function(self)
                self:SetUpdateFunction(dooting)
                self:visible(false)
                self:x(www / 8 + 10):y(SCREEN_TOP + hhh / 8 + 10)
        end,
        Def.Quad {
                Name = "BGQframe",
                InitCommand = function(self)
                        self:zoomto(www / 4, hhh / 4):diffuse(color(
                                                                  "0.1,0.1,0.1,0.8"))
                end,
                dootingCommand = function(self)
                        if isOver(self) then
                                self:GetParent():x(SCREEN_WIDTH -
                                                       self:GetParent():GetX())
                        end
                end
        },
        Def.BitmapText {
                Font = "Common Normal",
                InitCommand = function(self)
                        self:xy(-www / 8 + 10, -hhh / 8):diffusealpha(0.9)
                            :settext("5 items in queue:\ndoot\nmcscoot")
                            :maxwidth((www / 4 - 20) / dltzoom):halign(0)
                            :valign(0):zoom(dltzoom)
                end,
                DLProgressAndQueueUpdateMessageCommand = function(self, params)
                        self:settextf("%s %s\n%s\n\n%s %s:\n%s", params.dlsize,
                                      translated_info["ItemsDownloading"],
                                      params.dlprogress, params.queuesize,
                                      translated_info["ItemsLeftInQueue"],
                                      params.queuedpacks)
                        self:GetParent():GetChild("BGQframe"):zoomy(
                            self:GetHeight() - hhh / 4 + 10)
                end
        }
}

t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
                if Debug then
                        self:visible(true)
                else
                        self:visible(false)
                end
        end,
        Def.Quad {
                InitCommand = function(self)
                        self:xy(QuarkUnit(128).Horz, QuarkUnit(64).Vert)
                        self:zoomto(QuarkUnit(256).Horz, QuarkUnit(128).Vert)
                        self:diffuse(Palettes.StepMania.Gray)
                        self:diffusealpha(0.2)
                end
        },
        Def.BitmapText {
                Font = "Common normal",
                InitCommand = function(self)
                        self:xy(QuarkUnit(128).Horz, QuarkUnit(64).Vert)
                        self:zoom(FontSizes.Small)
                        self:diffusealpha(0.4)
                        self:settext(
                            "[/!\\DEBUG/!\\]\nFrameTime: " .. FrameTime * 1000 ..
                                "ms")
                        self:queuecommand("Update")
                end,
                UpdateCommand = function(self)
                        self:settext(
                            "[/!\\DEBUG/!\\]\nFrameTime: " .. FrameTime * 1000 ..
                                "ms")
                        self:sleep(1)
                        self:queuecommand("Update")
                end
        }
}

t[#t + 1] = Def.ActorFrame {
        DFRStartedMessageCommand = function(self) self:visible(true) end,
        DFRFinishedMessageCommand = function(self, params)
                self:visible(false)
        end,
        BeginCommand = function(self)
                self:visible(false)
                self:x(www / 8 + 10):y(SCREEN_BOTTOM - hhh / 8 - 70)
        end,
        Def.Quad {
                InitCommand = function(self)
                        self:zoomto(www / 4, hhh / 4):diffuse(color(
                                                                  "0.1,0.1,0.1,0.8"))
                end
        },
        Def.BitmapText {
                Font = "Common normal",
                InitCommand = function(self)
                        self:diffusealpha(0.9):settext(""):maxwidth((www / 4 -
                                                                        40) /
                                                                        rtzoom)
                            :zoom(rtzoom)
                end,
                DFRUpdateMessageCommand = function(self, params)
                        self:settext(params.txt)
                end
        }
}

return t
