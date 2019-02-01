From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 1 Feb 2019 12:21:18 -0800
Subject: [PATCH] [ARC] don't force _init/_fini as DT_INIT/DT_FINI
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1549052478-965-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Recent gcc commit b4371b277f1e ("[ARC] Enable init_array support")
inhibits DT_"INIT,FINI} in favor of DT_{INIT,FINI}ARRAY.

Even prior to that, it seems ARC port is the only one with this
special DT_INIT/FINI handling in linker emulation. Removing it
doesn't seem to change any uClibc/glibc testsuite results,
so this can RIP anyways.

bfd/
    2019-02-01  Vineet Gupta <vgupta at synopsys.com>

           * elf32-arc.c: Delete init_str, fini_str

ld/
    2019-02-01  Vineet Gupta <vgupta at synopsys.com>

           * emultempl/arclinux.em : Delete special INIT/FINI handling.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 bfd/ChangeLog            |  4 ++++
 bfd/elf32-arc.c          |  9 ---------
 ld/ChangeLog             |  4 ++++
 ld/emultempl/arclinux.em | 27 ---------------------------
 4 files changed, 8 insertions(+), 36 deletions(-)

diff --git a/bfd/ChangeLog b/bfd/ChangeLog
index 5547cd26b9bb..8fcf44e8d315 100644
--- a/bfd/ChangeLog
+++ b/bfd/ChangeLog
@@ -1,3 +1,7 @@
+2019-02-01  Vineet Gupta <vgupta at synopsys.com>
+
+	* elf32-arc.c: Delete init_str, fini_str.
+
 2019-01-21  Sergio Durigan Junior  <sergiodj at redhat.com>
 
 	* elf32-arm.c (elf32_arm_final_link_relocate): Use 'llabs' instead
diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
index c7469ded8acf..1ced270f3b15 100644
--- a/bfd/elf32-arc.c
+++ b/bfd/elf32-arc.c
@@ -72,15 +72,6 @@ name_for_global_symbol (struct elf_link_hash_entry *h)
   }
 
 
-/* The default symbols representing the init and fini dyn values.
-   TODO: Check what is the relation of those strings with arclinux.em
-   and DT_INIT.  */
-#define INIT_SYM_STRING "_init"
-#define FINI_SYM_STRING "_fini"
-
-char * init_str = INIT_SYM_STRING;
-char * fini_str = FINI_SYM_STRING;
-
 #define ARC_RELOC_HOWTO(TYPE, VALUE, SIZE, BITSIZE, RELOC_FUNCTION, OVERFLOW, FORMULA) \
       case VALUE: \
 	return "R_" #TYPE; \
diff --git a/ld/ChangeLog b/ld/ChangeLog
index 5713b0020c64..647e343d21b5 100644
--- a/ld/ChangeLog
+++ b/ld/ChangeLog
@@ -1,3 +1,7 @@
+2019-02-01  Vineet Gupta <vgupta at synopsys.com>
+
+	* emultempl/arclinux.em : Delete special INIT/FINI handling.
+
 2019-01-31  Alan Modra  <amodra at gmail.com>
 
 	* NEWS: Mention -t change.
diff --git a/ld/emultempl/arclinux.em b/ld/emultempl/arclinux.em
index 3163712fbd0e..796c89085e34 100644
--- a/ld/emultempl/arclinux.em
+++ b/ld/emultempl/arclinux.em
@@ -23,30 +23,3 @@
 # This file is sourced from elf32.em, and defines extra arc-linux
 # specific routines.
 #
-cat >>e${EMULATION_NAME}.c <<EOF
-extern char * init_str;
-extern char * fini_str;
-EOF
-
-PARSE_AND_LIST_PROLOGUE='
-#define OPTION_INIT 300+1
-#define OPTION_FINI (OPTION_INIT+1)
-'
-PARSE_AND_LIST_LONGOPTS='
-  /* PE options */
-  { "init", required_argument, NULL, OPTION_INIT },
-  { "fini", required_argument, NULL, OPTION_FINI },
-'
-
-# FIXME: Should set PARSE_AND_LIST_OPTIONS to provide a short description
-# of the options.
-
-PARSE_AND_LIST_ARGS_CASES='
-    case OPTION_FINI:
-      fini_str = optarg;
-      break;
-
-    case OPTION_INIT:
-      init_str = optarg;
-      break;
-'
-- 
2.7.4
