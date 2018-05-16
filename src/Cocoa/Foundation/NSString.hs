module Cocoa.Foundation.NSString (
    NSString()
  , copyFromByteString
  ) where

import qualified Data.ByteString          as BS
import qualified Data.ByteString.Internal as BS

import Foreign.ForeignPtr

import Language.ObjC.NSObject

import Cocoa.Foundation.NSString.Type
import Cocoa.Foundation.NSString.Msg

import Cocoa.Foundation.NSStringEncoding

copyFromByteString :: NSStringEncoding -> BS.ByteString -> IO NSString
copyFromByteString nsse bs = do
    nssi <- alloc
    initWithByteString nsse nssi bs

initWithByteString :: NSStringEncoding
                   -> NSString
                   -> BS.ByteString
                   -> IO NSString
initWithByteString nsse nss bs =
    let (bsfp, off, len) = BS.toForeignPtr bs
        nsseCode         = nsStringEncodingToCULong nsse
    in withForeignPtr (bsfp `plusForeignPtr` off) $ \p ->
        initWithBytes nss p (fromIntegral len) nsseCode
