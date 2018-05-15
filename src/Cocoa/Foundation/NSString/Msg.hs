{-# LANGUAGE TemplateHaskell
           #-}

module Cocoa.Foundation.NSString.Msg where

import Foreign.Ptr

import GHC.TypeLits

import Language.ObjC.MsgSend
import Language.ObjC.NSObject

import Cocoa.Foundation.NSString.Type

-- | Returns an empty 'NSString'.
string :: IO NSString
string = $(mkSendClassMsg [t| NSString |] "string" [t| IO NSString |])

-- | Initialize an NSString with the given byte buffer and encoding.
initWithBytes :: NSString -> Ptr () -> Int -> Int -> IO NSString
initWithBytes = $(mkSendInstMsg "initWithBytes"
                                [t| NSString
                                 -> Ptr ()
                                 -> Int
                                 -> Int
                                 -> IO NSString |]
                 )
