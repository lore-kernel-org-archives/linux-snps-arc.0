Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7761C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Apr 2022 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tq2ug0uTXy0FhlMJA9VXyxWuyBJA1sUbpKocvVTfd/o=; b=CuR5IZrd94loeb
	b4B8T5pejM0sRyrXDRIi62Bay8G5KeH+NACXtGfLYoLUvhjDukG0l3Weaw6dDXYM63j5YyVoUbpn6
	CxMII4lgHeWeYYLurOydXoXoL8oleX+aoL0Yqnt4wQELox7Yp4idyUEZsBlQPCIrFvGbuXKKuIK4L
	1hcGMPY+QoNFcHPqPigtLxgtgsB9PntnfCesMTD65G18jnsSlS/FfSwFjqkx8Cdkeh7llED+Q74/d
	ybAu1aJDz06g/ES/xrb8Vg9mSl64DgW6vtqJ0mKIs3hMapxC47FXOm9AdvW70IO419xRlTfP885C6
	Gj8a4HXHNtzg0Ps1GkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncr05-000OBN-Sw; Fri, 08 Apr 2022 15:58:17 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncr02-000O8E-Ql
 for linux-snps-arc@lists.infradead.org; Fri, 08 Apr 2022 15:58:16 +0000
Received: by mail-lj1-x22e.google.com with SMTP id s17so4111163ljp.8
 for <linux-snps-arc@lists.infradead.org>; Fri, 08 Apr 2022 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vsc3U53D+n1nJ6txtzC6klGnmN8969CYMnbry2w4dPQ=;
 b=IscNM1Z8MVnhXthcGzn6bX/SD6zdHYhTUMGHeXlYGWe3ElAHNGlD2k79vq0bGLh48F
 f3vv46nrW+e8k+qYfsBLlng49DZO/RIgweQMW/BOjrrqHCFdA1vGshZIToeVHDHkOMAr
 hOGFL+hlWXsBLhhjVuR+vNOy6Y6rSb3IcWWpGF4k8xYPUmLs7MquhocQ3POVqWdZLjU3
 GyjgLT0fF9qFy7x20fyNc+LJu+Cjow4YnmV4Owm5MBhzc2jpAk1Jrc9ZSASzSYIKTlmF
 QwQ1FiFnkbrE7Y/ZiltVjR2ipk+JY5EbSDq/1jY3p+TMVWCZCzfqJqwAYmZMCKEvmsqu
 N5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vsc3U53D+n1nJ6txtzC6klGnmN8969CYMnbry2w4dPQ=;
 b=n4WwLe/LyP/ZcgJ8UADtEDOvCoNA3iAfanHXTHVkpe9f4q/qYySlngo3T4P3AxjmHv
 gApLho/vVP9pL5mncY617zhztI4mdVzj+SM3CfM9+T2w5M2v0XAuEB9QJ2WPr+9cOMcd
 Ccu5KWbcHzdQY137IoOWkmHSxEf9OhEuK5pSmQI3e9lK1P6um+mSRe1WzlrMSxfpE6lP
 QzJKL8lKtuK7nL1xg79clf2WjVydZJi4ed1bfjGoDPJmceAhWijLZBNheEPRy3QpZ2b4
 SK+YXTMIJA+YRg7UahTL0tU+Bl+oILJE+x9BUFAvF0p036OUtpr04KGM4BRbmu3XIH+U
 nZcw==
X-Gm-Message-State: AOAM532tlBUJvnyOAWgtKtFKZUGaRprfY+vyfxCbNkb0eWQdKCQvwg86
 utpV7pE05+p6yuhbPqt5xT4ONnMxLjjMYg==
X-Google-Smtp-Source: ABdhPJyxXNehCM1fmYr4gG63q7TZIr7LKfz0NAnjEc1SnnuywdyI/sqtXjsUKPL2Fj2nxGwLJVEgBQ==
X-Received: by 2002:a2e:a592:0:b0:24b:d8f:ae55 with SMTP id
 m18-20020a2ea592000000b0024b0d8fae55mr11841880ljp.460.1649433490699; 
 Fri, 08 Apr 2022 08:58:10 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 r9-20020a2e9949000000b0024b46eef85bsm461826ljj.127.2022.04.08.08.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 08:58:10 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH 3/4] ARC: entry: fix syscall_trace_exit argument
Date: Fri,  8 Apr 2022 18:58:03 +0300
Message-Id: <20220408155804.587197-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408155804.587197-1-geomatsi@gmail.com>
References: <20220408155804.587197-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_085814_905118_0D2B2E77 
X-CRM114-Status: UNSURE (   8.99  )
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
