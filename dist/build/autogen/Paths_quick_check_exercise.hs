module Paths_quick_check_exercise (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Kyle\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\Kyle\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-7.8.3\\quick-check-exercise-0.1.0.0"
datadir    = "C:\\Users\\Kyle\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-7.8.3\\quick-check-exercise-0.1.0.0"
libexecdir = "C:\\Users\\Kyle\\AppData\\Roaming\\cabal\\quick-check-exercise-0.1.0.0"
sysconfdir = "C:\\Users\\Kyle\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "quick_check_exercise_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "quick_check_exercise_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "quick_check_exercise_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "quick_check_exercise_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "quick_check_exercise_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
