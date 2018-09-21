From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 21 Sep 2018 17:26:04 +0300
Subject: [PATCH v3 5/9] libgpg-error: Add ARC support
In-Reply-To: <20180921142608.36203-1-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180921142608.36203-6-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Ross Burton <ross.burton at intel.com>
Cc: Werner Koch <wk at gnupg.org>
---

Changes v2 -> v3:
 * Use proper [recently upstreamed] fix for ARC Glibc toolchain
 * Fix compilation for x86_64 due to renamed header

Changes v1 -> v2:

 * Added upstream status

 ...port-ARC-CPUs-and-simplify-aliasing-table.patch | 298 +++++++++++++++++++++
 ...cfg-Add-support-for-arc-unknown-linux-gnu.patch |  35 +++
 .../libgpg-error/libgpg-error_1.32.bb              |   7 +-
 3 files changed, 339 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch
new file mode 100644
index 0000000000..03b0ce77ed
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch
@@ -0,0 +1,298 @@
+From d4fd6975671477721936060771aa4d7d07fb0910 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk at gnupg.org>
+Date: Tue, 18 Sep 2018 14:54:08 +0200
+Subject: [PATCH libgpg-error] syscfg: Support ARC CPUs and simplify aliasing
+ table.
+
+* src/mkheader.c (xmalloc): New.
+(xstrdup): Implement using xmalloc.
+(canon_host_triplet): Add supporr for arc CPU.  Adjust alias table to
+also alias *-pc-*.  Rename ibm to unknown. Add internal arg.  Add
+unknown vendor hack.
+(main): New mode to just print the canonicalized form.
+* src/Makefile.am (lock_obj_pub): s/-(pc|ibm)-/-unknown/.  Also rename
+files accordingly.
+--
+
+config.sub does no real aliasing and thus we would need to add several
+vendors to the alising tables despite that this has no technical
+meanding.  Instead we now replace the vendor with "unknown" for the
+4-part-"triplets".  This change will make maintenace easier.
+
+Signed-off-by: Werner Koch <wk at gnupg.org>
+
+Upstream-Status: Backport [ http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=48c8f8ddfc80 ]
+---
+ src/Makefile.am                               | 16 ++--
+ src/mkheader.c                                | 92 ++++++++++++++++---
+ ...-gnu.h => lock-obj-pub.i686-unknown-gnu.h} |  0
+ ... lock-obj-pub.i686-unknown-kfreebsd-gnu.h} |  0
+ ... => lock-obj-pub.i686-unknown-linux-gnu.h} |  0
+ ...=> lock-obj-pub.s390x-unknown-linux-gnu.h} |  0
+ ...ock-obj-pub.x86_64-unknown-kfreebsd-gnu.h} |  0
+ ...> lock-obj-pub.x86_64-unknown-linux-gnu.h} |  0
+ ...ock-obj-pub.x86_64-unknown-linux-gnux32.h} |  0
+ ... lock-obj-pub.x86_64-unknown-linux-musl.h} |  0
+ 10 files changed, 85 insertions(+), 23 deletions(-)
+ rename src/syscfg/{lock-obj-pub.i686-pc-gnu.h => lock-obj-pub.i686-unknown-gnu.h} (100%)
+ rename src/syscfg/{lock-obj-pub.i686-pc-kfreebsd-gnu.h => lock-obj-pub.i686-unknown-kfreebsd-gnu.h} (100%)
+ rename src/syscfg/{lock-obj-pub.i686-pc-linux-gnu.h => lock-obj-pub.i686-unknown-linux-gnu.h} (100%)
+ rename src/syscfg/{lock-obj-pub.s390x-ibm-linux-gnu.h => lock-obj-pub.s390x-unknown-linux-gnu.h} (100%)
+ rename src/syscfg/{lock-obj-pub.x86_64-pc-kfreebsd-gnu.h => lock-obj-pub.x86_64-unknown-kfreebsd-gnu.h} (100%)
+ rename src/syscfg/{lock-obj-pub.x86_64-pc-linux-gnu.h => lock-obj-pub.x86_64-unknown-linux-gnu.h} (100%)
+ rename src/syscfg/{lock-obj-pub.x86_64-pc-linux-gnux32.h => lock-obj-pub.x86_64-unknown-linux-gnux32.h} (100%)
+ rename src/syscfg/{lock-obj-pub.x86_64-pc-linux-musl.h => lock-obj-pub.x86_64-unknown-linux-musl.h} (100%)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 42998e46a3bc..8ec582ef99fb 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -52,9 +52,9 @@ lock_obj_pub = \
+ 	syscfg/lock-obj-pub.arm-apple-darwin.h              \
+         syscfg/lock-obj-pub.hppa-unknown-linux-gnu.h        \
+ 	syscfg/lock-obj-pub.i386-apple-darwin.h             \
+-        syscfg/lock-obj-pub.i686-pc-gnu.h                   \
+-        syscfg/lock-obj-pub.i686-pc-kfreebsd-gnu.h          \
+-        syscfg/lock-obj-pub.i686-pc-linux-gnu.h             \
++        syscfg/lock-obj-pub.i686-unknown-gnu.h              \
++        syscfg/lock-obj-pub.i686-unknown-kfreebsd-gnu.h     \
++        syscfg/lock-obj-pub.i686-unknown-linux-gnu.h        \
+         syscfg/lock-obj-pub.m68k-unknown-linux-gnu.h        \
+         syscfg/lock-obj-pub.mips-unknown-linux-gnu.h        \
+         syscfg/lock-obj-pub.mips64el-unknown-linux-gnuabi64.h \
+@@ -66,16 +66,16 @@ lock_obj_pub = \
+ 	syscfg/lock-obj-pub.powerpc64le-unknown-linux-gnu.h \
+ 	syscfg/lock-obj-pub.powerpc-unknown-linux-gnuspe.h  \
+ 	syscfg/lock-obj-pub.riscv64-unknown-linux-gnu.h     \
+-        syscfg/lock-obj-pub.s390x-ibm-linux-gnu.h           \
++        syscfg/lock-obj-pub.s390x-unknown-linux-gnu.h       \
+         syscfg/lock-obj-pub.sh3-unknown-linux-gnu.h         \
+         syscfg/lock-obj-pub.sh4-unknown-linux-gnu.h         \
+         syscfg/lock-obj-pub.sparc-unknown-linux-gnu.h       \
+         syscfg/lock-obj-pub.sparc64-unknown-linux-gnu.h     \
+ 	syscfg/lock-obj-pub.x86_64-apple-darwin.h           \
+-        syscfg/lock-obj-pub.x86_64-pc-kfreebsd-gnu.h        \
+-        syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h           \
+-        syscfg/lock-obj-pub.x86_64-pc-linux-gnux32.h        \
+-        syscfg/lock-obj-pub.x86_64-pc-linux-musl.h          \
++        syscfg/lock-obj-pub.x86_64-unknown-kfreebsd-gnu.h   \
++        syscfg/lock-obj-pub.x86_64-unknown-linux-gnu.h      \
++        syscfg/lock-obj-pub.x86_64-unknown-linux-gnux32.h   \
++        syscfg/lock-obj-pub.x86_64-unknown-linux-musl.h     \
+ 	syscfg/lock-obj-pub.tilegx-unknown-linux-gnu.h      \
+ 	syscfg/lock-obj-pub.ia64-unknown-linux-gnu.h        \
+ 	syscfg/lock-obj-pub.mingw32.h
+diff --git a/src/mkheader.c b/src/mkheader.c
+index 2fc5fada66a4..7a38a1bec1a4 100644
+--- a/src/mkheader.c
++++ b/src/mkheader.c
+@@ -51,17 +51,27 @@ xfree (void *a)
+ 
+ 
+ static char *
+-xstrdup (const char *string)
++xmalloc (size_t n)
+ {
+   char *p;
+-  size_t len = strlen (string) + 1;
+ 
+-  p = malloc (len);
++  p = malloc (n);
+   if (!p)
+     {
+       fputs (PGM ": out of core\n", stderr);
+       exit (1);
+     }
++  return p;
++}
++
++
++static char *
++xstrdup (const char *string)
++{
++  char *p;
++  size_t len = strlen (string) + 1;
++
++  p = xmalloc (len);
+   memcpy (p, string, len);
+   return p;
+ }
+@@ -69,23 +79,31 @@ xstrdup (const char *string)
+ 
+ /* Return a malloced string with TRIPLET.  If TRIPLET has an alias
+    return that instead.  In general build-aux/config.sub should do the
+-   aliasing but some returned triplets are anyway identical and thus we
+-   use this function to map it to the canonical form.  */
++   aliasing but some returned triplets are anyway identical and thus
++   we use this function to map it to the canonical form.
++   NO_VENDOR_HACK is for internal use; caller must call with 0. */
+ static char *
+-canon_host_triplet (const char *triplet)
++canon_host_triplet (const char *triplet, int no_vendor_hack)
+ {
+   struct {
+     const char *name;
+     const char *alias;
+   } tbl[] = {
+-    {"i486-pc-linux-gnu", "i686-pc-linux-gnu" },
++    {"i486-pc-linux-gnu", "i686-unknown-linux-gnu" },
+     {"i586-pc-linux-gnu" },
+-    {"i486-pc-gnu", "i686-pc-gnu"},
++    {"i686-pc-linux-gnu" },
++    {"arc-oe-linux-uclibc" }, /* Other CPU but same struct.  */
++
++    {"i486-pc-gnu", "i686-unknown-gnu"},
+     {"i586-pc-gnu"},
+-    {"i486-pc-kfreebsd-gnu", "i686-pc-kfreebsd-gnu"},
++    {"i686-pc-gnu"},
++
++    {"i486-pc-kfreebsd-gnu", "i686-unknown-kfreebsd-gnu"},
+     {"i586-pc-kfreebsd-gnu"},
++    {"i686-pc-kfreebsd-gnu"},
+ 
+-    {"x86_64-pc-linux-gnuhardened1", "x86_64-pc-linux-gnu" },
++    {"x86_64-pc-linux-gnuhardened1", "x86_64-unknown-linux-gnu" },
++    {"x86_64-pc-linux-gnu" },
+ 
+     {"powerpc-unknown-linux-gnuspe", "powerpc-unknown-linux-gnu" },
+ 
+@@ -98,6 +116,7 @@ canon_host_triplet (const char *triplet)
+   };
+   int i;
+   const char *lastalias = NULL;
++  const char *s;
+ 
+   for (i=0; tbl[i].name; i++)
+     {
+@@ -110,6 +129,36 @@ canon_host_triplet (const char *triplet)
+           return xstrdup (lastalias);
+         }
+     }
++  for (i=0, s=triplet; *s; s++)
++    if (*s == '-')
++      i++;
++  if (i > 2 && !no_vendor_hack)
++    {
++      /* We have a 4 part "triplet": CPU-VENDOR-KERNEL-SYSTEM where
++       * the last two parts replace the OS part of a real triplet.
++       * The VENDOR part is then in general useless because
++       * KERNEL-SYSTEM is specific enough.  We now do a second pass by
++       * replacing VENDOR with "unknown".  */
++      char *p;
++      char *buf = xmalloc (strlen (triplet) + 7 + 1);
++
++      for (p=buf,s=triplet,i=0; *s; s++)
++        {
++          *p++ = *s;
++          if (*s == '-' && ++i == 1)
++            {
++              memcpy (p, "unknown-",8);
++              p += 8;
++              for (s++; *s != '-'; s++)
++                ;
++            }
++        }
++      *p = 0;
++      p = canon_host_triplet (buf, 1);
++      xfree (buf);
++      return p;
++    }
++
+   return xstrdup (triplet);
+ }
+ 
+@@ -558,7 +607,7 @@ write_special (const char *fname, int lnr, const char *tag)
+ int
+ main (int argc, char **argv)
+ {
+-  FILE *fp;
++  FILE *fp = NULL;
+   char line[LINESIZE];
+   int lnr = 0;
+   const char *fname, *s;
+@@ -571,11 +620,22 @@ main (int argc, char **argv)
+       argc--; argv++;
+     }
+ 
+-  if (argc != 6)
++  if (argc == 1)
++    {
++      /* Print just the canonicalized host triplet.  */
++      host_triplet = canon_host_triplet (argv[0], 0);
++      printf ("%s\n", host_triplet);
++      goto leave;
++    }
++  else if (argc == 6)
++    ; /* Standard operation.  */
++  else
+     {
+       fputs ("usage: " PGM
+              " host_os host_triplet template.h config.h"
+-             " version version_number\n",
++             " version version_number\n"
++             "       " PGM
++             " host_triplet\n",
+              stderr);
+       return 1;
+     }
+@@ -586,7 +646,7 @@ main (int argc, char **argv)
+   hdr_version = argv[4];
+   hdr_version_number = argv[5];
+ 
+-  host_triplet = canon_host_triplet (host_triplet_raw);
++  host_triplet = canon_host_triplet (host_triplet_raw, 0);
+ 
+   srcdir = malloc (strlen (fname) + 2 + 1);
+   if (!srcdir)
+@@ -677,13 +737,15 @@ main (int argc, char **argv)
+          "End:\n"
+          "*/\n", stdout);
+ 
++ leave:
+   if (ferror (stdout))
+     {
+       fprintf (stderr, PGM ": error writing to stdout: %s\n", strerror (errno));
+       return 1;
+     }
+ 
+-  fclose (fp);
++  if (fp)
++    fclose (fp);
+ 
+   xfree (host_triplet);
+   return 0;
+diff --git a/src/syscfg/lock-obj-pub.i686-pc-gnu.h b/src/syscfg/lock-obj-pub.i686-unknown-gnu.h
+similarity index 100%
+rename from src/syscfg/lock-obj-pub.i686-pc-gnu.h
+rename to src/syscfg/lock-obj-pub.i686-unknown-gnu.h
+diff --git a/src/syscfg/lock-obj-pub.i686-pc-kfreebsd-gnu.h b/src/syscfg/lock-obj-pub.i686-unknown-kfreebsd-gnu.h
+similarity index 100%
+rename from src/syscfg/lock-obj-pub.i686-pc-kfreebsd-gnu.h
+rename to src/syscfg/lock-obj-pub.i686-unknown-kfreebsd-gnu.h
+diff --git a/src/syscfg/lock-obj-pub.i686-pc-linux-gnu.h b/src/syscfg/lock-obj-pub.i686-unknown-linux-gnu.h
+similarity index 100%
+rename from src/syscfg/lock-obj-pub.i686-pc-linux-gnu.h
+rename to src/syscfg/lock-obj-pub.i686-unknown-linux-gnu.h
+diff --git a/src/syscfg/lock-obj-pub.s390x-ibm-linux-gnu.h b/src/syscfg/lock-obj-pub.s390x-unknown-linux-gnu.h
+similarity index 100%
+rename from src/syscfg/lock-obj-pub.s390x-ibm-linux-gnu.h
+rename to src/syscfg/lock-obj-pub.s390x-unknown-linux-gnu.h
+diff --git a/src/syscfg/lock-obj-pub.x86_64-pc-kfreebsd-gnu.h b/src/syscfg/lock-obj-pub.x86_64-unknown-kfreebsd-gnu.h
+similarity index 100%
+rename from src/syscfg/lock-obj-pub.x86_64-pc-kfreebsd-gnu.h
+rename to src/syscfg/lock-obj-pub.x86_64-unknown-kfreebsd-gnu.h
+diff --git a/src/syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h b/src/syscfg/lock-obj-pub.x86_64-unknown-linux-gnu.h
+similarity index 100%
+rename from src/syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h
+rename to src/syscfg/lock-obj-pub.x86_64-unknown-linux-gnu.h
+diff --git a/src/syscfg/lock-obj-pub.x86_64-pc-linux-gnux32.h b/src/syscfg/lock-obj-pub.x86_64-unknown-linux-gnux32.h
+similarity index 100%
+rename from src/syscfg/lock-obj-pub.x86_64-pc-linux-gnux32.h
+rename to src/syscfg/lock-obj-pub.x86_64-unknown-linux-gnux32.h
+diff --git a/src/syscfg/lock-obj-pub.x86_64-pc-linux-musl.h b/src/syscfg/lock-obj-pub.x86_64-unknown-linux-musl.h
+similarity index 100%
+rename from src/syscfg/lock-obj-pub.x86_64-pc-linux-musl.h
+rename to src/syscfg/lock-obj-pub.x86_64-unknown-linux-musl.h
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch b/meta/recipes-support/libgpg-error/libgpg-error/0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch
new file mode 100644
index 0000000000..197652f283
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch
@@ -0,0 +1,35 @@
+From ae6a3f20345dac4b9daab8c39ac2d3fb3f2c21e3 Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk at gnupg.org>
+Date: Fri, 21 Sep 2018 14:37:21 +0200
+Subject: [PATCH Libgpg-error] syscfg: Add support for arc-unknown-linux-gnu
+
+* src/mkheader.c (canon_host_triplet): Add to table.
+--
+
+Note that unknown in the above triplet is actually a wildcard for 4
+part triplets.
+
+Signed-off-by: Werner Koch <wk at gnupg.org>
+
+Upstream-Status: Backport [http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=f4f0da74f526d7e35cedbc2e93454df6440dbfa5]
+---
+ src/mkheader.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/mkheader.c b/src/mkheader.c
+index 7a38a1bec1a4..a4866e96ef43 100644
+--- a/src/mkheader.c
++++ b/src/mkheader.c
+@@ -92,7 +92,8 @@ canon_host_triplet (const char *triplet, int no_vendor_hack)
+     {"i486-pc-linux-gnu", "i686-unknown-linux-gnu" },
+     {"i586-pc-linux-gnu" },
+     {"i686-pc-linux-gnu" },
+-    {"arc-oe-linux-uclibc" }, /* Other CPU but same struct.  */
++    {"arc-oe-linux-gnu"    }, /* Other CPU but same struct.  */
++    {"arc-oe-linux-uclibc" }, /* and uclibc is also the same.  */
+ 
+     {"i486-pc-gnu", "i686-unknown-gnu"},
+     {"i586-pc-gnu"},
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
index a4c720be9d..3e39c556eb 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
@@ -14,6 +14,8 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
+           file://0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch \
+           file://0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch \
 	  "
 SRC_URI[md5sum] = "ef3d928a5a453fa701ecc3bb22be1c64"
 SRC_URI[sha256sum] = "c345c5e73cc2332f8d50db84a2280abfb1d8f6d4f1858b9daa30404db44540ca"
@@ -30,6 +32,9 @@ do_compile_prepend() {
 	if [ ${TARGET_OS} = "mingw32" ]; then
 		# There are no arch specific syscfg files for mingw32
 		TARGET_FILE=
+	elif [ ${TARGET_ARCH} = "arc" ]; then
+		# ARC syscfg file is automatically aliased to i686-pc-linux-gnu
+		TARGET_FILE=
 	elif [ ${TARGET_OS} != "linux" ]; then
 		TARGET_FILE=${TARGET_OS}
 	fi
@@ -42,7 +47,7 @@ do_compile_prepend() {
 	  mips64*)    TUPLE=mips64el-unknown-linux-gnuabi64 ;;
 	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
-	  x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
+	  x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
 	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
 	esac
 
-- 
2.16.2
