import Lake
open Lake DSL

package «testSrcDir2» where

require testSrcDir from git "git@github.com:joneugster/testSrcDir.git"

@[default_target]
lean_lib «TestSrcDir2» where
