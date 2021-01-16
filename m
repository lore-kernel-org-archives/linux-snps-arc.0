Return-Path: <SRS0=Q4Kc=GT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B6BC433DB
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 14:57:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32ED622DBF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 14:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32ED622DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q/8tcU0hOwTziCkPCM9dkWboqpbj70FkyXXitRhy9hE=; b=COnR0rJ16MjbWPsW3UN4P/2316
	p1Hv1YOd3FsNQbXunjQedeem54PJ51wgmr9i1Eha+eZEIkcWBmKoqITeDTgPOHt//+rN8wYW9/985
	YtMmwEVWQfGptpGdujEq+qLhwVa3wCciy/+7+pBlG23lerm1qbOySpji+PyR5Xdqys0qXgFTlJLUS
	t1uzeth6ojVbGiLchelF5c0Cm9d7dOCNxK8QoCWWRYQFq4dEcjWpLvPa4tSMm3VvAmx+AJtKLcRcV
	4k9F3jRDoqB4ll3d8r86XGXj/NO7c5jLM+UiFlopWM2wdVlyaioz9cJ1z4WO7OZon4TrpM3ru7SIp
	7kLbTw5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0n13-0004sd-VH; Sat, 16 Jan 2021 14:57:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0n12-0004rs-6z
 for linux-snps-arc@lists.infradead.org; Sat, 16 Jan 2021 14:57:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id u14so5881450wmq.4
 for <linux-snps-arc@lists.infradead.org>; Sat, 16 Jan 2021 06:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBNeTSu04ixKYSzbYAV+880sIV5+lGfcrwYBDcoDztA=;
 b=Tf7ga7AWLWf2ItsBKMJgzstjS0iQOHyu2Bo5P9Zu7PeqJcTXV5R0QRtWy+fAX6ZziU
 VTNdIKv1L+KoiYBkGsnBL+BhiCiRriQOW5i2KikBXwHQIALRDeXy+VTiYVnz73jP7DAl
 27BkEd63K5Hg779deY110KMYRPgeCQDyER+D7mwy7XNpWem3zdNkAXMiD48+24RuYJIU
 z0RotZ+DEDYaLV7VuLX0fzRCfjekiPoN3LBRk3jP37V7k+/qqLb5EksB0+JOLQGJvkDg
 zapzPI3f8tN+CN+LVAlIUlwTk5krGCiBKPyZl2T/h3eXWZNQpH9kbeXmx3g503dfLN6x
 DJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBNeTSu04ixKYSzbYAV+880sIV5+lGfcrwYBDcoDztA=;
 b=mDt++cJipMoo6FYfg3kaJ6GhGgL/F6jWDuHqFRPzhxnDo5oAlPvDZB8ikkqjkStluR
 bNq9/FK5fKBNuGH35zNWNFtKIG1RAEu2Tz+McJzHmn4zUp/qVofeu/30Apnxh4MyAOgL
 rfMObz9oD+yiDE3X1nQHA2/fp/l5cAEnca9TptLDJs6D2wLO6VTHBNUEDd9p1D9hkL5s
 gyPpChqtHiNGXXMzvPbqqXVCWxlVrXIM+2mTp6nISsN0dly0jX/jThKPIlfbplQtyghu
 UsMD5FdItjeq1oqAtg5OA2x1ihmJZjsExNYdL93O4t1dL0RO99cvMc4UzXJZEwRhbPTs
 kPIg==
X-Gm-Message-State: AOAM532G5+BFQ9cy2ilZvib0go2dGKHkSRGEYscAOQeFttd51GgMthwD
 x6AX5qfPFS7ay9ilumajo1E=
X-Google-Smtp-Source: ABdhPJwm71FymYwD2RCaAQe0ruh5XNahsyLNfkIwL+NUnHq8L9JrVeaj5YOOjlfFOQEHLVAB1cN/oQ==
X-Received: by 2002:a1c:e0d4:: with SMTP id
 x203mr13318861wmg.160.1610809041319; 
 Sat, 16 Jan 2021 06:57:21 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
 by smtp.gmail.com with ESMTPSA id h83sm17285824wmf.9.2021.01.16.06.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 06:57:20 -0800 (PST)
From: Alejandro Colomar <alx.manpages@gmail.com>
To: mtk.manpages@gmail.com
Subject: [PATCH] cacheflush.2: Update SYNOPSIS for glibc wrapper
Date: Sat, 16 Jan 2021 15:56:33 +0100
Message-Id: <20210116145632.7636-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_095724_329042_318A5320 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: Alejandro Colomar <alx.manpages@gmail.com>, linux-man@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vincent Chen <deanbo422@gmail.com>, Nick Hu <nickhu@andestech.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, Martin Sebor <msebor@redhat.com>,
 Guo Ren <guoren@kernel.org>, Greentime Hu <green.hu@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, libc-alpha@sourceware.org,
 linux-snps-arc@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Glibc uses 'void *' instead of 'char *'.
And the prototype is declared in <sys/cacheflush.h>.

......

$ syscall='cacheflush';
$ ret='int';
$ find glibc/ -type f -name '*.h' \
  |xargs pcregrep -Mn "(?s)^[\w\s]*${ret}\s*${syscall}\s*\(.*?;";
glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:
extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
glibc/sysdeps/unix/sysv/linux/mips/sys/cachectl.h:35:
extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:30:
extern int cacheflush (void *__addr, int __nbytes, int __op) __THROW;
glibc/sysdeps/unix/sysv/linux/csky/sys/cachectl.h:30:
extern int cacheflush (void *__addr, const int __nbytes,
		       const int __op) __THROW;

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/cacheflush.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
index 2cf624f3a..0496879ca 100644
--- a/man2/cacheflush.2
+++ b/man2/cacheflush.2
@@ -27,9 +27,9 @@
 cacheflush \- flush contents of instruction and/or data cache
 .SH SYNOPSIS
 .nf
-.B #include <asm/cachectl.h>
+.B #inlcude <sys/cacheflush.h>
 .PP
-.BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
+.BI "int cacheflush(void *" addr ", int "nbytes ", int "cache );
 .fi
 .PP
 .IR Note :
-- 
2.30.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
