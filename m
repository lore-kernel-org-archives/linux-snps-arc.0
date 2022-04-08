Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97DCC433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Apr 2022 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqJEX2acMh7nCEz9EHy/Tg/A8utaa5RD+qovFVXaQhc=; b=2UxiN/rIyfUVYZ
	WlyomhXTr9K2OYQ+5Rphpn2SDGYjTUqzHajdq4dBnyQZW7qah5nD1izypPfkZcxNOlD5hQfC66NyP
	opUfHmdD/V4uX5HcGvae3ZlNw+rn9dBQ7tZGRxf2zHgbq8JPrbUE+28H6JiI9YeGsFzcWi7qdnrVc
	eiNcnevcfLECPjNZzLZJzkW4DMaEbP6yHpIbxpZ3n6WQvLXmKke6/4UKyVRigs2RCsLM7uCp/nnTa
	KGi2HBl+Pncl4hcreJyKCu63/eyxqZkgLxsk+nd60UpAwUbV/wLrWmAn/fMb+aD5mcIsaw2Jqg1Tc
	JICQCQ2YF7fGu5milWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncr03-000OAJ-J7; Fri, 08 Apr 2022 15:58:15 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncr00-000O7n-UW
 for linux-snps-arc@lists.infradead.org; Fri, 08 Apr 2022 15:58:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id p10so15766314lfa.12
 for <linux-snps-arc@lists.infradead.org>; Fri, 08 Apr 2022 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XvDEb1kSlgMhqGp09t8N9I72SookPYjCPsrPupjc6g4=;
 b=kCqA0oiXvb+hsDlJhubbmozQBisraoImmKIB0CC7I+2o+x6MX8+V554o3oHmrbgoVL
 NNvf6j+3rGxyPKQ7EISqY8JKARpGAweLEf/N5XK+HMtib/UGTdeHVXNoKt6N/ChWnvhu
 Hb9mYIo+j7JEQoXlwRWKFk+EKcGHi/zGsZMzYRnUawPSzRTvKcgUUHVvKj4eT8dI1AxS
 G+R4YxWpW37xdtw6D1z2TewbqVHFDA8l6bGA07fj2mKRpY887ntJNdZfXf60EuiPvEDZ
 87I/QQrlc9u37YPi62zuCaFb6eWbfuTVR4Hqz+TqglFdAwVuF5ONzUL6SaUsFbAKSRrH
 YUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XvDEb1kSlgMhqGp09t8N9I72SookPYjCPsrPupjc6g4=;
 b=wq27Sh2zlD+T+5L5rNiIsZdOu9Cq1BEOjv9UBSbk2DkrhZV8XrYgPUvd91gAxXAI2M
 HdNlkZHACZ2BsklDWsleHkUWY1wDL3dLLSEOVHKcZA4wtm8IxEx+c1kR88DS3AEXzcB9
 pu3xKpc1o423i5+D/e9m3FJU1tvCQGHqGU3muNX5ZN430rxZD8YQ8+O+YMHG0pAoct5a
 tAPfr6rUGLHZlpH8MqFnyrvROaniPB1MvfztNSKiSI5hyzzdhJYPMEkLEvyBSd5nKlbL
 RDilMp8JZDSU9JvH2G/iI9kbkpaS3QYvD/FYXw08Ii1A9VOQU/139060stAAk7ajmvdf
 2ckw==
X-Gm-Message-State: AOAM531ry66V4BfcbTwVYqgEh/D4bpmiEIa0cYTuFqi9jSyfFOVjoTwq
 Ag/xSgfPLIj7dAQ5q2jcxH4tlK/MBDjiGw==
X-Google-Smtp-Source: ABdhPJwJi/MI0/H1run2b4qAvL032wT8fAFl1aRsVf68jiamk/yOcaNHnLwXHTUHrmho3PEOKWzfgg==
X-Received: by 2002:a05:6512:4019:b0:45d:cc0f:bfb1 with SMTP id
 br25-20020a056512401900b0045dcc0fbfb1mr13417629lfb.127.1649433488707; 
 Fri, 08 Apr 2022 08:58:08 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 r9-20020a2e9949000000b0024b46eef85bsm461826ljj.127.2022.04.08.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 08:58:08 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH 1/4] ARC: bpf: define uapi for BPF_PROG_TYPE_PERF_EVENT
 program type
Date: Fri,  8 Apr 2022 18:58:01 +0300
Message-Id: <20220408155804.587197-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408155804.587197-1-geomatsi@gmail.com>
References: <20220408155804.587197-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_085813_019490_E74609B4 
X-CRM114-Status: GOOD (  13.64  )
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

Define appropriate uapi for the BPF_PROG_TYPE_PERF_EVENT program type
by exporting the user_regs_struct structure instead of the pt_regs
structure that is in-kernel only.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 arch/arc/include/asm/perf_event.h          | 4 ++++
 arch/arc/include/uapi/asm/bpf_perf_event.h | 9 +++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 arch/arc/include/uapi/asm/bpf_perf_event.h

diff --git a/arch/arc/include/asm/perf_event.h b/arch/arc/include/asm/perf_event.h
index 4c919c0f4b30..d5719a260864 100644
--- a/arch/arc/include/asm/perf_event.h
+++ b/arch/arc/include/asm/perf_event.h
@@ -63,4 +63,8 @@ struct arc_reg_cc_build {
 
 #define PERF_COUNT_ARC_HW_MAX	(PERF_COUNT_HW_MAX + 8)
 
+#ifdef CONFIG_PERF_EVENTS
+#define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
+#endif
+
 #endif /* __ASM_PERF_EVENT_H */
diff --git a/arch/arc/include/uapi/asm/bpf_perf_event.h b/arch/arc/include/uapi/asm/bpf_perf_event.h
new file mode 100644
index 000000000000..6cb1c2823288
--- /dev/null
+++ b/arch/arc/include/uapi/asm/bpf_perf_event.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI__ASM_BPF_PERF_EVENT_H__
+#define _UAPI__ASM_BPF_PERF_EVENT_H__
+
+#include <asm/ptrace.h>
+
+typedef struct user_regs_struct bpf_user_pt_regs_t;
+
+#endif /* _UAPI__ASM_BPF_PERF_EVENT_H__ */
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
