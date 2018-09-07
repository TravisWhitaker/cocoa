{-# LANGUAGE OverloadedStrings #-}

module Main where

import Cocoa.Foundation.NSString

main :: IO ()
main = do
    ns1 <- copyFromText "You think you can get me by saying that to me?"
    copyToText ns1 >>= print
