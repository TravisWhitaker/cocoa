{-# LANGUAGE FlexibleContexts
           , OverloadedStrings
           #-}

module Main where

import Control.Concurrent

import Control.Exception

import Control.Monad

import Data.Coerce

import qualified Data.Text as T

import Foreign.ForeignPtr
import Foreign.Ptr

import System.Environment

import Cocoa.Foundation.NSString

import Cocoa.AppKit.NSApplication
import Cocoa.AppKit.NSApplication.Type
import Cocoa.AppKit.NSApplicationActivationPolicy
import Cocoa.AppKit.NSMenu
import Cocoa.AppKit.NSMenu.Type
import Cocoa.AppKit.NSMenuItem
import Cocoa.AppKit.NSMenuItem.Type

import Language.ObjC.Class
import Language.ObjC.NSObject

babump :: IO ()
babump = forever (putStrLn "babump..." *> threadDelay 3000000)

printId :: Coercible a (ForeignPtr ()) => a -> IO ()
printId x = let fp :: ForeignPtr ()
                fp = coerce x
            in print fp

main :: IO ()
main = do
    nsa <- sharedApplication
    setActivationPolicy NSApplicationActivationPolicyRegular nsa
    getActivationPolicy nsa >>= print
    printId nsa

    mainMenu <- alloc :: IO NSMenu
    printId mainMenu
    initWithTitle mainMenu <$> copyFromText "MainMenu"
    appleItem <- join $ addItemWithTitle mainMenu <$> copyFromText "Apple"
                                                  <*> pure (Method nullPtr)
                                                  <*> copyFromText ""
    printId appleItem
    appleSub <- (alloc :: IO NSMenu)
    printId appleSub
    initWithTitle appleSub <$> copyFromText "Apple"
    setAppleMenu nsa appleSub

    zuccItem <- join $ addItemWithTitle appleSub  <$> copyFromText "Zucc"
                                                  <*> pure (Method nullPtr)
                                                  <*> copyFromText ""
    printId zuccItem
    setTarget zuccItem (coerce nsa)

    setSubmenu mainMenu appleSub appleItem
    setMainMenu nsa mainMenu

    forkIO babump

    putStrLn "About to run..."
    threadDelay 1000000
    run nsa
