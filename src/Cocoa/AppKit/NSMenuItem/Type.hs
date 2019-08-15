{-# LANGUAGE DataKinds
           , GeneralizedNewtypeDeriving
           , UndecidableInstances
           , TemplateHaskell
           #-}

module Cocoa.AppKit.NSMenuItem.Type where

import Language.ObjC.NSObject

newtype NSMenuItem = NSMenuItem (SomeNSObject "NSApplication")
                   deriving (NSObject)
