{-# LANGUAGE TemplateHaskell
           #-}

module Cocoa.Foundation.NSString.Msg where

import GHC.TypeLits

import Language.ObjC.MsgSend
import Language.ObjC.NSObject

import Cocoa.Foundation.NSString.Type

-- | Returns an empty 'NSString'.
string :: IO NSString
string = $(mkSendClassMsg [t| NSString |] "string" [t| IO NSString |])
