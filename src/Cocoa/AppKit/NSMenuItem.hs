module Cocoa.AppKit.NSMenuItem (
    I.NSMenuItem()
  , setEnabled
  , I.setTarget
  ) where

import qualified Cocoa.AppKit.NSMenuItem.Type as I
import qualified Cocoa.AppKit.NSMenuItem.Msg  as I

setEnabled :: I.NSMenuItem -> Bool -> IO ()
setEnabled nmi b = I.setEnabled nmi (if b then 1 else 0)
