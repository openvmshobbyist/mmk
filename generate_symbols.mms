!++
!   GENERATE_SYMBOLS.MMS
!
!   Description file for generating version symbols from newly build
!   MMK for use in building documentation.
!
!   Copyright (c) 2012, Endless Software Solutions.
!
!   All rights reserved.
!
!   Redistribution and use in source and binary forms, with or without
!   modification, are permitted provided that the following conditions
!   are met:
!
!       * Redistributions of source code must retain the above
!         copyright notice, this list of conditions and the following
!         disclaimer.
!       * Redistributions in binary form must reproduce the above
!         copyright notice, this list of conditions and the following
!         disclaimer in the documentation and/or other materials provided
!         with the distribution.
!       * Neither the name of the copyright owner nor the names of any
!         other contributors may be used to endorse or promote products
!         derived from this software without specific prior written
!         permission.
!
!   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
!   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
!   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
!   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
!   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
!   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
!   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
!   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
!   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
!   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
!   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
!
!   06-AUG-2012 V1.0    Sneddon     Initial coding.
!--
ECHO = WRITE SYS$OUTPUT

GENERATE_SYMBOLS :
    @ months = "/January/February/March/April/May/June/July/August/September/October/November/December"
    @ now = F$CVTIME (, "ABSOLUTE")
    @ year = F$CVTIME  (now,, "YEAR")
    @ mon  = F$INTEGER (F$CVTIME (now,, "MONTH"))
    @ month = F$ELEMENT (mon, "/", months)
    @ amonth = F$CVTIME (now, "ABSOLUTE", "MONTH")
    @ day = F$CVTIME (now,, "DAY")
    @ $(ECHO) "<DEFINE_SYMBOL>(COPYYEAR\''year')"
    @ $(ECHO) "<DEFINE_SYMBOL>(RELDATE\''day'-''amonth'-''year')"
    @ $(ECHO) "<DEFINE_SYMBOL>(RELMONTH\''month', ''year')"
    @ $(ECHO) "<DEFINE_SYMBOL>(PRTDATE\''day' ''month' ''year')"
    @ $(ECHO) "<DEFINE_SYMBOL>(VER\$(MMK_VERSION))"
    @ $(ECHO) "<DEFINE_SYMBOL>(KITVER\$(MMK_MAJOR_VERSION)$(MMK_MINOR_VERSION))"
