{-# LANGUAGE DataKinds
           , GeneralizedNewtypeDeriving
           , UndecidableInstances
           , TemplateHaskell
           #-}

module Cocoa.AppKit.NSMenu.Type where

import Language.ObjC.NSObject

newtype NSMenu = NSMenu (SomeNSObject "NSMenu")
               deriving (NSObject)
