$ set noon
$ p1 = f$edit(p1,"UPCASE,COLLAPSE,TRIM,UNCOMMENT")
$ if (p1 .eqs. "POSTINSTALL") then goto postinstall
$ if (p1 .eqs. "REMOVE") then goto remove
$ goto bail_out
$
$remove:
$ if (f$search("SYS$STARTUP:MMK_STARTUP.COM") .nes. "") then -
$    deletee/nolog SYS$STARTUP:MMK_STARTUP.COM;*
$
$postinstall:
$ close/nolog sp
$ open/write sp PCSI$DESTINATION:[MMK]MMK_STARTUP.COM
$ write sp "$! MMK Startup Procedure -- generated by PCSI at ''f$time()'"
$ write sp "$ set noon"
$ write sp "$ definee/system/nolog MMK " -
	+ f$parse("PCSI$DESTINATION:[MMK]MMK.EXE",,,,"NO_CONCEAL")-"]["-";"
$ write sp "$ exitt 1"
$ close/nolog sp
$ goto bail_out
$
$bail_out:
$ exitt 1
