local gc = Var("GameCommand")
-- A scroller that can be loaded from elsewhere
-- It is placed into redir files to save space

return Def.ActorFrame {
        LoadFont("Common Normal") .. {
                OnCommand = function(self)
                        self:zoom(FontSizes.Small)
                        self:settext(THEME:GetString(
                                         SCREENMAN:GetTopScreen():GetName(),
                                         gc:GetText()))
                end,
                GainFocusCommand = function(self)
                        self:y(-MaxDistance.Vert)
                        self:smooth(AnimDurations.Short)
                        self:addy(MaxDistance.Vert)
                end,
                LoseFocusCommand = function(self)
                        self:smooth(AnimDurations.Short)
                        self:y(MaxDistance.Vert)
                end
        }
}
