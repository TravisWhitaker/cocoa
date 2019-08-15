module Cocoa.AppKit.NSApplicationActivationPolicy where

import Foreign.C.Types

data NSApplicationActivationPolicy = NSApplicationActivationPolicyRegular
                                   | NSApplicationActivationPolicyAccessory
                                   | NSApplicationActivationPolicyProhibited
                                   deriving ( Eq
                                            , Ord
                                            , Read
                                            , Show
                                            , Enum
                                            )

nsApplicationActivationPolicyToCLong :: NSApplicationActivationPolicy -> CLong
nsApplicationActivationPolicyToCLong NSApplicationActivationPolicyRegular    = 0
nsApplicationActivationPolicyToCLong NSApplicationActivationPolicyAccessory  = 1
nsApplicationActivationPolicyToCLong NSApplicationActivationPolicyProhibited = 2

cLongToNSApplicationActivationPolicy :: CLong -> NSApplicationActivationPolicy
cLongToNSApplicationActivationPolicy 0 = NSApplicationActivationPolicyRegular
cLongToNSApplicationActivationPolicy 1 = NSApplicationActivationPolicyAccessory
cLongToNSApplicationActivationPolicy 2 = NSApplicationActivationPolicyProhibited
