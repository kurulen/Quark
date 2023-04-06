return Def.ActorFrame {
   InitCommand=function(self)
      self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
   end,
   Def.Quad {
      InitCommand=function(self)
	 self:draworder(150)
	 self:zoomto(QuarkUnit(512).Horz,QuarkUnit(1).Vert)
	 self:diffuse(Palettes.StepMania.White)
	 self:diffuserightedge(Palettes.Special.Invisible)
	 self:xy(-QuarkUnit(655).Horz,-QuarkUnit(150).Vert)
      end
   },
   Def.Quad {
      InitCommand=function(self)
         self:draworder(150)
         self:zoomto(QuarkUnit(512).Horz,QuarkUnit(1).Vert)
	 self:diffuse(Palettes.StepMania.White)
         self:diffuserightedge(Palettes.Special.Invisible)
	 self:xy(-QuarkUnit(525).Horz,QuarkUnit(150).Vert)
      end
   },
   LoadActor("_scroller_bg.png") .. {
      InitCommand=function(self)
	 local offset = QuarkUnit(80).Horz
	 self:draworder(100)
	 self:x(offset)
	 self:zoomto(SCREEN_WIDTH+SAFE_WIDTH+offset,SCREEN_HEIGHT+SAFE_HEIGHT)
	 self:diffusealpha(0.9)
      end
				    },
   LoadActor("_scroller_bg.png") .. {
      InitCommand=function(self)
         local offset = QuarkUnit(-80).Horz
	 self:draworder(100)
	 self:baserotationz(180)
	 self:x(offset)
         self:zoomto(SCREEN_WIDTH+SAFE_WIDTH+math.abs(offset),SCREEN_HEIGHT+SAFE_HEIGHT)
         self:diffusealpha(0.9)
      end
                                    },
   LoadActor("_logo.png") .. {
      InitCommand=function(self)
	 self:draworder(150)
	 self:x(QuarkUnit(454).Horz)
	 self:addy(-QuarkUnit(94).Vert)
	 self:zoomto(384*0.8,384*0.8)
	 self:diffusealpha(1)
      end
			     },
   Def.BitmapText {
      Font = "Common normal",
      InitCommand=function(self)
	 self:draworder(200)
	 self:zoom(FontSizes.Small)
	 self:xy(QuarkUnit(516).Horz,QuarkUnit(190).Vert)
	 self:settext("Quark v!! (!!!!!!!!)\nMade by !!!!!!!!!!!!!!!!!!!!!!!!")
	 self:playcommand("UpdateText")
      end,
      UpdateTextCommand=function(self)
	 self:settext("Quark r" .. ThemeInfo.Release .. " (" .. ThemeInfo.Codename .. ")\nMade by " .. ThemeInfo.Author)
      end,
      CodeMessageCommand=function(self,params)
	 if params.Name == "EnableDebug" then
	    if ReadGamePrefFromFile("Quark_DebugEnabled") ~= "true" then
	       WriteGamePrefToFile("Quark_DebugEnabled", "true")
	       SCREENMAN:SystemMessage("You are now a developer!\nRestart to apply changes.")
	    else
	       WriteGamePrefToFile("Quark_DebugEnabled", "false")
	       SCREENMAN:SystemMessage("You are no longer a developer.\nRestart to apply changes.")
	    end
	 end
      end
   }
}
