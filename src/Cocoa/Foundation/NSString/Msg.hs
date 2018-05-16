{-# LANGUAGE TemplateHaskell
           #-}

module Cocoa.Foundation.NSString.Msg where

import Foreign.C.Types

import Foreign.Ptr

import GHC.TypeLits

import Language.ObjC.MsgSend
import Language.ObjC.NSObject

import Cocoa.Foundation.NSString.Type

-- | Returns an empty 'NSString'.
string :: IO NSString
string = $(mkSendClassMsg [t| NSString |] "string" [t| IO NSString |])

-- | Initialize an NSString with the given byte buffer and encoding.
initWithBytes :: NSString -> Ptr () -> CSize -> CULong -> IO NSString
initWithBytes = $(mkSendInstMsg "initWithBytes:length:encoding:"
                                [t| NSString
                                 -> Ptr ()
                                 -> CSize
                                 -> CULong
                                 -> IO NSString |]
                 )
