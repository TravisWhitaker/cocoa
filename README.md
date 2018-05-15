# cocoa

Haskell bindings to Apple's Cocoa API.

This is super tiny right now. I'll be wrapping things manually to flesh out the
`objc-runtime` package, then I'll work on generating this automatically from
Apple's headers.

## Building

Stack seems to not support the `--extra-framework-dirs` option, so you'll likely
need to build with cabal.
