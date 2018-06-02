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

-- | Initialize an NSString with the given UTF-16 byte buffer.
initWithCharacters :: NSString -> Ptr () -> CSize -> IO NSString
initWithCharacters = $(mkSendInstMsg "initWithCharacters:length:"
                                     [t| NSString
                                      -> Ptr ()
                                      -> CSize
                                      -> IO NSString |]
                      )

-- | Initialize an NSString by copying another NSString.
initWithString :: NSString -> NSString -> IO NSString
initWithString = $(mkSendInstMsg "initWithString:"
                                 [t| NSString
                                  -> NSString
                                  -> IO NSString |]
                  )

-- | Create an NSString by copying another NSString.
stringWithString :: NSString -> IO NSString
stringWithString = $(mkSendClassMsg [t| NSString |]
                                    "stringWithString:"
                                    [t| NSString -> IO NSString |]
                    )

-- | Create an NSString with the given UTF-16 byte buffer.
stringWithCharacters :: Ptr () -> CSize -> IO NSString
stringWithCharacters = $(mkSendClassMsg [t| NSString |]
                                        "stringWithCharacters:length:"
                                        [t| Ptr () -> CSize -> IO NSString |]
                        )

getCString :: NSString -> Ptr () -> CSize -> CULong -> IO CUChar
getCString = $(mkSendInstMsg "getCString:maxLength:encoding:"
                             [t| NSString
                              -> Ptr ()
                              -> CSize
                              -> CULong
                              -> IO CUChar |]
              )

utf16Length :: NSString -> IO CULong
utf16Length = $(mkSendInstMsg "length"
                              [t| NSString
                               -> IO CULong |]
               )
