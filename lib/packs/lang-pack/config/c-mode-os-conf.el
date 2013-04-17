(when (eq system-type 'windows-nt)
  (setq system-header-paths
        "d:\\mingw\\lib\\gcc\\mingw32\\4.6.2\\include\\c++
         d:\\mingw\\lib\\gcc\\mingw32\\4.6.2\\include\\c++\\mingw32
         d:\\mingw\\lib\\gcc\\mingw32\\4.6.2\\include\\c++\\backward
         d:\\mingw\\lib\\gcc\\mingw32\\4.6.2\\include
         d:\\mingw\\include
         d:\\mingw\\lib\\gcc\\mingw32\\4.6.2\\include-fixed"))

(when (not (boundp 'system-header-paths))
  (setq system-header-paths
	"/usr/lib/gcc/x86_64-redhat-linux/4.7.2/../../../../include/c++/4.7.2
         /usr/lib/gcc/x86_64-redhat-linux/4.7.2/../../../../include/c++/4.7.2/x86_64-redhat-linux
         /usr/lib/gcc/x86_64-redhat-linux/4.7.2/../../../../include/c++/4.7.2/backward
         /usr/lib/gcc/x86_64-redhat-linux/4.7.2/include
         /usr/local/include
         /usr/include"))
