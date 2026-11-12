class JournalSaveLoadList extends Shared.BSScrollingList
{
   var ListScrollbar;
   var iMaxScrollPosition;
   var selectedIndex;
   function JournalSaveLoadList()
   {
      super();
   }
   function SetEntry(aEntryClip, aEntryObject)
   {
      super.SetEntry(aEntryClip,aEntryObject);
      if(aEntryObject.fileNum != undefined)
      {
         if(aEntryObject.fileNum < 10)
         {
            aEntryClip.SaveNumber.SetText("00" + aEntryObject.fileNum);
         }
         else if(aEntryObject.fileNum < 100)
         {
            aEntryClip.SaveNumber.SetText("0" + aEntryObject.fileNum);
         }
         else
         {
            aEntryClip.SaveNumber.SetText(aEntryObject.fileNum);
         }
      }
      else
      {
         aEntryClip.SaveNumber.SetText(" ");
      }
      if(this.ListScrollbar != undefined)
      {
         aEntryClip._x = this.iMaxScrollPosition <= 0 ? 0 : 25;
      }
   }
   function moveSelectionUp()
   {
      var _loc3_ = this.selectedIndex;
      super.moveSelectionUp();
      if(_loc3_ != this.selectedIndex)
      {
         gfx.io.GameDelegate.call("PlaySound",["UIMenuFocus"]);
      }
   }
   function moveSelectionDown()
   {
      var _loc3_ = this.selectedIndex;
      super.moveSelectionDown();
      if(_loc3_ != this.selectedIndex)
      {
         gfx.io.GameDelegate.call("PlaySound",["UIMenuFocus"]);
      }
   }
}
