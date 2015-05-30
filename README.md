# Beepo

## What is it?

Beepo is a simple terminal utility that beeps (or talks) to inform you that some action has been completed.

## Why use it?

If you have some long running process and wants to be notified by sound when it's done.

## How to use it in a simple way?

Like this: make;make install;beepo  
This way Beepo will start beeping once the previous commands are finished.

## How to use it in an advanced way?

Like this: beepo -np Build.xml -say "Done" -bt 5 -t 0.5  
This will make Beepo watch for a process containing the text "Build.xml" to disappear from ps aux, and once it's gone Beepo will use the say command to say "Done" 5 times, waiting 0.5 seconds between each time.

## How to compile and install it?

* haxe Compile.hxml
* cp bin/beepo /usr/local/bin/ (or /usr/bin to make available for all users on computer)

## How to compile and run with Neko?

* haxe NekoCompile.hxml
* neko Beepo.n

## How to abort Beepo

Just use CTRL + C

## How to get more help?

Type beepo help

## Thanks to

* The Haxe programming language and toolkit
* vim/MacVim

