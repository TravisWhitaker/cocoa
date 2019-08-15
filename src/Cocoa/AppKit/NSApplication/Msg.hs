{-# LANGUAGE TemplateHaskell
           #-}

module Cocoa.AppKit.NSApplication.Msg where

import Foreign.C.Types

import GHC.TypeLits

import Language.ObjC.MsgSend
import Language.ObjC.NSObject

import Cocoa.AppKit.NSApplication.Type

import Cocoa.AppKit.NSMenu.Type

-- | Initialize a Cocoa application, returning the shared global
--   'NSApplication'.
sharedApplication :: IO NSApplication
sharedApplication = $(mkSendClassMsg [t| NSApplication |]
                                     "sharedApplication"
                                     [t| IO NSApplication |]
                     )

setActivationPolicy :: NSApplication
                    -> CLong
                    -> IO CChar
setActivationPolicy = $(mkSendInstMsg "setActivationPolicy:"
                                      [t| NSApplication -> CLong -> IO CChar |]
                       )

activationPolicy :: NSApplication -> IO CLong
activationPolicy = $(mkSendInstMsg "activationPolicy"
                                   [t| NSApplication -> IO CLong |]
                    )

run :: NSApplication -> IO ()
run = $(mkSendInstMsg "run" [t| NSApplication -> IO () |])

mainMenu :: NSApplication -> IO NSMenu
mainMenu = $(mkSendInstMsg "mainMenu" [t| NSApplication -> IO NSMenu |])

setAppleMenu :: NSApplication -> NSMenu -> IO ()
setAppleMenu = $(mkSendInstMsg "setAppleMenu:"
                               [t| NSApplication -> NSMenu -> IO () |]
                )

setMainMenu :: NSApplication -> NSMenu -> IO ()
setMainMenu = $(mkSendInstMsg "setMainMenu:"
                              [t| NSApplication -> NSMenu -> IO () |]
               )
