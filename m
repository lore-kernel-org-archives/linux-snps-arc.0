Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3761C6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 16:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vIypbPisOkMq1ne5veYMB4ZC12sH0P9R1a3tFFPojuA=; b=pgMmY8fQKHkTnN
	3ZPgkNI61y0YP7FMO20xqub99KSsJH1F+zRiE47dPBeO6Aaap/tqda3EHXCQKBnenNsEMoJTbAMpk
	yDG679bFsghBbGkxKlmpQdZ13zgPzceaWCnZc5d0iQjvWLupnMhjdbf0mkAM3VqegCLYfIqaxklUo
	7G7ZLhkKOAMx1/SSR6egcBYU4aGIWHbiL+HB7QF9+Duy31a15fLruIRm60o62CrZDNNIthuRhms9e
	sYXfMZtNKspzxDLGSIItffsMJ0O/UCOY7EEf+64Ajb/mrKkyXxppuw/TxLNrM/psbFuZp92gOgPs9
	oZw8Sjsf6+MQPeSddRKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXlXV-002mfb-FA; Thu, 02 Mar 2023 16:12:17 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXlXS-002mex-Vo
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 16:12:16 +0000
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 322Cf2Rc008287;
	Thu, 2 Mar 2023 08:12:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=pfptdkimsnps; bh=py+Fqw2tjK/aZNs2IDeKGyQlA+DTg6Eb96RLbxmlo7Q=;
 b=dvGFyjFE6EkRUaYXhsHSVWaSDBA8IkFtaGaujpZopj6zfM+IT56LiPNVuS53mN+Akslg
 xvpNR56+IkdkTO6AOg85RVKD4CUEcZnu7dIlk9ndvl8VvKYP2tX8qsKlgjDFPDRRK9Rh
 NJq9Z9KF14nAoEnMWZYjgMznEvhLYs0UjkezvsPe5iCfAdBS3LPXXxBYSoLZNXyi0MMh
 EMze1JDuLRVr6n3T3aj1mgV8Ct0r5GH8F8V2G0SHUZRSWgPulGF0LYy2/2he37VAGBde
 Mu7N+rK9L4laTyozMicGbh8igajQBk61oZxJSroCKGyWTsLuFkyhq/hK2TbEA3VJEBHV Gg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nyj7uumh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 08:12:12 -0800
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C7FBD4007B;
	Thu,  2 Mar 2023 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1677773532; bh=KKDkXBAKX8wzDBNtB+0zPTtijqWg+Ew/ylrwF17hlfw=;
	h=From:To:Cc:Subject:Date:From;
	b=Gw2QQUmC2i90P3QeMEcggra6gDPVNzN2998ufoj3YDLycRv978tHWomDNzZk4vb5j
	 B2phqV80f86Zx6tPDTkg9PzMF5qS5GrRnFrxtmSrlsbqRj0Wyg0kZI3j4Um8/mbhSF
	 eOteQ/i3BzfLFTAO6ThHUCTG7HLqnMA/FNzgmyakDy3u1GaXrnrcca/UNxZd9whMlc
	 1DaJEoRs/kD3tI0Wk5ttVbc5Hu7PpclB+jQhKhFlgoER4HqLwGUmCdIpWXrdwVELGt
	 q3VhRufBJz0qWvlN7BNIwNnNYoUcRgXT5xOHSOABcEaMQCWm1tyRS6726sDxJjSmQT
	 Pa/hg4eaCmL2Q==
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.105.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id B54A1A006D;
	Thu,  2 Mar 2023 16:12:07 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel.Kozlov@synopsys.com
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
        Pavel Kozlov <Pavel.Kozlov@synopsys.com>
Subject: [PATCH 1/2] ARC: Add the clone3 wrapper
Date: Thu,  2 Mar 2023 20:10:18 +0400
Message-Id: <20230302161019.27192-1-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: MUDGHryKDFWlja64VYxhY7_gXthZk4de
X-Proofpoint-ORIG-GUID: MUDGHryKDFWlja64VYxhY7_gXthZk4de
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_09,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303020140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_081215_101734_D5FF8728 
X-CRM114-Status: GOOD (  23.72  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Pavel Kozlov <pavel.kozlov@synopsys.com>

Use the clone3 wrapper on ARC. It doesn't care about stack alignment.
All callers should provide an aligned stack.
It follows the internal signature:

extern int clone3 (struct clone_args *__cl_args, size_t __size,
 int (*__func) (void *__arg), void *__arg);
---
Checked on arc-linux-gnu. Previously observed tst-misaling-clone-internal
test fail was because I used outdated master branch.
Full testsuite runs without regressions.
But I also see fail of the new tst-spawn7, as already repoted at [1].

[1]
https://sourceware.org/pipermail/libc-alpha/2023-February/145937.html

 sysdeps/unix/sysv/linux/arc/clone3.S | 90 ++++++++++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/sysdep.h |  2 +
 2 files changed, 92 insertions(+)
 create mode 100644 sysdeps/unix/sysv/linux/arc/clone3.S

diff --git a/sysdeps/unix/sysv/linux/arc/clone3.S b/sysdeps/unix/sysv/linux/arc/clone3.S
new file mode 100644
index 000000000000..87a8272a3977
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/clone3.S
@@ -0,0 +1,90 @@
+/* The clone3 syscall wrapper.  Linux/arc version.
+   Copyright (C) 2023 Free Software Foundation, Inc.
+
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#include <sysdep.h>
+#define _ERRNO_H	1
+#include <bits/errno.h>
+
+/* The userland implementation is:
+   int clone3 (struct clone_args *cl_args, size_t size,
+               int (*func)(void *arg), void *arg);
+
+   the kernel entry is:
+   int clone3 (struct clone_args *cl_args, size_t size);
+
+   The parameters are passed in registers from userland:
+   r0: cl_args
+   r1: size
+   r2: func
+   r3: arg  */
+
+ENTRY(__clone3)
+
+	/* Save args for the child.  */
+	mov	r10, r0		/* cl_args  */
+	mov	r11, r2		/* func	 */
+	mov	r12, r3		/* args  */
+
+	/* Sanity check args.  */
+	breq	r10, 0, L (__sys_err)	/* No NULL cl_args pointer.  */
+	breq	r11, 0, L (__sys_err)	/* No NULL function pointer.  */
+
+	/* Do the system call, the kernel expects:
+	   r8: system call number
+	   r0: cl_args
+	   r1: size  */
+	mov	r0, r10
+	mov	r8, __NR_clone3
+	ARC_TRAP_INSN
+
+	cmp	r0, 0
+	beq	thread_start_clone3	/* Child returns.  */
+	blt	L (__sys_err2)
+	j	[blink]			/* Parent returns.  */
+
+L (__sys_err):
+	mov	r0, -EINVAL
+L (__sys_err2):
+	b	__syscall_error
+PSEUDO_END (__clone3)
+
+
+	.align 4
+	.type thread_start_clone3, %function
+thread_start_clone3:
+	cfi_startproc
+	/* Terminate call stack by noting ra is undefined.  */
+	cfi_undefined (blink)
+
+	/* Child jumps off to @fn with @arg as argument.  */
+	jl.d	[r11]
+	mov	r0, r12
+
+	/* exit() with result from @fn (already in r0).  */
+	mov	r8, __NR_exit
+	ARC_TRAP_INSN
+
+	/* In case it ever came back.  */
+	flag	1
+
+	cfi_endproc
+	.size thread_start_clone3, .-thread_start_clone3
+
+libc_hidden_def (__clone3)
+weak_alias (__clone3, clone3)
diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
index dd6fe73445f9..88dc1dff017f 100644
--- a/sysdeps/unix/sysv/linux/arc/sysdep.h
+++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
@@ -141,6 +141,8 @@ hidden_proto (__syscall_error)
 
 # define ARC_TRAP_INSN	"trap_s 0	\n\t"
 
+# define HAVE_CLONE3_WRAPPER	1
+
 # undef INTERNAL_SYSCALL_NCS
 # define INTERNAL_SYSCALL_NCS(number, nr_args, args...)	\
   ({								\
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
