{-# LANGUAGE DataKinds
           , GeneralizedNewtypeDeriving
           , UndecidableInstances
           , TemplateHaskell
           #-}

module Cocoa.AppKit.NSApplication.Type where

import Language.ObjC.NSObject

newtype NSApplication = NSApplication (SomeNSObject "NSApplication")
                      deriving (NSObject)
