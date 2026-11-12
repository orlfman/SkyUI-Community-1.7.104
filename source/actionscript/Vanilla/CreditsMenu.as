class CreditsMenu extends MovieClip
{
   var CreditsText2_tf;
   var CreditsText_tf;
   var iUpTimerID;
   var textField;
   var textField2;
   var CreditsText2HasText = false;
   static var EndY = -100;
   static var TextYRate = 1;
   function CreditsMenu()
   {
      super();
      this.CreditsText_tf = this.textField;
      this.CreditsText_tf.verticalAutoSize = "top";
      this.CreditsText2_tf = this.textField2;
      this.CreditsText2_tf.verticalAutoSize = "top";
      Mouse.addListener(this);
      gfx.managers.FocusHandler.instance.setFocus(this,0);
   }
   function onCodeObjectInit()
   {
      this.CreditsText_tf.SetText(" ",true);
      this.CreditsText2_tf.SetText("",true);
      _root.CodeObj.requestCredits(this.CreditsText_tf,this.CreditsText2_tf);
      CreditsMenu.TextYRate = _root.CodeObj.getScrollSpeed();
      this.CreditsText2HasText = this.CreditsText2_tf.text.length > 0;
   }
   function onEnterFrame()
   {
      if(this.iUpTimerID == undefined)
      {
         this.CreditsText_tf._y -= CreditsMenu.TextYRate;
         if(this.CreditsText2HasText && this.CreditsText_tf._y + this.CreditsText_tf._height <= Stage.height)
         {
            this.CreditsText2_tf._y -= CreditsMenu.TextYRate;
         }
      }
      if(!this.CreditsText2HasText && this.CreditsText_tf._y + this.CreditsText_tf._height <= CreditsMenu.EndY)
      {
         _root.CodeObj.closeMenu();
      }
      else if(this.CreditsText2HasText && this.CreditsText2_tf._y + this.CreditsText2_tf._height <= CreditsMenu.EndY)
      {
         _root.CodeObj.closeMenu();
      }
   }
   function handleInput(details, pathToFocus)
   {
      if(Shared.GlobalFunc.IsKeyPressed(details))
      {
         switch(details.navEquivalent)
         {
            case gfx.ui.NavigationCode.TAB:
            case gfx.ui.NavigationCode.ESCAPE:
               _root.CodeObj.closeMenu();
               break;
            case gfx.ui.NavigationCode.UP:
               this.moveCredits(40);
               break;
            case gfx.ui.NavigationCode.DOWN:
               this.moveCredits(-40);
               break;
            case gfx.ui.NavigationCode.PAGE_UP:
               this.moveCredits(80);
               break;
            case gfx.ui.NavigationCode.PAGE_DOWN:
               this.moveCredits(-80);
         }
      }
      return true;
   }
   function onMouseDown()
   {
      _root.CodeObj.closeMenu();
   }
   function onMouseWheel(delta)
   {
      this.moveCredits(20 * delta);
   }
   function moveCredits(aiDelta)
   {
      if(aiDelta < 0)
      {
         this.CreditsText_tf._y += aiDelta;
         if(this.CreditsText2HasText && this.CreditsText_tf._y + this.CreditsText_tf._height <= Stage.height)
         {
            this.CreditsText2_tf._y += aiDelta;
         }
      }
      else if(aiDelta > 0 && this.CreditsText_tf._y < 140)
      {
         this.CreditsText_tf._y += aiDelta;
         if(this.CreditsText2HasText && this.CreditsText_tf._y + this.CreditsText_tf._height <= Stage.height)
         {
            this.CreditsText2_tf._y += aiDelta;
         }
         if(this.iUpTimerID != undefined)
         {
            clearInterval(this.iUpTimerID);
         }
         this.iUpTimerID = setInterval(this,"ClearUpTimer",1000);
      }
   }
   function ClearUpTimer()
   {
      clearInterval(this.iUpTimerID);
      this.iUpTimerID = undefined;
   }
}
