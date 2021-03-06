{-# LANGUAGE DataKinds
           , GeneralizedNewtypeDeriving
           , UndecidableInstances
           , TemplateHaskell
           #-}

module Cocoa.Foundation.NSString.Type where

import Language.ObjC.NSObject

newtype NSString = NSString (SomeNSObject "NSString")
                 deriving (NSObject)

$(requireLinkedClass "NSString")
