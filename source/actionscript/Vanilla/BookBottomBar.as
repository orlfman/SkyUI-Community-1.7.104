class BookBottomBar extends MovieClip
{
   var ButtonRect;
   var PageTurnButton;
   var TakeButton;
   static var PLATFORM_NX = 6;
   static var PLATFORM_NX_MOUSE = 7;
   function BookBottomBar()
   {
      super();
      this.PageTurnButton = this.ButtonRect.TurnPageButtonInstance;
      this.TakeButton = this.ButtonRect.TakeButtonInstance;
   }
   function InitExtensions()
   {
      Stage.scaleMode = "showAll";
      gfx.io.GameDelegate.addCallBack("ShowTakeButton",this,"ShowTakeButton");
      gfx.io.GameDelegate.addCallBack("UpdateTurnPagesButton",this,"UpdateTurnPagesButton");
      Shared.GlobalFunc.SetLockFunction();
      MovieClip(this).Lock("B");
      this._y -= 3;
   }
   function ShowTakeButton(abShow, abSteal)
   {
      this.TakeButton.visible = abShow;
      this.TakeButton.label = !abSteal ? "$Take" : "$Steal";
   }
   function SetPlatform(aiPlatformIndex, abPS3Switch)
   {
      this.PageTurnButton.SetPlatform(aiPlatformIndex,abPS3Switch);
      this.TakeButton.SetPlatform(aiPlatformIndex,abPS3Switch);
   }
   function UpdateTurnPagesButton(astrButtonId)
   {
      this.PageTurnButton.NXArt = astrButtonId;
      this.PageTurnButton.RefreshArt();
   }
}
