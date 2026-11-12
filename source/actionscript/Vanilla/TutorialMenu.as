class TutorialMenu extends MovieClip
{
   var AmiiboArtImage_mc;
   var AmiiboArtPlaceholder_mc;
   var ButtonArtHolder;
   var ButtonHolder;
   var ButtonRect;
   var HelpScrollingText;
   var HelpText;
   var HelpTitle;
   var NFCTouchpointImage_mc;
   var AmiiboImagesByLanguage = [null,"AmiiboTouch_US_EN","AmiiboTouch_EU_FR","AmiiboTouch_EU_IT","AmiiboTouch_EU_DE","AmiiboTouch_EU_ES","AmiiboTouch_US_ES",null,"AmiiboTouch_JA",null,"AmiiboTouch_EU_PT","AmiiboTouch_BR_PT","AmiiboTouch_EU_RU",null,"AmiiboTouch_TW"];
   var ENGLISH_INDEX = 1;
   function TutorialMenu()
   {
      super();
      this.HelpScrollingText = this.HelpText;
      this.ButtonHolder = this.ButtonArtHolder;
      this.NFCTouchpointImage_mc = this.NFCTouchpointImage_mc;
      this.AmiiboArtPlaceholder_mc = this.NFCTouchpointImage_mc.AmiiboArtPlaceholder_mc;
      Shared.ButtonMapping.Initialize("TutorialMenu");
      this.NFCTouchpointImage_mc._visible = false;
   }
   function InitExtensions()
   {
      trace("TutorialMenu::InitExtensions");
      Stage.scaleMode = "showAll";
      this.HelpTitle.textAutoSize = "shrink";
      this.ButtonRect.ExitMouseButton.addEventListener("press",this,"onExitPress");
      this.ButtonRect.ExitMouseButton.SetPlatform(0,false);
      gfx.managers.FocusHandler.instance.setFocus(this.HelpScrollingText,0);
   }
   function SetPlatform(aiPlatform, abPS3Switch)
   {
      trace("TutorialMenu::SetPlatform");
      this.ButtonRect.ExitGamepadButton._visible = aiPlatform != 0 && aiPlatform != 7;
      this.ButtonRect.ExitMouseButton._visible = aiPlatform == 0 || aiPlatform == 7;
      var _loc3_;
      if(aiPlatform != 0)
      {
         this.ButtonRect.ExitGamepadButton.SetPlatform(aiPlatform,abPS3Switch);
         this.ButtonRect.ExitMouseButton.SetPlatform(aiPlatform,false);
         this.ButtonHolder.SetPlatform(aiPlatform,abPS3Switch);
      }
      else
      {
         _loc3_ = this.ButtonRect.ExitMouseButton;
         Shared.ButtonMapping.CorrectLabel(_loc3_);
      }
   }
   function ApplyButtonArt()
   {
      trace("TutorialMenu::ApplyButtonArt");
      var _loc2_ = this.ButtonHolder.CreateButtonArt(this.HelpScrollingText.textField);
      if(_loc2_ != undefined)
      {
         this.HelpScrollingText.textField.html = true;
         this.HelpScrollingText.textField.htmlText = _loc2_;
      }
   }
   function ShowAmiiboArt(languageIndex)
   {
      var _loc2_ = languageIndex >= this.AmiiboImagesByLanguage.length ? this.AmiiboImagesByLanguage[this.ENGLISH_INDEX] : this.AmiiboImagesByLanguage[languageIndex];
      if(_loc2_ == null)
      {
         _loc2_ = this.AmiiboImagesByLanguage[this.ENGLISH_INDEX];
      }
      this.AmiiboArtImage_mc = this.AmiiboArtPlaceholder_mc.attachMovie(_loc2_,"AmiiboNFCArt",this.AmiiboArtPlaceholder_mc.getNextHighestDepth(),{_height:this.AmiiboArtPlaceholder_mc._height,_width:this.AmiiboArtPlaceholder_mc._width});
      this.NFCTouchpointImage_mc._visible = true;
   }
   function HideAmiiboArt()
   {
      if(undefined != this.AmiiboArtPlaceholder_mc)
      {
         this.AmiiboArtPlaceholder_mc.removeMovieClip();
      }
      this.NFCTouchpointImage_mc._visible = false;
   }
   function onExitPress()
   {
      trace("TutorialMenu::onExitPress");
      gfx.io.GameDelegate.call("CloseMenu",[]);
   }
}
