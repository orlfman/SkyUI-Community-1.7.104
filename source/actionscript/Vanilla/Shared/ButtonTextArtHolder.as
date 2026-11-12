class Shared.ButtonTextArtHolder extends MovieClip
{
   var iPlatform;
   var strButtonName;
   static var CONTROLLER_ORBIS = 3;
   static var CONTROLLER_SCARLETT = 4;
   static var CONTROLLER_PROSPERO = 5;
   static var CONTROLLER_NX = 6;
   static var CONTROLLER_NX_MOUSE = 7;
   function ButtonTextArtHolder()
   {
      super();
      this.iPlatform = 0;
   }
   function SetPlatform(aiPlatform, abPS3Switch)
   {
      trace("ButtonTextArtHolder::SetPlatform Called");
      this.iPlatform = aiPlatform;
   }
   function SetButtonName(aText)
   {
      var _loc3_;
      if(this.IsPS5())
      {
         _loc3_ = aText.split("_");
         if(_loc3_[1] == "Start")
         {
            this.strButtonName = "PS5_" + _loc3_[1];
         }
         else
         {
            this.strButtonName = aText;
         }
         trace(this.strButtonName + "Set");
      }
      else if(this.IsNXMouse())
      {
         if(aText == "MouseMove")
         {
            this.strButtonName = "NX_" + aText;
         }
         else
         {
            this.strButtonName = aText;
         }
      }
      else
      {
         this.strButtonName = aText;
      }
   }
   function CreateButtonArt(aInputText)
   {
      var _loc7_ = aInputText.text.indexOf("[");
      var _loc2_ = _loc7_ == -1 ? -1 : aInputText.text.indexOf("]",_loc7_);
      var _loc6_;
      var _loc10_;
      var _loc3_;
      var _loc8_;
      var _loc11_;
      var _loc5_;
      var _loc9_;
      if(_loc7_ != -1 && _loc2_ != -1)
      {
         _loc6_ = aInputText.text.substr(0,_loc7_);
         while(_loc7_ != -1 && _loc2_ != -1)
         {
            _loc10_ = aInputText.text.substring(_loc7_ + 1,_loc2_);
            gfx.io.GameDelegate.call("GetButtonFromUserEvent",[_loc10_],this,"SetButtonName");
            if(this.strButtonName != undefined)
            {
               _loc3_ = flash.display.BitmapData.loadBitmap(this.strButtonName + ".png");
               if(_loc3_ != undefined && _loc3_.height > 0)
               {
                  if(this.strButtonName == "NX_NFCTouchpoint")
                  {
                     _loc6_ += "<img src=\'" + this.strButtonName + ".png\' height=\'" + _loc3_.height + "\' width=\'" + _loc3_.width + "\'>";
                  }
                  else
                  {
                     _loc8_ = 26;
                     _loc11_ = Math.floor(_loc8_ / _loc3_.height * _loc3_.width);
                     _loc6_ += "<img src=\'" + this.strButtonName + ".png\' vspace=\'-5\' height=\'" + _loc8_ + "\' width=\'" + _loc11_ + "\'>";
                  }
               }
               else
               {
                  trace(this.strButtonName + ".png not found!");
                  _loc6_ += aInputText.text.substring(_loc7_,_loc2_ + 1);
               }
            }
            else
            {
               _loc6_ += aInputText.text.substring(_loc7_,_loc2_ + 1);
            }
            _loc5_ = aInputText.text.indexOf("[",_loc2_);
            _loc9_ = _loc5_ == -1 ? -1 : aInputText.text.indexOf("]",_loc5_);
            if(_loc5_ != -1 && _loc9_ != -1)
            {
               _loc6_ += aInputText.text.substring(_loc2_ + 1,_loc5_);
            }
            else
            {
               _loc6_ += aInputText.text.substr(_loc2_ + 1);
            }
            _loc7_ = _loc5_;
            _loc2_ = _loc9_;
         }
      }
      return _loc6_;
   }
   function IsPS5()
   {
      return this.iPlatform == Shared.ButtonTextArtHolder.CONTROLLER_PROSPERO;
   }
   function IsNXMouse()
   {
      return this.iPlatform == Shared.ButtonTextArtHolder.CONTROLLER_NX_MOUSE;
   }
}
