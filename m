Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EA8C25B0C
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Aug 2022 13:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzgSEae9hX1+dm5+u3CYBnK92QtUfEHKiseHsUkFekQ=; b=qNKkPpssi8zQus
	kA8b9QJsqvA8am/LsHveA3djSvoUl7Et2dOwK+webD0/vynWyOVW6rC9IfMyZZW7QKChg7fbfdu8o
	oJsM638OMSHKvETDdGyiy29dUcBqOpk8fnDzr1CFQpiJ5j2KtYatx9gcAGwgX6WFSkF1K2+oh4lsY
	BFh68+H/DTLGY2MbIKcl9yXpDehSbJESMaAV/gP/0STuaLcYB+KeJDngs1MHXEuPMqh6oWVQhn9oc
	MChkIWQdvrbzYcokp2MrjB7+QNUBxhEpnxAL7UpdPApqYHT5HTSvk1VAJb1aGkLV61XpfrPurOAFl
	a5zz0PPJL6tbpTePFDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2Vk-00DxkP-5R; Mon, 08 Aug 2022 13:09:36 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2Vc-00DxYp-Tg; Mon, 08 Aug 2022 13:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659964159;
	bh=0M5qpS13eLgzHYee8MKVxWGYrt0iQg2yqGtZwU3aGdU=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=MAJJpLOmv5dP4WWUjz3+3k/mV957rgW3/oPnz3WDvdF55JVzYl9+4da4nUIyEQde5
	 fp4ZpNL1yylkjW4WMjOYsxEI1SbQVi0Y0V6evCsQBgpPvCz4S3PP29D3vBuNI8w955
	 FdyD3hHW46JGuDTJWIudpTSlqEiAzvjdMRSuiaUg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.169.184]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1oJ7ci0mt9-007QkE; Mon, 08
 Aug 2022 15:09:19 +0200
From: Helge Deller <deller@gmx.de>
To: linux-s390@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	x86@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] arc: Use generic dump_stack_print_cmdline() implementation
Date: Mon,  8 Aug 2022 15:09:17 +0200
Message-Id: <20220808130917.30760-5-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808130917.30760-1-deller@gmx.de>
References: <20220808130917.30760-1-deller@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qbhdCVDdOCub1ozqXacRBFmeXEK1oHZl6SIb4aOtZAfxd9npLiz
 JIPE+2fdpNF9wfsoTc1Fq05gbMQbVssIrx529rpnx38ZZwh/bdchIpZuTlXNOU8kORBr51N
 OUttWVrlobZJh72zp3/GOjg13qfmgf2jAdXfTwFqcswpTzOPz3Zb1y+E+QxB5Dq5yNsGa2L
 /AiGHtqfm1EdEzr6qa2PA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UBgKY5ubY/o=:y4mAM+/YC+hjlH357pzhLS
 S1Oo26dgQQi0G3GNPLIWloPIzSYdEv9y+fkRy5kKq6Tapjmbzqd1PMccmB4swJ7gkoS1VPHsv
 B+/aK5aoO9wR1huwRixwjHFzFW9X8bXaaCBe3tfJgOzHfGM/x6I4UzK8y7/gSjSKV3bNioc4d
 a23nO7jfFxECak1p9CgZc913l8erOrMSXdvRqbOyPa+NScOFlMnCIXJiN2JQP9vOuFyBpbUCd
 eNwWTHyTDWQ+TPta9DeTql3pDf9MrSx/ekuzbLuXnxvcnlV6/QKPt8G745S8Ig7pcKDIZA3Hb
 keRlQimwz0qP23/7C7kNx3ttYi+EEpKwTPp+mW64ic366tf8+14YNjE/4l7hghbSJIG3fsF/m
 4F6w1QQfKgT8rPxu8Xm+UKVQb/kN+jnPmpWZQc8QB/QTk6TGeNu9usIZGvpqTsA6B4EjFfcVy
 c+xgsWyLN0iVsIte/kRAKjFiLBWTxJPMu/FOAxAEViXUxdYB8blZUMkaG2PeBtnTyFbqf6PtT
 m/ppniqaQYyVUvgk1Xvv29qBG+gGuTEOqnL314HzgwFp4woejXDpeTePfROdyGY9+Lru4yJKY
 CEYAH7dJAlK2Xs4Snrq3hpQIcEwLUqH1g7VahcqtkZV0Q69KnpmxUaEDgyBLfu5qCRv+JIDNj
 HvlJXR9n8yTIf6Fey5BpfmI7EGOzQ/mssNzrWX8MzX0cDupVg+Cbk1hlgPkl+cwaCXTOWlOz5
 m+OPAHfwa77r5nTBke2ofYJ51SkCtHh0ukFqur0Lzvt2Cg6BRQvQpHT9asgfRbd7tVlOmTJwf
 8kl4XJDBAq0Qf/BxMmbHkYrEDZm1I04+HUjy7j58P5LiUZuLMWceAiFVHUTPOHg4Zj7hfLugL
 VLIgvAOwrOqjINCRrmkB6V/lN8vbnrRcaTfxGAYfFmdm0zPIOFJLFbRadQE//zskDBdh4+vCD
 SV8OZMvI+eCduWQJUXhMjp2yp7kTN9+hRq/abYJqStonqK9U1M54jkuhk3A+PXjDPkfM5SN8W
 7Hf8quu804dluN9yRLhnD3XHGCEErG9sCGDZ9CfjBhkqy0qrOm6zTa5bJd/swDqzUCx9Bp/Hm
 LWtAFNsvYuYAvaE6CcXszUWJFsPIxTycLTSZDmdOHyy1A9d0bv5bV1Xfg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_060929_463054_1ED50712 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

The process program name and command line is now shown in generic code
in dump_stack_print_info(), so drop the arc-specific implementation.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/arc/kernel/troubleshoot.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index 7654c2e42dc0..9807e590ee55 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -51,29 +51,6 @@ static void print_regs_callee(struct callee_regs *regs)
 		regs->r24, regs->r25);
 }

-static void print_task_path_n_nm(struct task_struct *tsk)
-{
-	char *path_nm = NULL;
-	struct mm_struct *mm;
-	struct file *exe_file;
-	char buf[ARC_PATH_MAX];
-
-	mm = get_task_mm(tsk);
-	if (!mm)
-		goto done;
-
-	exe_file = get_mm_exe_file(mm);
-	mmput(mm);
-
-	if (exe_file) {
-		path_nm = file_path(exe_file, buf, ARC_PATH_MAX-1);
-		fput(exe_file);
-	}
-
-done:
-	pr_info("Path: %s\n", !IS_ERR(path_nm) ? path_nm : "?");
-}
-
 static void show_faulting_vma(unsigned long address)
 {
 	struct vm_area_struct *vma;
@@ -176,7 +153,6 @@ void show_regs(struct pt_regs *regs)
 	 */
 	preempt_enable();

-	print_task_path_n_nm(tsk);
 	show_regs_print_info(KERN_INFO);

 	show_ecr_verbose(regs);
--
2.37.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
