Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A360DC678D4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TX8LQg19ONKeBRVfcVhoLumuddF+AbbAdh0PZvGt1Q=; b=viDiibId78r+5x
	5DWjDv/ewvWQHaLxtc7/YrixDQC16LOEX7sqbCcGWYfPxeF5dGll7VX4RJu/3Wn/ta5bnXiFqsjtt
	iQO9/dMAbyXFfDfIPxBicIohM4wDaoKtmxttC9QYFXi4qOobbBvhs54udhf0AQZcYdLfxpCbPhh5O
	Ej3xzVMROiPsj6jMMDHuAo+TQ1Y9YfY5GvF9OEybMBJwMEkaI5e6zeG3NE8YnHVVBHb6XZZhg+w7k
	BHBXkIkVfh4XIDkQ+Trwix04KV0sH5Uo/tucP1pJmjacJFi6P0QZaHG5fIwn2nK4s8IWsFWzLeW8h
	70DFaomVin8R2SduLzKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXlXb-002mhV-Sq; Thu, 02 Mar 2023 16:12:23 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXlXY-002mgZ-Kb
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 16:12:21 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 322G51Lb010064;
	Thu, 2 Mar 2023 08:12:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pfptdkimsnps;
 bh=Vg249BbTkvNkrtiiv3LWdoFEvaTjamFxVm9+45KaJvc=;
 b=PI5UMxTQi0aJhPBs3PexwF4b7KNOjZxncevBSMAy/RUy8yRi6XZA9tVToC5KwmhARsOQ
 F/5qW1bWqMtvR7bnRAN9j5vGnoI3gfjycwJJ30eoHp13iSRt8DvMwiLiyQJDYs5TZQJ3
 nVghV/ccjl6CIwTKBeewzmrZVXDQRscUTemvDrF1Q1T0KYEIbvry5t84Wcdr7BmjWxPi
 Z3HXu5yT0jNT9uJup3q7NOvuBmkcSPE46SMv1GXoEStILTK61Yel6nA7rYBcgAIjKER0
 v1V34In3l4hYJtrJZqnD2etPIlTiTY0PIOPEPXyIcUAAyHxIB0dnpeJ6JZAWir2V35T9 nQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nyjfdwbnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 08:12:20 -0800
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D279DC00AF;
	Thu,  2 Mar 2023 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1677773539; bh=ef2VQ9QkBlki0vk0yTeJwqC+VlwKiBF/Qb9jA+N3Jts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lqMsLOZLUurkl6w7OLQFM9gkg2yfU4LqIWB6bzT7HSZZOA5WWSOQmRUdvSBOgYPUq
	 b9MgAQ9PDAAatNBzm3JMTRxmK4grto+6WgHT3kbGWreX5v573gl3vFslcWLJg1BoxE
	 qMwftf3e/4sYTtiz1xjppLp0rU/ff1ehLr5V2Y4fZDM+JS/KIUUp3Czrxn5F43Hz0P
	 yexTZgRb0CGumF6IRMK33C9AKeyRhiuXdmw09YmB6TyHv74FPdlJ8MYkYsTRinvhC6
	 czWc2+xXJhJPLAdcBRukFx9BLwIWjUiZvJB6Nbzt0of70bTirKWSovmYwrVeWeQuHt
	 NFE6736n8crnQ==
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.105.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id E173AA006D;
	Thu,  2 Mar 2023 16:12:16 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel.Kozlov@synopsys.com
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
        Pavel Kozlov <Pavel.Kozlov@synopsys.com>
Subject: [PATCH 2/2] ARC: run child from the separate start block in __clone
Date: Thu,  2 Mar 2023 20:10:19 +0400
Message-Id: <20230302161019.27192-2-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302161019.27192-1-kozlov@synopsys.com>
References: <20230302161019.27192-1-kozlov@synopsys.com>
MIME-Version: 1.0
X-Proofpoint-GUID: YlCzq_bxQPRvZ3PwhbDVJxRjvxzMUMw8
X-Proofpoint-ORIG-GUID: YlCzq_bxQPRvZ3PwhbDVJxRjvxzMUMw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_09,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=944
 impostorscore=0 bulkscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_081220_721412_046796FF 
X-CRM114-Status: GOOD (  15.92  )
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

For better debug experience use separate code block with extra
cfi_* directives to run child (same as in __clone3).
---
 sysdeps/unix/sysv/linux/arc/clone.S | 40 ++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
index 766649625658..0029aaeb8170 100644
--- a/sysdeps/unix/sysv/linux/arc/clone.S
+++ b/sysdeps/unix/sysv/linux/arc/clone.S
@@ -20,9 +20,6 @@
 #include <sysdep.h>
 #define _ERRNO_H	1
 #include <bits/errno.h>
-#include <tcb-offsets.h>
-
-#define CLONE_SETTLS		0x00080000
 
 /* int clone(int (*fn)(void *), void *child_stack,
            int flags, void *arg, ...
@@ -63,19 +60,9 @@ ENTRY (__clone)
 	ARC_TRAP_INSN
 
 	cmp	r0, 0		/* return code : 0 new process, !0 parent.  */
+	beq	thread_start_clone
 	blt	L (__sys_err2)	/* < 0 (signed) error.  */
-	jnz	[blink]		/* Parent returns.  */
-
-	/* child jumps off to @fn with @arg as argument
-           TP register already set by kernel.  */
-	jl.d	[r10]
-	mov	r0, r11
-
-	/* exit() with result from @fn (already in r0).  */
-	mov	r8, __NR_exit
-	ARC_TRAP_INSN
-	/* In case it ever came back.  */
-	flag	1
+	j	[blink]		/* Parent returns.  */
 
 L (__sys_err):
 	mov	r0, -EINVAL
@@ -89,5 +76,28 @@ L (__sys_err2):
 	       position independent.  */
 	b   __syscall_error
 PSEUDO_END (__clone)
+
+
+	.align 4
+	.type thread_start_clone, %function
+thread_start_clone:
+	cfi_startproc
+	/* Terminate call stack by noting ra is undefined.  */
+	cfi_undefined (blink)
+
+	/* Child jumps off to @fn with @arg as argument.  */
+	jl.d	[r10]
+	mov	r0, r11
+
+	/* exit() with result from @fn (already in r0).  */
+	mov	r8, __NR_exit
+	ARC_TRAP_INSN
+
+	/* In case it ever came back.  */
+	flag	1
+
+	cfi_endproc
+	.size thread_start_clone, .-thread_start_clone
+
 libc_hidden_def (__clone)
 weak_alias (__clone, clone)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
