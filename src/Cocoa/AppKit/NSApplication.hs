module Cocoa.AppKit.NSApplication (
    I.NSApplication()
  , I.sharedApplication
  , I.run
  , getActivationPolicy
  , setActivationPolicy
  , I.mainMenu
  , I.setAppleMenu
  , I.setMainMenu
  ) where

import Control.Monad

import Cocoa.AppKit.NSApplicationActivationPolicy

import qualified Cocoa.AppKit.NSApplication.Type as I
import qualified Cocoa.AppKit.NSApplication.Msg as I

setActivationPolicy :: NSApplicationActivationPolicy
                    -> I.NSApplication
                    -> IO ()
setActivationPolicy nsact nsapp =
    let nsactCLong = nsApplicationActivationPolicyToCLong nsact
    in void $ I.setActivationPolicy nsapp nsactCLong

getActivationPolicy :: I.NSApplication -> IO NSApplicationActivationPolicy
getActivationPolicy = fmap cLongToNSApplicationActivationPolicy
                    . I.activationPolicy
