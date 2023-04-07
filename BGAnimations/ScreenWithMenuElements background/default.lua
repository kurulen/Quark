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
        LoadActor("aperture/ring.png") .. {
                InitCommand = function(self)
                        self:zoomto(SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2,
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2)
                        self:z(-256)
                end
        },
        Def.ActorFrame {
                LoadActor("aperture/lens_1.png") .. {
                        InitCommand = function(self)
                                self:zoomto(
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2,
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2)
                                self:visible(true)
                                self:z(-256)
                                self:queuecommand("Animate")
                        end,
                        AnimateCommand = function(self)
                                self:smooth(AnimDurations.Long * 2)
                                self:addrotationz(360 * 2)
                                self:sleep(AnimDurations.Short)
                                self:queuecommand("Animate")
                        end
                }, LoadActor("aperture/lens_2.png") .. {
                        InitCommand = function(self)
                                self:zoomto(
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2,
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2)
                                self:visible(true)
                                self:z(-256)
                                self:queuecommand("Animate")
                        end,
                        AnimateCommand = function(self)
                                self:smooth(AnimDurations.Long * 2)
                                self:addrotationz(360 * 2)
                                self:sleep(AnimDurations.Short)
                                self:queuecommand("Animate")
                        end
                }, LoadActor("aperture/lens_3.png") .. {
                        InitCommand = function(self)
                                self:zoomto(
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2,
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2)
                                self:visible(true)
                                self:z(-256)
                                self:queuecommand("Animate")
                        end,
                        AnimateCommand = function(self)
                                self:smooth(AnimDurations.Long * 2)
                                self:addrotationz(360 * 2)
                                self:sleep(AnimDurations.Short)
                                self:queuecommand("Animate")
                        end
                }, LoadActor("aperture/lens_4.png") .. {
                        InitCommand = function(self)
                                self:zoomto(
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2,
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2)
                                self:visible(true)
                                self:z(-256)
                                self:queuecommand("Animate")
                        end,
                        AnimateCommand = function(self)
                                self:smooth(AnimDurations.Long * 2)
                                self:addrotationz(360 * 2)
                                self:sleep(AnimDurations.Short)
                                self:queuecommand("Animate")
                        end
                }, LoadActor("aperture/lens_5.png") .. {
                        InitCommand = function(self)
                                self:zoomto(
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2,
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2)
                                self:visible(true)
                                self:z(-256)
                                self:queuecommand("Animate")
                        end,
                        AnimateCommand = function(self)
                                self:smooth(AnimDurations.Long * 2)
                                self:addrotationz(360 * 2)
                                self:sleep(AnimDurations.Short)
                                self:queuecommand("Animate")
                        end
                }, LoadActor("aperture/lens_6.png") .. {
                        InitCommand = function(self)
                                self:zoomto(
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2,
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2)
                                self:visible(true)
                                self:z(-256)
                                self:queuecommand("Animate")
                        end,
                        AnimateCommand = function(self)
                                self:smooth(AnimDurations.Long * 2)
                                self:addrotationz(360 * 2)
                                self:sleep(AnimDurations.Short)
                                self:queuecommand("Animate")
                        end
                }, LoadActor("aperture/lens_7.png") .. {
                        InitCommand = function(self)
                                self:zoomto(
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2,
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2)
                                self:visible(true)
                                self:z(-256)
                                self:queuecommand("Animate")
                        end,
                        AnimateCommand = function(self)
                                self:smooth(AnimDurations.Long * 2)
                                self:addrotationz(360 * 2)
                                self:sleep(AnimDurations.Short)
                                self:queuecommand("Animate")
                        end
                }, LoadActor("aperture/lens_8.png") .. {
                        InitCommand = function(self)
                                self:zoomto(
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2,
                                    SCREEN_HEIGHT * 2.2 + SAFE_HEIGHT * 2.2)
                                self:visible(true)
                                self:z(-256)
                                self:queuecommand("Animate")
                        end,
                        AnimateCommand = function(self)
                                self:smooth(AnimDurations.Long * 2)
                                self:addrotationz(360 * 2)
                                self:sleep(AnimDurations.Short)
                                self:queuecommand("Animate")
                        end
                }
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
