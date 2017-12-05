{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_seminararbeit_fun (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\olcay\\Desktop\\seminararbeit-fun\\.stack-work\\install\\fab39206\\bin"
libdir     = "C:\\Users\\olcay\\Desktop\\seminararbeit-fun\\.stack-work\\install\\fab39206\\lib\\x86_64-windows-ghc-8.0.2\\seminararbeit-fun-0.1.0.0-9YBmB95yXlW1eP54qM70RB"
dynlibdir  = "C:\\Users\\olcay\\Desktop\\seminararbeit-fun\\.stack-work\\install\\fab39206\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\olcay\\Desktop\\seminararbeit-fun\\.stack-work\\install\\fab39206\\share\\x86_64-windows-ghc-8.0.2\\seminararbeit-fun-0.1.0.0"
libexecdir = "C:\\Users\\olcay\\Desktop\\seminararbeit-fun\\.stack-work\\install\\fab39206\\libexec"
sysconfdir = "C:\\Users\\olcay\\Desktop\\seminararbeit-fun\\.stack-work\\install\\fab39206\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "seminararbeit_fun_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "seminararbeit_fun_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "seminararbeit_fun_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "seminararbeit_fun_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "seminararbeit_fun_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "seminararbeit_fun_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
