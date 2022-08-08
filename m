Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08400C00140
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Aug 2022 13:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgsNJQJhrQvkrRwoU9puUsmihfSOMxseF5ib9HpZkTU=; b=mz1i80Vjr0D5qq
	I2RwemlyVRVoeEuUpX9O7wifXaXXqqSfhsW6LraV8bdd5wUgYW/y18VGEti1wFn2jgauKXP30UPUV
	E1LA0HHARNflNl2I8xIdpXzFJ3mN5NPIdN7lYEBixwSdAymWYtUUq16AbYYKuREMgAZ18HojL92c2
	8R6qVhVRHm1DpS43HUSIhTVcK0n8gFK+p6OrnNy27z+/0WPdzdIKATZA3FPOIC/m/7UQxwe/L05rL
	1NO4TePKoBv02AzM0WTT+MKB1Jp0wjAfsUcZTr/0uu/a1GjZfHjBfC4ZCjzxCNE5YV7/pFZLMLV/O
	It64F2Wp9x9hOepKUk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2Vk-00DxkF-0R; Mon, 08 Aug 2022 13:09:36 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2Vd-00DxYo-AI; Mon, 08 Aug 2022 13:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659964159;
	bh=P4saksYO9CTgO6X6/2ySNBwjHK+p2F8Ba3kmdgwmNIo=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=cF2sSQk2IC+/YLMkYSNiIW3FHdR6BCkRcqQvX1zhiuPVvJZQL1UrHfQmOVUTMjj6b
	 FvKwio4C8cpMCRUi04gaB1KTi2Ids9kAGjqxILLng/okGBuz5QsyMdbuxqYSgSAwQP
	 Qei1jnz9/jUKpFiS07EcRGUNeydXObY4538BoBpg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.169.184]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiaY9-1niySX3wFb-00ffdW; Mon, 08
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
Subject: [PATCH v3 3/4] x86/fault: Dump command line of faulting process to syslog
Date: Mon,  8 Aug 2022 15:09:16 +0200
Message-Id: <20220808130917.30760-4-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808130917.30760-1-deller@gmx.de>
References: <20220808130917.30760-1-deller@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:louBvz2yR4jkTgo627u5H+l8UG9i2dYFkwpu3hE4RDyH+SAv5gu
 1uZi8tHKHiOS2z+aIDclKc2Gke5YpmvooMGsYPIvvTBUDLFBLu/XMyZQ51/Dtejtxc+QadJ
 l6R1uEv1BxzjnjwzGKJ4+JSXGHaEQP2kmpKZEATjwMbEGaQNBgoF7RMSFNCH1Iuy+qHsS1Y
 OncxQEUpqyh+9TkLLFcSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/dBBLCq2604=:Ce+jE4umdoxfrr2xtC6+FD
 9O3kqH7oa2bzIwUT1YYtDtTQEvjEhaVKo2L2/eGbT2IbjEdhpirm9T0qXwaS8uzvrD0FJRIZw
 /EODphFxIOJGzVw0fuYQHZI0ZAcTtBvojZlM6yyfpiwjh763kbKp0Nf4Kd7uDOxmmxxMPi8z1
 GtEVaE22A/cY3CrMzlAFTGLJNVTdithhoPSKmMH+H/dspYeXPBV2te61wq+6GMKdCeOXoHoZ6
 X9tIc3R78hZroZXnxNxMcztgr+/i+mIq9/myRT4TyMtkMDy/CMLQggqNDipcpP7JsSI+XhHVy
 aTXC/MVoaFadlbKPnAXgxXbmQLdaOcGu0mTD9WB5CRuEkUTEx9pbcVBnvf9nnTSo1tgcB54GQ
 567YrvWzPXosPGu/cayPmIwVVUSNuZ5zr1yXeDUCI5f8HQMBYBmNbUAMkikIL5kVcDbYb2YMI
 hNSrCk47oZ4312cFwP6Ud7d6KoA+kYK21Q4bp8tIX92kpBMRW6WSdhcV268wixbT309dQWIxa
 H96ZcddQnEkOt3jcj0aMzqLSLYQw766tL+/KjfAdR7l3jFSj3Yg2DI4yNicwrEEkw8fJWv7rl
 wlKXHWUczVdPUWBRlSn74V0ntrGghvFD2o3+klrzp2tY/75CdWNFrNg+Cd6MNRg2CUqLr+VA4
 5N38FHRPGmXWuLUWZDkWdzThpuUS6illt8HujKcgyWlFXZiXcicnbYZ3OCeCdSNiGExN+nQ2U
 lQc8It9Q3AO+9RcxASCHGZyxWdLd33hXp5SYtUiH7loorc3dPaUVSZNaGjb26ZoeXKG4PngWv
 Qbn5/7A27Ug46B8O8gzQnTWVbneEpJQyQ4E9pt7UPQCX4aA/bNl5Rf6JtMXV3KomiAtQI8wiA
 zKWpWLt+Bs4NHtMzYP17ep8v+W43ADKf5lXrKD/phCMrFWOU3i4o8lArtJrhlBLr9k9wqag9+
 j3NTSY6pz1A76oLcPNwDbU8xLvf/BNEOt3eoYWmpQrcCFYHbrcdsNw1ManLkSIbzQpYAWPVL5
 wRfSd6lP/K6CfEQwK3n2ktHHqe2GTe0zSmwdXf9KJWBXstn+yqCCXmfEcDClvc4/4VSwGiEFs
 G6KUCv0LJ8uIV1Qq5IN99V1fkf+BU2+M+iYVSsIq7Wft3PA+QMTNnNh9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_060929_692516_5F389F96 
X-CRM114-Status: UNSURE (   9.35  )
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

If a process segfaults, include the command line of the faulting process
in the syslog.

In the example below, the "crash" program (which simply writes zero to address 0)
was called with the parameters "this is a test":

 crash[2326]: segfault at 0 ip 0000561a7969c12e sp 00007ffe97a05630 error 6 in crash[561a7969c000+1000]
 crash[2326] cmdline: ./crash this is a test
 Code: 68 ff ff ff c6 05 19 2f 00 00 01 5d c3 0f 1f 80 00 00 00 00 c3 0f 1f ...

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/x86/mm/fault.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index fad8faa29d04..d4e21c402e29 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -784,6 +784,8 @@ show_signal_msg(struct pt_regs *regs, unsigned long error_code,

 	printk(KERN_CONT "\n");

+	dump_stack_print_cmdline(loglvl);
+
 	show_opcodes(regs, loglvl);
 }

--
2.37.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
