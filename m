Return-Path: <SRS0=vR5P=FT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BCAC4361B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Dec 2020 13:30:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7D620729
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Dec 2020 13:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD7D620729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sqnsRbI+BYs/c1t6mxqLsLb1K5Gc16UiJrynvRVl/I8=; b=aY8Wwdin6OyAMn+olSKkiXo3Q
	NICQfiNXIPToBKHBdGtN8+UA5j7hYLBxuvLW36X3nYtu4tvw8O2wKRGVJwbz/y3gwPm35gnLtoj34
	M8SSCSie3KuC1uAhRRow2O5L1+xYWzjFZI6YshwUBR9Ss1cjzcIqySBFX6IDN0i1JnMyIJadS+Woy
	0o3cMwr5DZQys5ouWQfNRPR/ZDoL85a1ozRXvOeciuWCaz7uKCtaZYjd7XH6eH5Yibj14TUh4P1t3
	69zjtm4T2y0hJWJDtA788WXpfNAKaJzrfy/7tSrFyOG71/IIgOcEcnWN2V72OhnAxODvM/4Cjwqga
	544OsU0BA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpAPg-0002WS-Ba; Tue, 15 Dec 2020 13:30:48 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpAPd-0002Uo-8I
 for linux-snps-arc@lists.infradead.org; Tue, 15 Dec 2020 13:30:46 +0000
Received: by mail-wm1-x344.google.com with SMTP id a3so18491232wmb.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 15 Dec 2020 05:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hViOtnvGY+4JO9VZW4NA9Ghhzl7JHbPghEwPrt1jtVA=;
 b=Ef1XRfiw3/YMjfpkmB3NKEy4+KAYGtJ/+5Yxui3w2yjbH1Gt/dX4iseHBTlgLJjd20
 gYS0onONCVD/HrfoC8e3fMUi6Z3LdJJdGCF4B/Um+kw/DHUDYbWXyXSDS/rrg2YsjBJa
 qQmJZczHi1Xvg3Ef38xPYQqTMMxHx2unXWexJ8r4hl0VxMxzT5AaZRrfg/UGWaAbZoqA
 LAp4H6IeS3k6Fghi+mhE06nCPQTbDMpk000kVfv3o5tDuAhUvx/d5hWKWIlxW3V4Qdlz
 HKZRcpnWLTbEJs3t6OGooiaszoWYFiAuibNR+52c0riuvNqU1tI0DuSKE9CpOLEBU+rE
 JHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hViOtnvGY+4JO9VZW4NA9Ghhzl7JHbPghEwPrt1jtVA=;
 b=VsKB450sDQ5KB52uS8zHSjkKKJIzeqhITmpJ+49xnJ+H6+N+BmbFuwgtTBXnZZQQI1
 Di0ZP1Ew6UB5mMgE6dp23EdsbV+2AVbv6i1IRgHPIVRMcEuCGK2lIwkDV2w1MbIu4xr/
 ICfsBWpx2I5ji/Q3oq5DvFlI7Q9MkvYJZJX3tPwRqBKb2JvUNB6lk8+fryBBdevjjjkT
 0oJ6LQp8mD62iKaMYf1W6924dvERCQQXt/J3HZbJ+OfsCpo/FVZ1YyCXePQDSQatU7ET
 QKmb7ZPUfQlp2Tq82/wHmWtMX3eX06OC9iScFd2U8tJ0kbQVJnvZ1u2gXDf6wzcnTTM4
 girA==
X-Gm-Message-State: AOAM533Bq+FJJsHmKJR0IwglPYSx/T8DxtYQVNRglW3gUJ5h3FJ5llmf
 nGV0kZaVc20uIjt1qK/4lnI=
X-Google-Smtp-Source: ABdhPJxu0j/rXyBcT8i0pqy+eH/ROTi4+4c71h3L9WrE4dLOb7tZam/y9JAqsyWuoSkrUgKVrypPgQ==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr32319066wme.40.1608039042332;
 Tue, 15 Dec 2020 05:30:42 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
 by smtp.gmail.com with ESMTPSA id z8sm36888479wmg.17.2020.12.15.05.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 05:30:41 -0800 (PST)
From: Alejandro Colomar <alx.manpages@gmail.com>
To: Michael Kerrisk <mtk.manpages@gmail.com>,
 Dave Martin <Dave.Martin@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org,
 Martin Sebor <msebor@redhat.com>
Subject: [PATCH v6] cacheflush.2: Document __builtin___clear_cache() as a more
 portable alternative
Date: Tue, 15 Dec 2020 14:30:20 +0100
Message-Id: <20201215133019.14411-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
References: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_083045_318815_AC640830 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Alejandro Colomar <alx.manpages@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vincent Chen <deanbo422@gmail.com>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, gcc-patches@gcc.gnu.org,
 linux-snps-arc@lists.infradead.org, cfe-users@lists.llvm.org,
 cfe-dev@lists.llvm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
Cc: Martin Sebor <msebor@redhat.com>
Cc: Dave Martin <Dave.Martin@arm.com>
---

v6:
- GCC has always exposed 'void *', as Martin Sebor noted.
  It's Clang (and maybe others) that (following GCC's docs)
  exposed 'char *'.

 man2/cacheflush.2 | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
index aba625721..7a2eed506 100644
--- a/man2/cacheflush.2
+++ b/man2/cacheflush.2
@@ -86,6 +86,30 @@ On Linux, this call first appeared on the MIPS architecture,
 but nowadays, Linux provides a
 .BR cacheflush ()
 system call on some other architectures, but with different arguments.
+.SH NOTES
+Unless you need the finer grained control that this system call provides,
+you probably want to use the GCC built-in function
+.BR __builtin___clear_cache (),
+which provides a portable interface
+across platforms supported by GCC and compatible compilers:
+.PP
+.in +4n
+.EX
+.BI "void __builtin___clear_cache(void *" begin ", void *" end );
+.EE
+.in
+.PP
+On platforms that don't require instruction cache flushes,
+.BR __builtin___clear_cache ()
+has no effect.
+.PP
+.IR Note :
+On some GCC-compatible compilers,
+the prototype for this built-in function uses
+.I char *
+instead of
+.I void *
+for the parameters.
 .SH BUGS
 Linux kernels older than version 2.6.11 ignore the
 .I addr
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
