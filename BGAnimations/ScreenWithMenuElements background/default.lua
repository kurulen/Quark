local t = Def.ActorFrame {}

t[#t + 1] = Def.ActorFrame {
        InitCommand = function(self)
                self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
                self:SetFOV(90)
                self:fov(90)
        end,
        LoadActor("_horzstripe.png") .. {
                InitCommand = function(self)
                        self:zoomto(SCREEN_WIDTH + SAFE_WIDTH,
                                    SCREEN_HEIGHT + SAFE_HEIGHT)
                        self:texcoordvelocity(0, -0.3)
                end
        },
        LoadActor("_bg_over.png") .. {
                InitCommand = function(self)
                        self:zoomto(SCREEN_WIDTH * 2 + SAFE_WIDTH * 2,
                                    SCREEN_HEIGHT * 2 + SAFE_HEIGHT * 2)
                        self:z(-256)
                end
        },
        LoadActor("_2bg_over.png") .. {
                InitCommand = function(self)
                        self:zoomto(SCREEN_HEIGHT * 1.85 + SAFE_HEIGHT * 1.85,
                                    SCREEN_HEIGHT * 1.85 + SAFE_HEIGHT * 1.85)
                        self:z(-256)
                        self:queuecommand("Animate")
                end,
                AnimateCommand = function(self)
                        self:smooth(AnimDurations.Long)
                        self:addrotationz(360)
                        self:sleep(AnimDurations.Short)
                        self:queuecommand("Animate")
                end
        },
        LoadActor("_bg.png") .. {
                InitCommand = function(self)
                        self:zoomto(SCREEN_WIDTH * 3 + SAFE_WIDTH * 2,
                                    SCREEN_HEIGHT * 3 + SAFE_HEIGHT * 2)
                        self:z(-512)
                        self:diffusealpha(0.8)
                        self:blend("BlendMode_Add")
                end
        }
}

return t
