Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40413C43217
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8M+Wru1qqpqQBLh5yEjQ5k4Bzz4DRUqRfxVqn+ju+kI=; b=ABIV3C7FTDBwfQ
	ExS+QkXblMe2etM/Ay9WMgCHaQZCzEx2SjJZhoOE/sNfeChSBe6+M1DDX14VF75GBSOOeSVnmgcc5
	Qvo94ZR899NAQLaceUxWzFfITbaWS6lMNLRFMv7CnrfWI6/nZEdHjGUdWZ7L29TARe6wZVWZtzdyJ
	j7KFY3h6R7FzjoITtYcBZMJxKZ02fcWuucZbFFXAr+7sZTUGiNNT6Syj39l4B5Dsd1roA40wtwzCC
	Toc1ICMFQDPf9L61V9zB1Eh9Gve2g/CavW8uZYcwpyLCjITDyVIfSyL1Ju5pdbLkWvG0+tAnvpvzb
	L6mMb1oy9FVSGZTX+UKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVwr-009qUT-D0; Tue, 22 Feb 2022 14:15:25 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwn-009qPX-IY
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:23 +0000
Received: by mail-lj1-x230.google.com with SMTP id r20so19783611ljj.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zq0E9Ld2UsGrmVgT4FBba13TpFX50xXqtbdkW/rPKok=;
 b=XZNDtv54g2XWwCvb4kPelUfHASv7InMJIOGL4Xcjt2nGaflMQyjcYuSMUtjp5gz+nA
 TsZPPwuzlggIR6zp0UuNpypaAFx6f6oKZyEAmALPPyPdrbw8AMNm6r44O0+jdrtxfGCc
 UcERO0Ry99QI2PI8PueJU2ajplPGvTQYB9o0h96dA7N45gco9Cv4iZffIVKJc/CpJwyf
 JjhR+5k+dHXJJSbtxN74F/fTZT7AYPgdPE0S5K9G8C8eMEh4IAbgLBYLRDE7143e4Taz
 YrqIKWy/U/2Gh+G4CE70qfkBUFL+WWZ8I6+9cbdg6FuMA/q3zB3kJlrfRN+bz/mjaL9d
 trjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zq0E9Ld2UsGrmVgT4FBba13TpFX50xXqtbdkW/rPKok=;
 b=M0TCR7x5VUpobr3UCboFUPKTLxrVOcpRlub4FVMJEwz28JjRA7kiLczZoYJbeF2u7s
 JirgqE7E6h8P86Fi17ZoQ37exR5Qaqbn0Zsk1NcFLbAVEJrhSxnXBylC+J23T67nnK91
 y5u3gSa8QV8pz/Cc8hcL5b1b2Erba3Vrxfqlq/i4Z+2ke7ny40snmBtuuwm07b4nUuoX
 uzaI/bTykJP9Be6voZUHsC8aqq1ilbCJHbl++gzBlwbfK6MIW/p7xsKLoYa4tSl+mF/k
 eKYMRbmp9FJJSq9BsB/COtSGKOUHFEDKX9QV4uZxsWTHlgkYnPIVTXGsMAR1betx/lVx
 TUfw==
X-Gm-Message-State: AOAM5304hsXt1SpA9Sys+iJjBNI1CTJkTD8BgBaMQXa56HH9T2dcx09V
 5syZ2Cq9gQUO/mYDZUYz3L65WgzOByM=
X-Google-Smtp-Source: ABdhPJxQlRFkfhMtUo8lUQH7xV2w+r8KY6AKAfA4Q15P/3L+/FosNueBu4bKM1XDiFiuHf7uFnN3Jg==
X-Received: by 2002:a2e:824b:0:b0:246:1246:d830 with SMTP id
 j11-20020a2e824b000000b002461246d830mr17848076ljh.267.1645539320133; 
 Tue, 22 Feb 2022 06:15:20 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:19 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 05/13] ARCv2: memset: don't prefetch for len == 0 which
 happens a lot
Date: Tue, 22 Feb 2022 17:14:58 +0300
Message-Id: <20220222141506.4003433-6-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061521_637793_1338E5CA 
X-CRM114-Status: GOOD (  10.45  )
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

From: Vineet Gupta <vgupta@kernel.org>

This avoids potential "bleeding" when size == 0 as cache line
would be dirtied (and possibly fetched from other cores) and
due to the same reasons more optimal too.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/lib/memset-archs.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arc/lib/memset-archs.S b/arch/arc/lib/memset-archs.S
index d2e09fece5bc..d0a5cec4cdca 100644
--- a/arch/arc/lib/memset-archs.S
+++ b/arch/arc/lib/memset-archs.S
@@ -36,12 +36,13 @@
 #endif
 
 ENTRY_CFI(memset)
-	PREFETCHW_INSTR	r0, 0	; Prefetch the first write location
 	mov.f	0, r2
 ;;; if size is zero
 	jz.d	[blink]
 	mov	r3, r0		; don't clobber ret val
 
+	PREFETCHW_INSTR	r0, 0	; Prefetch the first write location
+
 ;;; if length < 8
 	brls.d.nt	r2, 8, .Lsmallchunk
 	mov.f	lp_count,r2
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
