{-# LANGUAGE TemplateHaskell
           #-}

module Cocoa.AppKit.NSMenu.Msg where

import Foreign.C.Types

import Foreign.Ptr

import GHC.TypeLits

import Language.ObjC.MsgSend
import Language.ObjC.NSObject

import Cocoa.AppKit.NSMenu.Type
import Cocoa.AppKit.NSMenuItem.Type

import Cocoa.Foundation.NSString.Type

addItem :: NSMenu -> NSMenuItem -> IO ()
addItem = $(mkSendInstMsg "addItem:"
                          [t| NSMenu -> NSMenuItem -> IO () |]
           )

addItemWithTitle :: NSMenu -> NSString -> Method -> NSString -> IO NSMenuItem
addItemWithTitle =
    $(mkSendInstMsg
        "addItemWithTitle:action:keyEquivalent:"
        [t| NSMenu -> NSString -> Method -> NSString -> IO NSMenuItem |]
     )

initWithTitle :: NSMenu -> NSString -> IO ()
initWithTitle = $(mkSendInstMsg "initWithTitle:"
                                [t| NSMenu -> NSString -> IO () |]
                 )

setSubmenu :: NSMenu -> NSMenu -> NSMenuItem -> IO ()
setSubmenu = $(mkSendInstMsg "setSubmenu:forItem:"
                             [t| NSMenu -> NSMenu -> NSMenuItem -> IO () |]
              )
