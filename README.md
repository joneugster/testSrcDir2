# Steps to reproduce

First clone the repo:

```
git clone git@github.com:joneugster/testSrcDir2.git
cd testSrcDir2
```

Then directly call
```
lake exe testsrcdir
```
This will fail with `uncaught exception: unknown package 'TestSrcDir'`

And looking inside `.lake`, indeed `TestSrcDir` hasn't been built, i.e. `TestSrcDir/Main.olean` does not exist
```
$ ls .lake/packages/testSrcDir/.lake/build/lib/
Main.ilean  Main.ilean.hash  Main.log.json  Main.olean  Main.olean.hash  Main.trace  TestSrcDir
$ ls .lake/packages/testSrcDir/.lake/build/lib/TestSrcDir/
bash: .lake/packages/testSrcDir/.lake/build/lib/TestSrcDir/: No such file or directory
```

so we build it:

```
lake build testSrcDir
```

Now the command succeeds with `Hello!`:
```
lake exe testsrcdir
```

And looking iside `.lake`, we see that there is now a file `TestSrcDir/Main.olean` which is a duplication of `Main.olean`.
```
$ ls .lake/packages/testSrcDir/.lake/build/lib/
Main.ilean       Main.log.json  Main.olean.hash  TestSrcDir        TestSrcDir.ilean.hash  TestSrcDir.olean       TestSrcDir.trace
Main.ilean.hash  Main.olean     Main.trace       TestSrcDir.ilean  TestSrcDir.log.json    TestSrcDir.olean.hash
$ ls .lake/packages/testSrcDir/.lake/build/lib/TestSrcDir/
Basic.ilean  Basic.ilean.hash  Basic.log.json  Basic.olean  Basic.olean.hash  Basic.trace  Main.ilean  Main.ilean.hash  Main.log.json  Main.olean  Main.olean.hash  Main.trace
```



