Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C54C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Apr 2022 08:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tq2ug0uTXy0FhlMJA9VXyxWuyBJA1sUbpKocvVTfd/o=; b=e+5ltZ29BBeDsZ
	ej8Ccb1T/MQuGReXqZf26h/rWkTH43OZnJwA57Rfij9HMDhZWjQXFl1p+/IS+IrCnTzlLbcT4e+9j
	NFla6AxGqa9CsjkJAfGTOtbpBVLVFaek9Ep6zNWMbKif538cP7N8RSCYMhl0blvlhURbwbAxsQxJg
	/U0kgOyG6RUCvW1mTBgM1TMMJZI7s9Dnk85uKm0P3KIg6BLMCZJhSbQtfzn+lrxAMExR5EYqnZpaO
	ybNQSLeOkdWQfeUhYSKeYJla7iiegxny9XBw9KJmGtnsxoYQBJw2dLaVeJMIYv/1GLYH0Y6GzYHmg
	GQJ93PhQl3we0M90swlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neufW-004VFd-H3; Thu, 14 Apr 2022 08:17:34 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neufT-004VCY-CO
 for linux-snps-arc@lists.infradead.org; Thu, 14 Apr 2022 08:17:33 +0000
Received: by mail-lj1-x234.google.com with SMTP id r18so5121195ljp.0
 for <linux-snps-arc@lists.infradead.org>; Thu, 14 Apr 2022 01:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vsc3U53D+n1nJ6txtzC6klGnmN8969CYMnbry2w4dPQ=;
 b=p0L10nv+OHXd+YPKZG4m+zZf5ju/1TA/nIzrOiS7FNqc3nWR7/vH/B5tyVgMT7oYow
 GK6GM4YyOJingrqiGKl120ZMgn/o5VF9bNIh044BuJ2g7EVgIjRBETHhmnRRotSx3GjA
 k9huxWrs3dqlDPi1l+tpl+Ncfqb5uPvdVd1I+vhoduDGVlcx/qrWfSn+xLLTKjDFRG6y
 7fjokzWLiyqaathVB5FL7OTYbVSL+DYcdQ4d4UgM7Ukxx3cl2pcqmXy9Z02rxdZzbfvP
 d7ko02kr4pqJk56wSZcL1VfN35yM5/lZV5cLjDDKI/6fBs9TwlRlPY+7PkgvKDZOs53p
 ehxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vsc3U53D+n1nJ6txtzC6klGnmN8969CYMnbry2w4dPQ=;
 b=cAK1g6Llu8H7c8qpHHVuomSpj1JxG3FAy3HycomvgiyRn4BypzpNsRll5tIniUL7Kd
 MDcuVYY5znsqW7ovJ6iWTAZXj9TNc523qskyrJddCJUgIfuqLdLgInA6EoeWgyDOyOvH
 FRwMXcSzm/WktoKcSqGBp1v8d0Q4kLzTuTvBmNkiMGCCfDMzohd8GuJChrBWaI6dgqP+
 Crjjykr8j88GCmX53RrDkWHt/u8yFCI+wuQ7lTN7dNlWT9TXKewYmmft7cqvuN+lrr/v
 zOag9HWwwUmXYtGFjXfbzw6+kB49lU2/G6grFOT09qEG/ZXvCdKPBVjXGmeCipL0EqoD
 n4hA==
X-Gm-Message-State: AOAM5317wumYsysDB1ciPIhja2eKGlSn9SgZVf71Mu/n3i+kgDjisBXE
 U8rL9YlKAvtc7en3kEf/9EFJIW5KtkViqYrB
X-Google-Smtp-Source: ABdhPJyQEwDeFWy3zNkbzhwH0LXP0rroilSTPl3Ol1vfXSRyfxOiVBbtTTIThxV32Pg2AzqF2mPERA==
X-Received: by 2002:a2e:b2ce:0:b0:24b:5f39:3124 with SMTP id
 14-20020a2eb2ce000000b0024b5f393124mr910119ljz.483.1649924248672; 
 Thu, 14 Apr 2022 01:17:28 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 v20-20020a2e87d4000000b0024b638069b1sm117116ljj.39.2022.04.14.01.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 01:17:28 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH v2 2/4] ARC: entry: fix syscall_trace_exit argument
Date: Thu, 14 Apr 2022 11:17:22 +0300
Message-Id: <20220414081724.3177956-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414081724.3177956-1-geomatsi@gmail.com>
References: <20220414081724.3177956-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_011731_507288_8DCCEC5B 
X-CRM114-Status: UNSURE (   8.44  )
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

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Function syscall_trace_exit expects pointer to pt_regs. However
r0 is also used to keep syscall return value. Restore pointer
to pt_regs before calling syscall_trace_exit.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 arch/arc/kernel/entry.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index dd77a0c8f740..66ba549b520f 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -196,6 +196,7 @@ tracesys_exit:
 	st  r0, [sp, PT_r0]     ; sys call return value in pt_regs
 
 	;POST Sys Call Ptrace Hook
+	mov r0, sp		; pt_regs needed
 	bl  @syscall_trace_exit
 	b   ret_from_exception ; NOT ret_from_system_call at is saves r0 which
 	; we'd done before calling post hook above
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
