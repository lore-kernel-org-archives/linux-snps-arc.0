Return-Path: <SRS0=tGlP=46=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2C0C5ACBF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E99206E2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DMo0PU2O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iHd6hAj8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E99206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eIBHXKiyds3VtgZayfiIZQqjdDUkA/z2Yxt37tZ8pc=; b=DMo0PU2Ovhq1dk
	yO/X15Gn5sLHadkGvlISbLQU625w4k/TLR6U/tFlcy+pu78pwJmVz6wrasmxMsKgKydtH7cIn0hcw
	cwGFWm6VnGRX+NCxcV8oELI+ZgsYOTfvRXjFXO9CKUQKvij+avmlC6G1jFlN91kIjBP40GqHxLRvH
	0uTvB0ezDXoPciTccpORxDJZzlkmECJ9KMR/QsKLb7btKnhqbgUHN8xdoIjHQvOMnJDhy3W5InQWw
	CiunRpOtfYmUS219Cyw4iVsvf7ZOMDCZGzgM5R1kDwW86QnHNxQ5CHlXqKzWXygLQbswMz6xTzW1n
	BiNGkUt2HyXvguzqjRKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCacz-0003et-5q; Fri, 13 Mar 2020 03:04:49 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCaci-0003Sj-A0
 for linux-snps-arc@lists.infradead.org; Fri, 13 Mar 2020 03:04:47 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 17CE84024E;
 Fri, 13 Mar 2020 03:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584068672; bh=gXteiENFgpFyjvpz0qkkU9sR0XEOCImqQ/MUG3QfAx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iHd6hAj8NZAwKL/9VPntcURBoRPZK5hroEFuJHhIulKuNWL9MbbENcGAJq8AdGTMb
 u2yNZmdGm5ScqkIQwCUJjmdaCSGz8qCrLRMPPKJgqlNl+fItrfZqoZT5vq4nTDsfC1
 kMpFuBW9NbZO8wrUZqjrE7raRoWL0omLoXdqWgwn/+69AKEEgDywxWvJCjEQzJwV6j
 QZig2/lVUMBD/u3ZZOQVa1Tj123/VlNNvNB6fVuSQot/k289PSXOYibQPAxvIqTLmU
 GZ1OYSf8KS2FfpAQo4FdXow05a+D8OeMlDK38UK9QH9FFJ8rrYZChdiSmg+E2Mn7mu
 cfTBLfMuQ8PMw==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id C2D76A007D;
 Fri, 13 Mar 2020 03:04:31 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v4 11/15] ARC: ABI lists
Date: Thu, 12 Mar 2020 20:04:15 -0700
Message-Id: <20200313030419.15843-12-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313030419.15843-1-vgupta@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_200432_458515_CAB6EC31 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/arc/nofpu/libm-test-ulps              |  390 +++
 sysdeps/arc/nofpu/libm-test-ulps-name         |    1 +
 sysdeps/unix/sysv/linux/arc/c++-types.data    |   67 +
 sysdeps/unix/sysv/linux/arc/ld.abilist        |    5 +
 .../sysv/linux/arc/libBrokenLocale.abilist    |    1 +
 sysdeps/unix/sysv/linux/arc/libanl.abilist    |    4 +
 sysdeps/unix/sysv/linux/arc/libc.abilist      | 2082 +++++++++++++++++
 sysdeps/unix/sysv/linux/arc/libcrypt.abilist  |    2 +
 sysdeps/unix/sysv/linux/arc/libdl.abilist     |    9 +
 sysdeps/unix/sysv/linux/arc/libm.abilist      |  699 ++++++
 .../unix/sysv/linux/arc/libpthread.abilist    |  217 ++
 sysdeps/unix/sysv/linux/arc/libresolv.abilist |   79 +
 sysdeps/unix/sysv/linux/arc/librt.abilist     |   35 +
 .../unix/sysv/linux/arc/libthread_db.abilist  |   40 +
 sysdeps/unix/sysv/linux/arc/libutil.abilist   |    6 +
 sysdeps/unix/sysv/linux/arc/localplt.data     |   12 +
 16 files changed, 3649 insertions(+)
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
 create mode 100644 sysdeps/unix/sysv/linux/arc/libpthread.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libresolv.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/librt.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libthread_db.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libutil.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/localplt.data

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
index 000000000000..8a9879ebd635
--- /dev/null
+++ b/sysdeps/arc/nofpu/libm-test-ulps-name
@@ -0,0 +1 @@
+ARC soft-float
diff --git a/sysdeps/unix/sysv/linux/arc/c++-types.data b/sysdeps/unix/sysv/linux/arc/c++-types.data
new file mode 100644
index 000000000000..0fb0143ae746
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/c++-types.data
@@ -0,0 +1,67 @@
+blkcnt64_t:x
+blkcnt_t:x
+blksize_t:i
+caddr_t:Pc
+clockid_t:i
+clock_t:l
+daddr_t:i
+dev_t:y
+fd_mask:l
+fsblkcnt64_t:y
+fsblkcnt_t:y
+fsfilcnt64_t:y
+fsfilcnt_t:y
+fsid_t:8__fsid_t
+gid_t:j
+id_t:j
+ino64_t:y
+ino_t:y
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
+off_t:x
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
+rlim_t:y
+sigset_t:10__sigset_t
+size_t:j
+socklen_t:j
+ssize_t:i
+suseconds_t:x
+time_t:x
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
index 000000000000..048f17c8486f
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ld.abilist
@@ -0,0 +1,5 @@
+GLIBC_2.32 __libc_stack_end D 0x4
+GLIBC_2.32 __stack_chk_guard D 0x4
+GLIBC_2.32 __tls_get_addr F
+GLIBC_2.32 _dl_mcount F
+GLIBC_2.32 _r_debug D 0x14
diff --git a/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist b/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
new file mode 100644
index 000000000000..b0869cec1fb8
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
@@ -0,0 +1 @@
+GLIBC_2.32 __ctype_get_mb_cur_max F
diff --git a/sysdeps/unix/sysv/linux/arc/libanl.abilist b/sysdeps/unix/sysv/linux/arc/libanl.abilist
new file mode 100644
index 000000000000..ba513bd0289d
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libanl.abilist
@@ -0,0 +1,4 @@
+GLIBC_2.32 gai_cancel F
+GLIBC_2.32 gai_error F
+GLIBC_2.32 gai_suspend F
+GLIBC_2.32 getaddrinfo_a F
diff --git a/sysdeps/unix/sysv/linux/arc/libc.abilist b/sysdeps/unix/sysv/linux/arc/libc.abilist
new file mode 100644
index 000000000000..fa23e821a55b
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libc.abilist
@@ -0,0 +1,2082 @@
+GLIBC_2.32 _Exit F
+GLIBC_2.32 _IO_2_1_stderr_ D 0x9c
+GLIBC_2.32 _IO_2_1_stdin_ D 0x9c
+GLIBC_2.32 _IO_2_1_stdout_ D 0x9c
+GLIBC_2.32 _IO_adjust_column F
+GLIBC_2.32 _IO_adjust_wcolumn F
+GLIBC_2.32 _IO_default_doallocate F
+GLIBC_2.32 _IO_default_finish F
+GLIBC_2.32 _IO_default_pbackfail F
+GLIBC_2.32 _IO_default_uflow F
+GLIBC_2.32 _IO_default_xsgetn F
+GLIBC_2.32 _IO_default_xsputn F
+GLIBC_2.32 _IO_do_write F
+GLIBC_2.32 _IO_doallocbuf F
+GLIBC_2.32 _IO_fclose F
+GLIBC_2.32 _IO_fdopen F
+GLIBC_2.32 _IO_feof F
+GLIBC_2.32 _IO_ferror F
+GLIBC_2.32 _IO_fflush F
+GLIBC_2.32 _IO_fgetpos F
+GLIBC_2.32 _IO_fgetpos64 F
+GLIBC_2.32 _IO_fgets F
+GLIBC_2.32 _IO_file_attach F
+GLIBC_2.32 _IO_file_close F
+GLIBC_2.32 _IO_file_close_it F
+GLIBC_2.32 _IO_file_doallocate F
+GLIBC_2.32 _IO_file_finish F
+GLIBC_2.32 _IO_file_fopen F
+GLIBC_2.32 _IO_file_init F
+GLIBC_2.32 _IO_file_jumps D 0x54
+GLIBC_2.32 _IO_file_open F
+GLIBC_2.32 _IO_file_overflow F
+GLIBC_2.32 _IO_file_read F
+GLIBC_2.32 _IO_file_seek F
+GLIBC_2.32 _IO_file_seekoff F
+GLIBC_2.32 _IO_file_setbuf F
+GLIBC_2.32 _IO_file_stat F
+GLIBC_2.32 _IO_file_sync F
+GLIBC_2.32 _IO_file_underflow F
+GLIBC_2.32 _IO_file_write F
+GLIBC_2.32 _IO_file_xsputn F
+GLIBC_2.32 _IO_flockfile F
+GLIBC_2.32 _IO_flush_all F
+GLIBC_2.32 _IO_flush_all_linebuffered F
+GLIBC_2.32 _IO_fopen F
+GLIBC_2.32 _IO_fprintf F
+GLIBC_2.32 _IO_fputs F
+GLIBC_2.32 _IO_fread F
+GLIBC_2.32 _IO_free_backup_area F
+GLIBC_2.32 _IO_free_wbackup_area F
+GLIBC_2.32 _IO_fsetpos F
+GLIBC_2.32 _IO_fsetpos64 F
+GLIBC_2.32 _IO_ftell F
+GLIBC_2.32 _IO_ftrylockfile F
+GLIBC_2.32 _IO_funlockfile F
+GLIBC_2.32 _IO_fwrite F
+GLIBC_2.32 _IO_getc F
+GLIBC_2.32 _IO_getline F
+GLIBC_2.32 _IO_getline_info F
+GLIBC_2.32 _IO_gets F
+GLIBC_2.32 _IO_init F
+GLIBC_2.32 _IO_init_marker F
+GLIBC_2.32 _IO_init_wmarker F
+GLIBC_2.32 _IO_iter_begin F
+GLIBC_2.32 _IO_iter_end F
+GLIBC_2.32 _IO_iter_file F
+GLIBC_2.32 _IO_iter_next F
+GLIBC_2.32 _IO_least_wmarker F
+GLIBC_2.32 _IO_link_in F
+GLIBC_2.32 _IO_list_all D 0x4
+GLIBC_2.32 _IO_list_lock F
+GLIBC_2.32 _IO_list_resetlock F
+GLIBC_2.32 _IO_list_unlock F
+GLIBC_2.32 _IO_marker_delta F
+GLIBC_2.32 _IO_marker_difference F
+GLIBC_2.32 _IO_padn F
+GLIBC_2.32 _IO_peekc_locked F
+GLIBC_2.32 _IO_popen F
+GLIBC_2.32 _IO_printf F
+GLIBC_2.32 _IO_proc_close F
+GLIBC_2.32 _IO_proc_open F
+GLIBC_2.32 _IO_putc F
+GLIBC_2.32 _IO_puts F
+GLIBC_2.32 _IO_remove_marker F
+GLIBC_2.32 _IO_seekmark F
+GLIBC_2.32 _IO_seekoff F
+GLIBC_2.32 _IO_seekpos F
+GLIBC_2.32 _IO_seekwmark F
+GLIBC_2.32 _IO_setb F
+GLIBC_2.32 _IO_setbuffer F
+GLIBC_2.32 _IO_setvbuf F
+GLIBC_2.32 _IO_sgetn F
+GLIBC_2.32 _IO_sprintf F
+GLIBC_2.32 _IO_sputbackc F
+GLIBC_2.32 _IO_sputbackwc F
+GLIBC_2.32 _IO_sscanf F
+GLIBC_2.32 _IO_str_init_readonly F
+GLIBC_2.32 _IO_str_init_static F
+GLIBC_2.32 _IO_str_overflow F
+GLIBC_2.32 _IO_str_pbackfail F
+GLIBC_2.32 _IO_str_seekoff F
+GLIBC_2.32 _IO_str_underflow F
+GLIBC_2.32 _IO_sungetc F
+GLIBC_2.32 _IO_sungetwc F
+GLIBC_2.32 _IO_switch_to_get_mode F
+GLIBC_2.32 _IO_switch_to_main_wget_area F
+GLIBC_2.32 _IO_switch_to_wbackup_area F
+GLIBC_2.32 _IO_switch_to_wget_mode F
+GLIBC_2.32 _IO_un_link F
+GLIBC_2.32 _IO_ungetc F
+GLIBC_2.32 _IO_unsave_markers F
+GLIBC_2.32 _IO_unsave_wmarkers F
+GLIBC_2.32 _IO_vfprintf F
+GLIBC_2.32 _IO_vsprintf F
+GLIBC_2.32 _IO_wdefault_doallocate F
+GLIBC_2.32 _IO_wdefault_finish F
+GLIBC_2.32 _IO_wdefault_pbackfail F
+GLIBC_2.32 _IO_wdefault_uflow F
+GLIBC_2.32 _IO_wdefault_xsgetn F
+GLIBC_2.32 _IO_wdefault_xsputn F
+GLIBC_2.32 _IO_wdo_write F
+GLIBC_2.32 _IO_wdoallocbuf F
+GLIBC_2.32 _IO_wfile_jumps D 0x54
+GLIBC_2.32 _IO_wfile_overflow F
+GLIBC_2.32 _IO_wfile_seekoff F
+GLIBC_2.32 _IO_wfile_sync F
+GLIBC_2.32 _IO_wfile_underflow F
+GLIBC_2.32 _IO_wfile_xsputn F
+GLIBC_2.32 _IO_wmarker_delta F
+GLIBC_2.32 _IO_wsetb F
+GLIBC_2.32 ___brk_addr D 0x4
+GLIBC_2.32 __adjtimex F
+GLIBC_2.32 __after_morecore_hook D 0x4
+GLIBC_2.32 __argz_count F
+GLIBC_2.32 __argz_next F
+GLIBC_2.32 __argz_stringify F
+GLIBC_2.32 __asprintf F
+GLIBC_2.32 __asprintf_chk F
+GLIBC_2.32 __assert F
+GLIBC_2.32 __assert_fail F
+GLIBC_2.32 __assert_perror_fail F
+GLIBC_2.32 __backtrace F
+GLIBC_2.32 __backtrace_symbols F
+GLIBC_2.32 __backtrace_symbols_fd F
+GLIBC_2.32 __bsd_getpgrp F
+GLIBC_2.32 __bzero F
+GLIBC_2.32 __check_rhosts_file D 0x4
+GLIBC_2.32 __chk_fail F
+GLIBC_2.32 __clone F
+GLIBC_2.32 __close F
+GLIBC_2.32 __cmsg_nxthdr F
+GLIBC_2.32 __confstr_chk F
+GLIBC_2.32 __connect F
+GLIBC_2.32 __ctype_b_loc F
+GLIBC_2.32 __ctype_get_mb_cur_max F
+GLIBC_2.32 __ctype_tolower_loc F
+GLIBC_2.32 __ctype_toupper_loc F
+GLIBC_2.32 __curbrk D 0x4
+GLIBC_2.32 __cxa_at_quick_exit F
+GLIBC_2.32 __cxa_atexit F
+GLIBC_2.32 __cxa_finalize F
+GLIBC_2.32 __cxa_thread_atexit_impl F
+GLIBC_2.32 __cyg_profile_func_enter F
+GLIBC_2.32 __cyg_profile_func_exit F
+GLIBC_2.32 __daylight D 0x4
+GLIBC_2.32 __dcgettext F
+GLIBC_2.32 __default_morecore F
+GLIBC_2.32 __dgettext F
+GLIBC_2.32 __dprintf_chk F
+GLIBC_2.32 __dup2 F
+GLIBC_2.32 __duplocale F
+GLIBC_2.32 __endmntent F
+GLIBC_2.32 __environ D 0x4
+GLIBC_2.32 __errno_location F
+GLIBC_2.32 __explicit_bzero_chk F
+GLIBC_2.32 __fbufsize F
+GLIBC_2.32 __fcntl F
+GLIBC_2.32 __fdelt_chk F
+GLIBC_2.32 __fdelt_warn F
+GLIBC_2.32 __ffs F
+GLIBC_2.32 __fgets_chk F
+GLIBC_2.32 __fgets_unlocked_chk F
+GLIBC_2.32 __fgetws_chk F
+GLIBC_2.32 __fgetws_unlocked_chk F
+GLIBC_2.32 __finite F
+GLIBC_2.32 __finitef F
+GLIBC_2.32 __flbf F
+GLIBC_2.32 __fork F
+GLIBC_2.32 __fpending F
+GLIBC_2.32 __fprintf_chk F
+GLIBC_2.32 __fpu_control D 0x4
+GLIBC_2.32 __fpurge F
+GLIBC_2.32 __fread_chk F
+GLIBC_2.32 __fread_unlocked_chk F
+GLIBC_2.32 __freadable F
+GLIBC_2.32 __freading F
+GLIBC_2.32 __free_hook D 0x4
+GLIBC_2.32 __freelocale F
+GLIBC_2.32 __fsetlocking F
+GLIBC_2.32 __fwprintf_chk F
+GLIBC_2.32 __fwritable F
+GLIBC_2.32 __fwriting F
+GLIBC_2.32 __fxstat F
+GLIBC_2.32 __fxstat64 F
+GLIBC_2.32 __fxstatat F
+GLIBC_2.32 __fxstatat64 F
+GLIBC_2.32 __getauxval F
+GLIBC_2.32 __getcwd_chk F
+GLIBC_2.32 __getdelim F
+GLIBC_2.32 __getdomainname_chk F
+GLIBC_2.32 __getgroups_chk F
+GLIBC_2.32 __gethostname_chk F
+GLIBC_2.32 __getlogin_r_chk F
+GLIBC_2.32 __getmntent_r F
+GLIBC_2.32 __getpagesize F
+GLIBC_2.32 __getpgid F
+GLIBC_2.32 __getpid F
+GLIBC_2.32 __gets_chk F
+GLIBC_2.32 __gettimeofday F
+GLIBC_2.32 __getwd_chk F
+GLIBC_2.32 __gmtime_r F
+GLIBC_2.32 __h_errno_location F
+GLIBC_2.32 __isalnum_l F
+GLIBC_2.32 __isalpha_l F
+GLIBC_2.32 __isascii_l F
+GLIBC_2.32 __isblank_l F
+GLIBC_2.32 __iscntrl_l F
+GLIBC_2.32 __isctype F
+GLIBC_2.32 __isdigit_l F
+GLIBC_2.32 __isgraph_l F
+GLIBC_2.32 __isinf F
+GLIBC_2.32 __isinff F
+GLIBC_2.32 __islower_l F
+GLIBC_2.32 __isnan F
+GLIBC_2.32 __isnanf F
+GLIBC_2.32 __isoc99_fscanf F
+GLIBC_2.32 __isoc99_fwscanf F
+GLIBC_2.32 __isoc99_scanf F
+GLIBC_2.32 __isoc99_sscanf F
+GLIBC_2.32 __isoc99_swscanf F
+GLIBC_2.32 __isoc99_vfscanf F
+GLIBC_2.32 __isoc99_vfwscanf F
+GLIBC_2.32 __isoc99_vscanf F
+GLIBC_2.32 __isoc99_vsscanf F
+GLIBC_2.32 __isoc99_vswscanf F
+GLIBC_2.32 __isoc99_vwscanf F
+GLIBC_2.32 __isoc99_wscanf F
+GLIBC_2.32 __isprint_l F
+GLIBC_2.32 __ispunct_l F
+GLIBC_2.32 __isspace_l F
+GLIBC_2.32 __isupper_l F
+GLIBC_2.32 __iswalnum_l F
+GLIBC_2.32 __iswalpha_l F
+GLIBC_2.32 __iswblank_l F
+GLIBC_2.32 __iswcntrl_l F
+GLIBC_2.32 __iswctype F
+GLIBC_2.32 __iswctype_l F
+GLIBC_2.32 __iswdigit_l F
+GLIBC_2.32 __iswgraph_l F
+GLIBC_2.32 __iswlower_l F
+GLIBC_2.32 __iswprint_l F
+GLIBC_2.32 __iswpunct_l F
+GLIBC_2.32 __iswspace_l F
+GLIBC_2.32 __iswupper_l F
+GLIBC_2.32 __iswxdigit_l F
+GLIBC_2.32 __isxdigit_l F
+GLIBC_2.32 __ivaliduser F
+GLIBC_2.32 __key_decryptsession_pk_LOCAL D 0x4
+GLIBC_2.32 __key_encryptsession_pk_LOCAL D 0x4
+GLIBC_2.32 __key_gendes_LOCAL D 0x4
+GLIBC_2.32 __libc_allocate_rtsig F
+GLIBC_2.32 __libc_calloc F
+GLIBC_2.32 __libc_current_sigrtmax F
+GLIBC_2.32 __libc_current_sigrtmin F
+GLIBC_2.32 __libc_free F
+GLIBC_2.32 __libc_freeres F
+GLIBC_2.32 __libc_init_first F
+GLIBC_2.32 __libc_mallinfo F
+GLIBC_2.32 __libc_malloc F
+GLIBC_2.32 __libc_mallopt F
+GLIBC_2.32 __libc_memalign F
+GLIBC_2.32 __libc_pvalloc F
+GLIBC_2.32 __libc_realloc F
+GLIBC_2.32 __libc_sa_len F
+GLIBC_2.32 __libc_start_main F
+GLIBC_2.32 __libc_valloc F
+GLIBC_2.32 __longjmp_chk F
+GLIBC_2.32 __lseek F
+GLIBC_2.32 __lxstat F
+GLIBC_2.32 __lxstat64 F
+GLIBC_2.32 __malloc_hook D 0x4
+GLIBC_2.32 __mbrlen F
+GLIBC_2.32 __mbrtowc F
+GLIBC_2.32 __mbsnrtowcs_chk F
+GLIBC_2.32 __mbsrtowcs_chk F
+GLIBC_2.32 __mbstowcs_chk F
+GLIBC_2.32 __memalign_hook D 0x4
+GLIBC_2.32 __memcpy_chk F
+GLIBC_2.32 __memmove_chk F
+GLIBC_2.32 __mempcpy F
+GLIBC_2.32 __mempcpy_chk F
+GLIBC_2.32 __memset_chk F
+GLIBC_2.32 __monstartup F
+GLIBC_2.32 __morecore D 0x4
+GLIBC_2.32 __nanosleep F
+GLIBC_2.32 __newlocale F
+GLIBC_2.32 __nl_langinfo_l F
+GLIBC_2.32 __nss_configure_lookup F
+GLIBC_2.32 __nss_hostname_digits_dots F
+GLIBC_2.32 __obstack_printf_chk F
+GLIBC_2.32 __obstack_vprintf_chk F
+GLIBC_2.32 __open F
+GLIBC_2.32 __open64 F
+GLIBC_2.32 __open64_2 F
+GLIBC_2.32 __open_2 F
+GLIBC_2.32 __openat64_2 F
+GLIBC_2.32 __openat_2 F
+GLIBC_2.32 __overflow F
+GLIBC_2.32 __pipe F
+GLIBC_2.32 __poll F
+GLIBC_2.32 __poll_chk F
+GLIBC_2.32 __posix_getopt F
+GLIBC_2.32 __ppoll_chk F
+GLIBC_2.32 __pread64 F
+GLIBC_2.32 __pread64_chk F
+GLIBC_2.32 __pread_chk F
+GLIBC_2.32 __printf_chk F
+GLIBC_2.32 __printf_fp F
+GLIBC_2.32 __profile_frequency F
+GLIBC_2.32 __progname D 0x4
+GLIBC_2.32 __progname_full D 0x4
+GLIBC_2.32 __ptsname_r_chk F
+GLIBC_2.32 __pwrite64 F
+GLIBC_2.32 __rawmemchr F
+GLIBC_2.32 __rcmd_errstr D 0x4
+GLIBC_2.32 __read F
+GLIBC_2.32 __read_chk F
+GLIBC_2.32 __readlink_chk F
+GLIBC_2.32 __readlinkat_chk F
+GLIBC_2.32 __realloc_hook D 0x4
+GLIBC_2.32 __realpath_chk F
+GLIBC_2.32 __recv_chk F
+GLIBC_2.32 __recvfrom_chk F
+GLIBC_2.32 __register_atfork F
+GLIBC_2.32 __res_init F
+GLIBC_2.32 __res_nclose F
+GLIBC_2.32 __res_ninit F
+GLIBC_2.32 __res_randomid F
+GLIBC_2.32 __res_state F
+GLIBC_2.32 __rpc_thread_createerr F
+GLIBC_2.32 __rpc_thread_svc_fdset F
+GLIBC_2.32 __rpc_thread_svc_max_pollfd F
+GLIBC_2.32 __rpc_thread_svc_pollfd F
+GLIBC_2.32 __sbrk F
+GLIBC_2.32 __sched_cpualloc F
+GLIBC_2.32 __sched_cpucount F
+GLIBC_2.32 __sched_cpufree F
+GLIBC_2.32 __sched_get_priority_max F
+GLIBC_2.32 __sched_get_priority_min F
+GLIBC_2.32 __sched_getparam F
+GLIBC_2.32 __sched_getscheduler F
+GLIBC_2.32 __sched_setscheduler F
+GLIBC_2.32 __sched_yield F
+GLIBC_2.32 __select F
+GLIBC_2.32 __send F
+GLIBC_2.32 __setmntent F
+GLIBC_2.32 __setpgid F
+GLIBC_2.32 __sigaction F
+GLIBC_2.32 __signbit F
+GLIBC_2.32 __signbitf F
+GLIBC_2.32 __sigpause F
+GLIBC_2.32 __sigsetjmp F
+GLIBC_2.32 __sigsuspend F
+GLIBC_2.32 __snprintf_chk F
+GLIBC_2.32 __sprintf_chk F
+GLIBC_2.32 __stack_chk_fail F
+GLIBC_2.32 __statfs F
+GLIBC_2.32 __stpcpy F
+GLIBC_2.32 __stpcpy_chk F
+GLIBC_2.32 __stpncpy F
+GLIBC_2.32 __stpncpy_chk F
+GLIBC_2.32 __strcasecmp F
+GLIBC_2.32 __strcasecmp_l F
+GLIBC_2.32 __strcasestr F
+GLIBC_2.32 __strcat_chk F
+GLIBC_2.32 __strcoll_l F
+GLIBC_2.32 __strcpy_chk F
+GLIBC_2.32 __strdup F
+GLIBC_2.32 __strerror_r F
+GLIBC_2.32 __strfmon_l F
+GLIBC_2.32 __strftime_l F
+GLIBC_2.32 __strncasecmp_l F
+GLIBC_2.32 __strncat_chk F
+GLIBC_2.32 __strncpy_chk F
+GLIBC_2.32 __strndup F
+GLIBC_2.32 __strsep_g F
+GLIBC_2.32 __strtod_internal F
+GLIBC_2.32 __strtod_l F
+GLIBC_2.32 __strtof_internal F
+GLIBC_2.32 __strtof_l F
+GLIBC_2.32 __strtok_r F
+GLIBC_2.32 __strtol_internal F
+GLIBC_2.32 __strtol_l F
+GLIBC_2.32 __strtold_internal F
+GLIBC_2.32 __strtold_l F
+GLIBC_2.32 __strtoll_internal F
+GLIBC_2.32 __strtoll_l F
+GLIBC_2.32 __strtoul_internal F
+GLIBC_2.32 __strtoul_l F
+GLIBC_2.32 __strtoull_internal F
+GLIBC_2.32 __strtoull_l F
+GLIBC_2.32 __strverscmp F
+GLIBC_2.32 __strxfrm_l F
+GLIBC_2.32 __swprintf_chk F
+GLIBC_2.32 __syscall_error F
+GLIBC_2.32 __sysconf F
+GLIBC_2.32 __syslog_chk F
+GLIBC_2.32 __sysv_signal F
+GLIBC_2.32 __timezone D 0x4
+GLIBC_2.32 __toascii_l F
+GLIBC_2.32 __tolower_l F
+GLIBC_2.32 __toupper_l F
+GLIBC_2.32 __towctrans F
+GLIBC_2.32 __towctrans_l F
+GLIBC_2.32 __towlower_l F
+GLIBC_2.32 __towupper_l F
+GLIBC_2.32 __ttyname_r_chk F
+GLIBC_2.32 __tzname D 0x8
+GLIBC_2.32 __uflow F
+GLIBC_2.32 __underflow F
+GLIBC_2.32 __uselocale F
+GLIBC_2.32 __vasprintf_chk F
+GLIBC_2.32 __vdprintf_chk F
+GLIBC_2.32 __vfork F
+GLIBC_2.32 __vfprintf_chk F
+GLIBC_2.32 __vfscanf F
+GLIBC_2.32 __vfwprintf_chk F
+GLIBC_2.32 __vprintf_chk F
+GLIBC_2.32 __vsnprintf F
+GLIBC_2.32 __vsnprintf_chk F
+GLIBC_2.32 __vsprintf_chk F
+GLIBC_2.32 __vsscanf F
+GLIBC_2.32 __vswprintf_chk F
+GLIBC_2.32 __vsyslog_chk F
+GLIBC_2.32 __vwprintf_chk F
+GLIBC_2.32 __wait F
+GLIBC_2.32 __waitpid F
+GLIBC_2.32 __wcpcpy_chk F
+GLIBC_2.32 __wcpncpy_chk F
+GLIBC_2.32 __wcrtomb_chk F
+GLIBC_2.32 __wcscasecmp_l F
+GLIBC_2.32 __wcscat_chk F
+GLIBC_2.32 __wcscoll_l F
+GLIBC_2.32 __wcscpy_chk F
+GLIBC_2.32 __wcsftime_l F
+GLIBC_2.32 __wcsncasecmp_l F
+GLIBC_2.32 __wcsncat_chk F
+GLIBC_2.32 __wcsncpy_chk F
+GLIBC_2.32 __wcsnrtombs_chk F
+GLIBC_2.32 __wcsrtombs_chk F
+GLIBC_2.32 __wcstod_internal F
+GLIBC_2.32 __wcstod_l F
+GLIBC_2.32 __wcstof_internal F
+GLIBC_2.32 __wcstof_l F
+GLIBC_2.32 __wcstol_internal F
+GLIBC_2.32 __wcstol_l F
+GLIBC_2.32 __wcstold_internal F
+GLIBC_2.32 __wcstold_l F
+GLIBC_2.32 __wcstoll_internal F
+GLIBC_2.32 __wcstoll_l F
+GLIBC_2.32 __wcstombs_chk F
+GLIBC_2.32 __wcstoul_internal F
+GLIBC_2.32 __wcstoul_l F
+GLIBC_2.32 __wcstoull_internal F
+GLIBC_2.32 __wcstoull_l F
+GLIBC_2.32 __wcsxfrm_l F
+GLIBC_2.32 __wctomb_chk F
+GLIBC_2.32 __wctrans_l F
+GLIBC_2.32 __wctype_l F
+GLIBC_2.32 __wmemcpy_chk F
+GLIBC_2.32 __wmemmove_chk F
+GLIBC_2.32 __wmempcpy_chk F
+GLIBC_2.32 __wmemset_chk F
+GLIBC_2.32 __woverflow F
+GLIBC_2.32 __wprintf_chk F
+GLIBC_2.32 __write F
+GLIBC_2.32 __wuflow F
+GLIBC_2.32 __wunderflow F
+GLIBC_2.32 __xmknod F
+GLIBC_2.32 __xmknodat F
+GLIBC_2.32 __xpg_basename F
+GLIBC_2.32 __xpg_sigpause F
+GLIBC_2.32 __xpg_strerror_r F
+GLIBC_2.32 __xstat F
+GLIBC_2.32 __xstat64 F
+GLIBC_2.32 _authenticate F
+GLIBC_2.32 _dl_mcount_wrapper F
+GLIBC_2.32 _dl_mcount_wrapper_check F
+GLIBC_2.32 _environ D 0x4
+GLIBC_2.32 _exit F
+GLIBC_2.32 _flush_cache F
+GLIBC_2.32 _flushlbf F
+GLIBC_2.32 _libc_intl_domainname D 0x5
+GLIBC_2.32 _longjmp F
+GLIBC_2.32 _mcleanup F
+GLIBC_2.32 _mcount F
+GLIBC_2.32 _nl_default_dirname D 0x12
+GLIBC_2.32 _nl_domain_bindings D 0x4
+GLIBC_2.32 _nl_msg_cat_cntr D 0x4
+GLIBC_2.32 _null_auth D 0xc
+GLIBC_2.32 _obstack_allocated_p F
+GLIBC_2.32 _obstack_begin F
+GLIBC_2.32 _obstack_begin_1 F
+GLIBC_2.32 _obstack_free F
+GLIBC_2.32 _obstack_memory_used F
+GLIBC_2.32 _obstack_newchunk F
+GLIBC_2.32 _res D 0x200
+GLIBC_2.32 _res_hconf D 0x30
+GLIBC_2.32 _rpc_dtablesize F
+GLIBC_2.32 _seterr_reply F
+GLIBC_2.32 _setjmp F
+GLIBC_2.32 _sys_errlist D 0x21c
+GLIBC_2.32 _sys_nerr D 0x4
+GLIBC_2.32 _sys_siglist D 0x104
+GLIBC_2.32 _tolower F
+GLIBC_2.32 _toupper F
+GLIBC_2.32 a64l F
+GLIBC_2.32 abort F
+GLIBC_2.32 abs F
+GLIBC_2.32 accept F
+GLIBC_2.32 accept4 F
+GLIBC_2.32 access F
+GLIBC_2.32 acct F
+GLIBC_2.32 addmntent F
+GLIBC_2.32 addseverity F
+GLIBC_2.32 adjtime F
+GLIBC_2.32 adjtimex F
+GLIBC_2.32 alarm F
+GLIBC_2.32 aligned_alloc F
+GLIBC_2.32 alphasort F
+GLIBC_2.32 alphasort64 F
+GLIBC_2.32 argp_err_exit_status D 0x4
+GLIBC_2.32 argp_error F
+GLIBC_2.32 argp_failure F
+GLIBC_2.32 argp_help F
+GLIBC_2.32 argp_parse F
+GLIBC_2.32 argp_program_bug_address D 0x4
+GLIBC_2.32 argp_program_version D 0x4
+GLIBC_2.32 argp_program_version_hook D 0x4
+GLIBC_2.32 argp_state_help F
+GLIBC_2.32 argp_usage F
+GLIBC_2.32 argz_add F
+GLIBC_2.32 argz_add_sep F
+GLIBC_2.32 argz_append F
+GLIBC_2.32 argz_count F
+GLIBC_2.32 argz_create F
+GLIBC_2.32 argz_create_sep F
+GLIBC_2.32 argz_delete F
+GLIBC_2.32 argz_extract F
+GLIBC_2.32 argz_insert F
+GLIBC_2.32 argz_next F
+GLIBC_2.32 argz_replace F
+GLIBC_2.32 argz_stringify F
+GLIBC_2.32 asctime F
+GLIBC_2.32 asctime_r F
+GLIBC_2.32 asprintf F
+GLIBC_2.32 atof F
+GLIBC_2.32 atoi F
+GLIBC_2.32 atol F
+GLIBC_2.32 atoll F
+GLIBC_2.32 authdes_create F
+GLIBC_2.32 authdes_getucred F
+GLIBC_2.32 authdes_pk_create F
+GLIBC_2.32 authnone_create F
+GLIBC_2.32 authunix_create F
+GLIBC_2.32 authunix_create_default F
+GLIBC_2.32 backtrace F
+GLIBC_2.32 backtrace_symbols F
+GLIBC_2.32 backtrace_symbols_fd F
+GLIBC_2.32 basename F
+GLIBC_2.32 bcmp F
+GLIBC_2.32 bcopy F
+GLIBC_2.32 bind F
+GLIBC_2.32 bind_textdomain_codeset F
+GLIBC_2.32 bindresvport F
+GLIBC_2.32 bindtextdomain F
+GLIBC_2.32 brk F
+GLIBC_2.32 bsd_signal F
+GLIBC_2.32 bsearch F
+GLIBC_2.32 btowc F
+GLIBC_2.32 bzero F
+GLIBC_2.32 c16rtomb F
+GLIBC_2.32 c32rtomb F
+GLIBC_2.32 cacheflush F
+GLIBC_2.32 calloc F
+GLIBC_2.32 callrpc F
+GLIBC_2.32 canonicalize_file_name F
+GLIBC_2.32 capget F
+GLIBC_2.32 capset F
+GLIBC_2.32 catclose F
+GLIBC_2.32 catgets F
+GLIBC_2.32 catopen F
+GLIBC_2.32 cbc_crypt F
+GLIBC_2.32 cfgetispeed F
+GLIBC_2.32 cfgetospeed F
+GLIBC_2.32 cfmakeraw F
+GLIBC_2.32 cfsetispeed F
+GLIBC_2.32 cfsetospeed F
+GLIBC_2.32 cfsetspeed F
+GLIBC_2.32 chdir F
+GLIBC_2.32 chflags F
+GLIBC_2.32 chmod F
+GLIBC_2.32 chown F
+GLIBC_2.32 chroot F
+GLIBC_2.32 clearenv F
+GLIBC_2.32 clearerr F
+GLIBC_2.32 clearerr_unlocked F
+GLIBC_2.32 clnt_broadcast F
+GLIBC_2.32 clnt_create F
+GLIBC_2.32 clnt_pcreateerror F
+GLIBC_2.32 clnt_perrno F
+GLIBC_2.32 clnt_perror F
+GLIBC_2.32 clnt_spcreateerror F
+GLIBC_2.32 clnt_sperrno F
+GLIBC_2.32 clnt_sperror F
+GLIBC_2.32 clntraw_create F
+GLIBC_2.32 clnttcp_create F
+GLIBC_2.32 clntudp_bufcreate F
+GLIBC_2.32 clntudp_create F
+GLIBC_2.32 clntunix_create F
+GLIBC_2.32 clock F
+GLIBC_2.32 clock_adjtime F
+GLIBC_2.32 clock_getcpuclockid F
+GLIBC_2.32 clock_getres F
+GLIBC_2.32 clock_gettime F
+GLIBC_2.32 clock_nanosleep F
+GLIBC_2.32 clock_settime F
+GLIBC_2.32 clone F
+GLIBC_2.32 close F
+GLIBC_2.32 closedir F
+GLIBC_2.32 closelog F
+GLIBC_2.32 confstr F
+GLIBC_2.32 connect F
+GLIBC_2.32 copy_file_range F
+GLIBC_2.32 copysign F
+GLIBC_2.32 copysignf F
+GLIBC_2.32 copysignl F
+GLIBC_2.32 creat F
+GLIBC_2.32 creat64 F
+GLIBC_2.32 ctermid F
+GLIBC_2.32 ctime F
+GLIBC_2.32 ctime_r F
+GLIBC_2.32 cuserid F
+GLIBC_2.32 daemon F
+GLIBC_2.32 daylight D 0x4
+GLIBC_2.32 dcgettext F
+GLIBC_2.32 dcngettext F
+GLIBC_2.32 delete_module F
+GLIBC_2.32 des_setparity F
+GLIBC_2.32 dgettext F
+GLIBC_2.32 difftime F
+GLIBC_2.32 dirfd F
+GLIBC_2.32 dirname F
+GLIBC_2.32 div F
+GLIBC_2.32 dl_iterate_phdr F
+GLIBC_2.32 dngettext F
+GLIBC_2.32 dprintf F
+GLIBC_2.32 drand48 F
+GLIBC_2.32 drand48_r F
+GLIBC_2.32 dup F
+GLIBC_2.32 dup2 F
+GLIBC_2.32 dup3 F
+GLIBC_2.32 duplocale F
+GLIBC_2.32 dysize F
+GLIBC_2.32 eaccess F
+GLIBC_2.32 ecb_crypt F
+GLIBC_2.32 ecvt F
+GLIBC_2.32 ecvt_r F
+GLIBC_2.32 endaliasent F
+GLIBC_2.32 endfsent F
+GLIBC_2.32 endgrent F
+GLIBC_2.32 endhostent F
+GLIBC_2.32 endmntent F
+GLIBC_2.32 endnetent F
+GLIBC_2.32 endnetgrent F
+GLIBC_2.32 endprotoent F
+GLIBC_2.32 endpwent F
+GLIBC_2.32 endrpcent F
+GLIBC_2.32 endservent F
+GLIBC_2.32 endsgent F
+GLIBC_2.32 endspent F
+GLIBC_2.32 endttyent F
+GLIBC_2.32 endusershell F
+GLIBC_2.32 endutent F
+GLIBC_2.32 endutxent F
+GLIBC_2.32 environ D 0x4
+GLIBC_2.32 envz_add F
+GLIBC_2.32 envz_entry F
+GLIBC_2.32 envz_get F
+GLIBC_2.32 envz_merge F
+GLIBC_2.32 envz_remove F
+GLIBC_2.32 envz_strip F
+GLIBC_2.32 epoll_create F
+GLIBC_2.32 epoll_create1 F
+GLIBC_2.32 epoll_ctl F
+GLIBC_2.32 epoll_pwait F
+GLIBC_2.32 epoll_wait F
+GLIBC_2.32 erand48 F
+GLIBC_2.32 erand48_r F
+GLIBC_2.32 err F
+GLIBC_2.32 error F
+GLIBC_2.32 error_at_line F
+GLIBC_2.32 error_message_count D 0x4
+GLIBC_2.32 error_one_per_line D 0x4
+GLIBC_2.32 error_print_progname D 0x4
+GLIBC_2.32 errx F
+GLIBC_2.32 ether_aton F
+GLIBC_2.32 ether_aton_r F
+GLIBC_2.32 ether_hostton F
+GLIBC_2.32 ether_line F
+GLIBC_2.32 ether_ntoa F
+GLIBC_2.32 ether_ntoa_r F
+GLIBC_2.32 ether_ntohost F
+GLIBC_2.32 euidaccess F
+GLIBC_2.32 eventfd F
+GLIBC_2.32 eventfd_read F
+GLIBC_2.32 eventfd_write F
+GLIBC_2.32 execl F
+GLIBC_2.32 execle F
+GLIBC_2.32 execlp F
+GLIBC_2.32 execv F
+GLIBC_2.32 execve F
+GLIBC_2.32 execvp F
+GLIBC_2.32 execvpe F
+GLIBC_2.32 exit F
+GLIBC_2.32 explicit_bzero F
+GLIBC_2.32 faccessat F
+GLIBC_2.32 fallocate F
+GLIBC_2.32 fallocate64 F
+GLIBC_2.32 fanotify_init F
+GLIBC_2.32 fanotify_mark F
+GLIBC_2.32 fchdir F
+GLIBC_2.32 fchflags F
+GLIBC_2.32 fchmod F
+GLIBC_2.32 fchmodat F
+GLIBC_2.32 fchown F
+GLIBC_2.32 fchownat F
+GLIBC_2.32 fclose F
+GLIBC_2.32 fcloseall F
+GLIBC_2.32 fcntl F
+GLIBC_2.32 fcntl64 F
+GLIBC_2.32 fcvt F
+GLIBC_2.32 fcvt_r F
+GLIBC_2.32 fdatasync F
+GLIBC_2.32 fdopen F
+GLIBC_2.32 fdopendir F
+GLIBC_2.32 feof F
+GLIBC_2.32 feof_unlocked F
+GLIBC_2.32 ferror F
+GLIBC_2.32 ferror_unlocked F
+GLIBC_2.32 fexecve F
+GLIBC_2.32 fflush F
+GLIBC_2.32 fflush_unlocked F
+GLIBC_2.32 ffs F
+GLIBC_2.32 ffsl F
+GLIBC_2.32 ffsll F
+GLIBC_2.32 fgetc F
+GLIBC_2.32 fgetc_unlocked F
+GLIBC_2.32 fgetgrent F
+GLIBC_2.32 fgetgrent_r F
+GLIBC_2.32 fgetpos F
+GLIBC_2.32 fgetpos64 F
+GLIBC_2.32 fgetpwent F
+GLIBC_2.32 fgetpwent_r F
+GLIBC_2.32 fgets F
+GLIBC_2.32 fgets_unlocked F
+GLIBC_2.32 fgetsgent F
+GLIBC_2.32 fgetsgent_r F
+GLIBC_2.32 fgetspent F
+GLIBC_2.32 fgetspent_r F
+GLIBC_2.32 fgetwc F
+GLIBC_2.32 fgetwc_unlocked F
+GLIBC_2.32 fgetws F
+GLIBC_2.32 fgetws_unlocked F
+GLIBC_2.32 fgetxattr F
+GLIBC_2.32 fileno F
+GLIBC_2.32 fileno_unlocked F
+GLIBC_2.32 finite F
+GLIBC_2.32 finitef F
+GLIBC_2.32 finitel F
+GLIBC_2.32 flistxattr F
+GLIBC_2.32 flock F
+GLIBC_2.32 flockfile F
+GLIBC_2.32 fmemopen F
+GLIBC_2.32 fmtmsg F
+GLIBC_2.32 fnmatch F
+GLIBC_2.32 fopen F
+GLIBC_2.32 fopen64 F
+GLIBC_2.32 fopencookie F
+GLIBC_2.32 fork F
+GLIBC_2.32 fpathconf F
+GLIBC_2.32 fprintf F
+GLIBC_2.32 fputc F
+GLIBC_2.32 fputc_unlocked F
+GLIBC_2.32 fputs F
+GLIBC_2.32 fputs_unlocked F
+GLIBC_2.32 fputwc F
+GLIBC_2.32 fputwc_unlocked F
+GLIBC_2.32 fputws F
+GLIBC_2.32 fputws_unlocked F
+GLIBC_2.32 fread F
+GLIBC_2.32 fread_unlocked F
+GLIBC_2.32 free F
+GLIBC_2.32 freeaddrinfo F
+GLIBC_2.32 freeifaddrs F
+GLIBC_2.32 freelocale F
+GLIBC_2.32 fremovexattr F
+GLIBC_2.32 freopen F
+GLIBC_2.32 freopen64 F
+GLIBC_2.32 frexp F
+GLIBC_2.32 frexpf F
+GLIBC_2.32 frexpl F
+GLIBC_2.32 fscanf F
+GLIBC_2.32 fseek F
+GLIBC_2.32 fseeko F
+GLIBC_2.32 fseeko64 F
+GLIBC_2.32 fsetpos F
+GLIBC_2.32 fsetpos64 F
+GLIBC_2.32 fsetxattr F
+GLIBC_2.32 fstatfs F
+GLIBC_2.32 fstatfs64 F
+GLIBC_2.32 fstatvfs F
+GLIBC_2.32 fstatvfs64 F
+GLIBC_2.32 fsync F
+GLIBC_2.32 ftell F
+GLIBC_2.32 ftello F
+GLIBC_2.32 ftello64 F
+GLIBC_2.32 ftime F
+GLIBC_2.32 ftok F
+GLIBC_2.32 ftruncate F
+GLIBC_2.32 ftruncate64 F
+GLIBC_2.32 ftrylockfile F
+GLIBC_2.32 fts64_children F
+GLIBC_2.32 fts64_close F
+GLIBC_2.32 fts64_open F
+GLIBC_2.32 fts64_read F
+GLIBC_2.32 fts64_set F
+GLIBC_2.32 fts_children F
+GLIBC_2.32 fts_close F
+GLIBC_2.32 fts_open F
+GLIBC_2.32 fts_read F
+GLIBC_2.32 fts_set F
+GLIBC_2.32 ftw F
+GLIBC_2.32 ftw64 F
+GLIBC_2.32 funlockfile F
+GLIBC_2.32 futimens F
+GLIBC_2.32 futimes F
+GLIBC_2.32 futimesat F
+GLIBC_2.32 fwide F
+GLIBC_2.32 fwprintf F
+GLIBC_2.32 fwrite F
+GLIBC_2.32 fwrite_unlocked F
+GLIBC_2.32 fwscanf F
+GLIBC_2.32 gai_strerror F
+GLIBC_2.32 gcvt F
+GLIBC_2.32 get_avphys_pages F
+GLIBC_2.32 get_current_dir_name F
+GLIBC_2.32 get_myaddress F
+GLIBC_2.32 get_nprocs F
+GLIBC_2.32 get_nprocs_conf F
+GLIBC_2.32 get_phys_pages F
+GLIBC_2.32 getaddrinfo F
+GLIBC_2.32 getaliasbyname F
+GLIBC_2.32 getaliasbyname_r F
+GLIBC_2.32 getaliasent F
+GLIBC_2.32 getaliasent_r F
+GLIBC_2.32 getauxval F
+GLIBC_2.32 getc F
+GLIBC_2.32 getc_unlocked F
+GLIBC_2.32 getchar F
+GLIBC_2.32 getchar_unlocked F
+GLIBC_2.32 getcontext F
+GLIBC_2.32 getcpu F
+GLIBC_2.32 getcwd F
+GLIBC_2.32 getdate F
+GLIBC_2.32 getdate_err D 0x4
+GLIBC_2.32 getdate_r F
+GLIBC_2.32 getdelim F
+GLIBC_2.32 getdents64 F
+GLIBC_2.32 getdirentries F
+GLIBC_2.32 getdirentries64 F
+GLIBC_2.32 getdomainname F
+GLIBC_2.32 getdtablesize F
+GLIBC_2.32 getegid F
+GLIBC_2.32 getentropy F
+GLIBC_2.32 getenv F
+GLIBC_2.32 geteuid F
+GLIBC_2.32 getfsent F
+GLIBC_2.32 getfsfile F
+GLIBC_2.32 getfsspec F
+GLIBC_2.32 getgid F
+GLIBC_2.32 getgrent F
+GLIBC_2.32 getgrent_r F
+GLIBC_2.32 getgrgid F
+GLIBC_2.32 getgrgid_r F
+GLIBC_2.32 getgrnam F
+GLIBC_2.32 getgrnam_r F
+GLIBC_2.32 getgrouplist F
+GLIBC_2.32 getgroups F
+GLIBC_2.32 gethostbyaddr F
+GLIBC_2.32 gethostbyaddr_r F
+GLIBC_2.32 gethostbyname F
+GLIBC_2.32 gethostbyname2 F
+GLIBC_2.32 gethostbyname2_r F
+GLIBC_2.32 gethostbyname_r F
+GLIBC_2.32 gethostent F
+GLIBC_2.32 gethostent_r F
+GLIBC_2.32 gethostid F
+GLIBC_2.32 gethostname F
+GLIBC_2.32 getifaddrs F
+GLIBC_2.32 getipv4sourcefilter F
+GLIBC_2.32 getitimer F
+GLIBC_2.32 getline F
+GLIBC_2.32 getloadavg F
+GLIBC_2.32 getlogin F
+GLIBC_2.32 getlogin_r F
+GLIBC_2.32 getmntent F
+GLIBC_2.32 getmntent_r F
+GLIBC_2.32 getnameinfo F
+GLIBC_2.32 getnetbyaddr F
+GLIBC_2.32 getnetbyaddr_r F
+GLIBC_2.32 getnetbyname F
+GLIBC_2.32 getnetbyname_r F
+GLIBC_2.32 getnetent F
+GLIBC_2.32 getnetent_r F
+GLIBC_2.32 getnetgrent F
+GLIBC_2.32 getnetgrent_r F
+GLIBC_2.32 getnetname F
+GLIBC_2.32 getopt F
+GLIBC_2.32 getopt_long F
+GLIBC_2.32 getopt_long_only F
+GLIBC_2.32 getpagesize F
+GLIBC_2.32 getpass F
+GLIBC_2.32 getpeername F
+GLIBC_2.32 getpgid F
+GLIBC_2.32 getpgrp F
+GLIBC_2.32 getpid F
+GLIBC_2.32 getppid F
+GLIBC_2.32 getpriority F
+GLIBC_2.32 getprotobyname F
+GLIBC_2.32 getprotobyname_r F
+GLIBC_2.32 getprotobynumber F
+GLIBC_2.32 getprotobynumber_r F
+GLIBC_2.32 getprotoent F
+GLIBC_2.32 getprotoent_r F
+GLIBC_2.32 getpt F
+GLIBC_2.32 getpublickey F
+GLIBC_2.32 getpw F
+GLIBC_2.32 getpwent F
+GLIBC_2.32 getpwent_r F
+GLIBC_2.32 getpwnam F
+GLIBC_2.32 getpwnam_r F
+GLIBC_2.32 getpwuid F
+GLIBC_2.32 getpwuid_r F
+GLIBC_2.32 getrandom F
+GLIBC_2.32 getresgid F
+GLIBC_2.32 getresuid F
+GLIBC_2.32 getrlimit F
+GLIBC_2.32 getrlimit64 F
+GLIBC_2.32 getrpcbyname F
+GLIBC_2.32 getrpcbyname_r F
+GLIBC_2.32 getrpcbynumber F
+GLIBC_2.32 getrpcbynumber_r F
+GLIBC_2.32 getrpcent F
+GLIBC_2.32 getrpcent_r F
+GLIBC_2.32 getrpcport F
+GLIBC_2.32 getrusage F
+GLIBC_2.32 gets F
+GLIBC_2.32 getsecretkey F
+GLIBC_2.32 getservbyname F
+GLIBC_2.32 getservbyname_r F
+GLIBC_2.32 getservbyport F
+GLIBC_2.32 getservbyport_r F
+GLIBC_2.32 getservent F
+GLIBC_2.32 getservent_r F
+GLIBC_2.32 getsgent F
+GLIBC_2.32 getsgent_r F
+GLIBC_2.32 getsgnam F
+GLIBC_2.32 getsgnam_r F
+GLIBC_2.32 getsid F
+GLIBC_2.32 getsockname F
+GLIBC_2.32 getsockopt F
+GLIBC_2.32 getsourcefilter F
+GLIBC_2.32 getspent F
+GLIBC_2.32 getspent_r F
+GLIBC_2.32 getspnam F
+GLIBC_2.32 getspnam_r F
+GLIBC_2.32 getsubopt F
+GLIBC_2.32 gettext F
+GLIBC_2.32 gettid F
+GLIBC_2.32 gettimeofday F
+GLIBC_2.32 getttyent F
+GLIBC_2.32 getttynam F
+GLIBC_2.32 getuid F
+GLIBC_2.32 getusershell F
+GLIBC_2.32 getutent F
+GLIBC_2.32 getutent_r F
+GLIBC_2.32 getutid F
+GLIBC_2.32 getutid_r F
+GLIBC_2.32 getutline F
+GLIBC_2.32 getutline_r F
+GLIBC_2.32 getutmp F
+GLIBC_2.32 getutmpx F
+GLIBC_2.32 getutxent F
+GLIBC_2.32 getutxid F
+GLIBC_2.32 getutxline F
+GLIBC_2.32 getw F
+GLIBC_2.32 getwc F
+GLIBC_2.32 getwc_unlocked F
+GLIBC_2.32 getwchar F
+GLIBC_2.32 getwchar_unlocked F
+GLIBC_2.32 getwd F
+GLIBC_2.32 getxattr F
+GLIBC_2.32 glob F
+GLIBC_2.32 glob64 F
+GLIBC_2.32 glob_pattern_p F
+GLIBC_2.32 globfree F
+GLIBC_2.32 globfree64 F
+GLIBC_2.32 gmtime F
+GLIBC_2.32 gmtime_r F
+GLIBC_2.32 gnu_dev_major F
+GLIBC_2.32 gnu_dev_makedev F
+GLIBC_2.32 gnu_dev_minor F
+GLIBC_2.32 gnu_get_libc_release F
+GLIBC_2.32 gnu_get_libc_version F
+GLIBC_2.32 grantpt F
+GLIBC_2.32 group_member F
+GLIBC_2.32 gsignal F
+GLIBC_2.32 gtty F
+GLIBC_2.32 h_errlist D 0x14
+GLIBC_2.32 h_nerr D 0x4
+GLIBC_2.32 hasmntopt F
+GLIBC_2.32 hcreate F
+GLIBC_2.32 hcreate_r F
+GLIBC_2.32 hdestroy F
+GLIBC_2.32 hdestroy_r F
+GLIBC_2.32 herror F
+GLIBC_2.32 host2netname F
+GLIBC_2.32 hsearch F
+GLIBC_2.32 hsearch_r F
+GLIBC_2.32 hstrerror F
+GLIBC_2.32 htonl F
+GLIBC_2.32 htons F
+GLIBC_2.32 iconv F
+GLIBC_2.32 iconv_close F
+GLIBC_2.32 iconv_open F
+GLIBC_2.32 if_freenameindex F
+GLIBC_2.32 if_indextoname F
+GLIBC_2.32 if_nameindex F
+GLIBC_2.32 if_nametoindex F
+GLIBC_2.32 imaxabs F
+GLIBC_2.32 imaxdiv F
+GLIBC_2.32 in6addr_any D 0x10
+GLIBC_2.32 in6addr_loopback D 0x10
+GLIBC_2.32 index F
+GLIBC_2.32 inet6_opt_append F
+GLIBC_2.32 inet6_opt_find F
+GLIBC_2.32 inet6_opt_finish F
+GLIBC_2.32 inet6_opt_get_val F
+GLIBC_2.32 inet6_opt_init F
+GLIBC_2.32 inet6_opt_next F
+GLIBC_2.32 inet6_opt_set_val F
+GLIBC_2.32 inet6_option_alloc F
+GLIBC_2.32 inet6_option_append F
+GLIBC_2.32 inet6_option_find F
+GLIBC_2.32 inet6_option_init F
+GLIBC_2.32 inet6_option_next F
+GLIBC_2.32 inet6_option_space F
+GLIBC_2.32 inet6_rth_add F
+GLIBC_2.32 inet6_rth_getaddr F
+GLIBC_2.32 inet6_rth_init F
+GLIBC_2.32 inet6_rth_reverse F
+GLIBC_2.32 inet6_rth_segments F
+GLIBC_2.32 inet6_rth_space F
+GLIBC_2.32 inet_addr F
+GLIBC_2.32 inet_aton F
+GLIBC_2.32 inet_lnaof F
+GLIBC_2.32 inet_makeaddr F
+GLIBC_2.32 inet_netof F
+GLIBC_2.32 inet_network F
+GLIBC_2.32 inet_nsap_addr F
+GLIBC_2.32 inet_nsap_ntoa F
+GLIBC_2.32 inet_ntoa F
+GLIBC_2.32 inet_ntop F
+GLIBC_2.32 inet_pton F
+GLIBC_2.32 init_module F
+GLIBC_2.32 initgroups F
+GLIBC_2.32 initstate F
+GLIBC_2.32 initstate_r F
+GLIBC_2.32 innetgr F
+GLIBC_2.32 inotify_add_watch F
+GLIBC_2.32 inotify_init F
+GLIBC_2.32 inotify_init1 F
+GLIBC_2.32 inotify_rm_watch F
+GLIBC_2.32 insque F
+GLIBC_2.32 ioctl F
+GLIBC_2.32 iruserok F
+GLIBC_2.32 iruserok_af F
+GLIBC_2.32 isalnum F
+GLIBC_2.32 isalnum_l F
+GLIBC_2.32 isalpha F
+GLIBC_2.32 isalpha_l F
+GLIBC_2.32 isascii F
+GLIBC_2.32 isatty F
+GLIBC_2.32 isblank F
+GLIBC_2.32 isblank_l F
+GLIBC_2.32 iscntrl F
+GLIBC_2.32 iscntrl_l F
+GLIBC_2.32 isctype F
+GLIBC_2.32 isdigit F
+GLIBC_2.32 isdigit_l F
+GLIBC_2.32 isfdtype F
+GLIBC_2.32 isgraph F
+GLIBC_2.32 isgraph_l F
+GLIBC_2.32 isinf F
+GLIBC_2.32 isinff F
+GLIBC_2.32 isinfl F
+GLIBC_2.32 islower F
+GLIBC_2.32 islower_l F
+GLIBC_2.32 isnan F
+GLIBC_2.32 isnanf F
+GLIBC_2.32 isnanl F
+GLIBC_2.32 isprint F
+GLIBC_2.32 isprint_l F
+GLIBC_2.32 ispunct F
+GLIBC_2.32 ispunct_l F
+GLIBC_2.32 isspace F
+GLIBC_2.32 isspace_l F
+GLIBC_2.32 isupper F
+GLIBC_2.32 isupper_l F
+GLIBC_2.32 iswalnum F
+GLIBC_2.32 iswalnum_l F
+GLIBC_2.32 iswalpha F
+GLIBC_2.32 iswalpha_l F
+GLIBC_2.32 iswblank F
+GLIBC_2.32 iswblank_l F
+GLIBC_2.32 iswcntrl F
+GLIBC_2.32 iswcntrl_l F
+GLIBC_2.32 iswctype F
+GLIBC_2.32 iswctype_l F
+GLIBC_2.32 iswdigit F
+GLIBC_2.32 iswdigit_l F
+GLIBC_2.32 iswgraph F
+GLIBC_2.32 iswgraph_l F
+GLIBC_2.32 iswlower F
+GLIBC_2.32 iswlower_l F
+GLIBC_2.32 iswprint F
+GLIBC_2.32 iswprint_l F
+GLIBC_2.32 iswpunct F
+GLIBC_2.32 iswpunct_l F
+GLIBC_2.32 iswspace F
+GLIBC_2.32 iswspace_l F
+GLIBC_2.32 iswupper F
+GLIBC_2.32 iswupper_l F
+GLIBC_2.32 iswxdigit F
+GLIBC_2.32 iswxdigit_l F
+GLIBC_2.32 isxdigit F
+GLIBC_2.32 isxdigit_l F
+GLIBC_2.32 jrand48 F
+GLIBC_2.32 jrand48_r F
+GLIBC_2.32 key_decryptsession F
+GLIBC_2.32 key_decryptsession_pk F
+GLIBC_2.32 key_encryptsession F
+GLIBC_2.32 key_encryptsession_pk F
+GLIBC_2.32 key_gendes F
+GLIBC_2.32 key_get_conv F
+GLIBC_2.32 key_secretkey_is_set F
+GLIBC_2.32 key_setnet F
+GLIBC_2.32 key_setsecret F
+GLIBC_2.32 kill F
+GLIBC_2.32 killpg F
+GLIBC_2.32 klogctl F
+GLIBC_2.32 l64a F
+GLIBC_2.32 labs F
+GLIBC_2.32 lchmod F
+GLIBC_2.32 lchown F
+GLIBC_2.32 lckpwdf F
+GLIBC_2.32 lcong48 F
+GLIBC_2.32 lcong48_r F
+GLIBC_2.32 ldexp F
+GLIBC_2.32 ldexpf F
+GLIBC_2.32 ldexpl F
+GLIBC_2.32 ldiv F
+GLIBC_2.32 lfind F
+GLIBC_2.32 lgetxattr F
+GLIBC_2.32 link F
+GLIBC_2.32 linkat F
+GLIBC_2.32 listen F
+GLIBC_2.32 listxattr F
+GLIBC_2.32 llabs F
+GLIBC_2.32 lldiv F
+GLIBC_2.32 llistxattr F
+GLIBC_2.32 localeconv F
+GLIBC_2.32 localtime F
+GLIBC_2.32 localtime_r F
+GLIBC_2.32 lockf F
+GLIBC_2.32 lockf64 F
+GLIBC_2.32 longjmp F
+GLIBC_2.32 lrand48 F
+GLIBC_2.32 lrand48_r F
+GLIBC_2.32 lremovexattr F
+GLIBC_2.32 lsearch F
+GLIBC_2.32 lseek F
+GLIBC_2.32 lseek64 F
+GLIBC_2.32 lsetxattr F
+GLIBC_2.32 lutimes F
+GLIBC_2.32 madvise F
+GLIBC_2.32 makecontext F
+GLIBC_2.32 mallinfo F
+GLIBC_2.32 malloc F
+GLIBC_2.32 malloc_info F
+GLIBC_2.32 malloc_stats F
+GLIBC_2.32 malloc_trim F
+GLIBC_2.32 malloc_usable_size F
+GLIBC_2.32 mallopt F
+GLIBC_2.32 mallwatch D 0x4
+GLIBC_2.32 mblen F
+GLIBC_2.32 mbrlen F
+GLIBC_2.32 mbrtoc16 F
+GLIBC_2.32 mbrtoc32 F
+GLIBC_2.32 mbrtowc F
+GLIBC_2.32 mbsinit F
+GLIBC_2.32 mbsnrtowcs F
+GLIBC_2.32 mbsrtowcs F
+GLIBC_2.32 mbstowcs F
+GLIBC_2.32 mbtowc F
+GLIBC_2.32 mcheck F
+GLIBC_2.32 mcheck_check_all F
+GLIBC_2.32 mcheck_pedantic F
+GLIBC_2.32 memalign F
+GLIBC_2.32 memccpy F
+GLIBC_2.32 memchr F
+GLIBC_2.32 memcmp F
+GLIBC_2.32 memcpy F
+GLIBC_2.32 memfd_create F
+GLIBC_2.32 memfrob F
+GLIBC_2.32 memmem F
+GLIBC_2.32 memmove F
+GLIBC_2.32 mempcpy F
+GLIBC_2.32 memrchr F
+GLIBC_2.32 memset F
+GLIBC_2.32 mincore F
+GLIBC_2.32 mkdir F
+GLIBC_2.32 mkdirat F
+GLIBC_2.32 mkdtemp F
+GLIBC_2.32 mkfifo F
+GLIBC_2.32 mkfifoat F
+GLIBC_2.32 mkostemp F
+GLIBC_2.32 mkostemp64 F
+GLIBC_2.32 mkostemps F
+GLIBC_2.32 mkostemps64 F
+GLIBC_2.32 mkstemp F
+GLIBC_2.32 mkstemp64 F
+GLIBC_2.32 mkstemps F
+GLIBC_2.32 mkstemps64 F
+GLIBC_2.32 mktemp F
+GLIBC_2.32 mktime F
+GLIBC_2.32 mlock F
+GLIBC_2.32 mlock2 F
+GLIBC_2.32 mlockall F
+GLIBC_2.32 mmap F
+GLIBC_2.32 mmap64 F
+GLIBC_2.32 modf F
+GLIBC_2.32 modff F
+GLIBC_2.32 modfl F
+GLIBC_2.32 moncontrol F
+GLIBC_2.32 monstartup F
+GLIBC_2.32 mount F
+GLIBC_2.32 mprobe F
+GLIBC_2.32 mprotect F
+GLIBC_2.32 mrand48 F
+GLIBC_2.32 mrand48_r F
+GLIBC_2.32 mremap F
+GLIBC_2.32 msgctl F
+GLIBC_2.32 msgget F
+GLIBC_2.32 msgrcv F
+GLIBC_2.32 msgsnd F
+GLIBC_2.32 msync F
+GLIBC_2.32 mtrace F
+GLIBC_2.32 munlock F
+GLIBC_2.32 munlockall F
+GLIBC_2.32 munmap F
+GLIBC_2.32 muntrace F
+GLIBC_2.32 name_to_handle_at F
+GLIBC_2.32 nanosleep F
+GLIBC_2.32 netname2host F
+GLIBC_2.32 netname2user F
+GLIBC_2.32 newlocale F
+GLIBC_2.32 nftw F
+GLIBC_2.32 nftw64 F
+GLIBC_2.32 ngettext F
+GLIBC_2.32 nice F
+GLIBC_2.32 nl_langinfo F
+GLIBC_2.32 nl_langinfo_l F
+GLIBC_2.32 nrand48 F
+GLIBC_2.32 nrand48_r F
+GLIBC_2.32 ntohl F
+GLIBC_2.32 ntohs F
+GLIBC_2.32 ntp_adjtime F
+GLIBC_2.32 ntp_gettime F
+GLIBC_2.32 ntp_gettimex F
+GLIBC_2.32 obstack_alloc_failed_handler D 0x4
+GLIBC_2.32 obstack_exit_failure D 0x4
+GLIBC_2.32 obstack_free F
+GLIBC_2.32 obstack_printf F
+GLIBC_2.32 obstack_vprintf F
+GLIBC_2.32 on_exit F
+GLIBC_2.32 open F
+GLIBC_2.32 open64 F
+GLIBC_2.32 open_by_handle_at F
+GLIBC_2.32 open_memstream F
+GLIBC_2.32 open_wmemstream F
+GLIBC_2.32 openat F
+GLIBC_2.32 openat64 F
+GLIBC_2.32 opendir F
+GLIBC_2.32 openlog F
+GLIBC_2.32 optarg D 0x4
+GLIBC_2.32 opterr D 0x4
+GLIBC_2.32 optind D 0x4
+GLIBC_2.32 optopt D 0x4
+GLIBC_2.32 parse_printf_format F
+GLIBC_2.32 passwd2des F
+GLIBC_2.32 pathconf F
+GLIBC_2.32 pause F
+GLIBC_2.32 pclose F
+GLIBC_2.32 perror F
+GLIBC_2.32 personality F
+GLIBC_2.32 pipe F
+GLIBC_2.32 pipe2 F
+GLIBC_2.32 pivot_root F
+GLIBC_2.32 pkey_alloc F
+GLIBC_2.32 pkey_free F
+GLIBC_2.32 pkey_get F
+GLIBC_2.32 pkey_mprotect F
+GLIBC_2.32 pkey_set F
+GLIBC_2.32 pmap_getmaps F
+GLIBC_2.32 pmap_getport F
+GLIBC_2.32 pmap_rmtcall F
+GLIBC_2.32 pmap_set F
+GLIBC_2.32 pmap_unset F
+GLIBC_2.32 poll F
+GLIBC_2.32 popen F
+GLIBC_2.32 posix_fadvise F
+GLIBC_2.32 posix_fadvise64 F
+GLIBC_2.32 posix_fallocate F
+GLIBC_2.32 posix_fallocate64 F
+GLIBC_2.32 posix_madvise F
+GLIBC_2.32 posix_memalign F
+GLIBC_2.32 posix_openpt F
+GLIBC_2.32 posix_spawn F
+GLIBC_2.32 posix_spawn_file_actions_addchdir_np F
+GLIBC_2.32 posix_spawn_file_actions_addclose F
+GLIBC_2.32 posix_spawn_file_actions_adddup2 F
+GLIBC_2.32 posix_spawn_file_actions_addfchdir_np F
+GLIBC_2.32 posix_spawn_file_actions_addopen F
+GLIBC_2.32 posix_spawn_file_actions_destroy F
+GLIBC_2.32 posix_spawn_file_actions_init F
+GLIBC_2.32 posix_spawnattr_destroy F
+GLIBC_2.32 posix_spawnattr_getflags F
+GLIBC_2.32 posix_spawnattr_getpgroup F
+GLIBC_2.32 posix_spawnattr_getschedparam F
+GLIBC_2.32 posix_spawnattr_getschedpolicy F
+GLIBC_2.32 posix_spawnattr_getsigdefault F
+GLIBC_2.32 posix_spawnattr_getsigmask F
+GLIBC_2.32 posix_spawnattr_init F
+GLIBC_2.32 posix_spawnattr_setflags F
+GLIBC_2.32 posix_spawnattr_setpgroup F
+GLIBC_2.32 posix_spawnattr_setschedparam F
+GLIBC_2.32 posix_spawnattr_setschedpolicy F
+GLIBC_2.32 posix_spawnattr_setsigdefault F
+GLIBC_2.32 posix_spawnattr_setsigmask F
+GLIBC_2.32 posix_spawnp F
+GLIBC_2.32 ppoll F
+GLIBC_2.32 prctl F
+GLIBC_2.32 pread F
+GLIBC_2.32 pread64 F
+GLIBC_2.32 preadv F
+GLIBC_2.32 preadv2 F
+GLIBC_2.32 preadv64 F
+GLIBC_2.32 preadv64v2 F
+GLIBC_2.32 printf F
+GLIBC_2.32 printf_size F
+GLIBC_2.32 printf_size_info F
+GLIBC_2.32 prlimit F
+GLIBC_2.32 prlimit64 F
+GLIBC_2.32 process_vm_readv F
+GLIBC_2.32 process_vm_writev F
+GLIBC_2.32 profil F
+GLIBC_2.32 program_invocation_name D 0x4
+GLIBC_2.32 program_invocation_short_name D 0x4
+GLIBC_2.32 pselect F
+GLIBC_2.32 psiginfo F
+GLIBC_2.32 psignal F
+GLIBC_2.32 pthread_attr_destroy F
+GLIBC_2.32 pthread_attr_getdetachstate F
+GLIBC_2.32 pthread_attr_getinheritsched F
+GLIBC_2.32 pthread_attr_getschedparam F
+GLIBC_2.32 pthread_attr_getschedpolicy F
+GLIBC_2.32 pthread_attr_getscope F
+GLIBC_2.32 pthread_attr_init F
+GLIBC_2.32 pthread_attr_setdetachstate F
+GLIBC_2.32 pthread_attr_setinheritsched F
+GLIBC_2.32 pthread_attr_setschedparam F
+GLIBC_2.32 pthread_attr_setschedpolicy F
+GLIBC_2.32 pthread_attr_setscope F
+GLIBC_2.32 pthread_cond_broadcast F
+GLIBC_2.32 pthread_cond_destroy F
+GLIBC_2.32 pthread_cond_init F
+GLIBC_2.32 pthread_cond_signal F
+GLIBC_2.32 pthread_cond_timedwait F
+GLIBC_2.32 pthread_cond_wait F
+GLIBC_2.32 pthread_condattr_destroy F
+GLIBC_2.32 pthread_condattr_init F
+GLIBC_2.32 pthread_equal F
+GLIBC_2.32 pthread_exit F
+GLIBC_2.32 pthread_getschedparam F
+GLIBC_2.32 pthread_mutex_destroy F
+GLIBC_2.32 pthread_mutex_init F
+GLIBC_2.32 pthread_mutex_lock F
+GLIBC_2.32 pthread_mutex_unlock F
+GLIBC_2.32 pthread_self F
+GLIBC_2.32 pthread_setcancelstate F
+GLIBC_2.32 pthread_setcanceltype F
+GLIBC_2.32 pthread_setschedparam F
+GLIBC_2.32 ptrace F
+GLIBC_2.32 ptsname F
+GLIBC_2.32 ptsname_r F
+GLIBC_2.32 putc F
+GLIBC_2.32 putc_unlocked F
+GLIBC_2.32 putchar F
+GLIBC_2.32 putchar_unlocked F
+GLIBC_2.32 putenv F
+GLIBC_2.32 putgrent F
+GLIBC_2.32 putpwent F
+GLIBC_2.32 puts F
+GLIBC_2.32 putsgent F
+GLIBC_2.32 putspent F
+GLIBC_2.32 pututline F
+GLIBC_2.32 pututxline F
+GLIBC_2.32 putw F
+GLIBC_2.32 putwc F
+GLIBC_2.32 putwc_unlocked F
+GLIBC_2.32 putwchar F
+GLIBC_2.32 putwchar_unlocked F
+GLIBC_2.32 pvalloc F
+GLIBC_2.32 pwrite F
+GLIBC_2.32 pwrite64 F
+GLIBC_2.32 pwritev F
+GLIBC_2.32 pwritev2 F
+GLIBC_2.32 pwritev64 F
+GLIBC_2.32 pwritev64v2 F
+GLIBC_2.32 qecvt F
+GLIBC_2.32 qecvt_r F
+GLIBC_2.32 qfcvt F
+GLIBC_2.32 qfcvt_r F
+GLIBC_2.32 qgcvt F
+GLIBC_2.32 qsort F
+GLIBC_2.32 qsort_r F
+GLIBC_2.32 quick_exit F
+GLIBC_2.32 quotactl F
+GLIBC_2.32 raise F
+GLIBC_2.32 rand F
+GLIBC_2.32 rand_r F
+GLIBC_2.32 random F
+GLIBC_2.32 random_r F
+GLIBC_2.32 rawmemchr F
+GLIBC_2.32 rcmd F
+GLIBC_2.32 rcmd_af F
+GLIBC_2.32 re_comp F
+GLIBC_2.32 re_compile_fastmap F
+GLIBC_2.32 re_compile_pattern F
+GLIBC_2.32 re_exec F
+GLIBC_2.32 re_match F
+GLIBC_2.32 re_match_2 F
+GLIBC_2.32 re_search F
+GLIBC_2.32 re_search_2 F
+GLIBC_2.32 re_set_registers F
+GLIBC_2.32 re_set_syntax F
+GLIBC_2.32 re_syntax_options D 0x4
+GLIBC_2.32 read F
+GLIBC_2.32 readahead F
+GLIBC_2.32 readdir F
+GLIBC_2.32 readdir64 F
+GLIBC_2.32 readdir64_r F
+GLIBC_2.32 readdir_r F
+GLIBC_2.32 readlink F
+GLIBC_2.32 readlinkat F
+GLIBC_2.32 readv F
+GLIBC_2.32 realloc F
+GLIBC_2.32 reallocarray F
+GLIBC_2.32 realpath F
+GLIBC_2.32 reboot F
+GLIBC_2.32 recv F
+GLIBC_2.32 recvfrom F
+GLIBC_2.32 recvmmsg F
+GLIBC_2.32 recvmsg F
+GLIBC_2.32 regcomp F
+GLIBC_2.32 regerror F
+GLIBC_2.32 regexec F
+GLIBC_2.32 regfree F
+GLIBC_2.32 register_printf_function F
+GLIBC_2.32 register_printf_modifier F
+GLIBC_2.32 register_printf_specifier F
+GLIBC_2.32 register_printf_type F
+GLIBC_2.32 registerrpc F
+GLIBC_2.32 remap_file_pages F
+GLIBC_2.32 remove F
+GLIBC_2.32 removexattr F
+GLIBC_2.32 remque F
+GLIBC_2.32 rename F
+GLIBC_2.32 renameat F
+GLIBC_2.32 renameat2 F
+GLIBC_2.32 revoke F
+GLIBC_2.32 rewind F
+GLIBC_2.32 rewinddir F
+GLIBC_2.32 rexec F
+GLIBC_2.32 rexec_af F
+GLIBC_2.32 rexecoptions D 0x4
+GLIBC_2.32 rindex F
+GLIBC_2.32 rmdir F
+GLIBC_2.32 rpc_createerr D 0x10
+GLIBC_2.32 rpmatch F
+GLIBC_2.32 rresvport F
+GLIBC_2.32 rresvport_af F
+GLIBC_2.32 rtime F
+GLIBC_2.32 ruserok F
+GLIBC_2.32 ruserok_af F
+GLIBC_2.32 ruserpass F
+GLIBC_2.32 sbrk F
+GLIBC_2.32 scalbn F
+GLIBC_2.32 scalbnf F
+GLIBC_2.32 scalbnl F
+GLIBC_2.32 scandir F
+GLIBC_2.32 scandir64 F
+GLIBC_2.32 scandirat F
+GLIBC_2.32 scandirat64 F
+GLIBC_2.32 scanf F
+GLIBC_2.32 sched_get_priority_max F
+GLIBC_2.32 sched_get_priority_min F
+GLIBC_2.32 sched_getaffinity F
+GLIBC_2.32 sched_getcpu F
+GLIBC_2.32 sched_getparam F
+GLIBC_2.32 sched_getscheduler F
+GLIBC_2.32 sched_rr_get_interval F
+GLIBC_2.32 sched_setaffinity F
+GLIBC_2.32 sched_setparam F
+GLIBC_2.32 sched_setscheduler F
+GLIBC_2.32 sched_yield F
+GLIBC_2.32 secure_getenv F
+GLIBC_2.32 seed48 F
+GLIBC_2.32 seed48_r F
+GLIBC_2.32 seekdir F
+GLIBC_2.32 select F
+GLIBC_2.32 semctl F
+GLIBC_2.32 semget F
+GLIBC_2.32 semop F
+GLIBC_2.32 semtimedop F
+GLIBC_2.32 send F
+GLIBC_2.32 sendfile F
+GLIBC_2.32 sendfile64 F
+GLIBC_2.32 sendmmsg F
+GLIBC_2.32 sendmsg F
+GLIBC_2.32 sendto F
+GLIBC_2.32 setaliasent F
+GLIBC_2.32 setbuf F
+GLIBC_2.32 setbuffer F
+GLIBC_2.32 setcontext F
+GLIBC_2.32 setdomainname F
+GLIBC_2.32 setegid F
+GLIBC_2.32 setenv F
+GLIBC_2.32 seteuid F
+GLIBC_2.32 setfsent F
+GLIBC_2.32 setfsgid F
+GLIBC_2.32 setfsuid F
+GLIBC_2.32 setgid F
+GLIBC_2.32 setgrent F
+GLIBC_2.32 setgroups F
+GLIBC_2.32 sethostent F
+GLIBC_2.32 sethostid F
+GLIBC_2.32 sethostname F
+GLIBC_2.32 setipv4sourcefilter F
+GLIBC_2.32 setitimer F
+GLIBC_2.32 setjmp F
+GLIBC_2.32 setlinebuf F
+GLIBC_2.32 setlocale F
+GLIBC_2.32 setlogin F
+GLIBC_2.32 setlogmask F
+GLIBC_2.32 setmntent F
+GLIBC_2.32 setnetent F
+GLIBC_2.32 setnetgrent F
+GLIBC_2.32 setns F
+GLIBC_2.32 setpgid F
+GLIBC_2.32 setpgrp F
+GLIBC_2.32 setpriority F
+GLIBC_2.32 setprotoent F
+GLIBC_2.32 setpwent F
+GLIBC_2.32 setregid F
+GLIBC_2.32 setresgid F
+GLIBC_2.32 setresuid F
+GLIBC_2.32 setreuid F
+GLIBC_2.32 setrlimit F
+GLIBC_2.32 setrlimit64 F
+GLIBC_2.32 setrpcent F
+GLIBC_2.32 setservent F
+GLIBC_2.32 setsgent F
+GLIBC_2.32 setsid F
+GLIBC_2.32 setsockopt F
+GLIBC_2.32 setsourcefilter F
+GLIBC_2.32 setspent F
+GLIBC_2.32 setstate F
+GLIBC_2.32 setstate_r F
+GLIBC_2.32 settimeofday F
+GLIBC_2.32 setttyent F
+GLIBC_2.32 setuid F
+GLIBC_2.32 setusershell F
+GLIBC_2.32 setutent F
+GLIBC_2.32 setutxent F
+GLIBC_2.32 setvbuf F
+GLIBC_2.32 setxattr F
+GLIBC_2.32 sgetsgent F
+GLIBC_2.32 sgetsgent_r F
+GLIBC_2.32 sgetspent F
+GLIBC_2.32 sgetspent_r F
+GLIBC_2.32 shmat F
+GLIBC_2.32 shmctl F
+GLIBC_2.32 shmdt F
+GLIBC_2.32 shmget F
+GLIBC_2.32 shutdown F
+GLIBC_2.32 sigaction F
+GLIBC_2.32 sigaddset F
+GLIBC_2.32 sigaltstack F
+GLIBC_2.32 sigandset F
+GLIBC_2.32 sigblock F
+GLIBC_2.32 sigdelset F
+GLIBC_2.32 sigemptyset F
+GLIBC_2.32 sigfillset F
+GLIBC_2.32 siggetmask F
+GLIBC_2.32 sighold F
+GLIBC_2.32 sigignore F
+GLIBC_2.32 siginterrupt F
+GLIBC_2.32 sigisemptyset F
+GLIBC_2.32 sigismember F
+GLIBC_2.32 siglongjmp F
+GLIBC_2.32 signal F
+GLIBC_2.32 signalfd F
+GLIBC_2.32 sigorset F
+GLIBC_2.32 sigpause F
+GLIBC_2.32 sigpending F
+GLIBC_2.32 sigprocmask F
+GLIBC_2.32 sigqueue F
+GLIBC_2.32 sigrelse F
+GLIBC_2.32 sigreturn F
+GLIBC_2.32 sigset F
+GLIBC_2.32 sigsetmask F
+GLIBC_2.32 sigstack F
+GLIBC_2.32 sigsuspend F
+GLIBC_2.32 sigtimedwait F
+GLIBC_2.32 sigwait F
+GLIBC_2.32 sigwaitinfo F
+GLIBC_2.32 sleep F
+GLIBC_2.32 snprintf F
+GLIBC_2.32 sockatmark F
+GLIBC_2.32 socket F
+GLIBC_2.32 socketpair F
+GLIBC_2.32 splice F
+GLIBC_2.32 sprintf F
+GLIBC_2.32 sprofil F
+GLIBC_2.32 srand F
+GLIBC_2.32 srand48 F
+GLIBC_2.32 srand48_r F
+GLIBC_2.32 srandom F
+GLIBC_2.32 srandom_r F
+GLIBC_2.32 sscanf F
+GLIBC_2.32 ssignal F
+GLIBC_2.32 sstk F
+GLIBC_2.32 statfs F
+GLIBC_2.32 statfs64 F
+GLIBC_2.32 statvfs F
+GLIBC_2.32 statvfs64 F
+GLIBC_2.32 statx F
+GLIBC_2.32 stderr D 0x4
+GLIBC_2.32 stdin D 0x4
+GLIBC_2.32 stdout D 0x4
+GLIBC_2.32 stpcpy F
+GLIBC_2.32 stpncpy F
+GLIBC_2.32 strcasecmp F
+GLIBC_2.32 strcasecmp_l F
+GLIBC_2.32 strcasestr F
+GLIBC_2.32 strcat F
+GLIBC_2.32 strchr F
+GLIBC_2.32 strchrnul F
+GLIBC_2.32 strcmp F
+GLIBC_2.32 strcoll F
+GLIBC_2.32 strcoll_l F
+GLIBC_2.32 strcpy F
+GLIBC_2.32 strcspn F
+GLIBC_2.32 strdup F
+GLIBC_2.32 strerror F
+GLIBC_2.32 strerror_l F
+GLIBC_2.32 strerror_r F
+GLIBC_2.32 strfmon F
+GLIBC_2.32 strfmon_l F
+GLIBC_2.32 strfromd F
+GLIBC_2.32 strfromf F
+GLIBC_2.32 strfromf32 F
+GLIBC_2.32 strfromf32x F
+GLIBC_2.32 strfromf64 F
+GLIBC_2.32 strfroml F
+GLIBC_2.32 strfry F
+GLIBC_2.32 strftime F
+GLIBC_2.32 strftime_l F
+GLIBC_2.32 strlen F
+GLIBC_2.32 strncasecmp F
+GLIBC_2.32 strncasecmp_l F
+GLIBC_2.32 strncat F
+GLIBC_2.32 strncmp F
+GLIBC_2.32 strncpy F
+GLIBC_2.32 strndup F
+GLIBC_2.32 strnlen F
+GLIBC_2.32 strpbrk F
+GLIBC_2.32 strptime F
+GLIBC_2.32 strptime_l F
+GLIBC_2.32 strrchr F
+GLIBC_2.32 strsep F
+GLIBC_2.32 strsignal F
+GLIBC_2.32 strspn F
+GLIBC_2.32 strstr F
+GLIBC_2.32 strtod F
+GLIBC_2.32 strtod_l F
+GLIBC_2.32 strtof F
+GLIBC_2.32 strtof32 F
+GLIBC_2.32 strtof32_l F
+GLIBC_2.32 strtof32x F
+GLIBC_2.32 strtof32x_l F
+GLIBC_2.32 strtof64 F
+GLIBC_2.32 strtof64_l F
+GLIBC_2.32 strtof_l F
+GLIBC_2.32 strtoimax F
+GLIBC_2.32 strtok F
+GLIBC_2.32 strtok_r F
+GLIBC_2.32 strtol F
+GLIBC_2.32 strtol_l F
+GLIBC_2.32 strtold F
+GLIBC_2.32 strtold_l F
+GLIBC_2.32 strtoll F
+GLIBC_2.32 strtoll_l F
+GLIBC_2.32 strtoq F
+GLIBC_2.32 strtoul F
+GLIBC_2.32 strtoul_l F
+GLIBC_2.32 strtoull F
+GLIBC_2.32 strtoull_l F
+GLIBC_2.32 strtoumax F
+GLIBC_2.32 strtouq F
+GLIBC_2.32 strverscmp F
+GLIBC_2.32 strxfrm F
+GLIBC_2.32 strxfrm_l F
+GLIBC_2.32 stty F
+GLIBC_2.32 svc_exit F
+GLIBC_2.32 svc_fdset D 0x80
+GLIBC_2.32 svc_getreq F
+GLIBC_2.32 svc_getreq_common F
+GLIBC_2.32 svc_getreq_poll F
+GLIBC_2.32 svc_getreqset F
+GLIBC_2.32 svc_max_pollfd D 0x4
+GLIBC_2.32 svc_pollfd D 0x4
+GLIBC_2.32 svc_register F
+GLIBC_2.32 svc_run F
+GLIBC_2.32 svc_sendreply F
+GLIBC_2.32 svc_unregister F
+GLIBC_2.32 svcauthdes_stats D 0xc
+GLIBC_2.32 svcerr_auth F
+GLIBC_2.32 svcerr_decode F
+GLIBC_2.32 svcerr_noproc F
+GLIBC_2.32 svcerr_noprog F
+GLIBC_2.32 svcerr_progvers F
+GLIBC_2.32 svcerr_systemerr F
+GLIBC_2.32 svcerr_weakauth F
+GLIBC_2.32 svcfd_create F
+GLIBC_2.32 svcraw_create F
+GLIBC_2.32 svctcp_create F
+GLIBC_2.32 svcudp_bufcreate F
+GLIBC_2.32 svcudp_create F
+GLIBC_2.32 svcudp_enablecache F
+GLIBC_2.32 svcunix_create F
+GLIBC_2.32 svcunixfd_create F
+GLIBC_2.32 swab F
+GLIBC_2.32 swapcontext F
+GLIBC_2.32 swapoff F
+GLIBC_2.32 swapon F
+GLIBC_2.32 swprintf F
+GLIBC_2.32 swscanf F
+GLIBC_2.32 symlink F
+GLIBC_2.32 symlinkat F
+GLIBC_2.32 sync F
+GLIBC_2.32 sync_file_range F
+GLIBC_2.32 syncfs F
+GLIBC_2.32 sys_errlist D 0x21c
+GLIBC_2.32 sys_nerr D 0x4
+GLIBC_2.32 sys_sigabbrev D 0x104
+GLIBC_2.32 sys_siglist D 0x104
+GLIBC_2.32 syscall F
+GLIBC_2.32 sysconf F
+GLIBC_2.32 sysinfo F
+GLIBC_2.32 syslog F
+GLIBC_2.32 system F
+GLIBC_2.32 sysv_signal F
+GLIBC_2.32 tcdrain F
+GLIBC_2.32 tcflow F
+GLIBC_2.32 tcflush F
+GLIBC_2.32 tcgetattr F
+GLIBC_2.32 tcgetpgrp F
+GLIBC_2.32 tcgetsid F
+GLIBC_2.32 tcsendbreak F
+GLIBC_2.32 tcsetattr F
+GLIBC_2.32 tcsetpgrp F
+GLIBC_2.32 tdelete F
+GLIBC_2.32 tdestroy F
+GLIBC_2.32 tee F
+GLIBC_2.32 telldir F
+GLIBC_2.32 tempnam F
+GLIBC_2.32 textdomain F
+GLIBC_2.32 tfind F
+GLIBC_2.32 tgkill F
+GLIBC_2.32 thrd_current F
+GLIBC_2.32 thrd_equal F
+GLIBC_2.32 thrd_sleep F
+GLIBC_2.32 thrd_yield F
+GLIBC_2.32 time F
+GLIBC_2.32 timegm F
+GLIBC_2.32 timelocal F
+GLIBC_2.32 timerfd_create F
+GLIBC_2.32 timerfd_gettime F
+GLIBC_2.32 timerfd_settime F
+GLIBC_2.32 times F
+GLIBC_2.32 timespec_get F
+GLIBC_2.32 timezone D 0x4
+GLIBC_2.32 tmpfile F
+GLIBC_2.32 tmpfile64 F
+GLIBC_2.32 tmpnam F
+GLIBC_2.32 tmpnam_r F
+GLIBC_2.32 toascii F
+GLIBC_2.32 tolower F
+GLIBC_2.32 tolower_l F
+GLIBC_2.32 toupper F
+GLIBC_2.32 toupper_l F
+GLIBC_2.32 towctrans F
+GLIBC_2.32 towctrans_l F
+GLIBC_2.32 towlower F
+GLIBC_2.32 towlower_l F
+GLIBC_2.32 towupper F
+GLIBC_2.32 towupper_l F
+GLIBC_2.32 tr_break F
+GLIBC_2.32 truncate F
+GLIBC_2.32 truncate64 F
+GLIBC_2.32 tsearch F
+GLIBC_2.32 ttyname F
+GLIBC_2.32 ttyname_r F
+GLIBC_2.32 ttyslot F
+GLIBC_2.32 twalk F
+GLIBC_2.32 twalk_r F
+GLIBC_2.32 tzname D 0x8
+GLIBC_2.32 tzset F
+GLIBC_2.32 ualarm F
+GLIBC_2.32 ulckpwdf F
+GLIBC_2.32 ulimit F
+GLIBC_2.32 umask F
+GLIBC_2.32 umount F
+GLIBC_2.32 umount2 F
+GLIBC_2.32 uname F
+GLIBC_2.32 ungetc F
+GLIBC_2.32 ungetwc F
+GLIBC_2.32 unlink F
+GLIBC_2.32 unlinkat F
+GLIBC_2.32 unlockpt F
+GLIBC_2.32 unsetenv F
+GLIBC_2.32 unshare F
+GLIBC_2.32 updwtmp F
+GLIBC_2.32 updwtmpx F
+GLIBC_2.32 uselocale F
+GLIBC_2.32 user2netname F
+GLIBC_2.32 usleep F
+GLIBC_2.32 utime F
+GLIBC_2.32 utimensat F
+GLIBC_2.32 utimes F
+GLIBC_2.32 utmpname F
+GLIBC_2.32 utmpxname F
+GLIBC_2.32 valloc F
+GLIBC_2.32 vasprintf F
+GLIBC_2.32 vdprintf F
+GLIBC_2.32 verr F
+GLIBC_2.32 verrx F
+GLIBC_2.32 versionsort F
+GLIBC_2.32 versionsort64 F
+GLIBC_2.32 vfork F
+GLIBC_2.32 vfprintf F
+GLIBC_2.32 vfscanf F
+GLIBC_2.32 vfwprintf F
+GLIBC_2.32 vfwscanf F
+GLIBC_2.32 vhangup F
+GLIBC_2.32 vlimit F
+GLIBC_2.32 vmsplice F
+GLIBC_2.32 vprintf F
+GLIBC_2.32 vscanf F
+GLIBC_2.32 vsnprintf F
+GLIBC_2.32 vsprintf F
+GLIBC_2.32 vsscanf F
+GLIBC_2.32 vswprintf F
+GLIBC_2.32 vswscanf F
+GLIBC_2.32 vsyslog F
+GLIBC_2.32 vtimes F
+GLIBC_2.32 vwarn F
+GLIBC_2.32 vwarnx F
+GLIBC_2.32 vwprintf F
+GLIBC_2.32 vwscanf F
+GLIBC_2.32 wait F
+GLIBC_2.32 wait3 F
+GLIBC_2.32 wait4 F
+GLIBC_2.32 waitid F
+GLIBC_2.32 waitpid F
+GLIBC_2.32 warn F
+GLIBC_2.32 warnx F
+GLIBC_2.32 wcpcpy F
+GLIBC_2.32 wcpncpy F
+GLIBC_2.32 wcrtomb F
+GLIBC_2.32 wcscasecmp F
+GLIBC_2.32 wcscasecmp_l F
+GLIBC_2.32 wcscat F
+GLIBC_2.32 wcschr F
+GLIBC_2.32 wcschrnul F
+GLIBC_2.32 wcscmp F
+GLIBC_2.32 wcscoll F
+GLIBC_2.32 wcscoll_l F
+GLIBC_2.32 wcscpy F
+GLIBC_2.32 wcscspn F
+GLIBC_2.32 wcsdup F
+GLIBC_2.32 wcsftime F
+GLIBC_2.32 wcsftime_l F
+GLIBC_2.32 wcslen F
+GLIBC_2.32 wcsncasecmp F
+GLIBC_2.32 wcsncasecmp_l F
+GLIBC_2.32 wcsncat F
+GLIBC_2.32 wcsncmp F
+GLIBC_2.32 wcsncpy F
+GLIBC_2.32 wcsnlen F
+GLIBC_2.32 wcsnrtombs F
+GLIBC_2.32 wcspbrk F
+GLIBC_2.32 wcsrchr F
+GLIBC_2.32 wcsrtombs F
+GLIBC_2.32 wcsspn F
+GLIBC_2.32 wcsstr F
+GLIBC_2.32 wcstod F
+GLIBC_2.32 wcstod_l F
+GLIBC_2.32 wcstof F
+GLIBC_2.32 wcstof32 F
+GLIBC_2.32 wcstof32_l F
+GLIBC_2.32 wcstof32x F
+GLIBC_2.32 wcstof32x_l F
+GLIBC_2.32 wcstof64 F
+GLIBC_2.32 wcstof64_l F
+GLIBC_2.32 wcstof_l F
+GLIBC_2.32 wcstoimax F
+GLIBC_2.32 wcstok F
+GLIBC_2.32 wcstol F
+GLIBC_2.32 wcstol_l F
+GLIBC_2.32 wcstold F
+GLIBC_2.32 wcstold_l F
+GLIBC_2.32 wcstoll F
+GLIBC_2.32 wcstoll_l F
+GLIBC_2.32 wcstombs F
+GLIBC_2.32 wcstoq F
+GLIBC_2.32 wcstoul F
+GLIBC_2.32 wcstoul_l F
+GLIBC_2.32 wcstoull F
+GLIBC_2.32 wcstoull_l F
+GLIBC_2.32 wcstoumax F
+GLIBC_2.32 wcstouq F
+GLIBC_2.32 wcswcs F
+GLIBC_2.32 wcswidth F
+GLIBC_2.32 wcsxfrm F
+GLIBC_2.32 wcsxfrm_l F
+GLIBC_2.32 wctob F
+GLIBC_2.32 wctomb F
+GLIBC_2.32 wctrans F
+GLIBC_2.32 wctrans_l F
+GLIBC_2.32 wctype F
+GLIBC_2.32 wctype_l F
+GLIBC_2.32 wcwidth F
+GLIBC_2.32 wmemchr F
+GLIBC_2.32 wmemcmp F
+GLIBC_2.32 wmemcpy F
+GLIBC_2.32 wmemmove F
+GLIBC_2.32 wmempcpy F
+GLIBC_2.32 wmemset F
+GLIBC_2.32 wordexp F
+GLIBC_2.32 wordfree F
+GLIBC_2.32 wprintf F
+GLIBC_2.32 write F
+GLIBC_2.32 writev F
+GLIBC_2.32 wscanf F
+GLIBC_2.32 xdecrypt F
+GLIBC_2.32 xdr_accepted_reply F
+GLIBC_2.32 xdr_array F
+GLIBC_2.32 xdr_authdes_cred F
+GLIBC_2.32 xdr_authdes_verf F
+GLIBC_2.32 xdr_authunix_parms F
+GLIBC_2.32 xdr_bool F
+GLIBC_2.32 xdr_bytes F
+GLIBC_2.32 xdr_callhdr F
+GLIBC_2.32 xdr_callmsg F
+GLIBC_2.32 xdr_char F
+GLIBC_2.32 xdr_cryptkeyarg F
+GLIBC_2.32 xdr_cryptkeyarg2 F
+GLIBC_2.32 xdr_cryptkeyres F
+GLIBC_2.32 xdr_des_block F
+GLIBC_2.32 xdr_double F
+GLIBC_2.32 xdr_enum F
+GLIBC_2.32 xdr_float F
+GLIBC_2.32 xdr_free F
+GLIBC_2.32 xdr_getcredres F
+GLIBC_2.32 xdr_hyper F
+GLIBC_2.32 xdr_int F
+GLIBC_2.32 xdr_int16_t F
+GLIBC_2.32 xdr_int32_t F
+GLIBC_2.32 xdr_int64_t F
+GLIBC_2.32 xdr_int8_t F
+GLIBC_2.32 xdr_key_netstarg F
+GLIBC_2.32 xdr_key_netstres F
+GLIBC_2.32 xdr_keybuf F
+GLIBC_2.32 xdr_keystatus F
+GLIBC_2.32 xdr_long F
+GLIBC_2.32 xdr_longlong_t F
+GLIBC_2.32 xdr_netnamestr F
+GLIBC_2.32 xdr_netobj F
+GLIBC_2.32 xdr_opaque F
+GLIBC_2.32 xdr_opaque_auth F
+GLIBC_2.32 xdr_pmap F
+GLIBC_2.32 xdr_pmaplist F
+GLIBC_2.32 xdr_pointer F
+GLIBC_2.32 xdr_quad_t F
+GLIBC_2.32 xdr_reference F
+GLIBC_2.32 xdr_rejected_reply F
+GLIBC_2.32 xdr_replymsg F
+GLIBC_2.32 xdr_rmtcall_args F
+GLIBC_2.32 xdr_rmtcallres F
+GLIBC_2.32 xdr_short F
+GLIBC_2.32 xdr_sizeof F
+GLIBC_2.32 xdr_string F
+GLIBC_2.32 xdr_u_char F
+GLIBC_2.32 xdr_u_hyper F
+GLIBC_2.32 xdr_u_int F
+GLIBC_2.32 xdr_u_long F
+GLIBC_2.32 xdr_u_longlong_t F
+GLIBC_2.32 xdr_u_quad_t F
+GLIBC_2.32 xdr_u_short F
+GLIBC_2.32 xdr_uint16_t F
+GLIBC_2.32 xdr_uint32_t F
+GLIBC_2.32 xdr_uint64_t F
+GLIBC_2.32 xdr_uint8_t F
+GLIBC_2.32 xdr_union F
+GLIBC_2.32 xdr_unixcred F
+GLIBC_2.32 xdr_vector F
+GLIBC_2.32 xdr_void F
+GLIBC_2.32 xdr_wrapstring F
+GLIBC_2.32 xdrmem_create F
+GLIBC_2.32 xdrrec_create F
+GLIBC_2.32 xdrrec_endofrecord F
+GLIBC_2.32 xdrrec_eof F
+GLIBC_2.32 xdrrec_skiprecord F
+GLIBC_2.32 xdrstdio_create F
+GLIBC_2.32 xencrypt F
+GLIBC_2.32 xprt_register F
+GLIBC_2.32 xprt_unregister F
diff --git a/sysdeps/unix/sysv/linux/arc/libcrypt.abilist b/sysdeps/unix/sysv/linux/arc/libcrypt.abilist
new file mode 100644
index 000000000000..6bd253453e99
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libcrypt.abilist
@@ -0,0 +1,2 @@
+GLIBC_2.32 crypt F
+GLIBC_2.32 crypt_r F
diff --git a/sysdeps/unix/sysv/linux/arc/libdl.abilist b/sysdeps/unix/sysv/linux/arc/libdl.abilist
new file mode 100644
index 000000000000..bf20b0c4044f
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libdl.abilist
@@ -0,0 +1,9 @@
+GLIBC_2.32 dladdr F
+GLIBC_2.32 dladdr1 F
+GLIBC_2.32 dlclose F
+GLIBC_2.32 dlerror F
+GLIBC_2.32 dlinfo F
+GLIBC_2.32 dlmopen F
+GLIBC_2.32 dlopen F
+GLIBC_2.32 dlsym F
+GLIBC_2.32 dlvsym F
diff --git a/sysdeps/unix/sysv/linux/arc/libm.abilist b/sysdeps/unix/sysv/linux/arc/libm.abilist
new file mode 100644
index 000000000000..4338563657b8
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libm.abilist
@@ -0,0 +1,699 @@
+GLIBC_2.32 __clog10 F
+GLIBC_2.32 __clog10f F
+GLIBC_2.32 __clog10l F
+GLIBC_2.32 __finite F
+GLIBC_2.32 __finitef F
+GLIBC_2.32 __fpclassify F
+GLIBC_2.32 __fpclassifyf F
+GLIBC_2.32 __iseqsig F
+GLIBC_2.32 __iseqsigf F
+GLIBC_2.32 __issignaling F
+GLIBC_2.32 __issignalingf F
+GLIBC_2.32 __signbit F
+GLIBC_2.32 __signbitf F
+GLIBC_2.32 __signgam D 0x4
+GLIBC_2.32 acos F
+GLIBC_2.32 acosf F
+GLIBC_2.32 acosf32 F
+GLIBC_2.32 acosf32x F
+GLIBC_2.32 acosf64 F
+GLIBC_2.32 acosh F
+GLIBC_2.32 acoshf F
+GLIBC_2.32 acoshf32 F
+GLIBC_2.32 acoshf32x F
+GLIBC_2.32 acoshf64 F
+GLIBC_2.32 acoshl F
+GLIBC_2.32 acosl F
+GLIBC_2.32 asin F
+GLIBC_2.32 asinf F
+GLIBC_2.32 asinf32 F
+GLIBC_2.32 asinf32x F
+GLIBC_2.32 asinf64 F
+GLIBC_2.32 asinh F
+GLIBC_2.32 asinhf F
+GLIBC_2.32 asinhf32 F
+GLIBC_2.32 asinhf32x F
+GLIBC_2.32 asinhf64 F
+GLIBC_2.32 asinhl F
+GLIBC_2.32 asinl F
+GLIBC_2.32 atan F
+GLIBC_2.32 atan2 F
+GLIBC_2.32 atan2f F
+GLIBC_2.32 atan2f32 F
+GLIBC_2.32 atan2f32x F
+GLIBC_2.32 atan2f64 F
+GLIBC_2.32 atan2l F
+GLIBC_2.32 atanf F
+GLIBC_2.32 atanf32 F
+GLIBC_2.32 atanf32x F
+GLIBC_2.32 atanf64 F
+GLIBC_2.32 atanh F
+GLIBC_2.32 atanhf F
+GLIBC_2.32 atanhf32 F
+GLIBC_2.32 atanhf32x F
+GLIBC_2.32 atanhf64 F
+GLIBC_2.32 atanhl F
+GLIBC_2.32 atanl F
+GLIBC_2.32 cabs F
+GLIBC_2.32 cabsf F
+GLIBC_2.32 cabsf32 F
+GLIBC_2.32 cabsf32x F
+GLIBC_2.32 cabsf64 F
+GLIBC_2.32 cabsl F
+GLIBC_2.32 cacos F
+GLIBC_2.32 cacosf F
+GLIBC_2.32 cacosf32 F
+GLIBC_2.32 cacosf32x F
+GLIBC_2.32 cacosf64 F
+GLIBC_2.32 cacosh F
+GLIBC_2.32 cacoshf F
+GLIBC_2.32 cacoshf32 F
+GLIBC_2.32 cacoshf32x F
+GLIBC_2.32 cacoshf64 F
+GLIBC_2.32 cacoshl F
+GLIBC_2.32 cacosl F
+GLIBC_2.32 canonicalize F
+GLIBC_2.32 canonicalizef F
+GLIBC_2.32 canonicalizef32 F
+GLIBC_2.32 canonicalizef32x F
+GLIBC_2.32 canonicalizef64 F
+GLIBC_2.32 canonicalizel F
+GLIBC_2.32 carg F
+GLIBC_2.32 cargf F
+GLIBC_2.32 cargf32 F
+GLIBC_2.32 cargf32x F
+GLIBC_2.32 cargf64 F
+GLIBC_2.32 cargl F
+GLIBC_2.32 casin F
+GLIBC_2.32 casinf F
+GLIBC_2.32 casinf32 F
+GLIBC_2.32 casinf32x F
+GLIBC_2.32 casinf64 F
+GLIBC_2.32 casinh F
+GLIBC_2.32 casinhf F
+GLIBC_2.32 casinhf32 F
+GLIBC_2.32 casinhf32x F
+GLIBC_2.32 casinhf64 F
+GLIBC_2.32 casinhl F
+GLIBC_2.32 casinl F
+GLIBC_2.32 catan F
+GLIBC_2.32 catanf F
+GLIBC_2.32 catanf32 F
+GLIBC_2.32 catanf32x F
+GLIBC_2.32 catanf64 F
+GLIBC_2.32 catanh F
+GLIBC_2.32 catanhf F
+GLIBC_2.32 catanhf32 F
+GLIBC_2.32 catanhf32x F
+GLIBC_2.32 catanhf64 F
+GLIBC_2.32 catanhl F
+GLIBC_2.32 catanl F
+GLIBC_2.32 cbrt F
+GLIBC_2.32 cbrtf F
+GLIBC_2.32 cbrtf32 F
+GLIBC_2.32 cbrtf32x F
+GLIBC_2.32 cbrtf64 F
+GLIBC_2.32 cbrtl F
+GLIBC_2.32 ccos F
+GLIBC_2.32 ccosf F
+GLIBC_2.32 ccosf32 F
+GLIBC_2.32 ccosf32x F
+GLIBC_2.32 ccosf64 F
+GLIBC_2.32 ccosh F
+GLIBC_2.32 ccoshf F
+GLIBC_2.32 ccoshf32 F
+GLIBC_2.32 ccoshf32x F
+GLIBC_2.32 ccoshf64 F
+GLIBC_2.32 ccoshl F
+GLIBC_2.32 ccosl F
+GLIBC_2.32 ceil F
+GLIBC_2.32 ceilf F
+GLIBC_2.32 ceilf32 F
+GLIBC_2.32 ceilf32x F
+GLIBC_2.32 ceilf64 F
+GLIBC_2.32 ceill F
+GLIBC_2.32 cexp F
+GLIBC_2.32 cexpf F
+GLIBC_2.32 cexpf32 F
+GLIBC_2.32 cexpf32x F
+GLIBC_2.32 cexpf64 F
+GLIBC_2.32 cexpl F
+GLIBC_2.32 cimag F
+GLIBC_2.32 cimagf F
+GLIBC_2.32 cimagf32 F
+GLIBC_2.32 cimagf32x F
+GLIBC_2.32 cimagf64 F
+GLIBC_2.32 cimagl F
+GLIBC_2.32 clog F
+GLIBC_2.32 clog10 F
+GLIBC_2.32 clog10f F
+GLIBC_2.32 clog10f32 F
+GLIBC_2.32 clog10f32x F
+GLIBC_2.32 clog10f64 F
+GLIBC_2.32 clog10l F
+GLIBC_2.32 clogf F
+GLIBC_2.32 clogf32 F
+GLIBC_2.32 clogf32x F
+GLIBC_2.32 clogf64 F
+GLIBC_2.32 clogl F
+GLIBC_2.32 conj F
+GLIBC_2.32 conjf F
+GLIBC_2.32 conjf32 F
+GLIBC_2.32 conjf32x F
+GLIBC_2.32 conjf64 F
+GLIBC_2.32 conjl F
+GLIBC_2.32 copysign F
+GLIBC_2.32 copysignf F
+GLIBC_2.32 copysignf32 F
+GLIBC_2.32 copysignf32x F
+GLIBC_2.32 copysignf64 F
+GLIBC_2.32 copysignl F
+GLIBC_2.32 cos F
+GLIBC_2.32 cosf F
+GLIBC_2.32 cosf32 F
+GLIBC_2.32 cosf32x F
+GLIBC_2.32 cosf64 F
+GLIBC_2.32 cosh F
+GLIBC_2.32 coshf F
+GLIBC_2.32 coshf32 F
+GLIBC_2.32 coshf32x F
+GLIBC_2.32 coshf64 F
+GLIBC_2.32 coshl F
+GLIBC_2.32 cosl F
+GLIBC_2.32 cpow F
+GLIBC_2.32 cpowf F
+GLIBC_2.32 cpowf32 F
+GLIBC_2.32 cpowf32x F
+GLIBC_2.32 cpowf64 F
+GLIBC_2.32 cpowl F
+GLIBC_2.32 cproj F
+GLIBC_2.32 cprojf F
+GLIBC_2.32 cprojf32 F
+GLIBC_2.32 cprojf32x F
+GLIBC_2.32 cprojf64 F
+GLIBC_2.32 cprojl F
+GLIBC_2.32 creal F
+GLIBC_2.32 crealf F
+GLIBC_2.32 crealf32 F
+GLIBC_2.32 crealf32x F
+GLIBC_2.32 crealf64 F
+GLIBC_2.32 creall F
+GLIBC_2.32 csin F
+GLIBC_2.32 csinf F
+GLIBC_2.32 csinf32 F
+GLIBC_2.32 csinf32x F
+GLIBC_2.32 csinf64 F
+GLIBC_2.32 csinh F
+GLIBC_2.32 csinhf F
+GLIBC_2.32 csinhf32 F
+GLIBC_2.32 csinhf32x F
+GLIBC_2.32 csinhf64 F
+GLIBC_2.32 csinhl F
+GLIBC_2.32 csinl F
+GLIBC_2.32 csqrt F
+GLIBC_2.32 csqrtf F
+GLIBC_2.32 csqrtf32 F
+GLIBC_2.32 csqrtf32x F
+GLIBC_2.32 csqrtf64 F
+GLIBC_2.32 csqrtl F
+GLIBC_2.32 ctan F
+GLIBC_2.32 ctanf F
+GLIBC_2.32 ctanf32 F
+GLIBC_2.32 ctanf32x F
+GLIBC_2.32 ctanf64 F
+GLIBC_2.32 ctanh F
+GLIBC_2.32 ctanhf F
+GLIBC_2.32 ctanhf32 F
+GLIBC_2.32 ctanhf32x F
+GLIBC_2.32 ctanhf64 F
+GLIBC_2.32 ctanhl F
+GLIBC_2.32 ctanl F
+GLIBC_2.32 daddl F
+GLIBC_2.32 ddivl F
+GLIBC_2.32 dmull F
+GLIBC_2.32 drem F
+GLIBC_2.32 dremf F
+GLIBC_2.32 dreml F
+GLIBC_2.32 dsubl F
+GLIBC_2.32 erf F
+GLIBC_2.32 erfc F
+GLIBC_2.32 erfcf F
+GLIBC_2.32 erfcf32 F
+GLIBC_2.32 erfcf32x F
+GLIBC_2.32 erfcf64 F
+GLIBC_2.32 erfcl F
+GLIBC_2.32 erff F
+GLIBC_2.32 erff32 F
+GLIBC_2.32 erff32x F
+GLIBC_2.32 erff64 F
+GLIBC_2.32 erfl F
+GLIBC_2.32 exp F
+GLIBC_2.32 exp10 F
+GLIBC_2.32 exp10f F
+GLIBC_2.32 exp10f32 F
+GLIBC_2.32 exp10f32x F
+GLIBC_2.32 exp10f64 F
+GLIBC_2.32 exp10l F
+GLIBC_2.32 exp2 F
+GLIBC_2.32 exp2f F
+GLIBC_2.32 exp2f32 F
+GLIBC_2.32 exp2f32x F
+GLIBC_2.32 exp2f64 F
+GLIBC_2.32 exp2l F
+GLIBC_2.32 expf F
+GLIBC_2.32 expf32 F
+GLIBC_2.32 expf32x F
+GLIBC_2.32 expf64 F
+GLIBC_2.32 expl F
+GLIBC_2.32 expm1 F
+GLIBC_2.32 expm1f F
+GLIBC_2.32 expm1f32 F
+GLIBC_2.32 expm1f32x F
+GLIBC_2.32 expm1f64 F
+GLIBC_2.32 expm1l F
+GLIBC_2.32 f32addf32x F
+GLIBC_2.32 f32addf64 F
+GLIBC_2.32 f32divf32x F
+GLIBC_2.32 f32divf64 F
+GLIBC_2.32 f32mulf32x F
+GLIBC_2.32 f32mulf64 F
+GLIBC_2.32 f32subf32x F
+GLIBC_2.32 f32subf64 F
+GLIBC_2.32 f32xaddf64 F
+GLIBC_2.32 f32xdivf64 F
+GLIBC_2.32 f32xmulf64 F
+GLIBC_2.32 f32xsubf64 F
+GLIBC_2.32 fabs F
+GLIBC_2.32 fabsf F
+GLIBC_2.32 fabsf32 F
+GLIBC_2.32 fabsf32x F
+GLIBC_2.32 fabsf64 F
+GLIBC_2.32 fabsl F
+GLIBC_2.32 fadd F
+GLIBC_2.32 faddl F
+GLIBC_2.32 fdim F
+GLIBC_2.32 fdimf F
+GLIBC_2.32 fdimf32 F
+GLIBC_2.32 fdimf32x F
+GLIBC_2.32 fdimf64 F
+GLIBC_2.32 fdiml F
+GLIBC_2.32 fdiv F
+GLIBC_2.32 fdivl F
+GLIBC_2.32 feclearexcept F
+GLIBC_2.32 fedisableexcept F
+GLIBC_2.32 feenableexcept F
+GLIBC_2.32 fegetenv F
+GLIBC_2.32 fegetexcept F
+GLIBC_2.32 fegetexceptflag F
+GLIBC_2.32 fegetmode F
+GLIBC_2.32 fegetround F
+GLIBC_2.32 feholdexcept F
+GLIBC_2.32 feraiseexcept F
+GLIBC_2.32 fesetenv F
+GLIBC_2.32 fesetexcept F
+GLIBC_2.32 fesetexceptflag F
+GLIBC_2.32 fesetmode F
+GLIBC_2.32 fesetround F
+GLIBC_2.32 fetestexcept F
+GLIBC_2.32 fetestexceptflag F
+GLIBC_2.32 feupdateenv F
+GLIBC_2.32 finite F
+GLIBC_2.32 finitef F
+GLIBC_2.32 finitel F
+GLIBC_2.32 floor F
+GLIBC_2.32 floorf F
+GLIBC_2.32 floorf32 F
+GLIBC_2.32 floorf32x F
+GLIBC_2.32 floorf64 F
+GLIBC_2.32 floorl F
+GLIBC_2.32 fma F
+GLIBC_2.32 fmaf F
+GLIBC_2.32 fmaf32 F
+GLIBC_2.32 fmaf32x F
+GLIBC_2.32 fmaf64 F
+GLIBC_2.32 fmal F
+GLIBC_2.32 fmax F
+GLIBC_2.32 fmaxf F
+GLIBC_2.32 fmaxf32 F
+GLIBC_2.32 fmaxf32x F
+GLIBC_2.32 fmaxf64 F
+GLIBC_2.32 fmaxl F
+GLIBC_2.32 fmaxmag F
+GLIBC_2.32 fmaxmagf F
+GLIBC_2.32 fmaxmagf32 F
+GLIBC_2.32 fmaxmagf32x F
+GLIBC_2.32 fmaxmagf64 F
+GLIBC_2.32 fmaxmagl F
+GLIBC_2.32 fmin F
+GLIBC_2.32 fminf F
+GLIBC_2.32 fminf32 F
+GLIBC_2.32 fminf32x F
+GLIBC_2.32 fminf64 F
+GLIBC_2.32 fminl F
+GLIBC_2.32 fminmag F
+GLIBC_2.32 fminmagf F
+GLIBC_2.32 fminmagf32 F
+GLIBC_2.32 fminmagf32x F
+GLIBC_2.32 fminmagf64 F
+GLIBC_2.32 fminmagl F
+GLIBC_2.32 fmod F
+GLIBC_2.32 fmodf F
+GLIBC_2.32 fmodf32 F
+GLIBC_2.32 fmodf32x F
+GLIBC_2.32 fmodf64 F
+GLIBC_2.32 fmodl F
+GLIBC_2.32 fmul F
+GLIBC_2.32 fmull F
+GLIBC_2.32 frexp F
+GLIBC_2.32 frexpf F
+GLIBC_2.32 frexpf32 F
+GLIBC_2.32 frexpf32x F
+GLIBC_2.32 frexpf64 F
+GLIBC_2.32 frexpl F
+GLIBC_2.32 fromfp F
+GLIBC_2.32 fromfpf F
+GLIBC_2.32 fromfpf32 F
+GLIBC_2.32 fromfpf32x F
+GLIBC_2.32 fromfpf64 F
+GLIBC_2.32 fromfpl F
+GLIBC_2.32 fromfpx F
+GLIBC_2.32 fromfpxf F
+GLIBC_2.32 fromfpxf32 F
+GLIBC_2.32 fromfpxf32x F
+GLIBC_2.32 fromfpxf64 F
+GLIBC_2.32 fromfpxl F
+GLIBC_2.32 fsub F
+GLIBC_2.32 fsubl F
+GLIBC_2.32 gamma F
+GLIBC_2.32 gammaf F
+GLIBC_2.32 gammal F
+GLIBC_2.32 getpayload F
+GLIBC_2.32 getpayloadf F
+GLIBC_2.32 getpayloadf32 F
+GLIBC_2.32 getpayloadf32x F
+GLIBC_2.32 getpayloadf64 F
+GLIBC_2.32 getpayloadl F
+GLIBC_2.32 hypot F
+GLIBC_2.32 hypotf F
+GLIBC_2.32 hypotf32 F
+GLIBC_2.32 hypotf32x F
+GLIBC_2.32 hypotf64 F
+GLIBC_2.32 hypotl F
+GLIBC_2.32 ilogb F
+GLIBC_2.32 ilogbf F
+GLIBC_2.32 ilogbf32 F
+GLIBC_2.32 ilogbf32x F
+GLIBC_2.32 ilogbf64 F
+GLIBC_2.32 ilogbl F
+GLIBC_2.32 j0 F
+GLIBC_2.32 j0f F
+GLIBC_2.32 j0f32 F
+GLIBC_2.32 j0f32x F
+GLIBC_2.32 j0f64 F
+GLIBC_2.32 j0l F
+GLIBC_2.32 j1 F
+GLIBC_2.32 j1f F
+GLIBC_2.32 j1f32 F
+GLIBC_2.32 j1f32x F
+GLIBC_2.32 j1f64 F
+GLIBC_2.32 j1l F
+GLIBC_2.32 jn F
+GLIBC_2.32 jnf F
+GLIBC_2.32 jnf32 F
+GLIBC_2.32 jnf32x F
+GLIBC_2.32 jnf64 F
+GLIBC_2.32 jnl F
+GLIBC_2.32 ldexp F
+GLIBC_2.32 ldexpf F
+GLIBC_2.32 ldexpf32 F
+GLIBC_2.32 ldexpf32x F
+GLIBC_2.32 ldexpf64 F
+GLIBC_2.32 ldexpl F
+GLIBC_2.32 lgamma F
+GLIBC_2.32 lgamma_r F
+GLIBC_2.32 lgammaf F
+GLIBC_2.32 lgammaf32 F
+GLIBC_2.32 lgammaf32_r F
+GLIBC_2.32 lgammaf32x F
+GLIBC_2.32 lgammaf32x_r F
+GLIBC_2.32 lgammaf64 F
+GLIBC_2.32 lgammaf64_r F
+GLIBC_2.32 lgammaf_r F
+GLIBC_2.32 lgammal F
+GLIBC_2.32 lgammal_r F
+GLIBC_2.32 llogb F
+GLIBC_2.32 llogbf F
+GLIBC_2.32 llogbf32 F
+GLIBC_2.32 llogbf32x F
+GLIBC_2.32 llogbf64 F
+GLIBC_2.32 llogbl F
+GLIBC_2.32 llrint F
+GLIBC_2.32 llrintf F
+GLIBC_2.32 llrintf32 F
+GLIBC_2.32 llrintf32x F
+GLIBC_2.32 llrintf64 F
+GLIBC_2.32 llrintl F
+GLIBC_2.32 llround F
+GLIBC_2.32 llroundf F
+GLIBC_2.32 llroundf32 F
+GLIBC_2.32 llroundf32x F
+GLIBC_2.32 llroundf64 F
+GLIBC_2.32 llroundl F
+GLIBC_2.32 log F
+GLIBC_2.32 log10 F
+GLIBC_2.32 log10f F
+GLIBC_2.32 log10f32 F
+GLIBC_2.32 log10f32x F
+GLIBC_2.32 log10f64 F
+GLIBC_2.32 log10l F
+GLIBC_2.32 log1p F
+GLIBC_2.32 log1pf F
+GLIBC_2.32 log1pf32 F
+GLIBC_2.32 log1pf32x F
+GLIBC_2.32 log1pf64 F
+GLIBC_2.32 log1pl F
+GLIBC_2.32 log2 F
+GLIBC_2.32 log2f F
+GLIBC_2.32 log2f32 F
+GLIBC_2.32 log2f32x F
+GLIBC_2.32 log2f64 F
+GLIBC_2.32 log2l F
+GLIBC_2.32 logb F
+GLIBC_2.32 logbf F
+GLIBC_2.32 logbf32 F
+GLIBC_2.32 logbf32x F
+GLIBC_2.32 logbf64 F
+GLIBC_2.32 logbl F
+GLIBC_2.32 logf F
+GLIBC_2.32 logf32 F
+GLIBC_2.32 logf32x F
+GLIBC_2.32 logf64 F
+GLIBC_2.32 logl F
+GLIBC_2.32 lrint F
+GLIBC_2.32 lrintf F
+GLIBC_2.32 lrintf32 F
+GLIBC_2.32 lrintf32x F
+GLIBC_2.32 lrintf64 F
+GLIBC_2.32 lrintl F
+GLIBC_2.32 lround F
+GLIBC_2.32 lroundf F
+GLIBC_2.32 lroundf32 F
+GLIBC_2.32 lroundf32x F
+GLIBC_2.32 lroundf64 F
+GLIBC_2.32 lroundl F
+GLIBC_2.32 modf F
+GLIBC_2.32 modff F
+GLIBC_2.32 modff32 F
+GLIBC_2.32 modff32x F
+GLIBC_2.32 modff64 F
+GLIBC_2.32 modfl F
+GLIBC_2.32 nan F
+GLIBC_2.32 nanf F
+GLIBC_2.32 nanf32 F
+GLIBC_2.32 nanf32x F
+GLIBC_2.32 nanf64 F
+GLIBC_2.32 nanl F
+GLIBC_2.32 nearbyint F
+GLIBC_2.32 nearbyintf F
+GLIBC_2.32 nearbyintf32 F
+GLIBC_2.32 nearbyintf32x F
+GLIBC_2.32 nearbyintf64 F
+GLIBC_2.32 nearbyintl F
+GLIBC_2.32 nextafter F
+GLIBC_2.32 nextafterf F
+GLIBC_2.32 nextafterf32 F
+GLIBC_2.32 nextafterf32x F
+GLIBC_2.32 nextafterf64 F
+GLIBC_2.32 nextafterl F
+GLIBC_2.32 nextdown F
+GLIBC_2.32 nextdownf F
+GLIBC_2.32 nextdownf32 F
+GLIBC_2.32 nextdownf32x F
+GLIBC_2.32 nextdownf64 F
+GLIBC_2.32 nextdownl F
+GLIBC_2.32 nexttoward F
+GLIBC_2.32 nexttowardf F
+GLIBC_2.32 nexttowardl F
+GLIBC_2.32 nextup F
+GLIBC_2.32 nextupf F
+GLIBC_2.32 nextupf32 F
+GLIBC_2.32 nextupf32x F
+GLIBC_2.32 nextupf64 F
+GLIBC_2.32 nextupl F
+GLIBC_2.32 pow F
+GLIBC_2.32 powf F
+GLIBC_2.32 powf32 F
+GLIBC_2.32 powf32x F
+GLIBC_2.32 powf64 F
+GLIBC_2.32 powl F
+GLIBC_2.32 remainder F
+GLIBC_2.32 remainderf F
+GLIBC_2.32 remainderf32 F
+GLIBC_2.32 remainderf32x F
+GLIBC_2.32 remainderf64 F
+GLIBC_2.32 remainderl F
+GLIBC_2.32 remquo F
+GLIBC_2.32 remquof F
+GLIBC_2.32 remquof32 F
+GLIBC_2.32 remquof32x F
+GLIBC_2.32 remquof64 F
+GLIBC_2.32 remquol F
+GLIBC_2.32 rint F
+GLIBC_2.32 rintf F
+GLIBC_2.32 rintf32 F
+GLIBC_2.32 rintf32x F
+GLIBC_2.32 rintf64 F
+GLIBC_2.32 rintl F
+GLIBC_2.32 round F
+GLIBC_2.32 roundeven F
+GLIBC_2.32 roundevenf F
+GLIBC_2.32 roundevenf32 F
+GLIBC_2.32 roundevenf32x F
+GLIBC_2.32 roundevenf64 F
+GLIBC_2.32 roundevenl F
+GLIBC_2.32 roundf F
+GLIBC_2.32 roundf32 F
+GLIBC_2.32 roundf32x F
+GLIBC_2.32 roundf64 F
+GLIBC_2.32 roundl F
+GLIBC_2.32 scalb F
+GLIBC_2.32 scalbf F
+GLIBC_2.32 scalbl F
+GLIBC_2.32 scalbln F
+GLIBC_2.32 scalblnf F
+GLIBC_2.32 scalblnf32 F
+GLIBC_2.32 scalblnf32x F
+GLIBC_2.32 scalblnf64 F
+GLIBC_2.32 scalblnl F
+GLIBC_2.32 scalbn F
+GLIBC_2.32 scalbnf F
+GLIBC_2.32 scalbnf32 F
+GLIBC_2.32 scalbnf32x F
+GLIBC_2.32 scalbnf64 F
+GLIBC_2.32 scalbnl F
+GLIBC_2.32 setpayload F
+GLIBC_2.32 setpayloadf F
+GLIBC_2.32 setpayloadf32 F
+GLIBC_2.32 setpayloadf32x F
+GLIBC_2.32 setpayloadf64 F
+GLIBC_2.32 setpayloadl F
+GLIBC_2.32 setpayloadsig F
+GLIBC_2.32 setpayloadsigf F
+GLIBC_2.32 setpayloadsigf32 F
+GLIBC_2.32 setpayloadsigf32x F
+GLIBC_2.32 setpayloadsigf64 F
+GLIBC_2.32 setpayloadsigl F
+GLIBC_2.32 signgam D 0x4
+GLIBC_2.32 significand F
+GLIBC_2.32 significandf F
+GLIBC_2.32 significandl F
+GLIBC_2.32 sin F
+GLIBC_2.32 sincos F
+GLIBC_2.32 sincosf F
+GLIBC_2.32 sincosf32 F
+GLIBC_2.32 sincosf32x F
+GLIBC_2.32 sincosf64 F
+GLIBC_2.32 sincosl F
+GLIBC_2.32 sinf F
+GLIBC_2.32 sinf32 F
+GLIBC_2.32 sinf32x F
+GLIBC_2.32 sinf64 F
+GLIBC_2.32 sinh F
+GLIBC_2.32 sinhf F
+GLIBC_2.32 sinhf32 F
+GLIBC_2.32 sinhf32x F
+GLIBC_2.32 sinhf64 F
+GLIBC_2.32 sinhl F
+GLIBC_2.32 sinl F
+GLIBC_2.32 sqrt F
+GLIBC_2.32 sqrtf F
+GLIBC_2.32 sqrtf32 F
+GLIBC_2.32 sqrtf32x F
+GLIBC_2.32 sqrtf64 F
+GLIBC_2.32 sqrtl F
+GLIBC_2.32 tan F
+GLIBC_2.32 tanf F
+GLIBC_2.32 tanf32 F
+GLIBC_2.32 tanf32x F
+GLIBC_2.32 tanf64 F
+GLIBC_2.32 tanh F
+GLIBC_2.32 tanhf F
+GLIBC_2.32 tanhf32 F
+GLIBC_2.32 tanhf32x F
+GLIBC_2.32 tanhf64 F
+GLIBC_2.32 tanhl F
+GLIBC_2.32 tanl F
+GLIBC_2.32 tgamma F
+GLIBC_2.32 tgammaf F
+GLIBC_2.32 tgammaf32 F
+GLIBC_2.32 tgammaf32x F
+GLIBC_2.32 tgammaf64 F
+GLIBC_2.32 tgammal F
+GLIBC_2.32 totalorder F
+GLIBC_2.32 totalorderf F
+GLIBC_2.32 totalorderf32 F
+GLIBC_2.32 totalorderf32x F
+GLIBC_2.32 totalorderf64 F
+GLIBC_2.32 totalorderl F
+GLIBC_2.32 totalordermag F
+GLIBC_2.32 totalordermagf F
+GLIBC_2.32 totalordermagf32 F
+GLIBC_2.32 totalordermagf32x F
+GLIBC_2.32 totalordermagf64 F
+GLIBC_2.32 totalordermagl F
+GLIBC_2.32 trunc F
+GLIBC_2.32 truncf F
+GLIBC_2.32 truncf32 F
+GLIBC_2.32 truncf32x F
+GLIBC_2.32 truncf64 F
+GLIBC_2.32 truncl F
+GLIBC_2.32 ufromfp F
+GLIBC_2.32 ufromfpf F
+GLIBC_2.32 ufromfpf32 F
+GLIBC_2.32 ufromfpf32x F
+GLIBC_2.32 ufromfpf64 F
+GLIBC_2.32 ufromfpl F
+GLIBC_2.32 ufromfpx F
+GLIBC_2.32 ufromfpxf F
+GLIBC_2.32 ufromfpxf32 F
+GLIBC_2.32 ufromfpxf32x F
+GLIBC_2.32 ufromfpxf64 F
+GLIBC_2.32 ufromfpxl F
+GLIBC_2.32 y0 F
+GLIBC_2.32 y0f F
+GLIBC_2.32 y0f32 F
+GLIBC_2.32 y0f32x F
+GLIBC_2.32 y0f64 F
+GLIBC_2.32 y0l F
+GLIBC_2.32 y1 F
+GLIBC_2.32 y1f F
+GLIBC_2.32 y1f32 F
+GLIBC_2.32 y1f32x F
+GLIBC_2.32 y1f64 F
+GLIBC_2.32 y1l F
+GLIBC_2.32 yn F
+GLIBC_2.32 ynf F
+GLIBC_2.32 ynf32 F
+GLIBC_2.32 ynf32x F
+GLIBC_2.32 ynf64 F
+GLIBC_2.32 ynl F
diff --git a/sysdeps/unix/sysv/linux/arc/libpthread.abilist b/sysdeps/unix/sysv/linux/arc/libpthread.abilist
new file mode 100644
index 000000000000..4bf24e062c83
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libpthread.abilist
@@ -0,0 +1,217 @@
+GLIBC_2.32 _IO_flockfile F
+GLIBC_2.32 _IO_ftrylockfile F
+GLIBC_2.32 _IO_funlockfile F
+GLIBC_2.32 __close F
+GLIBC_2.32 __connect F
+GLIBC_2.32 __errno_location F
+GLIBC_2.32 __h_errno_location F
+GLIBC_2.32 __libc_allocate_rtsig F
+GLIBC_2.32 __libc_current_sigrtmax F
+GLIBC_2.32 __libc_current_sigrtmin F
+GLIBC_2.32 __lseek F
+GLIBC_2.32 __open F
+GLIBC_2.32 __open64 F
+GLIBC_2.32 __pread64 F
+GLIBC_2.32 __pthread_cleanup_routine F
+GLIBC_2.32 __pthread_getspecific F
+GLIBC_2.32 __pthread_key_create F
+GLIBC_2.32 __pthread_mutex_destroy F
+GLIBC_2.32 __pthread_mutex_init F
+GLIBC_2.32 __pthread_mutex_lock F
+GLIBC_2.32 __pthread_mutex_trylock F
+GLIBC_2.32 __pthread_mutex_unlock F
+GLIBC_2.32 __pthread_mutexattr_destroy F
+GLIBC_2.32 __pthread_mutexattr_init F
+GLIBC_2.32 __pthread_mutexattr_settype F
+GLIBC_2.32 __pthread_once F
+GLIBC_2.32 __pthread_register_cancel F
+GLIBC_2.32 __pthread_register_cancel_defer F
+GLIBC_2.32 __pthread_rwlock_destroy F
+GLIBC_2.32 __pthread_rwlock_init F
+GLIBC_2.32 __pthread_rwlock_rdlock F
+GLIBC_2.32 __pthread_rwlock_tryrdlock F
+GLIBC_2.32 __pthread_rwlock_trywrlock F
+GLIBC_2.32 __pthread_rwlock_unlock F
+GLIBC_2.32 __pthread_rwlock_wrlock F
+GLIBC_2.32 __pthread_setspecific F
+GLIBC_2.32 __pthread_unregister_cancel F
+GLIBC_2.32 __pthread_unregister_cancel_restore F
+GLIBC_2.32 __pthread_unwind_next F
+GLIBC_2.32 __pwrite64 F
+GLIBC_2.32 __read F
+GLIBC_2.32 __res_state F
+GLIBC_2.32 __send F
+GLIBC_2.32 __sigaction F
+GLIBC_2.32 __write F
+GLIBC_2.32 _pthread_cleanup_pop F
+GLIBC_2.32 _pthread_cleanup_pop_restore F
+GLIBC_2.32 _pthread_cleanup_push F
+GLIBC_2.32 _pthread_cleanup_push_defer F
+GLIBC_2.32 accept F
+GLIBC_2.32 call_once F
+GLIBC_2.32 close F
+GLIBC_2.32 cnd_broadcast F
+GLIBC_2.32 cnd_destroy F
+GLIBC_2.32 cnd_init F
+GLIBC_2.32 cnd_signal F
+GLIBC_2.32 cnd_timedwait F
+GLIBC_2.32 cnd_wait F
+GLIBC_2.32 connect F
+GLIBC_2.32 flockfile F
+GLIBC_2.32 fsync F
+GLIBC_2.32 ftrylockfile F
+GLIBC_2.32 funlockfile F
+GLIBC_2.32 lseek F
+GLIBC_2.32 lseek64 F
+GLIBC_2.32 msync F
+GLIBC_2.32 mtx_destroy F
+GLIBC_2.32 mtx_init F
+GLIBC_2.32 mtx_lock F
+GLIBC_2.32 mtx_timedlock F
+GLIBC_2.32 mtx_trylock F
+GLIBC_2.32 mtx_unlock F
+GLIBC_2.32 open F
+GLIBC_2.32 open64 F
+GLIBC_2.32 pause F
+GLIBC_2.32 pread F
+GLIBC_2.32 pread64 F
+GLIBC_2.32 pthread_attr_getaffinity_np F
+GLIBC_2.32 pthread_attr_getguardsize F
+GLIBC_2.32 pthread_attr_getstack F
+GLIBC_2.32 pthread_attr_getstackaddr F
+GLIBC_2.32 pthread_attr_getstacksize F
+GLIBC_2.32 pthread_attr_setaffinity_np F
+GLIBC_2.32 pthread_attr_setguardsize F
+GLIBC_2.32 pthread_attr_setstack F
+GLIBC_2.32 pthread_attr_setstackaddr F
+GLIBC_2.32 pthread_attr_setstacksize F
+GLIBC_2.32 pthread_barrier_destroy F
+GLIBC_2.32 pthread_barrier_init F
+GLIBC_2.32 pthread_barrier_wait F
+GLIBC_2.32 pthread_barrierattr_destroy F
+GLIBC_2.32 pthread_barrierattr_getpshared F
+GLIBC_2.32 pthread_barrierattr_init F
+GLIBC_2.32 pthread_barrierattr_setpshared F
+GLIBC_2.32 pthread_cancel F
+GLIBC_2.32 pthread_clockjoin_np F
+GLIBC_2.32 pthread_cond_broadcast F
+GLIBC_2.32 pthread_cond_clockwait F
+GLIBC_2.32 pthread_cond_signal F
+GLIBC_2.32 pthread_cond_timedwait F
+GLIBC_2.32 pthread_cond_wait F
+GLIBC_2.32 pthread_condattr_getclock F
+GLIBC_2.32 pthread_condattr_getpshared F
+GLIBC_2.32 pthread_condattr_setclock F
+GLIBC_2.32 pthread_condattr_setpshared F
+GLIBC_2.32 pthread_create F
+GLIBC_2.32 pthread_detach F
+GLIBC_2.32 pthread_exit F
+GLIBC_2.32 pthread_getaffinity_np F
+GLIBC_2.32 pthread_getattr_default_np F
+GLIBC_2.32 pthread_getattr_np F
+GLIBC_2.32 pthread_getconcurrency F
+GLIBC_2.32 pthread_getcpuclockid F
+GLIBC_2.32 pthread_getname_np F
+GLIBC_2.32 pthread_getspecific F
+GLIBC_2.32 pthread_join F
+GLIBC_2.32 pthread_key_create F
+GLIBC_2.32 pthread_key_delete F
+GLIBC_2.32 pthread_kill F
+GLIBC_2.32 pthread_kill_other_threads_np F
+GLIBC_2.32 pthread_mutex_clocklock F
+GLIBC_2.32 pthread_mutex_consistent F
+GLIBC_2.32 pthread_mutex_consistent_np F
+GLIBC_2.32 pthread_mutex_destroy F
+GLIBC_2.32 pthread_mutex_getprioceiling F
+GLIBC_2.32 pthread_mutex_init F
+GLIBC_2.32 pthread_mutex_lock F
+GLIBC_2.32 pthread_mutex_setprioceiling F
+GLIBC_2.32 pthread_mutex_timedlock F
+GLIBC_2.32 pthread_mutex_trylock F
+GLIBC_2.32 pthread_mutex_unlock F
+GLIBC_2.32 pthread_mutexattr_destroy F
+GLIBC_2.32 pthread_mutexattr_getkind_np F
+GLIBC_2.32 pthread_mutexattr_getprioceiling F
+GLIBC_2.32 pthread_mutexattr_getprotocol F
+GLIBC_2.32 pthread_mutexattr_getpshared F
+GLIBC_2.32 pthread_mutexattr_getrobust F
+GLIBC_2.32 pthread_mutexattr_getrobust_np F
+GLIBC_2.32 pthread_mutexattr_gettype F
+GLIBC_2.32 pthread_mutexattr_init F
+GLIBC_2.32 pthread_mutexattr_setkind_np F
+GLIBC_2.32 pthread_mutexattr_setprioceiling F
+GLIBC_2.32 pthread_mutexattr_setprotocol F
+GLIBC_2.32 pthread_mutexattr_setpshared F
+GLIBC_2.32 pthread_mutexattr_setrobust F
+GLIBC_2.32 pthread_mutexattr_setrobust_np F
+GLIBC_2.32 pthread_mutexattr_settype F
+GLIBC_2.32 pthread_once F
+GLIBC_2.32 pthread_rwlock_clockrdlock F
+GLIBC_2.32 pthread_rwlock_clockwrlock F
+GLIBC_2.32 pthread_rwlock_destroy F
+GLIBC_2.32 pthread_rwlock_init F
+GLIBC_2.32 pthread_rwlock_rdlock F
+GLIBC_2.32 pthread_rwlock_timedrdlock F
+GLIBC_2.32 pthread_rwlock_timedwrlock F
+GLIBC_2.32 pthread_rwlock_tryrdlock F
+GLIBC_2.32 pthread_rwlock_trywrlock F
+GLIBC_2.32 pthread_rwlock_unlock F
+GLIBC_2.32 pthread_rwlock_wrlock F
+GLIBC_2.32 pthread_rwlockattr_destroy F
+GLIBC_2.32 pthread_rwlockattr_getkind_np F
+GLIBC_2.32 pthread_rwlockattr_getpshared F
+GLIBC_2.32 pthread_rwlockattr_init F
+GLIBC_2.32 pthread_rwlockattr_setkind_np F
+GLIBC_2.32 pthread_rwlockattr_setpshared F
+GLIBC_2.32 pthread_setaffinity_np F
+GLIBC_2.32 pthread_setattr_default_np F
+GLIBC_2.32 pthread_setcancelstate F
+GLIBC_2.32 pthread_setcanceltype F
+GLIBC_2.32 pthread_setconcurrency F
+GLIBC_2.32 pthread_setname_np F
+GLIBC_2.32 pthread_setschedprio F
+GLIBC_2.32 pthread_setspecific F
+GLIBC_2.32 pthread_sigmask F
+GLIBC_2.32 pthread_sigqueue F
+GLIBC_2.32 pthread_spin_destroy F
+GLIBC_2.32 pthread_spin_init F
+GLIBC_2.32 pthread_spin_lock F
+GLIBC_2.32 pthread_spin_trylock F
+GLIBC_2.32 pthread_spin_unlock F
+GLIBC_2.32 pthread_testcancel F
+GLIBC_2.32 pthread_timedjoin_np F
+GLIBC_2.32 pthread_tryjoin_np F
+GLIBC_2.32 pthread_yield F
+GLIBC_2.32 pwrite F
+GLIBC_2.32 pwrite64 F
+GLIBC_2.32 raise F
+GLIBC_2.32 read F
+GLIBC_2.32 recv F
+GLIBC_2.32 recvfrom F
+GLIBC_2.32 recvmsg F
+GLIBC_2.32 sem_clockwait F
+GLIBC_2.32 sem_close F
+GLIBC_2.32 sem_destroy F
+GLIBC_2.32 sem_getvalue F
+GLIBC_2.32 sem_init F
+GLIBC_2.32 sem_open F
+GLIBC_2.32 sem_post F
+GLIBC_2.32 sem_timedwait F
+GLIBC_2.32 sem_trywait F
+GLIBC_2.32 sem_unlink F
+GLIBC_2.32 sem_wait F
+GLIBC_2.32 send F
+GLIBC_2.32 sendmsg F
+GLIBC_2.32 sendto F
+GLIBC_2.32 sigaction F
+GLIBC_2.32 sigwait F
+GLIBC_2.32 tcdrain F
+GLIBC_2.32 thrd_create F
+GLIBC_2.32 thrd_detach F
+GLIBC_2.32 thrd_exit F
+GLIBC_2.32 thrd_join F
+GLIBC_2.32 tss_create F
+GLIBC_2.32 tss_delete F
+GLIBC_2.32 tss_get F
+GLIBC_2.32 tss_set F
+GLIBC_2.32 write F
diff --git a/sysdeps/unix/sysv/linux/arc/libresolv.abilist b/sysdeps/unix/sysv/linux/arc/libresolv.abilist
new file mode 100644
index 000000000000..c5edf99ea942
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libresolv.abilist
@@ -0,0 +1,79 @@
+GLIBC_2.32 __b64_ntop F
+GLIBC_2.32 __b64_pton F
+GLIBC_2.32 __dn_comp F
+GLIBC_2.32 __dn_count_labels F
+GLIBC_2.32 __dn_expand F
+GLIBC_2.32 __dn_skipname F
+GLIBC_2.32 __fp_nquery F
+GLIBC_2.32 __fp_query F
+GLIBC_2.32 __fp_resstat F
+GLIBC_2.32 __hostalias F
+GLIBC_2.32 __loc_aton F
+GLIBC_2.32 __loc_ntoa F
+GLIBC_2.32 __p_cdname F
+GLIBC_2.32 __p_cdnname F
+GLIBC_2.32 __p_class F
+GLIBC_2.32 __p_class_syms D 0x54
+GLIBC_2.32 __p_fqname F
+GLIBC_2.32 __p_fqnname F
+GLIBC_2.32 __p_option F
+GLIBC_2.32 __p_query F
+GLIBC_2.32 __p_rcode F
+GLIBC_2.32 __p_time F
+GLIBC_2.32 __p_type F
+GLIBC_2.32 __p_type_syms D 0x228
+GLIBC_2.32 __putlong F
+GLIBC_2.32 __putshort F
+GLIBC_2.32 __res_close F
+GLIBC_2.32 __res_dnok F
+GLIBC_2.32 __res_hnok F
+GLIBC_2.32 __res_hostalias F
+GLIBC_2.32 __res_isourserver F
+GLIBC_2.32 __res_mailok F
+GLIBC_2.32 __res_mkquery F
+GLIBC_2.32 __res_nameinquery F
+GLIBC_2.32 __res_nmkquery F
+GLIBC_2.32 __res_nquery F
+GLIBC_2.32 __res_nquerydomain F
+GLIBC_2.32 __res_nsearch F
+GLIBC_2.32 __res_nsend F
+GLIBC_2.32 __res_ownok F
+GLIBC_2.32 __res_queriesmatch F
+GLIBC_2.32 __res_query F
+GLIBC_2.32 __res_querydomain F
+GLIBC_2.32 __res_search F
+GLIBC_2.32 __res_send F
+GLIBC_2.32 __sym_ntop F
+GLIBC_2.32 __sym_ntos F
+GLIBC_2.32 __sym_ston F
+GLIBC_2.32 _getlong F
+GLIBC_2.32 _getshort F
+GLIBC_2.32 inet_net_ntop F
+GLIBC_2.32 inet_net_pton F
+GLIBC_2.32 inet_neta F
+GLIBC_2.32 ns_datetosecs F
+GLIBC_2.32 ns_format_ttl F
+GLIBC_2.32 ns_get16 F
+GLIBC_2.32 ns_get32 F
+GLIBC_2.32 ns_initparse F
+GLIBC_2.32 ns_makecanon F
+GLIBC_2.32 ns_msg_getflag F
+GLIBC_2.32 ns_name_compress F
+GLIBC_2.32 ns_name_ntol F
+GLIBC_2.32 ns_name_ntop F
+GLIBC_2.32 ns_name_pack F
+GLIBC_2.32 ns_name_pton F
+GLIBC_2.32 ns_name_rollback F
+GLIBC_2.32 ns_name_skip F
+GLIBC_2.32 ns_name_uncompress F
+GLIBC_2.32 ns_name_unpack F
+GLIBC_2.32 ns_parse_ttl F
+GLIBC_2.32 ns_parserr F
+GLIBC_2.32 ns_put16 F
+GLIBC_2.32 ns_put32 F
+GLIBC_2.32 ns_samedomain F
+GLIBC_2.32 ns_samename F
+GLIBC_2.32 ns_skiprr F
+GLIBC_2.32 ns_sprintrr F
+GLIBC_2.32 ns_sprintrrf F
+GLIBC_2.32 ns_subdomain F
diff --git a/sysdeps/unix/sysv/linux/arc/librt.abilist b/sysdeps/unix/sysv/linux/arc/librt.abilist
new file mode 100644
index 000000000000..fda2b20c019a
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/librt.abilist
@@ -0,0 +1,35 @@
+GLIBC_2.32 __mq_open_2 F
+GLIBC_2.32 aio_cancel F
+GLIBC_2.32 aio_cancel64 F
+GLIBC_2.32 aio_error F
+GLIBC_2.32 aio_error64 F
+GLIBC_2.32 aio_fsync F
+GLIBC_2.32 aio_fsync64 F
+GLIBC_2.32 aio_init F
+GLIBC_2.32 aio_read F
+GLIBC_2.32 aio_read64 F
+GLIBC_2.32 aio_return F
+GLIBC_2.32 aio_return64 F
+GLIBC_2.32 aio_suspend F
+GLIBC_2.32 aio_suspend64 F
+GLIBC_2.32 aio_write F
+GLIBC_2.32 aio_write64 F
+GLIBC_2.32 lio_listio F
+GLIBC_2.32 lio_listio64 F
+GLIBC_2.32 mq_close F
+GLIBC_2.32 mq_getattr F
+GLIBC_2.32 mq_notify F
+GLIBC_2.32 mq_open F
+GLIBC_2.32 mq_receive F
+GLIBC_2.32 mq_send F
+GLIBC_2.32 mq_setattr F
+GLIBC_2.32 mq_timedreceive F
+GLIBC_2.32 mq_timedsend F
+GLIBC_2.32 mq_unlink F
+GLIBC_2.32 shm_open F
+GLIBC_2.32 shm_unlink F
+GLIBC_2.32 timer_create F
+GLIBC_2.32 timer_delete F
+GLIBC_2.32 timer_getoverrun F
+GLIBC_2.32 timer_gettime F
+GLIBC_2.32 timer_settime F
diff --git a/sysdeps/unix/sysv/linux/arc/libthread_db.abilist b/sysdeps/unix/sysv/linux/arc/libthread_db.abilist
new file mode 100644
index 000000000000..dcbc4a8fbef5
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libthread_db.abilist
@@ -0,0 +1,40 @@
+GLIBC_2.32 td_init F
+GLIBC_2.32 td_log F
+GLIBC_2.32 td_symbol_list F
+GLIBC_2.32 td_ta_clear_event F
+GLIBC_2.32 td_ta_delete F
+GLIBC_2.32 td_ta_enable_stats F
+GLIBC_2.32 td_ta_event_addr F
+GLIBC_2.32 td_ta_event_getmsg F
+GLIBC_2.32 td_ta_get_nthreads F
+GLIBC_2.32 td_ta_get_ph F
+GLIBC_2.32 td_ta_get_stats F
+GLIBC_2.32 td_ta_map_id2thr F
+GLIBC_2.32 td_ta_map_lwp2thr F
+GLIBC_2.32 td_ta_new F
+GLIBC_2.32 td_ta_reset_stats F
+GLIBC_2.32 td_ta_set_event F
+GLIBC_2.32 td_ta_setconcurrency F
+GLIBC_2.32 td_ta_thr_iter F
+GLIBC_2.32 td_ta_tsd_iter F
+GLIBC_2.32 td_thr_clear_event F
+GLIBC_2.32 td_thr_dbresume F
+GLIBC_2.32 td_thr_dbsuspend F
+GLIBC_2.32 td_thr_event_enable F
+GLIBC_2.32 td_thr_event_getmsg F
+GLIBC_2.32 td_thr_get_info F
+GLIBC_2.32 td_thr_getfpregs F
+GLIBC_2.32 td_thr_getgregs F
+GLIBC_2.32 td_thr_getxregs F
+GLIBC_2.32 td_thr_getxregsize F
+GLIBC_2.32 td_thr_set_event F
+GLIBC_2.32 td_thr_setfpregs F
+GLIBC_2.32 td_thr_setgregs F
+GLIBC_2.32 td_thr_setprio F
+GLIBC_2.32 td_thr_setsigpending F
+GLIBC_2.32 td_thr_setxregs F
+GLIBC_2.32 td_thr_sigsetmask F
+GLIBC_2.32 td_thr_tls_get_addr F
+GLIBC_2.32 td_thr_tlsbase F
+GLIBC_2.32 td_thr_tsd F
+GLIBC_2.32 td_thr_validate F
diff --git a/sysdeps/unix/sysv/linux/arc/libutil.abilist b/sysdeps/unix/sysv/linux/arc/libutil.abilist
new file mode 100644
index 000000000000..61f73bc34ef8
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/libutil.abilist
@@ -0,0 +1,6 @@
+GLIBC_2.32 forkpty F
+GLIBC_2.32 login F
+GLIBC_2.32 login_tty F
+GLIBC_2.32 logout F
+GLIBC_2.32 logwtmp F
+GLIBC_2.32 openpty F
diff --git a/sysdeps/unix/sysv/linux/arc/localplt.data b/sysdeps/unix/sysv/linux/arc/localplt.data
new file mode 100644
index 000000000000..4479e8ee8a26
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/localplt.data
@@ -0,0 +1,12 @@
+libc.so: realloc
+libc.so: malloc
+libc.so: memalign
+libc.so: calloc
+libc.so: free
+# At -Os, a struct assignment in libgcc-static pulls this in
+libc.so: memcpy ?
+# The TLS-enabled version of these functions is interposed from libc.so.
+ld.so: _dl_signal_error
+ld.so: _dl_catch_error
+ld.so: _dl_signal_exception
+ld.so: _dl_catch_exception
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
