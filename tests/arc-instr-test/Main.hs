{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Concurrent

import qualified Data.Text as T
import qualified Data.Text.IO as T

import System.Environment

import Cocoa.Foundation.NSString

makeThenDeleteLoop :: IO ()
makeThenDeleteLoop = do
    inp <- T.getLine
    case inp of
        "done" -> pure ()
        x      -> do
            makeThenDelete x
            makeThenDeleteLoop

makeThenDelete :: T.Text -> IO ()
makeThenDelete inp = do
    putStr "To NSString..."
    nss <- copyFromText inp
    putStrLn " And back again..."
    Just inp' <- copyToText nss
    T.putStrLn inp'

main :: IO ()
--main = makeThenDeleteLoop
--main = do
--    putStrLn "Wait for instruments to attach..."
--    threadDelay 1000000
--    getArgs >>= (mapM_ (makeThenDelete . T.pack))
main = do
    putStrLn "Wait for instruments to attach..."
    threadDelay 1000000
    mapM_ (\t -> makeThenDelete t *> threadDelay 1000000) [ "sus", "dingas", "memsql"]
