module Cocoa.Foundation.NSStringEncoding where

import Foreign.C.Types

data NSStringEncoding = NSASCIIStringEncoding
                      | NSNEXTSTEPStringEncoding
                      | NSJapaneseEUCStringEncoding
                      | NSUTF8StringEncoding
                      | NSISOLatin1StringEncoding
                      | NSSymbolStringEncoding
                      | NSNonLossyASCIIStringEncoding
                      | NSShiftJISStringEncoding
                      | NSISOLatin2StringEncoding
                      | NSUnicodeStringEncoding
                      | NSWindowsCP1251StringEncoding
                      | NSWindowsCP1252StringEncoding
                      | NSWindowsCP1253StringEncoding
                      | NSWindowsCP1254StringEncoding
                      | NSWindowsCP1250StringEncoding
                      | NSISO2022JPStringEncoding
                      | NSMacOSRomanStringEncoding
                      | NSUTF16StringEncoding
                      | NSUTF16BigEndianStringEncoding
                      | NSUTF16LittleEndianStringEncoding
                      | NSUTF32StringEncoding
                      | NSUTF32BigEndianStringEncoding
                      | NSUTF32LittleEndianStringEncoding
                      deriving ( Eq
                               , Ord
                               , Read
                               , Show
                               , Enum
                               )

nsStringEncodingToCULong :: NSStringEncoding -> CULong
nsStringEncodingToCULong NSASCIIStringEncoding = 1
nsStringEncodingToCULong NSNEXTSTEPStringEncoding = 2
nsStringEncodingToCULong NSJapaneseEUCStringEncoding = 3
nsStringEncodingToCULong NSUTF8StringEncoding = 4
nsStringEncodingToCULong NSISOLatin1StringEncoding = 5
nsStringEncodingToCULong NSSymbolStringEncoding = 6
nsStringEncodingToCULong NSNonLossyASCIIStringEncoding = 7
nsStringEncodingToCULong NSShiftJISStringEncoding = 8
nsStringEncodingToCULong NSISOLatin2StringEncoding = 9
nsStringEncodingToCULong NSUnicodeStringEncoding = 10
nsStringEncodingToCULong NSWindowsCP1251StringEncoding = 11
nsStringEncodingToCULong NSWindowsCP1252StringEncoding = 12
nsStringEncodingToCULong NSWindowsCP1253StringEncoding = 13
nsStringEncodingToCULong NSWindowsCP1254StringEncoding = 14
nsStringEncodingToCULong NSWindowsCP1250StringEncoding = 15
nsStringEncodingToCULong NSISO2022JPStringEncoding = 21
nsStringEncodingToCULong NSMacOSRomanStringEncoding = 30
nsStringEncodingToCULong NSUTF16StringEncoding =
    nsStringEncodingToCULong NSUnicodeStringEncoding
nsStringEncodingToCULong NSUTF16BigEndianStringEncoding = 0x90000100
nsStringEncodingToCULong NSUTF16LittleEndianStringEncoding = 0x94000100
nsStringEncodingToCULong NSUTF32StringEncoding = 0x8c000100
nsStringEncodingToCULong NSUTF32BigEndianStringEncoding = 0x98000100
nsStringEncodingToCULong NSUTF32LittleEndianStringEncoding = 0x9c000100
