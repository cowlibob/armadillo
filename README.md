ruby_armadillo
==============

Ruby wrapper for Digital River&#39;s Armadillo Theft Prevention Engine

The gem interacts with [codegen.dll](http://www.siliconrealms.com/API/index.html?codegen_dll.htm) to allow generation of license keys for an Armadillo protected application.

Limitations
-----------

- Armadillo codegen.dll is not multithread safe.
- As a Windows DLL, the resulting ruby app can only be deployed to Windows (unless Wine could be of use).
- The gem has only been used to generate Version 1 & 3 license keys. Changes will be needed to support Version 2 keys.

Usage
-----

The gem relies on the CodeGen.dll. If you have Software Passport installed, you will find the DLL in %ProgramFiles(x86)%\SoftwarePassport\CodeGen\CodeGen.dll

The rake task `rake armadillo:init` will locate and make a copy of the DLL to the local folder.
