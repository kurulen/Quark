return Def.ActorFrame {
   LoadActor(THEME:GetPathG("ScreenSelectMusic", "ScrollBG")) .. {
      InitCommand=function(self)
	 self:Center()
	 self:addx(QuarkUnit(64).Horz)
	 self:zoomto(SCREEN_WIDTH+QuarkUnit(256).Horz,SCREEN_HEIGHT+QuarkUnit(64).Vert)
	 self:diffusealpha(0.8)
      end
								 },
   LoadActor(THEME:GetPathG("ScreenSelectMusic", "SectionTitle")) .. {
      InitCommand=function(self)
         self:Center()
         self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
         self:diffusealpha(0.8)
      end
								     },
   Def.BitmapText {
      Font = "Common normal",
      Text = "Select Music",
      InitCommand = function(self)
	 self:zoom(FontSizes.Medium)
	 self:xy(SCREEN_WIDTH-QuarkUnit(316).Horz,QuarkUnit(12).Vert)
      end
   },
   Def.BitmapText {
      Font = "Common normal",
      Text = "You can't decide, can you?",
      InitCommand = function(self)
         self:zoom(FontSizes.Small)
	 self:xy(SCREEN_WIDTH-QuarkUnit(184).Horz,QuarkUnit(28).Vert)
      end
   }
}
