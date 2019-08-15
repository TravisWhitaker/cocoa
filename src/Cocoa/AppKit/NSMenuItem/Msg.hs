{-# LANGUAGE TemplateHaskell
           #-}

module Cocoa.AppKit.NSMenuItem.Msg where

import Foreign.C.Types

import GHC.TypeLits

import Language.ObjC.Class
import Language.ObjC.MsgSend
import Language.ObjC.NSObject

import Cocoa.AppKit.NSMenuItem.Type

import Cocoa.Foundation.NSString.Type

initWithTitle :: NSMenuItem -> NSString -> Method -> NSString -> IO ()
initWithTitle =
    $(mkSendInstMsg "initWithTitle:action:keyEquivalent:"
                    [t| NSMenuItem -> NSString -> Method -> NSString -> IO () |]
     )

setEnabled :: NSMenuItem -> CChar -> IO ()
setEnabled = $(mkSendInstMsg "setEnabled:" [t| NSMenuItem -> CChar -> IO () |])

setTarget :: NSMenuItem -> Id -> IO ()
setTarget = $(mkSendInstMsg "setTarget:" [t| NSMenuItem -> Id -> IO () |])
