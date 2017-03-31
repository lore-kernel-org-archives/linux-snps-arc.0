From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 31 Mar 2017 11:22:20 -0700
Subject: [PATCH] ldso: don't discard sysmbols for DODEBUG builds
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1490984540-10031-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

the --discard-* toggles take away the symbols which comes in the way
when staring at objdumps for debugging low level issues

So don't discard symbols for DODEBUG builds

before
-----

    3388:	j_s.d	[blink]
    338a:	add_s	sp,sp,0x18
    338c:	b.d	332c <_dl_add_elf_hash_table+0x50>
    3390:	mov_s	r2,0
    3392:	nop_s
    3394:	push_s	blink		<--- function not called out
    3396:	st.aw	r13,[sp,-20]
    339a:	std	r14r15,[sp,4]
    339e:	std	r16r17,[sp,12]

after
-----

    3388:	j_s.d	[blink]
    338a:	add_s	sp,sp,0x18
    338c:	b.d	332c <_dl_add_elf_hash_table+0x50>
    3390:	mov_s	r2,0
    3392:	nop_s

  00003394 <add_ldso.isra.9>:
    3394:	push_s	blink
    3396:	st.aw	r13,[sp,-20]
    339a:	std	r14r15,[sp,4]
    339e:	std	r16r17,[sp,12]

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ldso/ldso/Makefile.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/ldso/ldso/Makefile.in b/ldso/ldso/Makefile.in
index 320e4488ba22..acb1a5b2ac15 100644
--- a/ldso/ldso/Makefile.in
+++ b/ldso/ldso/Makefile.in
@@ -51,8 +51,11 @@ LDFLAGS-$(UCLIBC_LDSO_NAME).so := $(LDFLAGS_NOSTRIP) -Wl,-z,defs
 endif
 LDFLAGS-$(UCLIBC_LDSO_NAME).so += -Wl,-e,$(SYMBOL_PREFIX)_start \
 	-Wl,-z,now -Wl,-Bsymbolic \
-	-Wl,--export-dynamic $(CFLAG_-Wl--sort-common) -Wl,--discard-locals \
-	$(CFLAG_-Wl--discard-all) -Wl,--no-undefined
+	-Wl,--export-dynamic $(CFLAG_-Wl--sort-common) -Wl,--no-undefined
+
+ifneq ($(DODEBUG),y)
+	LDFLAGS-$(UCLIBC_LDSO_NAME).so +=  -Wl,--discard-locals $(CFLAG_-Wl--discard-all)
+endif
 
 LDFLAGS-$(LDSO_PRELINK_SUPPORT)-$(UCLIBC_LDSO_NAME).so += -Wl,-defsym=$(SYMBOL_PREFIX)_begin=0
 
-- 
2.7.4
