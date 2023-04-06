return Def.ActorFrame {
        LoadActor(THEME:GetPathG("ScreenOptionsMaster", "FG")) .. {
                InitCommand = function(self)
                        self:Center()
                        self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
                        self:diffusealpha(0.8)
                end
        }
}
