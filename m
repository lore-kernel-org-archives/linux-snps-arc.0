From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:33 -0800
Subject: [PATCH 11/21] ARC: ABI lists
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-12-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                                          |   17 +
 sysdeps/arc/nofpu/libm-test-ulps                   |  390 ++++
 sysdeps/arc/nofpu/libm-test-ulps-name              |    1 +
 sysdeps/unix/sysv/linux/arc/c++-types.data         |   67 +
 sysdeps/unix/sysv/linux/arc/ld.abilist             |    9 +
 .../unix/sysv/linux/arc/libBrokenLocale.abilist    |    1 +
 sysdeps/unix/sysv/linux/arc/libanl.abilist         |    4 +
 sysdeps/unix/sysv/linux/arc/libc.abilist           | 2089 ++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/libcrypt.abilist       |    2 +
 sysdeps/unix/sysv/linux/arc/libdl.abilist          |    9 +
 sysdeps/unix/sysv/linux/arc/libm.abilist           |  753 +++++++
 sysdeps/unix/sysv/linux/arc/libnsl.abilist         |  120 ++
 sysdeps/unix/sysv/linux/arc/libpthread.abilist     |  235 +++
 sysdeps/unix/sysv/linux/arc/libresolv.abilist      |   79 +
 sysdeps/unix/sysv/linux/arc/librt.abilist          |   35 +
 sysdeps/unix/sysv/linux/arc/libthread_db.abilist   |   40 +
 sysdeps/unix/sysv/linux/arc/libutil.abilist        |    6 +
 sysdeps/unix/sysv/linux/arc/localplt.data          |   15 +
 18 files changed, 3872 insertions(+)
 create mode 100644 sysdeps/arc/nofpu/libm-test-ulps
 create mode 100644 sysdeps/arc/nofpu/libm-test-ulps-name
 create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
 create mode 100644 sysdeps/unix/sysv/linux/arc/ld.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libanl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libc.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libcrypt.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libdl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libm.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libnsl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libpthread.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libresolv.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/librt.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libthread_db.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libutil.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/localplt.data

diff --git a/ChangeLog b/ChangeLog
index f6ad5968d7de..4182e89ccbb3 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -74,6 +74,23 @@
 	* sysdeps/unix/sysv/linux/arc/dl-static.c: New file.
 	* sysdeps/unix/sysv/linux/arc/ldconfig.h: New file.
 	* sysdeps/unix/sysv/linux/arc/ldsodefs.h: New file.
+	* sysdeps/arc/nofpu/libm-test-ulps: New file.
+	* sysdeps/arc/nofpu/libm-test-ulps-name: New file.
+	* sysdeps/unix/sysv/linux/arc/c++-types.data: New file.
+	* sysdeps/unix/sysv/linux/arc/ld.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libanl.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libc.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libcrypt.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libdl.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libm.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libnsl.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libpthread.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libresolv.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/librt.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libthread_db.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/libutil.abilist: New file.
+	* sysdeps/unix/sysv/linux/arc/localplt.data: New file.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/sysdeps/arc/nofpu/libm-test-ulps b/sysdeps/arc/nofpu/libm-test-ulps
new file mode 100644
index 000000000000..0e8ef313fa94
--- /dev/null
+++ b/sysdeps/arc/nofpu/libm-test-ulps
@@ -0,0 +1,390 @@
+# Begin of automatic generation
+
+# Maximal error of functions:
+Function: "acos":
+float: 1
+ifloat: 1
+
+Function: "acosh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "asin":
+float: 1
+ifloat: 1
+
+Function: "asinh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "atan":
+float: 1
+ifloat: 1
+
+Function: "atan2":
+float: 1
+ifloat: 1
+
+Function: "atanh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "cabs":
+double: 1
+idouble: 1
+
+Function: Real part of "cacos":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Imaginary part of "cacos":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "cacosh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Imaginary part of "cacosh":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "carg":
+float: 1
+ifloat: 1
+
+Function: Real part of "casin":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "casin":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "casinh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Imaginary part of "casinh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "catan":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "catan":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "catanh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "catanh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "cbrt":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: Real part of "ccos":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "ccos":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "ccosh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "ccosh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "cexp":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: Imaginary part of "cexp":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Real part of "clog":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Imaginary part of "clog":
+float: 1
+ifloat: 1
+
+Function: Real part of "clog10":
+double: 3
+float: 4
+idouble: 3
+ifloat: 4
+
+Function: Imaginary part of "clog10":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "cos":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "cosh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "cpow":
+double: 2
+float: 5
+idouble: 2
+ifloat: 5
+
+Function: Imaginary part of "cpow":
+float: 2
+ifloat: 2
+
+Function: Real part of "csin":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "csinh":
+float: 1
+ifloat: 1
+
+Function: Imaginary part of "csinh":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Real part of "csqrt":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Imaginary part of "csqrt":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "ctan":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "ctan":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "ctanh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Imaginary part of "ctanh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "erf":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "erfc":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: "exp10":
+double: 2
+idouble: 2
+
+Function: "exp2":
+double: 1
+idouble: 1
+
+Function: "expm1":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "gamma":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: "hypot":
+double: 1
+idouble: 1
+
+Function: "j0":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "j1":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "jn":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: "lgamma":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: "log10":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "log1p":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "log2":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "pow":
+double: 1
+idouble: 1
+
+Function: "sin":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "sincos":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "sinh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "tan":
+float: 1
+ifloat: 1
+
+Function: "tanh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "tgamma":
+double: 5
+float: 4
+idouble: 5
+ifloat: 4
+
+Function: "y0":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "y1":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: "yn":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+# end of automatic generation
diff --git a/sysdeps/arc/nofpu/libm-test-ulps-name b/sysdeps/arc/nofpu/libm-test-ulps-name
new file mode 100644
index 000000000000..8c4fba4f9ae0
--- /dev/null
+++ b/sysdeps/arc/nofpu/libm-test-ulps-name
@@ -0,0 +1 @@
+ARC
diff --git a/sysdeps/unix/sysv/linux/arc/c++-types.data b/sysdeps/unix/sysv/linux/arc/c++-types.data
new file mode 100644
index 000000000000..303f4570c8ee
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/c++-types.data
@@ -0,0 +1,67 @@
+blkcnt64_t:x
+blkcnt_t:l
+blksize_t:i
+caddr_t:Pc
+clockid_t:i
+clock_t:l
+daddr_t:i
+dev_t:y
+fd_mask:l
+fsblkcnt64_t:y
+fsblkcnt_t:m
+fsfilcnt64_t:y
+fsfilcnt_t:m
+fsid_t:8__fsid_t
+gid_t:j
+id_t:j
+ino64_t:y
+ino_t:m
+int16_t:s
+int32_t:i
+int64_t:x
+int8_t:a
+intptr_t:i
+key_t:i
+loff_t:x
+mode_t:j
+nlink_t:j
+off64_t:x
+off_t:l
+pid_t:i
+pthread_attr_t:14pthread_attr_t
+pthread_barrier_t:17pthread_barrier_t
+pthread_barrierattr_t:21pthread_barrierattr_t
+pthread_cond_t:14pthread_cond_t
+pthread_condattr_t:18pthread_condattr_t
+pthread_key_t:j
+pthread_mutex_t:15pthread_mutex_t
+pthread_mutexattr_t:19pthread_mutexattr_t
+pthread_once_t:i
+pthread_rwlock_t:16pthread_rwlock_t
+pthread_rwlockattr_t:20pthread_rwlockattr_t
+pthread_spinlock_t:i
+pthread_t:m
+quad_t:x
+register_t:i
+rlim64_t:y
+rlim_t:m
+sigset_t:10__sigset_t
+size_t:j
+socklen_t:j
+ssize_t:i
+suseconds_t:l
+time_t:l
+u_char:h
+uid_t:j
+uint:j
+u_int:j
+u_int16_t:t
+u_int32_t:j
+u_int64_t:y
+u_int8_t:h
+ulong:m
+u_long:m
+u_quad_t:y
+useconds_t:j
+ushort:t
+u_short:t
diff --git a/sysdeps/unix/sysv/linux/arc/ld.abilist b/sysdeps/unix/sysv/linux/arc/ld.abilist
new file mode 100644
index 000000000000..71576160eddd
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ld.abilist
@@ -0,0 +1,9 @@
+GLIBC_2.29 __libc_stack_end D 0x4
+GLIBC_2.29 __stack_chk_guard D 0x4
+GLIBC_2.29 __tls_get_addr F
+GLIBC_2.29 _dl_mcount F
+GLIBC_2.29 _r_debug D 0x14
+GLIBC_2.29 calloc F
+GLIBC_2.29 free F
+GLIBC_2.29 malloc F
+GLIBC_2.29 realloc F
diff --git a/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist b/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
new file mode 100644
index 000000000000..96b4163a254a
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
@@ -0,0 +1 @@
+GLIBC_2.29 __ctype_get_mb_cur_max F
diff --git a/sysdeps/unix/sysv/linux/arc/libanl.abilist b/sysdeps/unix/sysv/linux/arc/libanl.abilist
new file mode 100644
index 000000000000..416a6f8ddb26
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libanl.abilist
@@ -0,0 +1,4 @@
+GLIBC_2.29 gai_cancel F
+GLIBC_2.29 gai_error F
+GLIBC_2.29 gai_suspend F
+GLIBC_2.29 getaddrinfo_a F
diff --git a/sysdeps/unix/sysv/linux/arc/libc.abilist b/sysdeps/unix/sysv/linux/arc/libc.abilist
new file mode 100644
index 000000000000..1e9a5dc9f092
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libc.abilist
@@ -0,0 +1,2089 @@
+GLIBC_2.29 _Exit F
+GLIBC_2.29 _IO_2_1_stderr_ D 0x98
+GLIBC_2.29 _IO_2_1_stdin_ D 0x98
+GLIBC_2.29 _IO_2_1_stdout_ D 0x98
+GLIBC_2.29 _IO_adjust_column F
+GLIBC_2.29 _IO_adjust_wcolumn F
+GLIBC_2.29 _IO_default_doallocate F
+GLIBC_2.29 _IO_default_finish F
+GLIBC_2.29 _IO_default_pbackfail F
+GLIBC_2.29 _IO_default_uflow F
+GLIBC_2.29 _IO_default_xsgetn F
+GLIBC_2.29 _IO_default_xsputn F
+GLIBC_2.29 _IO_do_write F
+GLIBC_2.29 _IO_doallocbuf F
+GLIBC_2.29 _IO_fclose F
+GLIBC_2.29 _IO_fdopen F
+GLIBC_2.29 _IO_feof F
+GLIBC_2.29 _IO_ferror F
+GLIBC_2.29 _IO_fflush F
+GLIBC_2.29 _IO_fgetpos F
+GLIBC_2.29 _IO_fgetpos64 F
+GLIBC_2.29 _IO_fgets F
+GLIBC_2.29 _IO_file_attach F
+GLIBC_2.29 _IO_file_close F
+GLIBC_2.29 _IO_file_close_it F
+GLIBC_2.29 _IO_file_doallocate F
+GLIBC_2.29 _IO_file_finish F
+GLIBC_2.29 _IO_file_fopen F
+GLIBC_2.29 _IO_file_init F
+GLIBC_2.29 _IO_file_jumps D 0x54
+GLIBC_2.29 _IO_file_open F
+GLIBC_2.29 _IO_file_overflow F
+GLIBC_2.29 _IO_file_read F
+GLIBC_2.29 _IO_file_seek F
+GLIBC_2.29 _IO_file_seekoff F
+GLIBC_2.29 _IO_file_setbuf F
+GLIBC_2.29 _IO_file_stat F
+GLIBC_2.29 _IO_file_sync F
+GLIBC_2.29 _IO_file_underflow F
+GLIBC_2.29 _IO_file_write F
+GLIBC_2.29 _IO_file_xsputn F
+GLIBC_2.29 _IO_flockfile F
+GLIBC_2.29 _IO_flush_all F
+GLIBC_2.29 _IO_flush_all_linebuffered F
+GLIBC_2.29 _IO_fopen F
+GLIBC_2.29 _IO_fprintf F
+GLIBC_2.29 _IO_fputs F
+GLIBC_2.29 _IO_fread F
+GLIBC_2.29 _IO_free_backup_area F
+GLIBC_2.29 _IO_free_wbackup_area F
+GLIBC_2.29 _IO_fsetpos F
+GLIBC_2.29 _IO_fsetpos64 F
+GLIBC_2.29 _IO_ftell F
+GLIBC_2.29 _IO_ftrylockfile F
+GLIBC_2.29 _IO_funlockfile F
+GLIBC_2.29 _IO_fwrite F
+GLIBC_2.29 _IO_getc F
+GLIBC_2.29 _IO_getline F
+GLIBC_2.29 _IO_getline_info F
+GLIBC_2.29 _IO_gets F
+GLIBC_2.29 _IO_init F
+GLIBC_2.29 _IO_init_marker F
+GLIBC_2.29 _IO_init_wmarker F
+GLIBC_2.29 _IO_iter_begin F
+GLIBC_2.29 _IO_iter_end F
+GLIBC_2.29 _IO_iter_file F
+GLIBC_2.29 _IO_iter_next F
+GLIBC_2.29 _IO_least_wmarker F
+GLIBC_2.29 _IO_link_in F
+GLIBC_2.29 _IO_list_all D 0x4
+GLIBC_2.29 _IO_list_lock F
+GLIBC_2.29 _IO_list_resetlock F
+GLIBC_2.29 _IO_list_unlock F
+GLIBC_2.29 _IO_marker_delta F
+GLIBC_2.29 _IO_marker_difference F
+GLIBC_2.29 _IO_padn F
+GLIBC_2.29 _IO_peekc_locked F
+GLIBC_2.29 _IO_popen F
+GLIBC_2.29 _IO_printf F
+GLIBC_2.29 _IO_proc_close F
+GLIBC_2.29 _IO_proc_open F
+GLIBC_2.29 _IO_putc F
+GLIBC_2.29 _IO_puts F
+GLIBC_2.29 _IO_remove_marker F
+GLIBC_2.29 _IO_seekmark F
+GLIBC_2.29 _IO_seekoff F
+GLIBC_2.29 _IO_seekpos F
+GLIBC_2.29 _IO_seekwmark F
+GLIBC_2.29 _IO_setb F
+GLIBC_2.29 _IO_setbuffer F
+GLIBC_2.29 _IO_setvbuf F
+GLIBC_2.29 _IO_sgetn F
+GLIBC_2.29 _IO_sprintf F
+GLIBC_2.29 _IO_sputbackc F
+GLIBC_2.29 _IO_sputbackwc F
+GLIBC_2.29 _IO_sscanf F
+GLIBC_2.29 _IO_str_init_readonly F
+GLIBC_2.29 _IO_str_init_static F
+GLIBC_2.29 _IO_str_overflow F
+GLIBC_2.29 _IO_str_pbackfail F
+GLIBC_2.29 _IO_str_seekoff F
+GLIBC_2.29 _IO_str_underflow F
+GLIBC_2.29 _IO_sungetc F
+GLIBC_2.29 _IO_sungetwc F
+GLIBC_2.29 _IO_switch_to_get_mode F
+GLIBC_2.29 _IO_switch_to_main_wget_area F
+GLIBC_2.29 _IO_switch_to_wbackup_area F
+GLIBC_2.29 _IO_switch_to_wget_mode F
+GLIBC_2.29 _IO_un_link F
+GLIBC_2.29 _IO_ungetc F
+GLIBC_2.29 _IO_unsave_markers F
+GLIBC_2.29 _IO_unsave_wmarkers F
+GLIBC_2.29 _IO_vfprintf F
+GLIBC_2.29 _IO_vsprintf F
+GLIBC_2.29 _IO_wdefault_doallocate F
+GLIBC_2.29 _IO_wdefault_finish F
+GLIBC_2.29 _IO_wdefault_pbackfail F
+GLIBC_2.29 _IO_wdefault_uflow F
+GLIBC_2.29 _IO_wdefault_xsgetn F
+GLIBC_2.29 _IO_wdefault_xsputn F
+GLIBC_2.29 _IO_wdo_write F
+GLIBC_2.29 _IO_wdoallocbuf F
+GLIBC_2.29 _IO_wfile_jumps D 0x54
+GLIBC_2.29 _IO_wfile_overflow F
+GLIBC_2.29 _IO_wfile_seekoff F
+GLIBC_2.29 _IO_wfile_sync F
+GLIBC_2.29 _IO_wfile_underflow F
+GLIBC_2.29 _IO_wfile_xsputn F
+GLIBC_2.29 _IO_wmarker_delta F
+GLIBC_2.29 _IO_wsetb F
+GLIBC_2.29 ___brk_addr D 0x4
+GLIBC_2.29 __adjtimex F
+GLIBC_2.29 __after_morecore_hook D 0x4
+GLIBC_2.29 __argz_count F
+GLIBC_2.29 __argz_next F
+GLIBC_2.29 __argz_stringify F
+GLIBC_2.29 __asprintf F
+GLIBC_2.29 __asprintf_chk F
+GLIBC_2.29 __assert F
+GLIBC_2.29 __assert_fail F
+GLIBC_2.29 __assert_perror_fail F
+GLIBC_2.29 __backtrace F
+GLIBC_2.29 __backtrace_symbols F
+GLIBC_2.29 __backtrace_symbols_fd F
+GLIBC_2.29 __bsd_getpgrp F
+GLIBC_2.29 __bzero F
+GLIBC_2.29 __check_rhosts_file D 0x4
+GLIBC_2.29 __chk_fail F
+GLIBC_2.29 __clone F
+GLIBC_2.29 __close F
+GLIBC_2.29 __cmsg_nxthdr F
+GLIBC_2.29 __confstr_chk F
+GLIBC_2.29 __connect F
+GLIBC_2.29 __ctype_b_loc F
+GLIBC_2.29 __ctype_get_mb_cur_max F
+GLIBC_2.29 __ctype_tolower_loc F
+GLIBC_2.29 __ctype_toupper_loc F
+GLIBC_2.29 __curbrk D 0x4
+GLIBC_2.29 __cxa_at_quick_exit F
+GLIBC_2.29 __cxa_atexit F
+GLIBC_2.29 __cxa_finalize F
+GLIBC_2.29 __cxa_thread_atexit_impl F
+GLIBC_2.29 __cyg_profile_func_enter F
+GLIBC_2.29 __cyg_profile_func_exit F
+GLIBC_2.29 __daylight D 0x4
+GLIBC_2.29 __dcgettext F
+GLIBC_2.29 __default_morecore F
+GLIBC_2.29 __dgettext F
+GLIBC_2.29 __dprintf_chk F
+GLIBC_2.29 __dup2 F
+GLIBC_2.29 __duplocale F
+GLIBC_2.29 __endmntent F
+GLIBC_2.29 __environ D 0x4
+GLIBC_2.29 __errno_location F
+GLIBC_2.29 __explicit_bzero_chk F
+GLIBC_2.29 __fbufsize F
+GLIBC_2.29 __fcntl F
+GLIBC_2.29 __fdelt_chk F
+GLIBC_2.29 __fdelt_warn F
+GLIBC_2.29 __ffs F
+GLIBC_2.29 __fgets_chk F
+GLIBC_2.29 __fgets_unlocked_chk F
+GLIBC_2.29 __fgetws_chk F
+GLIBC_2.29 __fgetws_unlocked_chk F
+GLIBC_2.29 __finite F
+GLIBC_2.29 __finitef F
+GLIBC_2.29 __flbf F
+GLIBC_2.29 __fork F
+GLIBC_2.29 __fpending F
+GLIBC_2.29 __fprintf_chk F
+GLIBC_2.29 __fpu_control D 0x4
+GLIBC_2.29 __fpurge F
+GLIBC_2.29 __fread_chk F
+GLIBC_2.29 __fread_unlocked_chk F
+GLIBC_2.29 __freadable F
+GLIBC_2.29 __freading F
+GLIBC_2.29 __free_hook D 0x4
+GLIBC_2.29 __freelocale F
+GLIBC_2.29 __fsetlocking F
+GLIBC_2.29 __fwprintf_chk F
+GLIBC_2.29 __fwritable F
+GLIBC_2.29 __fwriting F
+GLIBC_2.29 __fxstat F
+GLIBC_2.29 __fxstat64 F
+GLIBC_2.29 __fxstatat F
+GLIBC_2.29 __fxstatat64 F
+GLIBC_2.29 __getauxval F
+GLIBC_2.29 __getcwd_chk F
+GLIBC_2.29 __getdelim F
+GLIBC_2.29 __getdomainname_chk F
+GLIBC_2.29 __getgroups_chk F
+GLIBC_2.29 __gethostname_chk F
+GLIBC_2.29 __getlogin_r_chk F
+GLIBC_2.29 __getmntent_r F
+GLIBC_2.29 __getpagesize F
+GLIBC_2.29 __getpgid F
+GLIBC_2.29 __getpid F
+GLIBC_2.29 __gets_chk F
+GLIBC_2.29 __gettimeofday F
+GLIBC_2.29 __getwd_chk F
+GLIBC_2.29 __gmtime_r F
+GLIBC_2.29 __h_errno_location F
+GLIBC_2.29 __isalnum_l F
+GLIBC_2.29 __isalpha_l F
+GLIBC_2.29 __isascii_l F
+GLIBC_2.29 __isblank_l F
+GLIBC_2.29 __iscntrl_l F
+GLIBC_2.29 __isctype F
+GLIBC_2.29 __isdigit_l F
+GLIBC_2.29 __isgraph_l F
+GLIBC_2.29 __isinf F
+GLIBC_2.29 __isinff F
+GLIBC_2.29 __islower_l F
+GLIBC_2.29 __isnan F
+GLIBC_2.29 __isnanf F
+GLIBC_2.29 __isoc99_fscanf F
+GLIBC_2.29 __isoc99_fwscanf F
+GLIBC_2.29 __isoc99_scanf F
+GLIBC_2.29 __isoc99_sscanf F
+GLIBC_2.29 __isoc99_swscanf F
+GLIBC_2.29 __isoc99_vfscanf F
+GLIBC_2.29 __isoc99_vfwscanf F
+GLIBC_2.29 __isoc99_vscanf F
+GLIBC_2.29 __isoc99_vsscanf F
+GLIBC_2.29 __isoc99_vswscanf F
+GLIBC_2.29 __isoc99_vwscanf F
+GLIBC_2.29 __isoc99_wscanf F
+GLIBC_2.29 __isprint_l F
+GLIBC_2.29 __ispunct_l F
+GLIBC_2.29 __isspace_l F
+GLIBC_2.29 __isupper_l F
+GLIBC_2.29 __iswalnum_l F
+GLIBC_2.29 __iswalpha_l F
+GLIBC_2.29 __iswblank_l F
+GLIBC_2.29 __iswcntrl_l F
+GLIBC_2.29 __iswctype F
+GLIBC_2.29 __iswctype_l F
+GLIBC_2.29 __iswdigit_l F
+GLIBC_2.29 __iswgraph_l F
+GLIBC_2.29 __iswlower_l F
+GLIBC_2.29 __iswprint_l F
+GLIBC_2.29 __iswpunct_l F
+GLIBC_2.29 __iswspace_l F
+GLIBC_2.29 __iswupper_l F
+GLIBC_2.29 __iswxdigit_l F
+GLIBC_2.29 __isxdigit_l F
+GLIBC_2.29 __ivaliduser F
+GLIBC_2.29 __key_decryptsession_pk_LOCAL D 0x4
+GLIBC_2.29 __key_encryptsession_pk_LOCAL D 0x4
+GLIBC_2.29 __key_gendes_LOCAL D 0x4
+GLIBC_2.29 __libc_allocate_rtsig F
+GLIBC_2.29 __libc_calloc F
+GLIBC_2.29 __libc_current_sigrtmax F
+GLIBC_2.29 __libc_current_sigrtmin F
+GLIBC_2.29 __libc_free F
+GLIBC_2.29 __libc_freeres F
+GLIBC_2.29 __libc_init_first F
+GLIBC_2.29 __libc_mallinfo F
+GLIBC_2.29 __libc_malloc F
+GLIBC_2.29 __libc_mallopt F
+GLIBC_2.29 __libc_memalign F
+GLIBC_2.29 __libc_pvalloc F
+GLIBC_2.29 __libc_realloc F
+GLIBC_2.29 __libc_sa_len F
+GLIBC_2.29 __libc_start_main F
+GLIBC_2.29 __libc_valloc F
+GLIBC_2.29 __longjmp_chk F
+GLIBC_2.29 __lseek F
+GLIBC_2.29 __lxstat F
+GLIBC_2.29 __lxstat64 F
+GLIBC_2.29 __malloc_hook D 0x4
+GLIBC_2.29 __mbrlen F
+GLIBC_2.29 __mbrtowc F
+GLIBC_2.29 __mbsnrtowcs_chk F
+GLIBC_2.29 __mbsrtowcs_chk F
+GLIBC_2.29 __mbstowcs_chk F
+GLIBC_2.29 __memalign_hook D 0x4
+GLIBC_2.29 __memcpy_chk F
+GLIBC_2.29 __memmove_chk F
+GLIBC_2.29 __mempcpy F
+GLIBC_2.29 __mempcpy_chk F
+GLIBC_2.29 __memset_chk F
+GLIBC_2.29 __monstartup F
+GLIBC_2.29 __morecore D 0x4
+GLIBC_2.29 __nanosleep F
+GLIBC_2.29 __newlocale F
+GLIBC_2.29 __nl_langinfo_l F
+GLIBC_2.29 __nss_configure_lookup F
+GLIBC_2.29 __nss_database_lookup F
+GLIBC_2.29 __nss_hostname_digits_dots F
+GLIBC_2.29 __nss_next F
+GLIBC_2.29 __obstack_printf_chk F
+GLIBC_2.29 __obstack_vprintf_chk F
+GLIBC_2.29 __open F
+GLIBC_2.29 __open64 F
+GLIBC_2.29 __open64_2 F
+GLIBC_2.29 __open_2 F
+GLIBC_2.29 __openat64_2 F
+GLIBC_2.29 __openat_2 F
+GLIBC_2.29 __overflow F
+GLIBC_2.29 __pipe F
+GLIBC_2.29 __poll F
+GLIBC_2.29 __poll_chk F
+GLIBC_2.29 __posix_getopt F
+GLIBC_2.29 __ppoll_chk F
+GLIBC_2.29 __pread64 F
+GLIBC_2.29 __pread64_chk F
+GLIBC_2.29 __pread_chk F
+GLIBC_2.29 __printf_chk F
+GLIBC_2.29 __printf_fp F
+GLIBC_2.29 __profile_frequency F
+GLIBC_2.29 __progname D 0x4
+GLIBC_2.29 __progname_full D 0x4
+GLIBC_2.29 __ptsname_r_chk F
+GLIBC_2.29 __pwrite64 F
+GLIBC_2.29 __rawmemchr F
+GLIBC_2.29 __rcmd_errstr D 0x4
+GLIBC_2.29 __read F
+GLIBC_2.29 __read_chk F
+GLIBC_2.29 __readlink_chk F
+GLIBC_2.29 __readlinkat_chk F
+GLIBC_2.29 __realloc_hook D 0x4
+GLIBC_2.29 __realpath_chk F
+GLIBC_2.29 __recv_chk F
+GLIBC_2.29 __recvfrom_chk F
+GLIBC_2.29 __register_atfork F
+GLIBC_2.29 __res_init F
+GLIBC_2.29 __res_nclose F
+GLIBC_2.29 __res_ninit F
+GLIBC_2.29 __res_randomid F
+GLIBC_2.29 __res_state F
+GLIBC_2.29 __rpc_thread_createerr F
+GLIBC_2.29 __rpc_thread_svc_fdset F
+GLIBC_2.29 __rpc_thread_svc_max_pollfd F
+GLIBC_2.29 __rpc_thread_svc_pollfd F
+GLIBC_2.29 __sbrk F
+GLIBC_2.29 __sched_cpualloc F
+GLIBC_2.29 __sched_cpucount F
+GLIBC_2.29 __sched_cpufree F
+GLIBC_2.29 __sched_get_priority_max F
+GLIBC_2.29 __sched_get_priority_min F
+GLIBC_2.29 __sched_getparam F
+GLIBC_2.29 __sched_getscheduler F
+GLIBC_2.29 __sched_setscheduler F
+GLIBC_2.29 __sched_yield F
+GLIBC_2.29 __select F
+GLIBC_2.29 __send F
+GLIBC_2.29 __setmntent F
+GLIBC_2.29 __setpgid F
+GLIBC_2.29 __sigaction F
+GLIBC_2.29 __signbit F
+GLIBC_2.29 __signbitf F
+GLIBC_2.29 __sigpause F
+GLIBC_2.29 __sigsetjmp F
+GLIBC_2.29 __sigsuspend F
+GLIBC_2.29 __snprintf_chk F
+GLIBC_2.29 __sprintf_chk F
+GLIBC_2.29 __stack_chk_fail F
+GLIBC_2.29 __statfs F
+GLIBC_2.29 __stpcpy F
+GLIBC_2.29 __stpcpy_chk F
+GLIBC_2.29 __stpncpy F
+GLIBC_2.29 __stpncpy_chk F
+GLIBC_2.29 __strcasecmp F
+GLIBC_2.29 __strcasecmp_l F
+GLIBC_2.29 __strcasestr F
+GLIBC_2.29 __strcat_chk F
+GLIBC_2.29 __strcoll_l F
+GLIBC_2.29 __strcpy_chk F
+GLIBC_2.29 __strdup F
+GLIBC_2.29 __strerror_r F
+GLIBC_2.29 __strfmon_l F
+GLIBC_2.29 __strftime_l F
+GLIBC_2.29 __strncasecmp_l F
+GLIBC_2.29 __strncat_chk F
+GLIBC_2.29 __strncpy_chk F
+GLIBC_2.29 __strndup F
+GLIBC_2.29 __strsep_g F
+GLIBC_2.29 __strtod_internal F
+GLIBC_2.29 __strtod_l F
+GLIBC_2.29 __strtof_internal F
+GLIBC_2.29 __strtof_l F
+GLIBC_2.29 __strtok_r F
+GLIBC_2.29 __strtol_internal F
+GLIBC_2.29 __strtol_l F
+GLIBC_2.29 __strtold_internal F
+GLIBC_2.29 __strtold_l F
+GLIBC_2.29 __strtoll_internal F
+GLIBC_2.29 __strtoll_l F
+GLIBC_2.29 __strtoul_internal F
+GLIBC_2.29 __strtoul_l F
+GLIBC_2.29 __strtoull_internal F
+GLIBC_2.29 __strtoull_l F
+GLIBC_2.29 __strverscmp F
+GLIBC_2.29 __strxfrm_l F
+GLIBC_2.29 __swprintf_chk F
+GLIBC_2.29 __syscall_error F
+GLIBC_2.29 __sysconf F
+GLIBC_2.29 __syslog_chk F
+GLIBC_2.29 __sysv_signal F
+GLIBC_2.29 __timezone D 0x4
+GLIBC_2.29 __toascii_l F
+GLIBC_2.29 __tolower_l F
+GLIBC_2.29 __toupper_l F
+GLIBC_2.29 __towctrans F
+GLIBC_2.29 __towctrans_l F
+GLIBC_2.29 __towlower_l F
+GLIBC_2.29 __towupper_l F
+GLIBC_2.29 __ttyname_r_chk F
+GLIBC_2.29 __tzname D 0x8
+GLIBC_2.29 __uflow F
+GLIBC_2.29 __underflow F
+GLIBC_2.29 __uselocale F
+GLIBC_2.29 __vasprintf_chk F
+GLIBC_2.29 __vdprintf_chk F
+GLIBC_2.29 __vfork F
+GLIBC_2.29 __vfprintf_chk F
+GLIBC_2.29 __vfscanf F
+GLIBC_2.29 __vfwprintf_chk F
+GLIBC_2.29 __vprintf_chk F
+GLIBC_2.29 __vsnprintf F
+GLIBC_2.29 __vsnprintf_chk F
+GLIBC_2.29 __vsprintf_chk F
+GLIBC_2.29 __vsscanf F
+GLIBC_2.29 __vswprintf_chk F
+GLIBC_2.29 __vsyslog_chk F
+GLIBC_2.29 __vwprintf_chk F
+GLIBC_2.29 __wait F
+GLIBC_2.29 __waitpid F
+GLIBC_2.29 __wcpcpy_chk F
+GLIBC_2.29 __wcpncpy_chk F
+GLIBC_2.29 __wcrtomb_chk F
+GLIBC_2.29 __wcscasecmp_l F
+GLIBC_2.29 __wcscat_chk F
+GLIBC_2.29 __wcscoll_l F
+GLIBC_2.29 __wcscpy_chk F
+GLIBC_2.29 __wcsftime_l F
+GLIBC_2.29 __wcsncasecmp_l F
+GLIBC_2.29 __wcsncat_chk F
+GLIBC_2.29 __wcsncpy_chk F
+GLIBC_2.29 __wcsnrtombs_chk F
+GLIBC_2.29 __wcsrtombs_chk F
+GLIBC_2.29 __wcstod_internal F
+GLIBC_2.29 __wcstod_l F
+GLIBC_2.29 __wcstof_internal F
+GLIBC_2.29 __wcstof_l F
+GLIBC_2.29 __wcstol_internal F
+GLIBC_2.29 __wcstol_l F
+GLIBC_2.29 __wcstold_internal F
+GLIBC_2.29 __wcstold_l F
+GLIBC_2.29 __wcstoll_internal F
+GLIBC_2.29 __wcstoll_l F
+GLIBC_2.29 __wcstombs_chk F
+GLIBC_2.29 __wcstoul_internal F
+GLIBC_2.29 __wcstoul_l F
+GLIBC_2.29 __wcstoull_internal F
+GLIBC_2.29 __wcstoull_l F
+GLIBC_2.29 __wcsxfrm_l F
+GLIBC_2.29 __wctomb_chk F
+GLIBC_2.29 __wctrans_l F
+GLIBC_2.29 __wctype_l F
+GLIBC_2.29 __wmemcpy_chk F
+GLIBC_2.29 __wmemmove_chk F
+GLIBC_2.29 __wmempcpy_chk F
+GLIBC_2.29 __wmemset_chk F
+GLIBC_2.29 __woverflow F
+GLIBC_2.29 __wprintf_chk F
+GLIBC_2.29 __write F
+GLIBC_2.29 __wuflow F
+GLIBC_2.29 __wunderflow F
+GLIBC_2.29 __xmknod F
+GLIBC_2.29 __xmknodat F
+GLIBC_2.29 __xpg_basename F
+GLIBC_2.29 __xpg_sigpause F
+GLIBC_2.29 __xpg_strerror_r F
+GLIBC_2.29 __xstat F
+GLIBC_2.29 __xstat64 F
+GLIBC_2.29 _authenticate F
+GLIBC_2.29 _dl_mcount_wrapper F
+GLIBC_2.29 _dl_mcount_wrapper_check F
+GLIBC_2.29 _environ D 0x4
+GLIBC_2.29 _exit F
+GLIBC_2.29 _flush_cache F
+GLIBC_2.29 _flushlbf F
+GLIBC_2.29 _libc_intl_domainname D 0x5
+GLIBC_2.29 _longjmp F
+GLIBC_2.29 _mcleanup F
+GLIBC_2.29 _mcount F
+GLIBC_2.29 _nl_default_dirname D 0x12
+GLIBC_2.29 _nl_domain_bindings D 0x4
+GLIBC_2.29 _nl_msg_cat_cntr D 0x4
+GLIBC_2.29 _null_auth D 0xc
+GLIBC_2.29 _obstack_allocated_p F
+GLIBC_2.29 _obstack_begin F
+GLIBC_2.29 _obstack_begin_1 F
+GLIBC_2.29 _obstack_free F
+GLIBC_2.29 _obstack_memory_used F
+GLIBC_2.29 _obstack_newchunk F
+GLIBC_2.29 _res D 0x200
+GLIBC_2.29 _res_hconf D 0x30
+GLIBC_2.29 _rpc_dtablesize F
+GLIBC_2.29 _seterr_reply F
+GLIBC_2.29 _setjmp F
+GLIBC_2.29 _sys_errlist D 0x21c
+GLIBC_2.29 _sys_nerr D 0x4
+GLIBC_2.29 _sys_siglist D 0x104
+GLIBC_2.29 _tolower F
+GLIBC_2.29 _toupper F
+GLIBC_2.29 a64l F
+GLIBC_2.29 abort F
+GLIBC_2.29 abs F
+GLIBC_2.29 accept F
+GLIBC_2.29 accept4 F
+GLIBC_2.29 access F
+GLIBC_2.29 acct F
+GLIBC_2.29 addmntent F
+GLIBC_2.29 addseverity F
+GLIBC_2.29 adjtime F
+GLIBC_2.29 adjtimex F
+GLIBC_2.29 alarm F
+GLIBC_2.29 aligned_alloc F
+GLIBC_2.29 alphasort F
+GLIBC_2.29 alphasort64 F
+GLIBC_2.29 argp_err_exit_status D 0x4
+GLIBC_2.29 argp_error F
+GLIBC_2.29 argp_failure F
+GLIBC_2.29 argp_help F
+GLIBC_2.29 argp_parse F
+GLIBC_2.29 argp_program_bug_address D 0x4
+GLIBC_2.29 argp_program_version D 0x4
+GLIBC_2.29 argp_program_version_hook D 0x4
+GLIBC_2.29 argp_state_help F
+GLIBC_2.29 argp_usage F
+GLIBC_2.29 argz_add F
+GLIBC_2.29 argz_add_sep F
+GLIBC_2.29 argz_append F
+GLIBC_2.29 argz_count F
+GLIBC_2.29 argz_create F
+GLIBC_2.29 argz_create_sep F
+GLIBC_2.29 argz_delete F
+GLIBC_2.29 argz_extract F
+GLIBC_2.29 argz_insert F
+GLIBC_2.29 argz_next F
+GLIBC_2.29 argz_replace F
+GLIBC_2.29 argz_stringify F
+GLIBC_2.29 asctime F
+GLIBC_2.29 asctime_r F
+GLIBC_2.29 asprintf F
+GLIBC_2.29 atof F
+GLIBC_2.29 atoi F
+GLIBC_2.29 atol F
+GLIBC_2.29 atoll F
+GLIBC_2.29 authdes_create F
+GLIBC_2.29 authdes_getucred F
+GLIBC_2.29 authdes_pk_create F
+GLIBC_2.29 authnone_create F
+GLIBC_2.29 authunix_create F
+GLIBC_2.29 authunix_create_default F
+GLIBC_2.29 backtrace F
+GLIBC_2.29 backtrace_symbols F
+GLIBC_2.29 backtrace_symbols_fd F
+GLIBC_2.29 basename F
+GLIBC_2.29 bcmp F
+GLIBC_2.29 bcopy F
+GLIBC_2.29 bind F
+GLIBC_2.29 bind_textdomain_codeset F
+GLIBC_2.29 bindresvport F
+GLIBC_2.29 bindtextdomain F
+GLIBC_2.29 brk F
+GLIBC_2.29 bsd_signal F
+GLIBC_2.29 bsearch F
+GLIBC_2.29 btowc F
+GLIBC_2.29 bzero F
+GLIBC_2.29 c16rtomb F
+GLIBC_2.29 c32rtomb F
+GLIBC_2.29 cacheflush F
+GLIBC_2.29 calloc F
+GLIBC_2.29 callrpc F
+GLIBC_2.29 canonicalize_file_name F
+GLIBC_2.29 capget F
+GLIBC_2.29 capset F
+GLIBC_2.29 catclose F
+GLIBC_2.29 catgets F
+GLIBC_2.29 catopen F
+GLIBC_2.29 cbc_crypt F
+GLIBC_2.29 cfgetispeed F
+GLIBC_2.29 cfgetospeed F
+GLIBC_2.29 cfmakeraw F
+GLIBC_2.29 cfsetispeed F
+GLIBC_2.29 cfsetospeed F
+GLIBC_2.29 cfsetspeed F
+GLIBC_2.29 chdir F
+GLIBC_2.29 chflags F
+GLIBC_2.29 chmod F
+GLIBC_2.29 chown F
+GLIBC_2.29 chroot F
+GLIBC_2.29 clearenv F
+GLIBC_2.29 clearerr F
+GLIBC_2.29 clearerr_unlocked F
+GLIBC_2.29 clnt_broadcast F
+GLIBC_2.29 clnt_create F
+GLIBC_2.29 clnt_pcreateerror F
+GLIBC_2.29 clnt_perrno F
+GLIBC_2.29 clnt_perror F
+GLIBC_2.29 clnt_spcreateerror F
+GLIBC_2.29 clnt_sperrno F
+GLIBC_2.29 clnt_sperror F
+GLIBC_2.29 clntraw_create F
+GLIBC_2.29 clnttcp_create F
+GLIBC_2.29 clntudp_bufcreate F
+GLIBC_2.29 clntudp_create F
+GLIBC_2.29 clntunix_create F
+GLIBC_2.29 clock F
+GLIBC_2.29 clock_adjtime F
+GLIBC_2.29 clock_getcpuclockid F
+GLIBC_2.29 clock_getres F
+GLIBC_2.29 clock_gettime F
+GLIBC_2.29 clock_nanosleep F
+GLIBC_2.29 clock_settime F
+GLIBC_2.29 clone F
+GLIBC_2.29 close F
+GLIBC_2.29 closedir F
+GLIBC_2.29 closelog F
+GLIBC_2.29 confstr F
+GLIBC_2.29 connect F
+GLIBC_2.29 copy_file_range F
+GLIBC_2.29 copysign F
+GLIBC_2.29 copysignf F
+GLIBC_2.29 copysignl F
+GLIBC_2.29 creat F
+GLIBC_2.29 creat64 F
+GLIBC_2.29 ctermid F
+GLIBC_2.29 ctime F
+GLIBC_2.29 ctime_r F
+GLIBC_2.29 cuserid F
+GLIBC_2.29 daemon F
+GLIBC_2.29 daylight D 0x4
+GLIBC_2.29 dcgettext F
+GLIBC_2.29 dcngettext F
+GLIBC_2.29 delete_module F
+GLIBC_2.29 des_setparity F
+GLIBC_2.29 dgettext F
+GLIBC_2.29 difftime F
+GLIBC_2.29 dirfd F
+GLIBC_2.29 dirname F
+GLIBC_2.29 div F
+GLIBC_2.29 dl_iterate_phdr F
+GLIBC_2.29 dngettext F
+GLIBC_2.29 dprintf F
+GLIBC_2.29 drand48 F
+GLIBC_2.29 drand48_r F
+GLIBC_2.29 dup F
+GLIBC_2.29 dup2 F
+GLIBC_2.29 dup3 F
+GLIBC_2.29 duplocale F
+GLIBC_2.29 dysize F
+GLIBC_2.29 eaccess F
+GLIBC_2.29 ecb_crypt F
+GLIBC_2.29 ecvt F
+GLIBC_2.29 ecvt_r F
+GLIBC_2.29 endaliasent F
+GLIBC_2.29 endfsent F
+GLIBC_2.29 endgrent F
+GLIBC_2.29 endhostent F
+GLIBC_2.29 endmntent F
+GLIBC_2.29 endnetent F
+GLIBC_2.29 endnetgrent F
+GLIBC_2.29 endprotoent F
+GLIBC_2.29 endpwent F
+GLIBC_2.29 endrpcent F
+GLIBC_2.29 endservent F
+GLIBC_2.29 endsgent F
+GLIBC_2.29 endspent F
+GLIBC_2.29 endttyent F
+GLIBC_2.29 endusershell F
+GLIBC_2.29 endutent F
+GLIBC_2.29 endutxent F
+GLIBC_2.29 environ D 0x4
+GLIBC_2.29 envz_add F
+GLIBC_2.29 envz_entry F
+GLIBC_2.29 envz_get F
+GLIBC_2.29 envz_merge F
+GLIBC_2.29 envz_remove F
+GLIBC_2.29 envz_strip F
+GLIBC_2.29 epoll_create F
+GLIBC_2.29 epoll_create1 F
+GLIBC_2.29 epoll_ctl F
+GLIBC_2.29 epoll_pwait F
+GLIBC_2.29 epoll_wait F
+GLIBC_2.29 erand48 F
+GLIBC_2.29 erand48_r F
+GLIBC_2.29 err F
+GLIBC_2.29 error F
+GLIBC_2.29 error_at_line F
+GLIBC_2.29 error_message_count D 0x4
+GLIBC_2.29 error_one_per_line D 0x4
+GLIBC_2.29 error_print_progname D 0x4
+GLIBC_2.29 errx F
+GLIBC_2.29 ether_aton F
+GLIBC_2.29 ether_aton_r F
+GLIBC_2.29 ether_hostton F
+GLIBC_2.29 ether_line F
+GLIBC_2.29 ether_ntoa F
+GLIBC_2.29 ether_ntoa_r F
+GLIBC_2.29 ether_ntohost F
+GLIBC_2.29 euidaccess F
+GLIBC_2.29 eventfd F
+GLIBC_2.29 eventfd_read F
+GLIBC_2.29 eventfd_write F
+GLIBC_2.29 execl F
+GLIBC_2.29 execle F
+GLIBC_2.29 execlp F
+GLIBC_2.29 execv F
+GLIBC_2.29 execve F
+GLIBC_2.29 execvp F
+GLIBC_2.29 execvpe F
+GLIBC_2.29 exit F
+GLIBC_2.29 explicit_bzero F
+GLIBC_2.29 faccessat F
+GLIBC_2.29 fallocate F
+GLIBC_2.29 fallocate64 F
+GLIBC_2.29 fanotify_init F
+GLIBC_2.29 fanotify_mark F
+GLIBC_2.29 fattach F
+GLIBC_2.29 fchdir F
+GLIBC_2.29 fchflags F
+GLIBC_2.29 fchmod F
+GLIBC_2.29 fchmodat F
+GLIBC_2.29 fchown F
+GLIBC_2.29 fchownat F
+GLIBC_2.29 fclose F
+GLIBC_2.29 fcloseall F
+GLIBC_2.29 fcntl F
+GLIBC_2.29 fcntl64 F
+GLIBC_2.29 fcvt F
+GLIBC_2.29 fcvt_r F
+GLIBC_2.29 fdatasync F
+GLIBC_2.29 fdetach F
+GLIBC_2.29 fdopen F
+GLIBC_2.29 fdopendir F
+GLIBC_2.29 feof F
+GLIBC_2.29 feof_unlocked F
+GLIBC_2.29 ferror F
+GLIBC_2.29 ferror_unlocked F
+GLIBC_2.29 fexecve F
+GLIBC_2.29 fflush F
+GLIBC_2.29 fflush_unlocked F
+GLIBC_2.29 ffs F
+GLIBC_2.29 ffsl F
+GLIBC_2.29 ffsll F
+GLIBC_2.29 fgetc F
+GLIBC_2.29 fgetc_unlocked F
+GLIBC_2.29 fgetgrent F
+GLIBC_2.29 fgetgrent_r F
+GLIBC_2.29 fgetpos F
+GLIBC_2.29 fgetpos64 F
+GLIBC_2.29 fgetpwent F
+GLIBC_2.29 fgetpwent_r F
+GLIBC_2.29 fgets F
+GLIBC_2.29 fgets_unlocked F
+GLIBC_2.29 fgetsgent F
+GLIBC_2.29 fgetsgent_r F
+GLIBC_2.29 fgetspent F
+GLIBC_2.29 fgetspent_r F
+GLIBC_2.29 fgetwc F
+GLIBC_2.29 fgetwc_unlocked F
+GLIBC_2.29 fgetws F
+GLIBC_2.29 fgetws_unlocked F
+GLIBC_2.29 fgetxattr F
+GLIBC_2.29 fileno F
+GLIBC_2.29 fileno_unlocked F
+GLIBC_2.29 finite F
+GLIBC_2.29 finitef F
+GLIBC_2.29 finitel F
+GLIBC_2.29 flistxattr F
+GLIBC_2.29 flock F
+GLIBC_2.29 flockfile F
+GLIBC_2.29 fmemopen F
+GLIBC_2.29 fmtmsg F
+GLIBC_2.29 fnmatch F
+GLIBC_2.29 fopen F
+GLIBC_2.29 fopen64 F
+GLIBC_2.29 fopencookie F
+GLIBC_2.29 fork F
+GLIBC_2.29 fpathconf F
+GLIBC_2.29 fprintf F
+GLIBC_2.29 fputc F
+GLIBC_2.29 fputc_unlocked F
+GLIBC_2.29 fputs F
+GLIBC_2.29 fputs_unlocked F
+GLIBC_2.29 fputwc F
+GLIBC_2.29 fputwc_unlocked F
+GLIBC_2.29 fputws F
+GLIBC_2.29 fputws_unlocked F
+GLIBC_2.29 fread F
+GLIBC_2.29 fread_unlocked F
+GLIBC_2.29 free F
+GLIBC_2.29 freeaddrinfo F
+GLIBC_2.29 freeifaddrs F
+GLIBC_2.29 freelocale F
+GLIBC_2.29 fremovexattr F
+GLIBC_2.29 freopen F
+GLIBC_2.29 freopen64 F
+GLIBC_2.29 frexp F
+GLIBC_2.29 frexpf F
+GLIBC_2.29 frexpl F
+GLIBC_2.29 fscanf F
+GLIBC_2.29 fseek F
+GLIBC_2.29 fseeko F
+GLIBC_2.29 fseeko64 F
+GLIBC_2.29 fsetpos F
+GLIBC_2.29 fsetpos64 F
+GLIBC_2.29 fsetxattr F
+GLIBC_2.29 fstatfs F
+GLIBC_2.29 fstatfs64 F
+GLIBC_2.29 fstatvfs F
+GLIBC_2.29 fstatvfs64 F
+GLIBC_2.29 fsync F
+GLIBC_2.29 ftell F
+GLIBC_2.29 ftello F
+GLIBC_2.29 ftello64 F
+GLIBC_2.29 ftime F
+GLIBC_2.29 ftok F
+GLIBC_2.29 ftruncate F
+GLIBC_2.29 ftruncate64 F
+GLIBC_2.29 ftrylockfile F
+GLIBC_2.29 fts64_children F
+GLIBC_2.29 fts64_close F
+GLIBC_2.29 fts64_open F
+GLIBC_2.29 fts64_read F
+GLIBC_2.29 fts64_set F
+GLIBC_2.29 fts_children F
+GLIBC_2.29 fts_close F
+GLIBC_2.29 fts_open F
+GLIBC_2.29 fts_read F
+GLIBC_2.29 fts_set F
+GLIBC_2.29 ftw F
+GLIBC_2.29 ftw64 F
+GLIBC_2.29 funlockfile F
+GLIBC_2.29 futimens F
+GLIBC_2.29 futimes F
+GLIBC_2.29 futimesat F
+GLIBC_2.29 fwide F
+GLIBC_2.29 fwprintf F
+GLIBC_2.29 fwrite F
+GLIBC_2.29 fwrite_unlocked F
+GLIBC_2.29 fwscanf F
+GLIBC_2.29 gai_strerror F
+GLIBC_2.29 gcvt F
+GLIBC_2.29 get_avphys_pages F
+GLIBC_2.29 get_current_dir_name F
+GLIBC_2.29 get_myaddress F
+GLIBC_2.29 get_nprocs F
+GLIBC_2.29 get_nprocs_conf F
+GLIBC_2.29 get_phys_pages F
+GLIBC_2.29 getaddrinfo F
+GLIBC_2.29 getaliasbyname F
+GLIBC_2.29 getaliasbyname_r F
+GLIBC_2.29 getaliasent F
+GLIBC_2.29 getaliasent_r F
+GLIBC_2.29 getauxval F
+GLIBC_2.29 getc F
+GLIBC_2.29 getc_unlocked F
+GLIBC_2.29 getchar F
+GLIBC_2.29 getchar_unlocked F
+GLIBC_2.29 getcontext F
+GLIBC_2.29 getcpu F
+GLIBC_2.29 getcwd F
+GLIBC_2.29 getdate F
+GLIBC_2.29 getdate_err D 0x4
+GLIBC_2.29 getdate_r F
+GLIBC_2.29 getdelim F
+GLIBC_2.29 getdirentries F
+GLIBC_2.29 getdirentries64 F
+GLIBC_2.29 getdomainname F
+GLIBC_2.29 getdtablesize F
+GLIBC_2.29 getegid F
+GLIBC_2.29 getentropy F
+GLIBC_2.29 getenv F
+GLIBC_2.29 geteuid F
+GLIBC_2.29 getfsent F
+GLIBC_2.29 getfsfile F
+GLIBC_2.29 getfsspec F
+GLIBC_2.29 getgid F
+GLIBC_2.29 getgrent F
+GLIBC_2.29 getgrent_r F
+GLIBC_2.29 getgrgid F
+GLIBC_2.29 getgrgid_r F
+GLIBC_2.29 getgrnam F
+GLIBC_2.29 getgrnam_r F
+GLIBC_2.29 getgrouplist F
+GLIBC_2.29 getgroups F
+GLIBC_2.29 gethostbyaddr F
+GLIBC_2.29 gethostbyaddr_r F
+GLIBC_2.29 gethostbyname F
+GLIBC_2.29 gethostbyname2 F
+GLIBC_2.29 gethostbyname2_r F
+GLIBC_2.29 gethostbyname_r F
+GLIBC_2.29 gethostent F
+GLIBC_2.29 gethostent_r F
+GLIBC_2.29 gethostid F
+GLIBC_2.29 gethostname F
+GLIBC_2.29 getifaddrs F
+GLIBC_2.29 getipv4sourcefilter F
+GLIBC_2.29 getitimer F
+GLIBC_2.29 getline F
+GLIBC_2.29 getloadavg F
+GLIBC_2.29 getlogin F
+GLIBC_2.29 getlogin_r F
+GLIBC_2.29 getmntent F
+GLIBC_2.29 getmntent_r F
+GLIBC_2.29 getmsg F
+GLIBC_2.29 getnameinfo F
+GLIBC_2.29 getnetbyaddr F
+GLIBC_2.29 getnetbyaddr_r F
+GLIBC_2.29 getnetbyname F
+GLIBC_2.29 getnetbyname_r F
+GLIBC_2.29 getnetent F
+GLIBC_2.29 getnetent_r F
+GLIBC_2.29 getnetgrent F
+GLIBC_2.29 getnetgrent_r F
+GLIBC_2.29 getnetname F
+GLIBC_2.29 getopt F
+GLIBC_2.29 getopt_long F
+GLIBC_2.29 getopt_long_only F
+GLIBC_2.29 getpagesize F
+GLIBC_2.29 getpass F
+GLIBC_2.29 getpeername F
+GLIBC_2.29 getpgid F
+GLIBC_2.29 getpgrp F
+GLIBC_2.29 getpid F
+GLIBC_2.29 getpmsg F
+GLIBC_2.29 getppid F
+GLIBC_2.29 getpriority F
+GLIBC_2.29 getprotobyname F
+GLIBC_2.29 getprotobyname_r F
+GLIBC_2.29 getprotobynumber F
+GLIBC_2.29 getprotobynumber_r F
+GLIBC_2.29 getprotoent F
+GLIBC_2.29 getprotoent_r F
+GLIBC_2.29 getpt F
+GLIBC_2.29 getpublickey F
+GLIBC_2.29 getpw F
+GLIBC_2.29 getpwent F
+GLIBC_2.29 getpwent_r F
+GLIBC_2.29 getpwnam F
+GLIBC_2.29 getpwnam_r F
+GLIBC_2.29 getpwuid F
+GLIBC_2.29 getpwuid_r F
+GLIBC_2.29 getrandom F
+GLIBC_2.29 getresgid F
+GLIBC_2.29 getresuid F
+GLIBC_2.29 getrlimit F
+GLIBC_2.29 getrlimit64 F
+GLIBC_2.29 getrpcbyname F
+GLIBC_2.29 getrpcbyname_r F
+GLIBC_2.29 getrpcbynumber F
+GLIBC_2.29 getrpcbynumber_r F
+GLIBC_2.29 getrpcent F
+GLIBC_2.29 getrpcent_r F
+GLIBC_2.29 getrpcport F
+GLIBC_2.29 getrusage F
+GLIBC_2.29 gets F
+GLIBC_2.29 getsecretkey F
+GLIBC_2.29 getservbyname F
+GLIBC_2.29 getservbyname_r F
+GLIBC_2.29 getservbyport F
+GLIBC_2.29 getservbyport_r F
+GLIBC_2.29 getservent F
+GLIBC_2.29 getservent_r F
+GLIBC_2.29 getsgent F
+GLIBC_2.29 getsgent_r F
+GLIBC_2.29 getsgnam F
+GLIBC_2.29 getsgnam_r F
+GLIBC_2.29 getsid F
+GLIBC_2.29 getsockname F
+GLIBC_2.29 getsockopt F
+GLIBC_2.29 getsourcefilter F
+GLIBC_2.29 getspent F
+GLIBC_2.29 getspent_r F
+GLIBC_2.29 getspnam F
+GLIBC_2.29 getspnam_r F
+GLIBC_2.29 getsubopt F
+GLIBC_2.29 gettext F
+GLIBC_2.29 gettimeofday F
+GLIBC_2.29 getttyent F
+GLIBC_2.29 getttynam F
+GLIBC_2.29 getuid F
+GLIBC_2.29 getusershell F
+GLIBC_2.29 getutent F
+GLIBC_2.29 getutent_r F
+GLIBC_2.29 getutid F
+GLIBC_2.29 getutid_r F
+GLIBC_2.29 getutline F
+GLIBC_2.29 getutline_r F
+GLIBC_2.29 getutmp F
+GLIBC_2.29 getutmpx F
+GLIBC_2.29 getutxent F
+GLIBC_2.29 getutxid F
+GLIBC_2.29 getutxline F
+GLIBC_2.29 getw F
+GLIBC_2.29 getwc F
+GLIBC_2.29 getwc_unlocked F
+GLIBC_2.29 getwchar F
+GLIBC_2.29 getwchar_unlocked F
+GLIBC_2.29 getwd F
+GLIBC_2.29 getxattr F
+GLIBC_2.29 glob F
+GLIBC_2.29 glob64 F
+GLIBC_2.29 glob_pattern_p F
+GLIBC_2.29 globfree F
+GLIBC_2.29 globfree64 F
+GLIBC_2.29 gmtime F
+GLIBC_2.29 gmtime_r F
+GLIBC_2.29 gnu_dev_major F
+GLIBC_2.29 gnu_dev_makedev F
+GLIBC_2.29 gnu_dev_minor F
+GLIBC_2.29 gnu_get_libc_release F
+GLIBC_2.29 gnu_get_libc_version F
+GLIBC_2.29 grantpt F
+GLIBC_2.29 group_member F
+GLIBC_2.29 gsignal F
+GLIBC_2.29 gtty F
+GLIBC_2.29 h_errlist D 0x14
+GLIBC_2.29 h_nerr D 0x4
+GLIBC_2.29 hasmntopt F
+GLIBC_2.29 hcreate F
+GLIBC_2.29 hcreate_r F
+GLIBC_2.29 hdestroy F
+GLIBC_2.29 hdestroy_r F
+GLIBC_2.29 herror F
+GLIBC_2.29 host2netname F
+GLIBC_2.29 hsearch F
+GLIBC_2.29 hsearch_r F
+GLIBC_2.29 hstrerror F
+GLIBC_2.29 htonl F
+GLIBC_2.29 htons F
+GLIBC_2.29 iconv F
+GLIBC_2.29 iconv_close F
+GLIBC_2.29 iconv_open F
+GLIBC_2.29 if_freenameindex F
+GLIBC_2.29 if_indextoname F
+GLIBC_2.29 if_nameindex F
+GLIBC_2.29 if_nametoindex F
+GLIBC_2.29 imaxabs F
+GLIBC_2.29 imaxdiv F
+GLIBC_2.29 in6addr_any D 0x10
+GLIBC_2.29 in6addr_loopback D 0x10
+GLIBC_2.29 index F
+GLIBC_2.29 inet6_opt_append F
+GLIBC_2.29 inet6_opt_find F
+GLIBC_2.29 inet6_opt_finish F
+GLIBC_2.29 inet6_opt_get_val F
+GLIBC_2.29 inet6_opt_init F
+GLIBC_2.29 inet6_opt_next F
+GLIBC_2.29 inet6_opt_set_val F
+GLIBC_2.29 inet6_option_alloc F
+GLIBC_2.29 inet6_option_append F
+GLIBC_2.29 inet6_option_find F
+GLIBC_2.29 inet6_option_init F
+GLIBC_2.29 inet6_option_next F
+GLIBC_2.29 inet6_option_space F
+GLIBC_2.29 inet6_rth_add F
+GLIBC_2.29 inet6_rth_getaddr F
+GLIBC_2.29 inet6_rth_init F
+GLIBC_2.29 inet6_rth_reverse F
+GLIBC_2.29 inet6_rth_segments F
+GLIBC_2.29 inet6_rth_space F
+GLIBC_2.29 inet_addr F
+GLIBC_2.29 inet_aton F
+GLIBC_2.29 inet_lnaof F
+GLIBC_2.29 inet_makeaddr F
+GLIBC_2.29 inet_netof F
+GLIBC_2.29 inet_network F
+GLIBC_2.29 inet_nsap_addr F
+GLIBC_2.29 inet_nsap_ntoa F
+GLIBC_2.29 inet_ntoa F
+GLIBC_2.29 inet_ntop F
+GLIBC_2.29 inet_pton F
+GLIBC_2.29 init_module F
+GLIBC_2.29 initgroups F
+GLIBC_2.29 initstate F
+GLIBC_2.29 initstate_r F
+GLIBC_2.29 innetgr F
+GLIBC_2.29 inotify_add_watch F
+GLIBC_2.29 inotify_init F
+GLIBC_2.29 inotify_init1 F
+GLIBC_2.29 inotify_rm_watch F
+GLIBC_2.29 insque F
+GLIBC_2.29 ioctl F
+GLIBC_2.29 iruserok F
+GLIBC_2.29 iruserok_af F
+GLIBC_2.29 isalnum F
+GLIBC_2.29 isalnum_l F
+GLIBC_2.29 isalpha F
+GLIBC_2.29 isalpha_l F
+GLIBC_2.29 isascii F
+GLIBC_2.29 isastream F
+GLIBC_2.29 isatty F
+GLIBC_2.29 isblank F
+GLIBC_2.29 isblank_l F
+GLIBC_2.29 iscntrl F
+GLIBC_2.29 iscntrl_l F
+GLIBC_2.29 isctype F
+GLIBC_2.29 isdigit F
+GLIBC_2.29 isdigit_l F
+GLIBC_2.29 isfdtype F
+GLIBC_2.29 isgraph F
+GLIBC_2.29 isgraph_l F
+GLIBC_2.29 isinf F
+GLIBC_2.29 isinff F
+GLIBC_2.29 isinfl F
+GLIBC_2.29 islower F
+GLIBC_2.29 islower_l F
+GLIBC_2.29 isnan F
+GLIBC_2.29 isnanf F
+GLIBC_2.29 isnanl F
+GLIBC_2.29 isprint F
+GLIBC_2.29 isprint_l F
+GLIBC_2.29 ispunct F
+GLIBC_2.29 ispunct_l F
+GLIBC_2.29 isspace F
+GLIBC_2.29 isspace_l F
+GLIBC_2.29 isupper F
+GLIBC_2.29 isupper_l F
+GLIBC_2.29 iswalnum F
+GLIBC_2.29 iswalnum_l F
+GLIBC_2.29 iswalpha F
+GLIBC_2.29 iswalpha_l F
+GLIBC_2.29 iswblank F
+GLIBC_2.29 iswblank_l F
+GLIBC_2.29 iswcntrl F
+GLIBC_2.29 iswcntrl_l F
+GLIBC_2.29 iswctype F
+GLIBC_2.29 iswctype_l F
+GLIBC_2.29 iswdigit F
+GLIBC_2.29 iswdigit_l F
+GLIBC_2.29 iswgraph F
+GLIBC_2.29 iswgraph_l F
+GLIBC_2.29 iswlower F
+GLIBC_2.29 iswlower_l F
+GLIBC_2.29 iswprint F
+GLIBC_2.29 iswprint_l F
+GLIBC_2.29 iswpunct F
+GLIBC_2.29 iswpunct_l F
+GLIBC_2.29 iswspace F
+GLIBC_2.29 iswspace_l F
+GLIBC_2.29 iswupper F
+GLIBC_2.29 iswupper_l F
+GLIBC_2.29 iswxdigit F
+GLIBC_2.29 iswxdigit_l F
+GLIBC_2.29 isxdigit F
+GLIBC_2.29 isxdigit_l F
+GLIBC_2.29 jrand48 F
+GLIBC_2.29 jrand48_r F
+GLIBC_2.29 key_decryptsession F
+GLIBC_2.29 key_decryptsession_pk F
+GLIBC_2.29 key_encryptsession F
+GLIBC_2.29 key_encryptsession_pk F
+GLIBC_2.29 key_gendes F
+GLIBC_2.29 key_get_conv F
+GLIBC_2.29 key_secretkey_is_set F
+GLIBC_2.29 key_setnet F
+GLIBC_2.29 key_setsecret F
+GLIBC_2.29 kill F
+GLIBC_2.29 killpg F
+GLIBC_2.29 klogctl F
+GLIBC_2.29 l64a F
+GLIBC_2.29 labs F
+GLIBC_2.29 lchmod F
+GLIBC_2.29 lchown F
+GLIBC_2.29 lckpwdf F
+GLIBC_2.29 lcong48 F
+GLIBC_2.29 lcong48_r F
+GLIBC_2.29 ldexp F
+GLIBC_2.29 ldexpf F
+GLIBC_2.29 ldexpl F
+GLIBC_2.29 ldiv F
+GLIBC_2.29 lfind F
+GLIBC_2.29 lgetxattr F
+GLIBC_2.29 link F
+GLIBC_2.29 linkat F
+GLIBC_2.29 listen F
+GLIBC_2.29 listxattr F
+GLIBC_2.29 llabs F
+GLIBC_2.29 lldiv F
+GLIBC_2.29 llistxattr F
+GLIBC_2.29 localeconv F
+GLIBC_2.29 localtime F
+GLIBC_2.29 localtime_r F
+GLIBC_2.29 lockf F
+GLIBC_2.29 lockf64 F
+GLIBC_2.29 longjmp F
+GLIBC_2.29 lrand48 F
+GLIBC_2.29 lrand48_r F
+GLIBC_2.29 lremovexattr F
+GLIBC_2.29 lsearch F
+GLIBC_2.29 lseek F
+GLIBC_2.29 lseek64 F
+GLIBC_2.29 lsetxattr F
+GLIBC_2.29 lutimes F
+GLIBC_2.29 madvise F
+GLIBC_2.29 makecontext F
+GLIBC_2.29 mallinfo F
+GLIBC_2.29 malloc F
+GLIBC_2.29 malloc_info F
+GLIBC_2.29 malloc_stats F
+GLIBC_2.29 malloc_trim F
+GLIBC_2.29 malloc_usable_size F
+GLIBC_2.29 mallopt F
+GLIBC_2.29 mallwatch D 0x4
+GLIBC_2.29 mblen F
+GLIBC_2.29 mbrlen F
+GLIBC_2.29 mbrtoc16 F
+GLIBC_2.29 mbrtoc32 F
+GLIBC_2.29 mbrtowc F
+GLIBC_2.29 mbsinit F
+GLIBC_2.29 mbsnrtowcs F
+GLIBC_2.29 mbsrtowcs F
+GLIBC_2.29 mbstowcs F
+GLIBC_2.29 mbtowc F
+GLIBC_2.29 mcheck F
+GLIBC_2.29 mcheck_check_all F
+GLIBC_2.29 mcheck_pedantic F
+GLIBC_2.29 memalign F
+GLIBC_2.29 memccpy F
+GLIBC_2.29 memchr F
+GLIBC_2.29 memcmp F
+GLIBC_2.29 memcpy F
+GLIBC_2.29 memfd_create F
+GLIBC_2.29 memfrob F
+GLIBC_2.29 memmem F
+GLIBC_2.29 memmove F
+GLIBC_2.29 mempcpy F
+GLIBC_2.29 memrchr F
+GLIBC_2.29 memset F
+GLIBC_2.29 mincore F
+GLIBC_2.29 mkdir F
+GLIBC_2.29 mkdirat F
+GLIBC_2.29 mkdtemp F
+GLIBC_2.29 mkfifo F
+GLIBC_2.29 mkfifoat F
+GLIBC_2.29 mkostemp F
+GLIBC_2.29 mkostemp64 F
+GLIBC_2.29 mkostemps F
+GLIBC_2.29 mkostemps64 F
+GLIBC_2.29 mkstemp F
+GLIBC_2.29 mkstemp64 F
+GLIBC_2.29 mkstemps F
+GLIBC_2.29 mkstemps64 F
+GLIBC_2.29 mktemp F
+GLIBC_2.29 mktime F
+GLIBC_2.29 mlock F
+GLIBC_2.29 mlock2 F
+GLIBC_2.29 mlockall F
+GLIBC_2.29 mmap F
+GLIBC_2.29 mmap64 F
+GLIBC_2.29 modf F
+GLIBC_2.29 modff F
+GLIBC_2.29 modfl F
+GLIBC_2.29 moncontrol F
+GLIBC_2.29 monstartup F
+GLIBC_2.29 mount F
+GLIBC_2.29 mprobe F
+GLIBC_2.29 mprotect F
+GLIBC_2.29 mrand48 F
+GLIBC_2.29 mrand48_r F
+GLIBC_2.29 mremap F
+GLIBC_2.29 msgctl F
+GLIBC_2.29 msgget F
+GLIBC_2.29 msgrcv F
+GLIBC_2.29 msgsnd F
+GLIBC_2.29 msync F
+GLIBC_2.29 mtrace F
+GLIBC_2.29 munlock F
+GLIBC_2.29 munlockall F
+GLIBC_2.29 munmap F
+GLIBC_2.29 muntrace F
+GLIBC_2.29 name_to_handle_at F
+GLIBC_2.29 nanosleep F
+GLIBC_2.29 netname2host F
+GLIBC_2.29 netname2user F
+GLIBC_2.29 newlocale F
+GLIBC_2.29 nftw F
+GLIBC_2.29 nftw64 F
+GLIBC_2.29 ngettext F
+GLIBC_2.29 nice F
+GLIBC_2.29 nl_langinfo F
+GLIBC_2.29 nl_langinfo_l F
+GLIBC_2.29 nrand48 F
+GLIBC_2.29 nrand48_r F
+GLIBC_2.29 ntohl F
+GLIBC_2.29 ntohs F
+GLIBC_2.29 ntp_adjtime F
+GLIBC_2.29 ntp_gettime F
+GLIBC_2.29 ntp_gettimex F
+GLIBC_2.29 obstack_alloc_failed_handler D 0x4
+GLIBC_2.29 obstack_exit_failure D 0x4
+GLIBC_2.29 obstack_free F
+GLIBC_2.29 obstack_printf F
+GLIBC_2.29 obstack_vprintf F
+GLIBC_2.29 on_exit F
+GLIBC_2.29 open F
+GLIBC_2.29 open64 F
+GLIBC_2.29 open_by_handle_at F
+GLIBC_2.29 open_memstream F
+GLIBC_2.29 open_wmemstream F
+GLIBC_2.29 openat F
+GLIBC_2.29 openat64 F
+GLIBC_2.29 opendir F
+GLIBC_2.29 openlog F
+GLIBC_2.29 optarg D 0x4
+GLIBC_2.29 opterr D 0x4
+GLIBC_2.29 optind D 0x4
+GLIBC_2.29 optopt D 0x4
+GLIBC_2.29 parse_printf_format F
+GLIBC_2.29 passwd2des F
+GLIBC_2.29 pathconf F
+GLIBC_2.29 pause F
+GLIBC_2.29 pclose F
+GLIBC_2.29 perror F
+GLIBC_2.29 personality F
+GLIBC_2.29 pipe F
+GLIBC_2.29 pipe2 F
+GLIBC_2.29 pivot_root F
+GLIBC_2.29 pkey_alloc F
+GLIBC_2.29 pkey_free F
+GLIBC_2.29 pkey_get F
+GLIBC_2.29 pkey_mprotect F
+GLIBC_2.29 pkey_set F
+GLIBC_2.29 pmap_getmaps F
+GLIBC_2.29 pmap_getport F
+GLIBC_2.29 pmap_rmtcall F
+GLIBC_2.29 pmap_set F
+GLIBC_2.29 pmap_unset F
+GLIBC_2.29 poll F
+GLIBC_2.29 popen F
+GLIBC_2.29 posix_fadvise F
+GLIBC_2.29 posix_fadvise64 F
+GLIBC_2.29 posix_fallocate F
+GLIBC_2.29 posix_fallocate64 F
+GLIBC_2.29 posix_madvise F
+GLIBC_2.29 posix_memalign F
+GLIBC_2.29 posix_openpt F
+GLIBC_2.29 posix_spawn F
+GLIBC_2.29 posix_spawn_file_actions_addchdir_np F
+GLIBC_2.29 posix_spawn_file_actions_addclose F
+GLIBC_2.29 posix_spawn_file_actions_adddup2 F
+GLIBC_2.29 posix_spawn_file_actions_addfchdir_np F
+GLIBC_2.29 posix_spawn_file_actions_addopen F
+GLIBC_2.29 posix_spawn_file_actions_destroy F
+GLIBC_2.29 posix_spawn_file_actions_init F
+GLIBC_2.29 posix_spawnattr_destroy F
+GLIBC_2.29 posix_spawnattr_getflags F
+GLIBC_2.29 posix_spawnattr_getpgroup F
+GLIBC_2.29 posix_spawnattr_getschedparam F
+GLIBC_2.29 posix_spawnattr_getschedpolicy F
+GLIBC_2.29 posix_spawnattr_getsigdefault F
+GLIBC_2.29 posix_spawnattr_getsigmask F
+GLIBC_2.29 posix_spawnattr_init F
+GLIBC_2.29 posix_spawnattr_setflags F
+GLIBC_2.29 posix_spawnattr_setpgroup F
+GLIBC_2.29 posix_spawnattr_setschedparam F
+GLIBC_2.29 posix_spawnattr_setschedpolicy F
+GLIBC_2.29 posix_spawnattr_setsigdefault F
+GLIBC_2.29 posix_spawnattr_setsigmask F
+GLIBC_2.29 posix_spawnp F
+GLIBC_2.29 ppoll F
+GLIBC_2.29 prctl F
+GLIBC_2.29 pread F
+GLIBC_2.29 pread64 F
+GLIBC_2.29 preadv F
+GLIBC_2.29 preadv2 F
+GLIBC_2.29 preadv64 F
+GLIBC_2.29 preadv64v2 F
+GLIBC_2.29 printf F
+GLIBC_2.29 printf_size F
+GLIBC_2.29 printf_size_info F
+GLIBC_2.29 prlimit F
+GLIBC_2.29 prlimit64 F
+GLIBC_2.29 process_vm_readv F
+GLIBC_2.29 process_vm_writev F
+GLIBC_2.29 profil F
+GLIBC_2.29 program_invocation_name D 0x4
+GLIBC_2.29 program_invocation_short_name D 0x4
+GLIBC_2.29 pselect F
+GLIBC_2.29 psiginfo F
+GLIBC_2.29 psignal F
+GLIBC_2.29 pthread_attr_destroy F
+GLIBC_2.29 pthread_attr_getdetachstate F
+GLIBC_2.29 pthread_attr_getinheritsched F
+GLIBC_2.29 pthread_attr_getschedparam F
+GLIBC_2.29 pthread_attr_getschedpolicy F
+GLIBC_2.29 pthread_attr_getscope F
+GLIBC_2.29 pthread_attr_init F
+GLIBC_2.29 pthread_attr_setdetachstate F
+GLIBC_2.29 pthread_attr_setinheritsched F
+GLIBC_2.29 pthread_attr_setschedparam F
+GLIBC_2.29 pthread_attr_setschedpolicy F
+GLIBC_2.29 pthread_attr_setscope F
+GLIBC_2.29 pthread_cond_broadcast F
+GLIBC_2.29 pthread_cond_destroy F
+GLIBC_2.29 pthread_cond_init F
+GLIBC_2.29 pthread_cond_signal F
+GLIBC_2.29 pthread_cond_timedwait F
+GLIBC_2.29 pthread_cond_wait F
+GLIBC_2.29 pthread_condattr_destroy F
+GLIBC_2.29 pthread_condattr_init F
+GLIBC_2.29 pthread_equal F
+GLIBC_2.29 pthread_exit F
+GLIBC_2.29 pthread_getschedparam F
+GLIBC_2.29 pthread_mutex_destroy F
+GLIBC_2.29 pthread_mutex_init F
+GLIBC_2.29 pthread_mutex_lock F
+GLIBC_2.29 pthread_mutex_unlock F
+GLIBC_2.29 pthread_self F
+GLIBC_2.29 pthread_setcancelstate F
+GLIBC_2.29 pthread_setcanceltype F
+GLIBC_2.29 pthread_setschedparam F
+GLIBC_2.29 ptrace F
+GLIBC_2.29 ptsname F
+GLIBC_2.29 ptsname_r F
+GLIBC_2.29 putc F
+GLIBC_2.29 putc_unlocked F
+GLIBC_2.29 putchar F
+GLIBC_2.29 putchar_unlocked F
+GLIBC_2.29 putenv F
+GLIBC_2.29 putgrent F
+GLIBC_2.29 putmsg F
+GLIBC_2.29 putpmsg F
+GLIBC_2.29 putpwent F
+GLIBC_2.29 puts F
+GLIBC_2.29 putsgent F
+GLIBC_2.29 putspent F
+GLIBC_2.29 pututline F
+GLIBC_2.29 pututxline F
+GLIBC_2.29 putw F
+GLIBC_2.29 putwc F
+GLIBC_2.29 putwc_unlocked F
+GLIBC_2.29 putwchar F
+GLIBC_2.29 putwchar_unlocked F
+GLIBC_2.29 pvalloc F
+GLIBC_2.29 pwrite F
+GLIBC_2.29 pwrite64 F
+GLIBC_2.29 pwritev F
+GLIBC_2.29 pwritev2 F
+GLIBC_2.29 pwritev64 F
+GLIBC_2.29 pwritev64v2 F
+GLIBC_2.29 qecvt F
+GLIBC_2.29 qecvt_r F
+GLIBC_2.29 qfcvt F
+GLIBC_2.29 qfcvt_r F
+GLIBC_2.29 qgcvt F
+GLIBC_2.29 qsort F
+GLIBC_2.29 qsort_r F
+GLIBC_2.29 quick_exit F
+GLIBC_2.29 quotactl F
+GLIBC_2.29 raise F
+GLIBC_2.29 rand F
+GLIBC_2.29 rand_r F
+GLIBC_2.29 random F
+GLIBC_2.29 random_r F
+GLIBC_2.29 rawmemchr F
+GLIBC_2.29 rcmd F
+GLIBC_2.29 rcmd_af F
+GLIBC_2.29 re_comp F
+GLIBC_2.29 re_compile_fastmap F
+GLIBC_2.29 re_compile_pattern F
+GLIBC_2.29 re_exec F
+GLIBC_2.29 re_match F
+GLIBC_2.29 re_match_2 F
+GLIBC_2.29 re_search F
+GLIBC_2.29 re_search_2 F
+GLIBC_2.29 re_set_registers F
+GLIBC_2.29 re_set_syntax F
+GLIBC_2.29 re_syntax_options D 0x4
+GLIBC_2.29 read F
+GLIBC_2.29 readahead F
+GLIBC_2.29 readdir F
+GLIBC_2.29 readdir64 F
+GLIBC_2.29 readdir64_r F
+GLIBC_2.29 readdir_r F
+GLIBC_2.29 readlink F
+GLIBC_2.29 readlinkat F
+GLIBC_2.29 readv F
+GLIBC_2.29 realloc F
+GLIBC_2.29 reallocarray F
+GLIBC_2.29 realpath F
+GLIBC_2.29 reboot F
+GLIBC_2.29 recv F
+GLIBC_2.29 recvfrom F
+GLIBC_2.29 recvmmsg F
+GLIBC_2.29 recvmsg F
+GLIBC_2.29 regcomp F
+GLIBC_2.29 regerror F
+GLIBC_2.29 regexec F
+GLIBC_2.29 regfree F
+GLIBC_2.29 register_printf_function F
+GLIBC_2.29 register_printf_modifier F
+GLIBC_2.29 register_printf_specifier F
+GLIBC_2.29 register_printf_type F
+GLIBC_2.29 registerrpc F
+GLIBC_2.29 remap_file_pages F
+GLIBC_2.29 remove F
+GLIBC_2.29 removexattr F
+GLIBC_2.29 remque F
+GLIBC_2.29 rename F
+GLIBC_2.29 renameat F
+GLIBC_2.29 renameat2 F
+GLIBC_2.29 revoke F
+GLIBC_2.29 rewind F
+GLIBC_2.29 rewinddir F
+GLIBC_2.29 rexec F
+GLIBC_2.29 rexec_af F
+GLIBC_2.29 rexecoptions D 0x4
+GLIBC_2.29 rindex F
+GLIBC_2.29 rmdir F
+GLIBC_2.29 rpc_createerr D 0x10
+GLIBC_2.29 rpmatch F
+GLIBC_2.29 rresvport F
+GLIBC_2.29 rresvport_af F
+GLIBC_2.29 rtime F
+GLIBC_2.29 ruserok F
+GLIBC_2.29 ruserok_af F
+GLIBC_2.29 ruserpass F
+GLIBC_2.29 sbrk F
+GLIBC_2.29 scalbn F
+GLIBC_2.29 scalbnf F
+GLIBC_2.29 scalbnl F
+GLIBC_2.29 scandir F
+GLIBC_2.29 scandir64 F
+GLIBC_2.29 scandirat F
+GLIBC_2.29 scandirat64 F
+GLIBC_2.29 scanf F
+GLIBC_2.29 sched_get_priority_max F
+GLIBC_2.29 sched_get_priority_min F
+GLIBC_2.29 sched_getaffinity F
+GLIBC_2.29 sched_getcpu F
+GLIBC_2.29 sched_getparam F
+GLIBC_2.29 sched_getscheduler F
+GLIBC_2.29 sched_rr_get_interval F
+GLIBC_2.29 sched_setaffinity F
+GLIBC_2.29 sched_setparam F
+GLIBC_2.29 sched_setscheduler F
+GLIBC_2.29 sched_yield F
+GLIBC_2.29 secure_getenv F
+GLIBC_2.29 seed48 F
+GLIBC_2.29 seed48_r F
+GLIBC_2.29 seekdir F
+GLIBC_2.29 select F
+GLIBC_2.29 semctl F
+GLIBC_2.29 semget F
+GLIBC_2.29 semop F
+GLIBC_2.29 semtimedop F
+GLIBC_2.29 send F
+GLIBC_2.29 sendfile F
+GLIBC_2.29 sendfile64 F
+GLIBC_2.29 sendmmsg F
+GLIBC_2.29 sendmsg F
+GLIBC_2.29 sendto F
+GLIBC_2.29 setaliasent F
+GLIBC_2.29 setbuf F
+GLIBC_2.29 setbuffer F
+GLIBC_2.29 setcontext F
+GLIBC_2.29 setdomainname F
+GLIBC_2.29 setegid F
+GLIBC_2.29 setenv F
+GLIBC_2.29 seteuid F
+GLIBC_2.29 setfsent F
+GLIBC_2.29 setfsgid F
+GLIBC_2.29 setfsuid F
+GLIBC_2.29 setgid F
+GLIBC_2.29 setgrent F
+GLIBC_2.29 setgroups F
+GLIBC_2.29 sethostent F
+GLIBC_2.29 sethostid F
+GLIBC_2.29 sethostname F
+GLIBC_2.29 setipv4sourcefilter F
+GLIBC_2.29 setitimer F
+GLIBC_2.29 setjmp F
+GLIBC_2.29 setlinebuf F
+GLIBC_2.29 setlocale F
+GLIBC_2.29 setlogin F
+GLIBC_2.29 setlogmask F
+GLIBC_2.29 setmntent F
+GLIBC_2.29 setnetent F
+GLIBC_2.29 setnetgrent F
+GLIBC_2.29 setns F
+GLIBC_2.29 setpgid F
+GLIBC_2.29 setpgrp F
+GLIBC_2.29 setpriority F
+GLIBC_2.29 setprotoent F
+GLIBC_2.29 setpwent F
+GLIBC_2.29 setregid F
+GLIBC_2.29 setresgid F
+GLIBC_2.29 setresuid F
+GLIBC_2.29 setreuid F
+GLIBC_2.29 setrlimit F
+GLIBC_2.29 setrlimit64 F
+GLIBC_2.29 setrpcent F
+GLIBC_2.29 setservent F
+GLIBC_2.29 setsgent F
+GLIBC_2.29 setsid F
+GLIBC_2.29 setsockopt F
+GLIBC_2.29 setsourcefilter F
+GLIBC_2.29 setspent F
+GLIBC_2.29 setstate F
+GLIBC_2.29 setstate_r F
+GLIBC_2.29 settimeofday F
+GLIBC_2.29 setttyent F
+GLIBC_2.29 setuid F
+GLIBC_2.29 setusershell F
+GLIBC_2.29 setutent F
+GLIBC_2.29 setutxent F
+GLIBC_2.29 setvbuf F
+GLIBC_2.29 setxattr F
+GLIBC_2.29 sgetsgent F
+GLIBC_2.29 sgetsgent_r F
+GLIBC_2.29 sgetspent F
+GLIBC_2.29 sgetspent_r F
+GLIBC_2.29 shmat F
+GLIBC_2.29 shmctl F
+GLIBC_2.29 shmdt F
+GLIBC_2.29 shmget F
+GLIBC_2.29 shutdown F
+GLIBC_2.29 sigaction F
+GLIBC_2.29 sigaddset F
+GLIBC_2.29 sigaltstack F
+GLIBC_2.29 sigandset F
+GLIBC_2.29 sigblock F
+GLIBC_2.29 sigdelset F
+GLIBC_2.29 sigemptyset F
+GLIBC_2.29 sigfillset F
+GLIBC_2.29 siggetmask F
+GLIBC_2.29 sighold F
+GLIBC_2.29 sigignore F
+GLIBC_2.29 siginterrupt F
+GLIBC_2.29 sigisemptyset F
+GLIBC_2.29 sigismember F
+GLIBC_2.29 siglongjmp F
+GLIBC_2.29 signal F
+GLIBC_2.29 signalfd F
+GLIBC_2.29 sigorset F
+GLIBC_2.29 sigpause F
+GLIBC_2.29 sigpending F
+GLIBC_2.29 sigprocmask F
+GLIBC_2.29 sigqueue F
+GLIBC_2.29 sigrelse F
+GLIBC_2.29 sigreturn F
+GLIBC_2.29 sigset F
+GLIBC_2.29 sigsetmask F
+GLIBC_2.29 sigstack F
+GLIBC_2.29 sigsuspend F
+GLIBC_2.29 sigtimedwait F
+GLIBC_2.29 sigwait F
+GLIBC_2.29 sigwaitinfo F
+GLIBC_2.29 sleep F
+GLIBC_2.29 snprintf F
+GLIBC_2.29 sockatmark F
+GLIBC_2.29 socket F
+GLIBC_2.29 socketpair F
+GLIBC_2.29 splice F
+GLIBC_2.29 sprintf F
+GLIBC_2.29 sprofil F
+GLIBC_2.29 srand F
+GLIBC_2.29 srand48 F
+GLIBC_2.29 srand48_r F
+GLIBC_2.29 srandom F
+GLIBC_2.29 srandom_r F
+GLIBC_2.29 sscanf F
+GLIBC_2.29 ssignal F
+GLIBC_2.29 sstk F
+GLIBC_2.29 statfs F
+GLIBC_2.29 statfs64 F
+GLIBC_2.29 statvfs F
+GLIBC_2.29 statvfs64 F
+GLIBC_2.29 statx F
+GLIBC_2.29 stderr D 0x4
+GLIBC_2.29 stdin D 0x4
+GLIBC_2.29 stdout D 0x4
+GLIBC_2.29 stime F
+GLIBC_2.29 stpcpy F
+GLIBC_2.29 stpncpy F
+GLIBC_2.29 strcasecmp F
+GLIBC_2.29 strcasecmp_l F
+GLIBC_2.29 strcasestr F
+GLIBC_2.29 strcat F
+GLIBC_2.29 strchr F
+GLIBC_2.29 strchrnul F
+GLIBC_2.29 strcmp F
+GLIBC_2.29 strcoll F
+GLIBC_2.29 strcoll_l F
+GLIBC_2.29 strcpy F
+GLIBC_2.29 strcspn F
+GLIBC_2.29 strdup F
+GLIBC_2.29 strerror F
+GLIBC_2.29 strerror_l F
+GLIBC_2.29 strerror_r F
+GLIBC_2.29 strfmon F
+GLIBC_2.29 strfmon_l F
+GLIBC_2.29 strfromd F
+GLIBC_2.29 strfromf F
+GLIBC_2.29 strfromf32 F
+GLIBC_2.29 strfromf32x F
+GLIBC_2.29 strfromf64 F
+GLIBC_2.29 strfroml F
+GLIBC_2.29 strfry F
+GLIBC_2.29 strftime F
+GLIBC_2.29 strftime_l F
+GLIBC_2.29 strlen F
+GLIBC_2.29 strncasecmp F
+GLIBC_2.29 strncasecmp_l F
+GLIBC_2.29 strncat F
+GLIBC_2.29 strncmp F
+GLIBC_2.29 strncpy F
+GLIBC_2.29 strndup F
+GLIBC_2.29 strnlen F
+GLIBC_2.29 strpbrk F
+GLIBC_2.29 strptime F
+GLIBC_2.29 strptime_l F
+GLIBC_2.29 strrchr F
+GLIBC_2.29 strsep F
+GLIBC_2.29 strsignal F
+GLIBC_2.29 strspn F
+GLIBC_2.29 strstr F
+GLIBC_2.29 strtod F
+GLIBC_2.29 strtod_l F
+GLIBC_2.29 strtof F
+GLIBC_2.29 strtof32 F
+GLIBC_2.29 strtof32_l F
+GLIBC_2.29 strtof32x F
+GLIBC_2.29 strtof32x_l F
+GLIBC_2.29 strtof64 F
+GLIBC_2.29 strtof64_l F
+GLIBC_2.29 strtof_l F
+GLIBC_2.29 strtoimax F
+GLIBC_2.29 strtok F
+GLIBC_2.29 strtok_r F
+GLIBC_2.29 strtol F
+GLIBC_2.29 strtol_l F
+GLIBC_2.29 strtold F
+GLIBC_2.29 strtold_l F
+GLIBC_2.29 strtoll F
+GLIBC_2.29 strtoll_l F
+GLIBC_2.29 strtoq F
+GLIBC_2.29 strtoul F
+GLIBC_2.29 strtoul_l F
+GLIBC_2.29 strtoull F
+GLIBC_2.29 strtoull_l F
+GLIBC_2.29 strtoumax F
+GLIBC_2.29 strtouq F
+GLIBC_2.29 strverscmp F
+GLIBC_2.29 strxfrm F
+GLIBC_2.29 strxfrm_l F
+GLIBC_2.29 stty F
+GLIBC_2.29 svc_exit F
+GLIBC_2.29 svc_fdset D 0x80
+GLIBC_2.29 svc_getreq F
+GLIBC_2.29 svc_getreq_common F
+GLIBC_2.29 svc_getreq_poll F
+GLIBC_2.29 svc_getreqset F
+GLIBC_2.29 svc_max_pollfd D 0x4
+GLIBC_2.29 svc_pollfd D 0x4
+GLIBC_2.29 svc_register F
+GLIBC_2.29 svc_run F
+GLIBC_2.29 svc_sendreply F
+GLIBC_2.29 svc_unregister F
+GLIBC_2.29 svcauthdes_stats D 0xc
+GLIBC_2.29 svcerr_auth F
+GLIBC_2.29 svcerr_decode F
+GLIBC_2.29 svcerr_noproc F
+GLIBC_2.29 svcerr_noprog F
+GLIBC_2.29 svcerr_progvers F
+GLIBC_2.29 svcerr_systemerr F
+GLIBC_2.29 svcerr_weakauth F
+GLIBC_2.29 svcfd_create F
+GLIBC_2.29 svcraw_create F
+GLIBC_2.29 svctcp_create F
+GLIBC_2.29 svcudp_bufcreate F
+GLIBC_2.29 svcudp_create F
+GLIBC_2.29 svcudp_enablecache F
+GLIBC_2.29 svcunix_create F
+GLIBC_2.29 svcunixfd_create F
+GLIBC_2.29 swab F
+GLIBC_2.29 swapcontext F
+GLIBC_2.29 swapoff F
+GLIBC_2.29 swapon F
+GLIBC_2.29 swprintf F
+GLIBC_2.29 swscanf F
+GLIBC_2.29 symlink F
+GLIBC_2.29 symlinkat F
+GLIBC_2.29 sync F
+GLIBC_2.29 sync_file_range F
+GLIBC_2.29 syncfs F
+GLIBC_2.29 sys_errlist D 0x21c
+GLIBC_2.29 sys_nerr D 0x4
+GLIBC_2.29 sys_sigabbrev D 0x104
+GLIBC_2.29 sys_siglist D 0x104
+GLIBC_2.29 syscall F
+GLIBC_2.29 sysconf F
+GLIBC_2.29 sysctl F
+GLIBC_2.29 sysinfo F
+GLIBC_2.29 syslog F
+GLIBC_2.29 system F
+GLIBC_2.29 sysv_signal F
+GLIBC_2.29 tcdrain F
+GLIBC_2.29 tcflow F
+GLIBC_2.29 tcflush F
+GLIBC_2.29 tcgetattr F
+GLIBC_2.29 tcgetpgrp F
+GLIBC_2.29 tcgetsid F
+GLIBC_2.29 tcsendbreak F
+GLIBC_2.29 tcsetattr F
+GLIBC_2.29 tcsetpgrp F
+GLIBC_2.29 tdelete F
+GLIBC_2.29 tdestroy F
+GLIBC_2.29 tee F
+GLIBC_2.29 telldir F
+GLIBC_2.29 tempnam F
+GLIBC_2.29 textdomain F
+GLIBC_2.29 tfind F
+GLIBC_2.29 thrd_current F
+GLIBC_2.29 thrd_equal F
+GLIBC_2.29 thrd_sleep F
+GLIBC_2.29 thrd_yield F
+GLIBC_2.29 time F
+GLIBC_2.29 timegm F
+GLIBC_2.29 timelocal F
+GLIBC_2.29 timerfd_create F
+GLIBC_2.29 timerfd_gettime F
+GLIBC_2.29 timerfd_settime F
+GLIBC_2.29 times F
+GLIBC_2.29 timespec_get F
+GLIBC_2.29 timezone D 0x4
+GLIBC_2.29 tmpfile F
+GLIBC_2.29 tmpfile64 F
+GLIBC_2.29 tmpnam F
+GLIBC_2.29 tmpnam_r F
+GLIBC_2.29 toascii F
+GLIBC_2.29 tolower F
+GLIBC_2.29 tolower_l F
+GLIBC_2.29 toupper F
+GLIBC_2.29 toupper_l F
+GLIBC_2.29 towctrans F
+GLIBC_2.29 towctrans_l F
+GLIBC_2.29 towlower F
+GLIBC_2.29 towlower_l F
+GLIBC_2.29 towupper F
+GLIBC_2.29 towupper_l F
+GLIBC_2.29 tr_break F
+GLIBC_2.29 truncate F
+GLIBC_2.29 truncate64 F
+GLIBC_2.29 tsearch F
+GLIBC_2.29 ttyname F
+GLIBC_2.29 ttyname_r F
+GLIBC_2.29 ttyslot F
+GLIBC_2.29 twalk F
+GLIBC_2.29 tzname D 0x8
+GLIBC_2.29 tzset F
+GLIBC_2.29 ualarm F
+GLIBC_2.29 ulckpwdf F
+GLIBC_2.29 ulimit F
+GLIBC_2.29 umask F
+GLIBC_2.29 umount F
+GLIBC_2.29 umount2 F
+GLIBC_2.29 uname F
+GLIBC_2.29 ungetc F
+GLIBC_2.29 ungetwc F
+GLIBC_2.29 unlink F
+GLIBC_2.29 unlinkat F
+GLIBC_2.29 unlockpt F
+GLIBC_2.29 unsetenv F
+GLIBC_2.29 unshare F
+GLIBC_2.29 updwtmp F
+GLIBC_2.29 updwtmpx F
+GLIBC_2.29 uselocale F
+GLIBC_2.29 user2netname F
+GLIBC_2.29 usleep F
+GLIBC_2.29 utime F
+GLIBC_2.29 utimensat F
+GLIBC_2.29 utimes F
+GLIBC_2.29 utmpname F
+GLIBC_2.29 utmpxname F
+GLIBC_2.29 valloc F
+GLIBC_2.29 vasprintf F
+GLIBC_2.29 vdprintf F
+GLIBC_2.29 verr F
+GLIBC_2.29 verrx F
+GLIBC_2.29 versionsort F
+GLIBC_2.29 versionsort64 F
+GLIBC_2.29 vfork F
+GLIBC_2.29 vfprintf F
+GLIBC_2.29 vfscanf F
+GLIBC_2.29 vfwprintf F
+GLIBC_2.29 vfwscanf F
+GLIBC_2.29 vhangup F
+GLIBC_2.29 vlimit F
+GLIBC_2.29 vmsplice F
+GLIBC_2.29 vprintf F
+GLIBC_2.29 vscanf F
+GLIBC_2.29 vsnprintf F
+GLIBC_2.29 vsprintf F
+GLIBC_2.29 vsscanf F
+GLIBC_2.29 vswprintf F
+GLIBC_2.29 vswscanf F
+GLIBC_2.29 vsyslog F
+GLIBC_2.29 vtimes F
+GLIBC_2.29 vwarn F
+GLIBC_2.29 vwarnx F
+GLIBC_2.29 vwprintf F
+GLIBC_2.29 vwscanf F
+GLIBC_2.29 wait F
+GLIBC_2.29 wait3 F
+GLIBC_2.29 wait4 F
+GLIBC_2.29 waitid F
+GLIBC_2.29 waitpid F
+GLIBC_2.29 warn F
+GLIBC_2.29 warnx F
+GLIBC_2.29 wcpcpy F
+GLIBC_2.29 wcpncpy F
+GLIBC_2.29 wcrtomb F
+GLIBC_2.29 wcscasecmp F
+GLIBC_2.29 wcscasecmp_l F
+GLIBC_2.29 wcscat F
+GLIBC_2.29 wcschr F
+GLIBC_2.29 wcschrnul F
+GLIBC_2.29 wcscmp F
+GLIBC_2.29 wcscoll F
+GLIBC_2.29 wcscoll_l F
+GLIBC_2.29 wcscpy F
+GLIBC_2.29 wcscspn F
+GLIBC_2.29 wcsdup F
+GLIBC_2.29 wcsftime F
+GLIBC_2.29 wcsftime_l F
+GLIBC_2.29 wcslen F
+GLIBC_2.29 wcsncasecmp F
+GLIBC_2.29 wcsncasecmp_l F
+GLIBC_2.29 wcsncat F
+GLIBC_2.29 wcsncmp F
+GLIBC_2.29 wcsncpy F
+GLIBC_2.29 wcsnlen F
+GLIBC_2.29 wcsnrtombs F
+GLIBC_2.29 wcspbrk F
+GLIBC_2.29 wcsrchr F
+GLIBC_2.29 wcsrtombs F
+GLIBC_2.29 wcsspn F
+GLIBC_2.29 wcsstr F
+GLIBC_2.29 wcstod F
+GLIBC_2.29 wcstod_l F
+GLIBC_2.29 wcstof F
+GLIBC_2.29 wcstof32 F
+GLIBC_2.29 wcstof32_l F
+GLIBC_2.29 wcstof32x F
+GLIBC_2.29 wcstof32x_l F
+GLIBC_2.29 wcstof64 F
+GLIBC_2.29 wcstof64_l F
+GLIBC_2.29 wcstof_l F
+GLIBC_2.29 wcstoimax F
+GLIBC_2.29 wcstok F
+GLIBC_2.29 wcstol F
+GLIBC_2.29 wcstol_l F
+GLIBC_2.29 wcstold F
+GLIBC_2.29 wcstold_l F
+GLIBC_2.29 wcstoll F
+GLIBC_2.29 wcstoll_l F
+GLIBC_2.29 wcstombs F
+GLIBC_2.29 wcstoq F
+GLIBC_2.29 wcstoul F
+GLIBC_2.29 wcstoul_l F
+GLIBC_2.29 wcstoull F
+GLIBC_2.29 wcstoull_l F
+GLIBC_2.29 wcstoumax F
+GLIBC_2.29 wcstouq F
+GLIBC_2.29 wcswcs F
+GLIBC_2.29 wcswidth F
+GLIBC_2.29 wcsxfrm F
+GLIBC_2.29 wcsxfrm_l F
+GLIBC_2.29 wctob F
+GLIBC_2.29 wctomb F
+GLIBC_2.29 wctrans F
+GLIBC_2.29 wctrans_l F
+GLIBC_2.29 wctype F
+GLIBC_2.29 wctype_l F
+GLIBC_2.29 wcwidth F
+GLIBC_2.29 wmemchr F
+GLIBC_2.29 wmemcmp F
+GLIBC_2.29 wmemcpy F
+GLIBC_2.29 wmemmove F
+GLIBC_2.29 wmempcpy F
+GLIBC_2.29 wmemset F
+GLIBC_2.29 wordexp F
+GLIBC_2.29 wordfree F
+GLIBC_2.29 wprintf F
+GLIBC_2.29 write F
+GLIBC_2.29 writev F
+GLIBC_2.29 wscanf F
+GLIBC_2.29 xdecrypt F
+GLIBC_2.29 xdr_accepted_reply F
+GLIBC_2.29 xdr_array F
+GLIBC_2.29 xdr_authdes_cred F
+GLIBC_2.29 xdr_authdes_verf F
+GLIBC_2.29 xdr_authunix_parms F
+GLIBC_2.29 xdr_bool F
+GLIBC_2.29 xdr_bytes F
+GLIBC_2.29 xdr_callhdr F
+GLIBC_2.29 xdr_callmsg F
+GLIBC_2.29 xdr_char F
+GLIBC_2.29 xdr_cryptkeyarg F
+GLIBC_2.29 xdr_cryptkeyarg2 F
+GLIBC_2.29 xdr_cryptkeyres F
+GLIBC_2.29 xdr_des_block F
+GLIBC_2.29 xdr_double F
+GLIBC_2.29 xdr_enum F
+GLIBC_2.29 xdr_float F
+GLIBC_2.29 xdr_free F
+GLIBC_2.29 xdr_getcredres F
+GLIBC_2.29 xdr_hyper F
+GLIBC_2.29 xdr_int F
+GLIBC_2.29 xdr_int16_t F
+GLIBC_2.29 xdr_int32_t F
+GLIBC_2.29 xdr_int64_t F
+GLIBC_2.29 xdr_int8_t F
+GLIBC_2.29 xdr_key_netstarg F
+GLIBC_2.29 xdr_key_netstres F
+GLIBC_2.29 xdr_keybuf F
+GLIBC_2.29 xdr_keystatus F
+GLIBC_2.29 xdr_long F
+GLIBC_2.29 xdr_longlong_t F
+GLIBC_2.29 xdr_netnamestr F
+GLIBC_2.29 xdr_netobj F
+GLIBC_2.29 xdr_opaque F
+GLIBC_2.29 xdr_opaque_auth F
+GLIBC_2.29 xdr_pmap F
+GLIBC_2.29 xdr_pmaplist F
+GLIBC_2.29 xdr_pointer F
+GLIBC_2.29 xdr_quad_t F
+GLIBC_2.29 xdr_reference F
+GLIBC_2.29 xdr_rejected_reply F
+GLIBC_2.29 xdr_replymsg F
+GLIBC_2.29 xdr_rmtcall_args F
+GLIBC_2.29 xdr_rmtcallres F
+GLIBC_2.29 xdr_short F
+GLIBC_2.29 xdr_sizeof F
+GLIBC_2.29 xdr_string F
+GLIBC_2.29 xdr_u_char F
+GLIBC_2.29 xdr_u_hyper F
+GLIBC_2.29 xdr_u_int F
+GLIBC_2.29 xdr_u_long F
+GLIBC_2.29 xdr_u_longlong_t F
+GLIBC_2.29 xdr_u_quad_t F
+GLIBC_2.29 xdr_u_short F
+GLIBC_2.29 xdr_uint16_t F
+GLIBC_2.29 xdr_uint32_t F
+GLIBC_2.29 xdr_uint64_t F
+GLIBC_2.29 xdr_uint8_t F
+GLIBC_2.29 xdr_union F
+GLIBC_2.29 xdr_unixcred F
+GLIBC_2.29 xdr_vector F
+GLIBC_2.29 xdr_void F
+GLIBC_2.29 xdr_wrapstring F
+GLIBC_2.29 xdrmem_create F
+GLIBC_2.29 xdrrec_create F
+GLIBC_2.29 xdrrec_endofrecord F
+GLIBC_2.29 xdrrec_eof F
+GLIBC_2.29 xdrrec_skiprecord F
+GLIBC_2.29 xdrstdio_create F
+GLIBC_2.29 xencrypt F
+GLIBC_2.29 xprt_register F
+GLIBC_2.29 xprt_unregister F
diff --git a/sysdeps/unix/sysv/linux/arc/libcrypt.abilist b/sysdeps/unix/sysv/linux/arc/libcrypt.abilist
new file mode 100644
index 000000000000..da3abbf8fb89
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libcrypt.abilist
@@ -0,0 +1,2 @@
+GLIBC_2.29 crypt F
+GLIBC_2.29 crypt_r F
diff --git a/sysdeps/unix/sysv/linux/arc/libdl.abilist b/sysdeps/unix/sysv/linux/arc/libdl.abilist
new file mode 100644
index 000000000000..8fcb609ddcfa
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libdl.abilist
@@ -0,0 +1,9 @@
+GLIBC_2.29 dladdr F
+GLIBC_2.29 dladdr1 F
+GLIBC_2.29 dlclose F
+GLIBC_2.29 dlerror F
+GLIBC_2.29 dlinfo F
+GLIBC_2.29 dlmopen F
+GLIBC_2.29 dlopen F
+GLIBC_2.29 dlsym F
+GLIBC_2.29 dlvsym F
diff --git a/sysdeps/unix/sysv/linux/arc/libm.abilist b/sysdeps/unix/sysv/linux/arc/libm.abilist
new file mode 100644
index 000000000000..497f62264475
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libm.abilist
@@ -0,0 +1,753 @@
+GLIBC_2.29 __acos_finite F
+GLIBC_2.29 __acosf_finite F
+GLIBC_2.29 __acosh_finite F
+GLIBC_2.29 __acoshf_finite F
+GLIBC_2.29 __asin_finite F
+GLIBC_2.29 __asinf_finite F
+GLIBC_2.29 __atan2_finite F
+GLIBC_2.29 __atan2f_finite F
+GLIBC_2.29 __atanh_finite F
+GLIBC_2.29 __atanhf_finite F
+GLIBC_2.29 __clog10 F
+GLIBC_2.29 __clog10f F
+GLIBC_2.29 __clog10l F
+GLIBC_2.29 __cosh_finite F
+GLIBC_2.29 __coshf_finite F
+GLIBC_2.29 __exp10_finite F
+GLIBC_2.29 __exp10f_finite F
+GLIBC_2.29 __exp2_finite F
+GLIBC_2.29 __exp2f_finite F
+GLIBC_2.29 __exp_finite F
+GLIBC_2.29 __expf_finite F
+GLIBC_2.29 __finite F
+GLIBC_2.29 __finitef F
+GLIBC_2.29 __fmod_finite F
+GLIBC_2.29 __fmodf_finite F
+GLIBC_2.29 __fpclassify F
+GLIBC_2.29 __fpclassifyf F
+GLIBC_2.29 __gamma_r_finite F
+GLIBC_2.29 __gammaf_r_finite F
+GLIBC_2.29 __hypot_finite F
+GLIBC_2.29 __hypotf_finite F
+GLIBC_2.29 __iseqsig F
+GLIBC_2.29 __iseqsigf F
+GLIBC_2.29 __issignaling F
+GLIBC_2.29 __issignalingf F
+GLIBC_2.29 __j0_finite F
+GLIBC_2.29 __j0f_finite F
+GLIBC_2.29 __j1_finite F
+GLIBC_2.29 __j1f_finite F
+GLIBC_2.29 __jn_finite F
+GLIBC_2.29 __jnf_finite F
+GLIBC_2.29 __lgamma_r_finite F
+GLIBC_2.29 __lgammaf_r_finite F
+GLIBC_2.29 __log10_finite F
+GLIBC_2.29 __log10f_finite F
+GLIBC_2.29 __log2_finite F
+GLIBC_2.29 __log2f_finite F
+GLIBC_2.29 __log_finite F
+GLIBC_2.29 __logf_finite F
+GLIBC_2.29 __pow_finite F
+GLIBC_2.29 __powf_finite F
+GLIBC_2.29 __remainder_finite F
+GLIBC_2.29 __remainderf_finite F
+GLIBC_2.29 __scalb_finite F
+GLIBC_2.29 __scalbf_finite F
+GLIBC_2.29 __signbit F
+GLIBC_2.29 __signbitf F
+GLIBC_2.29 __signgam D 0x4
+GLIBC_2.29 __sinh_finite F
+GLIBC_2.29 __sinhf_finite F
+GLIBC_2.29 __sqrt_finite F
+GLIBC_2.29 __sqrtf_finite F
+GLIBC_2.29 __y0_finite F
+GLIBC_2.29 __y0f_finite F
+GLIBC_2.29 __y1_finite F
+GLIBC_2.29 __y1f_finite F
+GLIBC_2.29 __yn_finite F
+GLIBC_2.29 __ynf_finite F
+GLIBC_2.29 acos F
+GLIBC_2.29 acosf F
+GLIBC_2.29 acosf32 F
+GLIBC_2.29 acosf32x F
+GLIBC_2.29 acosf64 F
+GLIBC_2.29 acosh F
+GLIBC_2.29 acoshf F
+GLIBC_2.29 acoshf32 F
+GLIBC_2.29 acoshf32x F
+GLIBC_2.29 acoshf64 F
+GLIBC_2.29 acoshl F
+GLIBC_2.29 acosl F
+GLIBC_2.29 asin F
+GLIBC_2.29 asinf F
+GLIBC_2.29 asinf32 F
+GLIBC_2.29 asinf32x F
+GLIBC_2.29 asinf64 F
+GLIBC_2.29 asinh F
+GLIBC_2.29 asinhf F
+GLIBC_2.29 asinhf32 F
+GLIBC_2.29 asinhf32x F
+GLIBC_2.29 asinhf64 F
+GLIBC_2.29 asinhl F
+GLIBC_2.29 asinl F
+GLIBC_2.29 atan F
+GLIBC_2.29 atan2 F
+GLIBC_2.29 atan2f F
+GLIBC_2.29 atan2f32 F
+GLIBC_2.29 atan2f32x F
+GLIBC_2.29 atan2f64 F
+GLIBC_2.29 atan2l F
+GLIBC_2.29 atanf F
+GLIBC_2.29 atanf32 F
+GLIBC_2.29 atanf32x F
+GLIBC_2.29 atanf64 F
+GLIBC_2.29 atanh F
+GLIBC_2.29 atanhf F
+GLIBC_2.29 atanhf32 F
+GLIBC_2.29 atanhf32x F
+GLIBC_2.29 atanhf64 F
+GLIBC_2.29 atanhl F
+GLIBC_2.29 atanl F
+GLIBC_2.29 cabs F
+GLIBC_2.29 cabsf F
+GLIBC_2.29 cabsf32 F
+GLIBC_2.29 cabsf32x F
+GLIBC_2.29 cabsf64 F
+GLIBC_2.29 cabsl F
+GLIBC_2.29 cacos F
+GLIBC_2.29 cacosf F
+GLIBC_2.29 cacosf32 F
+GLIBC_2.29 cacosf32x F
+GLIBC_2.29 cacosf64 F
+GLIBC_2.29 cacosh F
+GLIBC_2.29 cacoshf F
+GLIBC_2.29 cacoshf32 F
+GLIBC_2.29 cacoshf32x F
+GLIBC_2.29 cacoshf64 F
+GLIBC_2.29 cacoshl F
+GLIBC_2.29 cacosl F
+GLIBC_2.29 canonicalize F
+GLIBC_2.29 canonicalizef F
+GLIBC_2.29 canonicalizef32 F
+GLIBC_2.29 canonicalizef32x F
+GLIBC_2.29 canonicalizef64 F
+GLIBC_2.29 canonicalizel F
+GLIBC_2.29 carg F
+GLIBC_2.29 cargf F
+GLIBC_2.29 cargf32 F
+GLIBC_2.29 cargf32x F
+GLIBC_2.29 cargf64 F
+GLIBC_2.29 cargl F
+GLIBC_2.29 casin F
+GLIBC_2.29 casinf F
+GLIBC_2.29 casinf32 F
+GLIBC_2.29 casinf32x F
+GLIBC_2.29 casinf64 F
+GLIBC_2.29 casinh F
+GLIBC_2.29 casinhf F
+GLIBC_2.29 casinhf32 F
+GLIBC_2.29 casinhf32x F
+GLIBC_2.29 casinhf64 F
+GLIBC_2.29 casinhl F
+GLIBC_2.29 casinl F
+GLIBC_2.29 catan F
+GLIBC_2.29 catanf F
+GLIBC_2.29 catanf32 F
+GLIBC_2.29 catanf32x F
+GLIBC_2.29 catanf64 F
+GLIBC_2.29 catanh F
+GLIBC_2.29 catanhf F
+GLIBC_2.29 catanhf32 F
+GLIBC_2.29 catanhf32x F
+GLIBC_2.29 catanhf64 F
+GLIBC_2.29 catanhl F
+GLIBC_2.29 catanl F
+GLIBC_2.29 cbrt F
+GLIBC_2.29 cbrtf F
+GLIBC_2.29 cbrtf32 F
+GLIBC_2.29 cbrtf32x F
+GLIBC_2.29 cbrtf64 F
+GLIBC_2.29 cbrtl F
+GLIBC_2.29 ccos F
+GLIBC_2.29 ccosf F
+GLIBC_2.29 ccosf32 F
+GLIBC_2.29 ccosf32x F
+GLIBC_2.29 ccosf64 F
+GLIBC_2.29 ccosh F
+GLIBC_2.29 ccoshf F
+GLIBC_2.29 ccoshf32 F
+GLIBC_2.29 ccoshf32x F
+GLIBC_2.29 ccoshf64 F
+GLIBC_2.29 ccoshl F
+GLIBC_2.29 ccosl F
+GLIBC_2.29 ceil F
+GLIBC_2.29 ceilf F
+GLIBC_2.29 ceilf32 F
+GLIBC_2.29 ceilf32x F
+GLIBC_2.29 ceilf64 F
+GLIBC_2.29 ceill F
+GLIBC_2.29 cexp F
+GLIBC_2.29 cexpf F
+GLIBC_2.29 cexpf32 F
+GLIBC_2.29 cexpf32x F
+GLIBC_2.29 cexpf64 F
+GLIBC_2.29 cexpl F
+GLIBC_2.29 cimag F
+GLIBC_2.29 cimagf F
+GLIBC_2.29 cimagf32 F
+GLIBC_2.29 cimagf32x F
+GLIBC_2.29 cimagf64 F
+GLIBC_2.29 cimagl F
+GLIBC_2.29 clog F
+GLIBC_2.29 clog10 F
+GLIBC_2.29 clog10f F
+GLIBC_2.29 clog10f32 F
+GLIBC_2.29 clog10f32x F
+GLIBC_2.29 clog10f64 F
+GLIBC_2.29 clog10l F
+GLIBC_2.29 clogf F
+GLIBC_2.29 clogf32 F
+GLIBC_2.29 clogf32x F
+GLIBC_2.29 clogf64 F
+GLIBC_2.29 clogl F
+GLIBC_2.29 conj F
+GLIBC_2.29 conjf F
+GLIBC_2.29 conjf32 F
+GLIBC_2.29 conjf32x F
+GLIBC_2.29 conjf64 F
+GLIBC_2.29 conjl F
+GLIBC_2.29 copysign F
+GLIBC_2.29 copysignf F
+GLIBC_2.29 copysignf32 F
+GLIBC_2.29 copysignf32x F
+GLIBC_2.29 copysignf64 F
+GLIBC_2.29 copysignl F
+GLIBC_2.29 cos F
+GLIBC_2.29 cosf F
+GLIBC_2.29 cosf32 F
+GLIBC_2.29 cosf32x F
+GLIBC_2.29 cosf64 F
+GLIBC_2.29 cosh F
+GLIBC_2.29 coshf F
+GLIBC_2.29 coshf32 F
+GLIBC_2.29 coshf32x F
+GLIBC_2.29 coshf64 F
+GLIBC_2.29 coshl F
+GLIBC_2.29 cosl F
+GLIBC_2.29 cpow F
+GLIBC_2.29 cpowf F
+GLIBC_2.29 cpowf32 F
+GLIBC_2.29 cpowf32x F
+GLIBC_2.29 cpowf64 F
+GLIBC_2.29 cpowl F
+GLIBC_2.29 cproj F
+GLIBC_2.29 cprojf F
+GLIBC_2.29 cprojf32 F
+GLIBC_2.29 cprojf32x F
+GLIBC_2.29 cprojf64 F
+GLIBC_2.29 cprojl F
+GLIBC_2.29 creal F
+GLIBC_2.29 crealf F
+GLIBC_2.29 crealf32 F
+GLIBC_2.29 crealf32x F
+GLIBC_2.29 crealf64 F
+GLIBC_2.29 creall F
+GLIBC_2.29 csin F
+GLIBC_2.29 csinf F
+GLIBC_2.29 csinf32 F
+GLIBC_2.29 csinf32x F
+GLIBC_2.29 csinf64 F
+GLIBC_2.29 csinh F
+GLIBC_2.29 csinhf F
+GLIBC_2.29 csinhf32 F
+GLIBC_2.29 csinhf32x F
+GLIBC_2.29 csinhf64 F
+GLIBC_2.29 csinhl F
+GLIBC_2.29 csinl F
+GLIBC_2.29 csqrt F
+GLIBC_2.29 csqrtf F
+GLIBC_2.29 csqrtf32 F
+GLIBC_2.29 csqrtf32x F
+GLIBC_2.29 csqrtf64 F
+GLIBC_2.29 csqrtl F
+GLIBC_2.29 ctan F
+GLIBC_2.29 ctanf F
+GLIBC_2.29 ctanf32 F
+GLIBC_2.29 ctanf32x F
+GLIBC_2.29 ctanf64 F
+GLIBC_2.29 ctanh F
+GLIBC_2.29 ctanhf F
+GLIBC_2.29 ctanhf32 F
+GLIBC_2.29 ctanhf32x F
+GLIBC_2.29 ctanhf64 F
+GLIBC_2.29 ctanhl F
+GLIBC_2.29 ctanl F
+GLIBC_2.29 daddl F
+GLIBC_2.29 ddivl F
+GLIBC_2.29 dmull F
+GLIBC_2.29 drem F
+GLIBC_2.29 dremf F
+GLIBC_2.29 dreml F
+GLIBC_2.29 dsubl F
+GLIBC_2.29 erf F
+GLIBC_2.29 erfc F
+GLIBC_2.29 erfcf F
+GLIBC_2.29 erfcf32 F
+GLIBC_2.29 erfcf32x F
+GLIBC_2.29 erfcf64 F
+GLIBC_2.29 erfcl F
+GLIBC_2.29 erff F
+GLIBC_2.29 erff32 F
+GLIBC_2.29 erff32x F
+GLIBC_2.29 erff64 F
+GLIBC_2.29 erfl F
+GLIBC_2.29 exp F
+GLIBC_2.29 exp10 F
+GLIBC_2.29 exp10f F
+GLIBC_2.29 exp10f32 F
+GLIBC_2.29 exp10f32x F
+GLIBC_2.29 exp10f64 F
+GLIBC_2.29 exp10l F
+GLIBC_2.29 exp2 F
+GLIBC_2.29 exp2f F
+GLIBC_2.29 exp2f32 F
+GLIBC_2.29 exp2f32x F
+GLIBC_2.29 exp2f64 F
+GLIBC_2.29 exp2l F
+GLIBC_2.29 expf F
+GLIBC_2.29 expf32 F
+GLIBC_2.29 expf32x F
+GLIBC_2.29 expf64 F
+GLIBC_2.29 expl F
+GLIBC_2.29 expm1 F
+GLIBC_2.29 expm1f F
+GLIBC_2.29 expm1f32 F
+GLIBC_2.29 expm1f32x F
+GLIBC_2.29 expm1f64 F
+GLIBC_2.29 expm1l F
+GLIBC_2.29 f32addf32x F
+GLIBC_2.29 f32addf64 F
+GLIBC_2.29 f32divf32x F
+GLIBC_2.29 f32divf64 F
+GLIBC_2.29 f32mulf32x F
+GLIBC_2.29 f32mulf64 F
+GLIBC_2.29 f32subf32x F
+GLIBC_2.29 f32subf64 F
+GLIBC_2.29 f32xaddf64 F
+GLIBC_2.29 f32xdivf64 F
+GLIBC_2.29 f32xmulf64 F
+GLIBC_2.29 f32xsubf64 F
+GLIBC_2.29 fabs F
+GLIBC_2.29 fabsf F
+GLIBC_2.29 fabsf32 F
+GLIBC_2.29 fabsf32x F
+GLIBC_2.29 fabsf64 F
+GLIBC_2.29 fabsl F
+GLIBC_2.29 fadd F
+GLIBC_2.29 faddl F
+GLIBC_2.29 fdim F
+GLIBC_2.29 fdimf F
+GLIBC_2.29 fdimf32 F
+GLIBC_2.29 fdimf32x F
+GLIBC_2.29 fdimf64 F
+GLIBC_2.29 fdiml F
+GLIBC_2.29 fdiv F
+GLIBC_2.29 fdivl F
+GLIBC_2.29 feclearexcept F
+GLIBC_2.29 fedisableexcept F
+GLIBC_2.29 feenableexcept F
+GLIBC_2.29 fegetenv F
+GLIBC_2.29 fegetexcept F
+GLIBC_2.29 fegetexceptflag F
+GLIBC_2.29 fegetmode F
+GLIBC_2.29 fegetround F
+GLIBC_2.29 feholdexcept F
+GLIBC_2.29 feraiseexcept F
+GLIBC_2.29 fesetenv F
+GLIBC_2.29 fesetexcept F
+GLIBC_2.29 fesetexceptflag F
+GLIBC_2.29 fesetmode F
+GLIBC_2.29 fesetround F
+GLIBC_2.29 fetestexcept F
+GLIBC_2.29 fetestexceptflag F
+GLIBC_2.29 feupdateenv F
+GLIBC_2.29 finite F
+GLIBC_2.29 finitef F
+GLIBC_2.29 finitel F
+GLIBC_2.29 floor F
+GLIBC_2.29 floorf F
+GLIBC_2.29 floorf32 F
+GLIBC_2.29 floorf32x F
+GLIBC_2.29 floorf64 F
+GLIBC_2.29 floorl F
+GLIBC_2.29 fma F
+GLIBC_2.29 fmaf F
+GLIBC_2.29 fmaf32 F
+GLIBC_2.29 fmaf32x F
+GLIBC_2.29 fmaf64 F
+GLIBC_2.29 fmal F
+GLIBC_2.29 fmax F
+GLIBC_2.29 fmaxf F
+GLIBC_2.29 fmaxf32 F
+GLIBC_2.29 fmaxf32x F
+GLIBC_2.29 fmaxf64 F
+GLIBC_2.29 fmaxl F
+GLIBC_2.29 fmaxmag F
+GLIBC_2.29 fmaxmagf F
+GLIBC_2.29 fmaxmagf32 F
+GLIBC_2.29 fmaxmagf32x F
+GLIBC_2.29 fmaxmagf64 F
+GLIBC_2.29 fmaxmagl F
+GLIBC_2.29 fmin F
+GLIBC_2.29 fminf F
+GLIBC_2.29 fminf32 F
+GLIBC_2.29 fminf32x F
+GLIBC_2.29 fminf64 F
+GLIBC_2.29 fminl F
+GLIBC_2.29 fminmag F
+GLIBC_2.29 fminmagf F
+GLIBC_2.29 fminmagf32 F
+GLIBC_2.29 fminmagf32x F
+GLIBC_2.29 fminmagf64 F
+GLIBC_2.29 fminmagl F
+GLIBC_2.29 fmod F
+GLIBC_2.29 fmodf F
+GLIBC_2.29 fmodf32 F
+GLIBC_2.29 fmodf32x F
+GLIBC_2.29 fmodf64 F
+GLIBC_2.29 fmodl F
+GLIBC_2.29 fmul F
+GLIBC_2.29 fmull F
+GLIBC_2.29 frexp F
+GLIBC_2.29 frexpf F
+GLIBC_2.29 frexpf32 F
+GLIBC_2.29 frexpf32x F
+GLIBC_2.29 frexpf64 F
+GLIBC_2.29 frexpl F
+GLIBC_2.29 fromfp F
+GLIBC_2.29 fromfpf F
+GLIBC_2.29 fromfpf32 F
+GLIBC_2.29 fromfpf32x F
+GLIBC_2.29 fromfpf64 F
+GLIBC_2.29 fromfpl F
+GLIBC_2.29 fromfpx F
+GLIBC_2.29 fromfpxf F
+GLIBC_2.29 fromfpxf32 F
+GLIBC_2.29 fromfpxf32x F
+GLIBC_2.29 fromfpxf64 F
+GLIBC_2.29 fromfpxl F
+GLIBC_2.29 fsub F
+GLIBC_2.29 fsubl F
+GLIBC_2.29 gamma F
+GLIBC_2.29 gammaf F
+GLIBC_2.29 gammal F
+GLIBC_2.29 getpayload F
+GLIBC_2.29 getpayloadf F
+GLIBC_2.29 getpayloadf32 F
+GLIBC_2.29 getpayloadf32x F
+GLIBC_2.29 getpayloadf64 F
+GLIBC_2.29 getpayloadl F
+GLIBC_2.29 hypot F
+GLIBC_2.29 hypotf F
+GLIBC_2.29 hypotf32 F
+GLIBC_2.29 hypotf32x F
+GLIBC_2.29 hypotf64 F
+GLIBC_2.29 hypotl F
+GLIBC_2.29 ilogb F
+GLIBC_2.29 ilogbf F
+GLIBC_2.29 ilogbf32 F
+GLIBC_2.29 ilogbf32x F
+GLIBC_2.29 ilogbf64 F
+GLIBC_2.29 ilogbl F
+GLIBC_2.29 j0 F
+GLIBC_2.29 j0f F
+GLIBC_2.29 j0f32 F
+GLIBC_2.29 j0f32x F
+GLIBC_2.29 j0f64 F
+GLIBC_2.29 j0l F
+GLIBC_2.29 j1 F
+GLIBC_2.29 j1f F
+GLIBC_2.29 j1f32 F
+GLIBC_2.29 j1f32x F
+GLIBC_2.29 j1f64 F
+GLIBC_2.29 j1l F
+GLIBC_2.29 jn F
+GLIBC_2.29 jnf F
+GLIBC_2.29 jnf32 F
+GLIBC_2.29 jnf32x F
+GLIBC_2.29 jnf64 F
+GLIBC_2.29 jnl F
+GLIBC_2.29 ldexp F
+GLIBC_2.29 ldexpf F
+GLIBC_2.29 ldexpf32 F
+GLIBC_2.29 ldexpf32x F
+GLIBC_2.29 ldexpf64 F
+GLIBC_2.29 ldexpl F
+GLIBC_2.29 lgamma F
+GLIBC_2.29 lgamma_r F
+GLIBC_2.29 lgammaf F
+GLIBC_2.29 lgammaf32 F
+GLIBC_2.29 lgammaf32_r F
+GLIBC_2.29 lgammaf32x F
+GLIBC_2.29 lgammaf32x_r F
+GLIBC_2.29 lgammaf64 F
+GLIBC_2.29 lgammaf64_r F
+GLIBC_2.29 lgammaf_r F
+GLIBC_2.29 lgammal F
+GLIBC_2.29 lgammal_r F
+GLIBC_2.29 llogb F
+GLIBC_2.29 llogbf F
+GLIBC_2.29 llogbf32 F
+GLIBC_2.29 llogbf32x F
+GLIBC_2.29 llogbf64 F
+GLIBC_2.29 llogbl F
+GLIBC_2.29 llrint F
+GLIBC_2.29 llrintf F
+GLIBC_2.29 llrintf32 F
+GLIBC_2.29 llrintf32x F
+GLIBC_2.29 llrintf64 F
+GLIBC_2.29 llrintl F
+GLIBC_2.29 llround F
+GLIBC_2.29 llroundf F
+GLIBC_2.29 llroundf32 F
+GLIBC_2.29 llroundf32x F
+GLIBC_2.29 llroundf64 F
+GLIBC_2.29 llroundl F
+GLIBC_2.29 log F
+GLIBC_2.29 log10 F
+GLIBC_2.29 log10f F
+GLIBC_2.29 log10f32 F
+GLIBC_2.29 log10f32x F
+GLIBC_2.29 log10f64 F
+GLIBC_2.29 log10l F
+GLIBC_2.29 log1p F
+GLIBC_2.29 log1pf F
+GLIBC_2.29 log1pf32 F
+GLIBC_2.29 log1pf32x F
+GLIBC_2.29 log1pf64 F
+GLIBC_2.29 log1pl F
+GLIBC_2.29 log2 F
+GLIBC_2.29 log2f F
+GLIBC_2.29 log2f32 F
+GLIBC_2.29 log2f32x F
+GLIBC_2.29 log2f64 F
+GLIBC_2.29 log2l F
+GLIBC_2.29 logb F
+GLIBC_2.29 logbf F
+GLIBC_2.29 logbf32 F
+GLIBC_2.29 logbf32x F
+GLIBC_2.29 logbf64 F
+GLIBC_2.29 logbl F
+GLIBC_2.29 logf F
+GLIBC_2.29 logf32 F
+GLIBC_2.29 logf32x F
+GLIBC_2.29 logf64 F
+GLIBC_2.29 logl F
+GLIBC_2.29 lrint F
+GLIBC_2.29 lrintf F
+GLIBC_2.29 lrintf32 F
+GLIBC_2.29 lrintf32x F
+GLIBC_2.29 lrintf64 F
+GLIBC_2.29 lrintl F
+GLIBC_2.29 lround F
+GLIBC_2.29 lroundf F
+GLIBC_2.29 lroundf32 F
+GLIBC_2.29 lroundf32x F
+GLIBC_2.29 lroundf64 F
+GLIBC_2.29 lroundl F
+GLIBC_2.29 modf F
+GLIBC_2.29 modff F
+GLIBC_2.29 modff32 F
+GLIBC_2.29 modff32x F
+GLIBC_2.29 modff64 F
+GLIBC_2.29 modfl F
+GLIBC_2.29 nan F
+GLIBC_2.29 nanf F
+GLIBC_2.29 nanf32 F
+GLIBC_2.29 nanf32x F
+GLIBC_2.29 nanf64 F
+GLIBC_2.29 nanl F
+GLIBC_2.29 nearbyint F
+GLIBC_2.29 nearbyintf F
+GLIBC_2.29 nearbyintf32 F
+GLIBC_2.29 nearbyintf32x F
+GLIBC_2.29 nearbyintf64 F
+GLIBC_2.29 nearbyintl F
+GLIBC_2.29 nextafter F
+GLIBC_2.29 nextafterf F
+GLIBC_2.29 nextafterf32 F
+GLIBC_2.29 nextafterf32x F
+GLIBC_2.29 nextafterf64 F
+GLIBC_2.29 nextafterl F
+GLIBC_2.29 nextdown F
+GLIBC_2.29 nextdownf F
+GLIBC_2.29 nextdownf32 F
+GLIBC_2.29 nextdownf32x F
+GLIBC_2.29 nextdownf64 F
+GLIBC_2.29 nextdownl F
+GLIBC_2.29 nexttoward F
+GLIBC_2.29 nexttowardf F
+GLIBC_2.29 nexttowardl F
+GLIBC_2.29 nextup F
+GLIBC_2.29 nextupf F
+GLIBC_2.29 nextupf32 F
+GLIBC_2.29 nextupf32x F
+GLIBC_2.29 nextupf64 F
+GLIBC_2.29 nextupl F
+GLIBC_2.29 pow F
+GLIBC_2.29 powf F
+GLIBC_2.29 powf32 F
+GLIBC_2.29 powf32x F
+GLIBC_2.29 powf64 F
+GLIBC_2.29 powl F
+GLIBC_2.29 remainder F
+GLIBC_2.29 remainderf F
+GLIBC_2.29 remainderf32 F
+GLIBC_2.29 remainderf32x F
+GLIBC_2.29 remainderf64 F
+GLIBC_2.29 remainderl F
+GLIBC_2.29 remquo F
+GLIBC_2.29 remquof F
+GLIBC_2.29 remquof32 F
+GLIBC_2.29 remquof32x F
+GLIBC_2.29 remquof64 F
+GLIBC_2.29 remquol F
+GLIBC_2.29 rint F
+GLIBC_2.29 rintf F
+GLIBC_2.29 rintf32 F
+GLIBC_2.29 rintf32x F
+GLIBC_2.29 rintf64 F
+GLIBC_2.29 rintl F
+GLIBC_2.29 round F
+GLIBC_2.29 roundeven F
+GLIBC_2.29 roundevenf F
+GLIBC_2.29 roundevenf32 F
+GLIBC_2.29 roundevenf32x F
+GLIBC_2.29 roundevenf64 F
+GLIBC_2.29 roundevenl F
+GLIBC_2.29 roundf F
+GLIBC_2.29 roundf32 F
+GLIBC_2.29 roundf32x F
+GLIBC_2.29 roundf64 F
+GLIBC_2.29 roundl F
+GLIBC_2.29 scalb F
+GLIBC_2.29 scalbf F
+GLIBC_2.29 scalbl F
+GLIBC_2.29 scalbln F
+GLIBC_2.29 scalblnf F
+GLIBC_2.29 scalblnf32 F
+GLIBC_2.29 scalblnf32x F
+GLIBC_2.29 scalblnf64 F
+GLIBC_2.29 scalblnl F
+GLIBC_2.29 scalbn F
+GLIBC_2.29 scalbnf F
+GLIBC_2.29 scalbnf32 F
+GLIBC_2.29 scalbnf32x F
+GLIBC_2.29 scalbnf64 F
+GLIBC_2.29 scalbnl F
+GLIBC_2.29 setpayload F
+GLIBC_2.29 setpayloadf F
+GLIBC_2.29 setpayloadf32 F
+GLIBC_2.29 setpayloadf32x F
+GLIBC_2.29 setpayloadf64 F
+GLIBC_2.29 setpayloadl F
+GLIBC_2.29 setpayloadsig F
+GLIBC_2.29 setpayloadsigf F
+GLIBC_2.29 setpayloadsigf32 F
+GLIBC_2.29 setpayloadsigf32x F
+GLIBC_2.29 setpayloadsigf64 F
+GLIBC_2.29 setpayloadsigl F
+GLIBC_2.29 signgam D 0x4
+GLIBC_2.29 significand F
+GLIBC_2.29 significandf F
+GLIBC_2.29 significandl F
+GLIBC_2.29 sin F
+GLIBC_2.29 sincos F
+GLIBC_2.29 sincosf F
+GLIBC_2.29 sincosf32 F
+GLIBC_2.29 sincosf32x F
+GLIBC_2.29 sincosf64 F
+GLIBC_2.29 sincosl F
+GLIBC_2.29 sinf F
+GLIBC_2.29 sinf32 F
+GLIBC_2.29 sinf32x F
+GLIBC_2.29 sinf64 F
+GLIBC_2.29 sinh F
+GLIBC_2.29 sinhf F
+GLIBC_2.29 sinhf32 F
+GLIBC_2.29 sinhf32x F
+GLIBC_2.29 sinhf64 F
+GLIBC_2.29 sinhl F
+GLIBC_2.29 sinl F
+GLIBC_2.29 sqrt F
+GLIBC_2.29 sqrtf F
+GLIBC_2.29 sqrtf32 F
+GLIBC_2.29 sqrtf32x F
+GLIBC_2.29 sqrtf64 F
+GLIBC_2.29 sqrtl F
+GLIBC_2.29 tan F
+GLIBC_2.29 tanf F
+GLIBC_2.29 tanf32 F
+GLIBC_2.29 tanf32x F
+GLIBC_2.29 tanf64 F
+GLIBC_2.29 tanh F
+GLIBC_2.29 tanhf F
+GLIBC_2.29 tanhf32 F
+GLIBC_2.29 tanhf32x F
+GLIBC_2.29 tanhf64 F
+GLIBC_2.29 tanhl F
+GLIBC_2.29 tanl F
+GLIBC_2.29 tgamma F
+GLIBC_2.29 tgammaf F
+GLIBC_2.29 tgammaf32 F
+GLIBC_2.29 tgammaf32x F
+GLIBC_2.29 tgammaf64 F
+GLIBC_2.29 tgammal F
+GLIBC_2.29 totalorder F
+GLIBC_2.29 totalorderf F
+GLIBC_2.29 totalorderf32 F
+GLIBC_2.29 totalorderf32x F
+GLIBC_2.29 totalorderf64 F
+GLIBC_2.29 totalorderl F
+GLIBC_2.29 totalordermag F
+GLIBC_2.29 totalordermagf F
+GLIBC_2.29 totalordermagf32 F
+GLIBC_2.29 totalordermagf32x F
+GLIBC_2.29 totalordermagf64 F
+GLIBC_2.29 totalordermagl F
+GLIBC_2.29 trunc F
+GLIBC_2.29 truncf F
+GLIBC_2.29 truncf32 F
+GLIBC_2.29 truncf32x F
+GLIBC_2.29 truncf64 F
+GLIBC_2.29 truncl F
+GLIBC_2.29 ufromfp F
+GLIBC_2.29 ufromfpf F
+GLIBC_2.29 ufromfpf32 F
+GLIBC_2.29 ufromfpf32x F
+GLIBC_2.29 ufromfpf64 F
+GLIBC_2.29 ufromfpl F
+GLIBC_2.29 ufromfpx F
+GLIBC_2.29 ufromfpxf F
+GLIBC_2.29 ufromfpxf32 F
+GLIBC_2.29 ufromfpxf32x F
+GLIBC_2.29 ufromfpxf64 F
+GLIBC_2.29 ufromfpxl F
+GLIBC_2.29 y0 F
+GLIBC_2.29 y0f F
+GLIBC_2.29 y0f32 F
+GLIBC_2.29 y0f32x F
+GLIBC_2.29 y0f64 F
+GLIBC_2.29 y0l F
+GLIBC_2.29 y1 F
+GLIBC_2.29 y1f F
+GLIBC_2.29 y1f32 F
+GLIBC_2.29 y1f32x F
+GLIBC_2.29 y1f64 F
+GLIBC_2.29 y1l F
+GLIBC_2.29 yn F
+GLIBC_2.29 ynf F
+GLIBC_2.29 ynf32 F
+GLIBC_2.29 ynf32x F
+GLIBC_2.29 ynf64 F
+GLIBC_2.29 ynl F
diff --git a/sysdeps/unix/sysv/linux/arc/libnsl.abilist b/sysdeps/unix/sysv/linux/arc/libnsl.abilist
new file mode 100644
index 000000000000..c8ef9e3891e3
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libnsl.abilist
@@ -0,0 +1,120 @@
+GLIBC_2.29 __free_fdresult F
+GLIBC_2.29 __nis_default_access F
+GLIBC_2.29 __nis_default_group F
+GLIBC_2.29 __nis_default_owner F
+GLIBC_2.29 __nis_default_ttl F
+GLIBC_2.29 __nis_finddirectory F
+GLIBC_2.29 __nisbind_connect F
+GLIBC_2.29 __nisbind_create F
+GLIBC_2.29 __nisbind_destroy F
+GLIBC_2.29 __nisbind_next F
+GLIBC_2.29 __yp_check F
+GLIBC_2.29 nis_add F
+GLIBC_2.29 nis_add_entry F
+GLIBC_2.29 nis_addmember F
+GLIBC_2.29 nis_checkpoint F
+GLIBC_2.29 nis_clone_directory F
+GLIBC_2.29 nis_clone_object F
+GLIBC_2.29 nis_clone_result F
+GLIBC_2.29 nis_creategroup F
+GLIBC_2.29 nis_destroy_object F
+GLIBC_2.29 nis_destroygroup F
+GLIBC_2.29 nis_dir_cmp F
+GLIBC_2.29 nis_domain_of F
+GLIBC_2.29 nis_domain_of_r F
+GLIBC_2.29 nis_first_entry F
+GLIBC_2.29 nis_free_directory F
+GLIBC_2.29 nis_free_object F
+GLIBC_2.29 nis_free_request F
+GLIBC_2.29 nis_freenames F
+GLIBC_2.29 nis_freeresult F
+GLIBC_2.29 nis_freeservlist F
+GLIBC_2.29 nis_freetags F
+GLIBC_2.29 nis_getnames F
+GLIBC_2.29 nis_getservlist F
+GLIBC_2.29 nis_ismember F
+GLIBC_2.29 nis_leaf_of F
+GLIBC_2.29 nis_leaf_of_r F
+GLIBC_2.29 nis_lerror F
+GLIBC_2.29 nis_list F
+GLIBC_2.29 nis_local_directory F
+GLIBC_2.29 nis_local_group F
+GLIBC_2.29 nis_local_host F
+GLIBC_2.29 nis_local_principal F
+GLIBC_2.29 nis_lookup F
+GLIBC_2.29 nis_mkdir F
+GLIBC_2.29 nis_modify F
+GLIBC_2.29 nis_modify_entry F
+GLIBC_2.29 nis_name_of F
+GLIBC_2.29 nis_name_of_r F
+GLIBC_2.29 nis_next_entry F
+GLIBC_2.29 nis_perror F
+GLIBC_2.29 nis_ping F
+GLIBC_2.29 nis_print_directory F
+GLIBC_2.29 nis_print_entry F
+GLIBC_2.29 nis_print_group F
+GLIBC_2.29 nis_print_group_entry F
+GLIBC_2.29 nis_print_link F
+GLIBC_2.29 nis_print_object F
+GLIBC_2.29 nis_print_result F
+GLIBC_2.29 nis_print_rights F
+GLIBC_2.29 nis_print_table F
+GLIBC_2.29 nis_read_obj F
+GLIBC_2.29 nis_remove F
+GLIBC_2.29 nis_remove_entry F
+GLIBC_2.29 nis_removemember F
+GLIBC_2.29 nis_rmdir F
+GLIBC_2.29 nis_servstate F
+GLIBC_2.29 nis_sperrno F
+GLIBC_2.29 nis_sperror F
+GLIBC_2.29 nis_sperror_r F
+GLIBC_2.29 nis_stats F
+GLIBC_2.29 nis_verifygroup F
+GLIBC_2.29 nis_write_obj F
+GLIBC_2.29 readColdStartFile F
+GLIBC_2.29 writeColdStartFile F
+GLIBC_2.29 xdr_cback_data F
+GLIBC_2.29 xdr_domainname F
+GLIBC_2.29 xdr_keydat F
+GLIBC_2.29 xdr_mapname F
+GLIBC_2.29 xdr_obj_p F
+GLIBC_2.29 xdr_peername F
+GLIBC_2.29 xdr_valdat F
+GLIBC_2.29 xdr_yp_buf F
+GLIBC_2.29 xdr_ypall F
+GLIBC_2.29 xdr_ypbind_binding F
+GLIBC_2.29 xdr_ypbind_resp F
+GLIBC_2.29 xdr_ypbind_resptype F
+GLIBC_2.29 xdr_ypbind_setdom F
+GLIBC_2.29 xdr_ypdelete_args F
+GLIBC_2.29 xdr_ypmap_parms F
+GLIBC_2.29 xdr_ypmaplist F
+GLIBC_2.29 xdr_yppush_status F
+GLIBC_2.29 xdr_yppushresp_xfr F
+GLIBC_2.29 xdr_ypreq_key F
+GLIBC_2.29 xdr_ypreq_nokey F
+GLIBC_2.29 xdr_ypreq_xfr F
+GLIBC_2.29 xdr_ypresp_all F
+GLIBC_2.29 xdr_ypresp_key_val F
+GLIBC_2.29 xdr_ypresp_maplist F
+GLIBC_2.29 xdr_ypresp_master F
+GLIBC_2.29 xdr_ypresp_order F
+GLIBC_2.29 xdr_ypresp_val F
+GLIBC_2.29 xdr_ypresp_xfr F
+GLIBC_2.29 xdr_ypstat F
+GLIBC_2.29 xdr_ypupdate_args F
+GLIBC_2.29 xdr_ypxfrstat F
+GLIBC_2.29 yp_all F
+GLIBC_2.29 yp_bind F
+GLIBC_2.29 yp_first F
+GLIBC_2.29 yp_get_default_domain F
+GLIBC_2.29 yp_maplist F
+GLIBC_2.29 yp_master F
+GLIBC_2.29 yp_match F
+GLIBC_2.29 yp_next F
+GLIBC_2.29 yp_order F
+GLIBC_2.29 yp_unbind F
+GLIBC_2.29 yp_update F
+GLIBC_2.29 ypbinderr_string F
+GLIBC_2.29 yperr_string F
+GLIBC_2.29 ypprot_err F
diff --git a/sysdeps/unix/sysv/linux/arc/libpthread.abilist b/sysdeps/unix/sysv/linux/arc/libpthread.abilist
new file mode 100644
index 000000000000..ea4b79a518ee
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libpthread.abilist
@@ -0,0 +1,235 @@
+GLIBC_2.29 _IO_flockfile F
+GLIBC_2.29 _IO_ftrylockfile F
+GLIBC_2.29 _IO_funlockfile F
+GLIBC_2.29 __close F
+GLIBC_2.29 __connect F
+GLIBC_2.29 __errno_location F
+GLIBC_2.29 __h_errno_location F
+GLIBC_2.29 __libc_allocate_rtsig F
+GLIBC_2.29 __libc_current_sigrtmax F
+GLIBC_2.29 __libc_current_sigrtmin F
+GLIBC_2.29 __lseek F
+GLIBC_2.29 __nanosleep F
+GLIBC_2.29 __open F
+GLIBC_2.29 __open64 F
+GLIBC_2.29 __pread64 F
+GLIBC_2.29 __pthread_cleanup_routine F
+GLIBC_2.29 __pthread_getspecific F
+GLIBC_2.29 __pthread_key_create F
+GLIBC_2.29 __pthread_mutex_destroy F
+GLIBC_2.29 __pthread_mutex_init F
+GLIBC_2.29 __pthread_mutex_lock F
+GLIBC_2.29 __pthread_mutex_trylock F
+GLIBC_2.29 __pthread_mutex_unlock F
+GLIBC_2.29 __pthread_mutexattr_destroy F
+GLIBC_2.29 __pthread_mutexattr_init F
+GLIBC_2.29 __pthread_mutexattr_settype F
+GLIBC_2.29 __pthread_once F
+GLIBC_2.29 __pthread_register_cancel F
+GLIBC_2.29 __pthread_register_cancel_defer F
+GLIBC_2.29 __pthread_rwlock_destroy F
+GLIBC_2.29 __pthread_rwlock_init F
+GLIBC_2.29 __pthread_rwlock_rdlock F
+GLIBC_2.29 __pthread_rwlock_tryrdlock F
+GLIBC_2.29 __pthread_rwlock_trywrlock F
+GLIBC_2.29 __pthread_rwlock_unlock F
+GLIBC_2.29 __pthread_rwlock_wrlock F
+GLIBC_2.29 __pthread_setspecific F
+GLIBC_2.29 __pthread_unregister_cancel F
+GLIBC_2.29 __pthread_unregister_cancel_restore F
+GLIBC_2.29 __pthread_unwind_next F
+GLIBC_2.29 __pwrite64 F
+GLIBC_2.29 __read F
+GLIBC_2.29 __res_state F
+GLIBC_2.29 __send F
+GLIBC_2.29 __sigaction F
+GLIBC_2.29 __wait F
+GLIBC_2.29 __write F
+GLIBC_2.29 _pthread_cleanup_pop F
+GLIBC_2.29 _pthread_cleanup_pop_restore F
+GLIBC_2.29 _pthread_cleanup_push F
+GLIBC_2.29 _pthread_cleanup_push_defer F
+GLIBC_2.29 accept F
+GLIBC_2.29 call_once F
+GLIBC_2.29 close F
+GLIBC_2.29 cnd_broadcast F
+GLIBC_2.29 cnd_destroy F
+GLIBC_2.29 cnd_init F
+GLIBC_2.29 cnd_signal F
+GLIBC_2.29 cnd_timedwait F
+GLIBC_2.29 cnd_wait F
+GLIBC_2.29 connect F
+GLIBC_2.29 flockfile F
+GLIBC_2.29 fsync F
+GLIBC_2.29 ftrylockfile F
+GLIBC_2.29 funlockfile F
+GLIBC_2.29 lseek F
+GLIBC_2.29 lseek64 F
+GLIBC_2.29 msync F
+GLIBC_2.29 mtx_destroy F
+GLIBC_2.29 mtx_init F
+GLIBC_2.29 mtx_lock F
+GLIBC_2.29 mtx_timedlock F
+GLIBC_2.29 mtx_trylock F
+GLIBC_2.29 mtx_unlock F
+GLIBC_2.29 nanosleep F
+GLIBC_2.29 open F
+GLIBC_2.29 open64 F
+GLIBC_2.29 pause F
+GLIBC_2.29 pread F
+GLIBC_2.29 pread64 F
+GLIBC_2.29 pthread_attr_destroy F
+GLIBC_2.29 pthread_attr_getaffinity_np F
+GLIBC_2.29 pthread_attr_getdetachstate F
+GLIBC_2.29 pthread_attr_getguardsize F
+GLIBC_2.29 pthread_attr_getinheritsched F
+GLIBC_2.29 pthread_attr_getschedparam F
+GLIBC_2.29 pthread_attr_getschedpolicy F
+GLIBC_2.29 pthread_attr_getscope F
+GLIBC_2.29 pthread_attr_getstack F
+GLIBC_2.29 pthread_attr_getstackaddr F
+GLIBC_2.29 pthread_attr_getstacksize F
+GLIBC_2.29 pthread_attr_init F
+GLIBC_2.29 pthread_attr_setaffinity_np F
+GLIBC_2.29 pthread_attr_setdetachstate F
+GLIBC_2.29 pthread_attr_setguardsize F
+GLIBC_2.29 pthread_attr_setinheritsched F
+GLIBC_2.29 pthread_attr_setschedparam F
+GLIBC_2.29 pthread_attr_setschedpolicy F
+GLIBC_2.29 pthread_attr_setscope F
+GLIBC_2.29 pthread_attr_setstack F
+GLIBC_2.29 pthread_attr_setstackaddr F
+GLIBC_2.29 pthread_attr_setstacksize F
+GLIBC_2.29 pthread_barrier_destroy F
+GLIBC_2.29 pthread_barrier_init F
+GLIBC_2.29 pthread_barrier_wait F
+GLIBC_2.29 pthread_barrierattr_destroy F
+GLIBC_2.29 pthread_barrierattr_getpshared F
+GLIBC_2.29 pthread_barrierattr_init F
+GLIBC_2.29 pthread_barrierattr_setpshared F
+GLIBC_2.29 pthread_cancel F
+GLIBC_2.29 pthread_cond_broadcast F
+GLIBC_2.29 pthread_cond_destroy F
+GLIBC_2.29 pthread_cond_init F
+GLIBC_2.29 pthread_cond_signal F
+GLIBC_2.29 pthread_cond_timedwait F
+GLIBC_2.29 pthread_cond_wait F
+GLIBC_2.29 pthread_condattr_destroy F
+GLIBC_2.29 pthread_condattr_getclock F
+GLIBC_2.29 pthread_condattr_getpshared F
+GLIBC_2.29 pthread_condattr_init F
+GLIBC_2.29 pthread_condattr_setclock F
+GLIBC_2.29 pthread_condattr_setpshared F
+GLIBC_2.29 pthread_create F
+GLIBC_2.29 pthread_detach F
+GLIBC_2.29 pthread_equal F
+GLIBC_2.29 pthread_exit F
+GLIBC_2.29 pthread_getaffinity_np F
+GLIBC_2.29 pthread_getattr_default_np F
+GLIBC_2.29 pthread_getattr_np F
+GLIBC_2.29 pthread_getconcurrency F
+GLIBC_2.29 pthread_getcpuclockid F
+GLIBC_2.29 pthread_getname_np F
+GLIBC_2.29 pthread_getschedparam F
+GLIBC_2.29 pthread_getspecific F
+GLIBC_2.29 pthread_join F
+GLIBC_2.29 pthread_key_create F
+GLIBC_2.29 pthread_key_delete F
+GLIBC_2.29 pthread_kill F
+GLIBC_2.29 pthread_kill_other_threads_np F
+GLIBC_2.29 pthread_mutex_consistent F
+GLIBC_2.29 pthread_mutex_consistent_np F
+GLIBC_2.29 pthread_mutex_destroy F
+GLIBC_2.29 pthread_mutex_getprioceiling F
+GLIBC_2.29 pthread_mutex_init F
+GLIBC_2.29 pthread_mutex_lock F
+GLIBC_2.29 pthread_mutex_setprioceiling F
+GLIBC_2.29 pthread_mutex_timedlock F
+GLIBC_2.29 pthread_mutex_trylock F
+GLIBC_2.29 pthread_mutex_unlock F
+GLIBC_2.29 pthread_mutexattr_destroy F
+GLIBC_2.29 pthread_mutexattr_getkind_np F
+GLIBC_2.29 pthread_mutexattr_getprioceiling F
+GLIBC_2.29 pthread_mutexattr_getprotocol F
+GLIBC_2.29 pthread_mutexattr_getpshared F
+GLIBC_2.29 pthread_mutexattr_getrobust F
+GLIBC_2.29 pthread_mutexattr_getrobust_np F
+GLIBC_2.29 pthread_mutexattr_gettype F
+GLIBC_2.29 pthread_mutexattr_init F
+GLIBC_2.29 pthread_mutexattr_setkind_np F
+GLIBC_2.29 pthread_mutexattr_setprioceiling F
+GLIBC_2.29 pthread_mutexattr_setprotocol F
+GLIBC_2.29 pthread_mutexattr_setpshared F
+GLIBC_2.29 pthread_mutexattr_setrobust F
+GLIBC_2.29 pthread_mutexattr_setrobust_np F
+GLIBC_2.29 pthread_mutexattr_settype F
+GLIBC_2.29 pthread_once F
+GLIBC_2.29 pthread_rwlock_destroy F
+GLIBC_2.29 pthread_rwlock_init F
+GLIBC_2.29 pthread_rwlock_rdlock F
+GLIBC_2.29 pthread_rwlock_timedrdlock F
+GLIBC_2.29 pthread_rwlock_timedwrlock F
+GLIBC_2.29 pthread_rwlock_tryrdlock F
+GLIBC_2.29 pthread_rwlock_trywrlock F
+GLIBC_2.29 pthread_rwlock_unlock F
+GLIBC_2.29 pthread_rwlock_wrlock F
+GLIBC_2.29 pthread_rwlockattr_destroy F
+GLIBC_2.29 pthread_rwlockattr_getkind_np F
+GLIBC_2.29 pthread_rwlockattr_getpshared F
+GLIBC_2.29 pthread_rwlockattr_init F
+GLIBC_2.29 pthread_rwlockattr_setkind_np F
+GLIBC_2.29 pthread_rwlockattr_setpshared F
+GLIBC_2.29 pthread_setaffinity_np F
+GLIBC_2.29 pthread_setattr_default_np F
+GLIBC_2.29 pthread_setcancelstate F
+GLIBC_2.29 pthread_setcanceltype F
+GLIBC_2.29 pthread_setconcurrency F
+GLIBC_2.29 pthread_setname_np F
+GLIBC_2.29 pthread_setschedparam F
+GLIBC_2.29 pthread_setschedprio F
+GLIBC_2.29 pthread_setspecific F
+GLIBC_2.29 pthread_sigmask F
+GLIBC_2.29 pthread_sigqueue F
+GLIBC_2.29 pthread_spin_destroy F
+GLIBC_2.29 pthread_spin_init F
+GLIBC_2.29 pthread_spin_lock F
+GLIBC_2.29 pthread_spin_trylock F
+GLIBC_2.29 pthread_spin_unlock F
+GLIBC_2.29 pthread_testcancel F
+GLIBC_2.29 pthread_timedjoin_np F
+GLIBC_2.29 pthread_tryjoin_np F
+GLIBC_2.29 pthread_yield F
+GLIBC_2.29 pwrite F
+GLIBC_2.29 pwrite64 F
+GLIBC_2.29 raise F
+GLIBC_2.29 read F
+GLIBC_2.29 recv F
+GLIBC_2.29 recvfrom F
+GLIBC_2.29 recvmsg F
+GLIBC_2.29 sem_close F
+GLIBC_2.29 sem_destroy F
+GLIBC_2.29 sem_getvalue F
+GLIBC_2.29 sem_init F
+GLIBC_2.29 sem_open F
+GLIBC_2.29 sem_post F
+GLIBC_2.29 sem_timedwait F
+GLIBC_2.29 sem_trywait F
+GLIBC_2.29 sem_unlink F
+GLIBC_2.29 sem_wait F
+GLIBC_2.29 send F
+GLIBC_2.29 sendmsg F
+GLIBC_2.29 sendto F
+GLIBC_2.29 sigaction F
+GLIBC_2.29 sigwait F
+GLIBC_2.29 tcdrain F
+GLIBC_2.29 thrd_create F
+GLIBC_2.29 thrd_detach F
+GLIBC_2.29 thrd_exit F
+GLIBC_2.29 thrd_join F
+GLIBC_2.29 tss_create F
+GLIBC_2.29 tss_delete F
+GLIBC_2.29 tss_get F
+GLIBC_2.29 tss_set F
+GLIBC_2.29 wait F
+GLIBC_2.29 waitpid F
+GLIBC_2.29 write F
diff --git a/sysdeps/unix/sysv/linux/arc/libresolv.abilist b/sysdeps/unix/sysv/linux/arc/libresolv.abilist
new file mode 100644
index 000000000000..2830a7efd17d
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libresolv.abilist
@@ -0,0 +1,79 @@
+GLIBC_2.29 __b64_ntop F
+GLIBC_2.29 __b64_pton F
+GLIBC_2.29 __dn_comp F
+GLIBC_2.29 __dn_count_labels F
+GLIBC_2.29 __dn_expand F
+GLIBC_2.29 __dn_skipname F
+GLIBC_2.29 __fp_nquery F
+GLIBC_2.29 __fp_query F
+GLIBC_2.29 __fp_resstat F
+GLIBC_2.29 __hostalias F
+GLIBC_2.29 __loc_aton F
+GLIBC_2.29 __loc_ntoa F
+GLIBC_2.29 __p_cdname F
+GLIBC_2.29 __p_cdnname F
+GLIBC_2.29 __p_class F
+GLIBC_2.29 __p_class_syms D 0x54
+GLIBC_2.29 __p_fqname F
+GLIBC_2.29 __p_fqnname F
+GLIBC_2.29 __p_option F
+GLIBC_2.29 __p_query F
+GLIBC_2.29 __p_rcode F
+GLIBC_2.29 __p_time F
+GLIBC_2.29 __p_type F
+GLIBC_2.29 __p_type_syms D 0x228
+GLIBC_2.29 __putlong F
+GLIBC_2.29 __putshort F
+GLIBC_2.29 __res_close F
+GLIBC_2.29 __res_dnok F
+GLIBC_2.29 __res_hnok F
+GLIBC_2.29 __res_hostalias F
+GLIBC_2.29 __res_isourserver F
+GLIBC_2.29 __res_mailok F
+GLIBC_2.29 __res_mkquery F
+GLIBC_2.29 __res_nameinquery F
+GLIBC_2.29 __res_nmkquery F
+GLIBC_2.29 __res_nquery F
+GLIBC_2.29 __res_nquerydomain F
+GLIBC_2.29 __res_nsearch F
+GLIBC_2.29 __res_nsend F
+GLIBC_2.29 __res_ownok F
+GLIBC_2.29 __res_queriesmatch F
+GLIBC_2.29 __res_query F
+GLIBC_2.29 __res_querydomain F
+GLIBC_2.29 __res_search F
+GLIBC_2.29 __res_send F
+GLIBC_2.29 __sym_ntop F
+GLIBC_2.29 __sym_ntos F
+GLIBC_2.29 __sym_ston F
+GLIBC_2.29 _getlong F
+GLIBC_2.29 _getshort F
+GLIBC_2.29 inet_net_ntop F
+GLIBC_2.29 inet_net_pton F
+GLIBC_2.29 inet_neta F
+GLIBC_2.29 ns_datetosecs F
+GLIBC_2.29 ns_format_ttl F
+GLIBC_2.29 ns_get16 F
+GLIBC_2.29 ns_get32 F
+GLIBC_2.29 ns_initparse F
+GLIBC_2.29 ns_makecanon F
+GLIBC_2.29 ns_msg_getflag F
+GLIBC_2.29 ns_name_compress F
+GLIBC_2.29 ns_name_ntol F
+GLIBC_2.29 ns_name_ntop F
+GLIBC_2.29 ns_name_pack F
+GLIBC_2.29 ns_name_pton F
+GLIBC_2.29 ns_name_rollback F
+GLIBC_2.29 ns_name_skip F
+GLIBC_2.29 ns_name_uncompress F
+GLIBC_2.29 ns_name_unpack F
+GLIBC_2.29 ns_parse_ttl F
+GLIBC_2.29 ns_parserr F
+GLIBC_2.29 ns_put16 F
+GLIBC_2.29 ns_put32 F
+GLIBC_2.29 ns_samedomain F
+GLIBC_2.29 ns_samename F
+GLIBC_2.29 ns_skiprr F
+GLIBC_2.29 ns_sprintrr F
+GLIBC_2.29 ns_sprintrrf F
+GLIBC_2.29 ns_subdomain F
diff --git a/sysdeps/unix/sysv/linux/arc/librt.abilist b/sysdeps/unix/sysv/linux/arc/librt.abilist
new file mode 100644
index 000000000000..c6690ef7c135
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/librt.abilist
@@ -0,0 +1,35 @@
+GLIBC_2.29 __mq_open_2 F
+GLIBC_2.29 aio_cancel F
+GLIBC_2.29 aio_cancel64 F
+GLIBC_2.29 aio_error F
+GLIBC_2.29 aio_error64 F
+GLIBC_2.29 aio_fsync F
+GLIBC_2.29 aio_fsync64 F
+GLIBC_2.29 aio_init F
+GLIBC_2.29 aio_read F
+GLIBC_2.29 aio_read64 F
+GLIBC_2.29 aio_return F
+GLIBC_2.29 aio_return64 F
+GLIBC_2.29 aio_suspend F
+GLIBC_2.29 aio_suspend64 F
+GLIBC_2.29 aio_write F
+GLIBC_2.29 aio_write64 F
+GLIBC_2.29 lio_listio F
+GLIBC_2.29 lio_listio64 F
+GLIBC_2.29 mq_close F
+GLIBC_2.29 mq_getattr F
+GLIBC_2.29 mq_notify F
+GLIBC_2.29 mq_open F
+GLIBC_2.29 mq_receive F
+GLIBC_2.29 mq_send F
+GLIBC_2.29 mq_setattr F
+GLIBC_2.29 mq_timedreceive F
+GLIBC_2.29 mq_timedsend F
+GLIBC_2.29 mq_unlink F
+GLIBC_2.29 shm_open F
+GLIBC_2.29 shm_unlink F
+GLIBC_2.29 timer_create F
+GLIBC_2.29 timer_delete F
+GLIBC_2.29 timer_getoverrun F
+GLIBC_2.29 timer_gettime F
+GLIBC_2.29 timer_settime F
diff --git a/sysdeps/unix/sysv/linux/arc/libthread_db.abilist b/sysdeps/unix/sysv/linux/arc/libthread_db.abilist
new file mode 100644
index 000000000000..37e9bace5521
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libthread_db.abilist
@@ -0,0 +1,40 @@
+GLIBC_2.29 td_init F
+GLIBC_2.29 td_log F
+GLIBC_2.29 td_symbol_list F
+GLIBC_2.29 td_ta_clear_event F
+GLIBC_2.29 td_ta_delete F
+GLIBC_2.29 td_ta_enable_stats F
+GLIBC_2.29 td_ta_event_addr F
+GLIBC_2.29 td_ta_event_getmsg F
+GLIBC_2.29 td_ta_get_nthreads F
+GLIBC_2.29 td_ta_get_ph F
+GLIBC_2.29 td_ta_get_stats F
+GLIBC_2.29 td_ta_map_id2thr F
+GLIBC_2.29 td_ta_map_lwp2thr F
+GLIBC_2.29 td_ta_new F
+GLIBC_2.29 td_ta_reset_stats F
+GLIBC_2.29 td_ta_set_event F
+GLIBC_2.29 td_ta_setconcurrency F
+GLIBC_2.29 td_ta_thr_iter F
+GLIBC_2.29 td_ta_tsd_iter F
+GLIBC_2.29 td_thr_clear_event F
+GLIBC_2.29 td_thr_dbresume F
+GLIBC_2.29 td_thr_dbsuspend F
+GLIBC_2.29 td_thr_event_enable F
+GLIBC_2.29 td_thr_event_getmsg F
+GLIBC_2.29 td_thr_get_info F
+GLIBC_2.29 td_thr_getfpregs F
+GLIBC_2.29 td_thr_getgregs F
+GLIBC_2.29 td_thr_getxregs F
+GLIBC_2.29 td_thr_getxregsize F
+GLIBC_2.29 td_thr_set_event F
+GLIBC_2.29 td_thr_setfpregs F
+GLIBC_2.29 td_thr_setgregs F
+GLIBC_2.29 td_thr_setprio F
+GLIBC_2.29 td_thr_setsigpending F
+GLIBC_2.29 td_thr_setxregs F
+GLIBC_2.29 td_thr_sigsetmask F
+GLIBC_2.29 td_thr_tls_get_addr F
+GLIBC_2.29 td_thr_tlsbase F
+GLIBC_2.29 td_thr_tsd F
+GLIBC_2.29 td_thr_validate F
diff --git a/sysdeps/unix/sysv/linux/arc/libutil.abilist b/sysdeps/unix/sysv/linux/arc/libutil.abilist
new file mode 100644
index 000000000000..cbd11999a4f1
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libutil.abilist
@@ -0,0 +1,6 @@
+GLIBC_2.29 forkpty F
+GLIBC_2.29 login F
+GLIBC_2.29 login_tty F
+GLIBC_2.29 logout F
+GLIBC_2.29 logwtmp F
+GLIBC_2.29 openpty F
diff --git a/sysdeps/unix/sysv/linux/arc/localplt.data b/sysdeps/unix/sysv/linux/arc/localplt.data
new file mode 100644
index 000000000000..3a9bfb648ac9
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/localplt.data
@@ -0,0 +1,15 @@
+libc.so: realloc
+libc.so: malloc
+libc.so: memalign
+libc.so: calloc
+libc.so: free
+# libc.so: memcpy
+ld.so: malloc
+ld.so: calloc
+ld.so: realloc
+ld.so: free
+# The TLS-enabled version of these functions is interposed from libc.so.
+ld.so: _dl_signal_error
+ld.so: _dl_catch_error
+ld.so: _dl_signal_exception
+ld.so: _dl_catch_exception
-- 
2.7.4
