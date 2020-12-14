Return-Path: <SRS0=O7sC=FS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2481C4361B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Dec 2020 14:39:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A784B22473
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Dec 2020 14:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A784B22473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GWUr59Bi7ipmBi+pZoh5oNPyF1ZtGMx6DuxV4xKb3B4=; b=lmFk45kn9+6v/pvbzPW31w850y
	KmSnRLIn/ZIyAlFm81KDBx54+HPJDh91ibAMPafzB2D7e4J8RTplgt5K6zQlEJYSPnLcjInp4ImrQ
	KWgUkq+xME3QTDQpVu5THxVTbZzjaIqpSvwiLwJauRbk1P1A9HT/wmZ6Ed7zEbpxxRwwhdrYyNTp2
	S67XaNd3/xIhgO5fgsfUdvzyJHzykdOcoXNAd6V9vaRDn3JfomulR8X1UPgtwctPpZR6uaS8T5PEW
	pTzfqvDgKAv6Zuhtb2xhUoP0J6d+NxsQhpEys/zb/SfvENnm83OHr/Qi/Fnco/d0TWIpqKaX7gWqh
	gIrY6gGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kop0J-00048f-19; Mon, 14 Dec 2020 14:39:11 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kop0G-000488-Uw
 for linux-snps-arc@lists.infradead.org; Mon, 14 Dec 2020 14:39:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id a11so8912558wrr.13
 for <linux-snps-arc@lists.infradead.org>; Mon, 14 Dec 2020 06:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y23uQOHXl8QZ5RIklxR/5d33ikY1eJDu8wcPOna5oh4=;
 b=L6tz25Dmbm6QTy/RsOTHj5HcD+iVVZXZ9pDv1dXNiPIUjzgZ3vz2s9Jsi8bDGn8OW4
 2YkyF5rU/HLezWAyBNB6QMCNBG8/HuvpFBX+rz8/VdKBKS5VVt39sWNvga9Q53e7R733
 0LpK5/rJTUMvJbs3pGlBAzAEqdZmaZgEuaPJc728JO42MKOphAv+uSg7af7zvgoz34P6
 6UG1aBiBYuu3bKLd+DJXPJTECQWb62n2d9EnSPdqZB5T6BJbifDwfjKDSUo7qDamU66o
 8VdH2J+YpEYeDoeN7/bocXWlfCox28B/i9OkKwLvgulGEKd96SGHbVV8l6K6rduduooi
 +7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y23uQOHXl8QZ5RIklxR/5d33ikY1eJDu8wcPOna5oh4=;
 b=pCVhXOWNrEw27DyjVL9gi0qYvvdcMWBtLecLqnikUmnOqIdyzQ45lU18dzx9qV4VrP
 E9mXDMWoL+s1PVDKHkzsw1kzj+Nu7fX/0zBZ0gv44m0LxkbL4iBZOV4dwUdvhYlp40/0
 s4Craaj3og3M41oPWm3LkTImVMy660KNCAFVAqEiD5Tit96egelyO1uHB/OXf+cx5F8i
 6oRsfHr2JIP/5pjD7hqwjRNWqiICZ8Yzc+iWGfRdGSRvy54fBhjyrzF+Rt0SQkIWVwKv
 +4c8iyin+732qLQDLE7nMIi9Fljw68v0fLXel1iHTJX+NVYGpmLyBeIPn+c9Pqa1kNNs
 +5EQ==
X-Gm-Message-State: AOAM530LGbWc8UyqZZClPtoeKMwI75dzE6r1jvZNWjGtJEr7VYq3X+js
 PS+WbBr8NaO5+n5fUxB/678=
X-Google-Smtp-Source: ABdhPJw6FLJ01Z+XyCZT/YG7W+WiJ6p1Di+54cDzlWLY2Y7+ZsEyURKbqB2sn9ipAH3YjqEV1gr5gw==
X-Received: by 2002:a05:6000:185:: with SMTP id
 p5mr28298483wrx.403.1607956748086; 
 Mon, 14 Dec 2020 06:39:08 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
 by smtp.gmail.com with ESMTPSA id w18sm12481539wrn.2.2020.12.14.06.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:39:07 -0800 (PST)
From: Alejandro Colomar <alx.manpages@gmail.com>
To: Michael Kerrisk <mtk.manpages@gmail.com>,
 Dave Martin <Dave.Martin@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-man@vger.kernel.org
Subject: [PATCH] cacheflush.2: Document Architecture-specific variants
Date: Mon, 14 Dec 2020 15:38:53 +0100
Message-Id: <20201214143852.16565-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_093909_009783_94FF6BD9 
X-CRM114-Status: GOOD (  10.52  )
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
 Greentime Hu <green.hu@gmail.com>, libc-alpha@sourceware.org,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---

Hi Michael,

Please apply this patch after
'[PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a more
 portable alternative'.

Thanks,

Alex

 man2/cacheflush.2 | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
index fc35f1a0b..0761b429a 100644
--- a/man2/cacheflush.2
+++ b/man2/cacheflush.2
@@ -31,6 +31,10 @@ cacheflush \- flush contents of instruction and/or data cache
 .PP
 .BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
 .fi
+.PP
+.IR Note :
+On some architectures,
+there is no glibc wrapper for this system call; see NOTES.
 .SH DESCRIPTION
 .BR cacheflush ()
 flushes the contents of the indicated cache(s) for the
@@ -87,6 +91,44 @@ but nowadays, Linux provides a
 .BR cacheflush ()
 system call on some other architectures, but with different arguments.
 .SH NOTES
+.SS Architecture-specific variants
+Glibc provides a wrapper for this system call,
+with the prototype shown in SYNOPSIS,
+for the following architectures:
+ARC, CSKY, MIPS, and NIOS2.
+.PP
+On some other architectures,
+Linux provides this system call, with different arguments:
+.TP
+M68K:
+.PP
+.in +4n
+.EX
+.BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
+.BI "               unsigned long " len );
+.EE
+.in
+.TP
+SH:
+.PP
+.in +4n
+.EX
+.BI "int cacheflush(unsigned long " addr ", unsigned long " len ", int " op );
+.EE
+.in
+.TP
+NDS32:
+.PP
+.in +4n
+.EX
+.BI "int cacheflush(unsigned int " start ", unsigned int " end ", int " cache );
+.EE
+.in
+.PP
+On the above architectures,
+glibc does not provide a wrapper for this system call; call it using
+.BR syscall (2).
+.SS GCC alternative
 Unless you need the finer grained control that this system call provides,
 you probably want to use the GCC built-in function
 .BR __builtin___clear_cache (),
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
