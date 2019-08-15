module Cocoa.Foundation.NSString (
    NSString()
  , copyFromByteString
  , copyFromText
  , copyToText
  ) where

import qualified Data.ByteString          as BS
import qualified Data.ByteString.Internal as BS

import qualified Data.Text          as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Foreign  as T

import Foreign.ForeignPtr
import Foreign.Ptr

import Language.ObjC.NSObject

import Cocoa.Foundation.NSString.Type
import Cocoa.Foundation.NSString.Msg

import Cocoa.Foundation.NSStringEncoding

initWithByteString :: NSStringEncoding
                   -> NSString
                   -> BS.ByteString
                   -> IO NSString
initWithByteString nsse nss bs =
    let (bsfp, off, len) = BS.toForeignPtr bs
        nsseCode         = nsStringEncodingToCULong nsse
    in withForeignPtr (bsfp `plusForeignPtr` off) $ \p ->
        initWithBytes nss p (fromIntegral len) nsseCode

copyFromByteString :: NSStringEncoding -> BS.ByteString -> IO NSString
copyFromByteString nsse bs = do
    nssi <- alloc
    initWithByteString nsse nssi bs

copyFromText :: T.Text -> IO NSString
copyFromText t =
    T.useAsPtr t (\p l -> stringWithCharacters (castPtr p) (fromIntegral l))

copyToText :: NSString -> IO (Maybe T.Text)
copyToText nss = do
    utf16Len <- utf16Length nss
    let byteLen         = utf16Len * 2
        byteLenWithNull = byteLen + 2
        enc             = nsStringEncodingToCULong NSUTF16StringEncoding
    fp <- mallocForeignPtrBytes (fromIntegral byteLenWithNull)
    r  <- withForeignPtr
            (castForeignPtr fp)
            (\p -> getCString nss p (fromIntegral byteLenWithNull) enc)
    let bs = BS.fromForeignPtr fp 0 (fromIntegral byteLen)
    pure $ if (r == 1)
           then Just (T.decodeUtf16LE bs)
           else Nothing
