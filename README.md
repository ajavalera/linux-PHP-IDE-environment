PHP IDE Linux Environment
=================================

By adding customized CLI configuration, VIM and Docker installation scripts, this project aims to make any linux CLI into a powerful PHP IDE.

Dependencies:
--------------
1. You would need to have Python 2.* installed for the XDEBUG VIM Debugger to run.
2. You need to have XDEBUG installed for the Debugger to run.
3. You need VIM to be compiled with ```+python``` and ```+signals``` (only if you want XDEBUG capacity).

Installation:
--------------
*CLI configuration and VIM:* 

To have VIM configured and ready to work with XDEBUG, you need to compile VIM with ```+python``` (that's Python 2.*) and ```+signals``` support.  If you don't have that (or don't want to have it) that's OK, the only thing that won't work will be de XDEBUG Debugger functionality.

1. Copy the contents of homedir into your home directory (~).
2. Exit and log in again into your Shell session.
3. There. That's it.

Make sure you copy all the files, even the hidden ones.

What you get:
------------------
A VIM environment that can do most of the things a full fledged IDE can, with keystroke shortcuts designed to mimic or implement:
- Class, Methods creation.
- Visibility keywords creation.
- Class finding.
- Usage finding.
- Some other things.

Look at home/.vimrc for details of what you can do.

In the future:
--------------------
Bug fixing and full documentation (including a wiki) is in progress.  Any suggestions please create an issue.

