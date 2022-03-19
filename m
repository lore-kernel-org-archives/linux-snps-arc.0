Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0AAC433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Mar 2022 02:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fauBHVuCztUVhLln/Uf8AHKbecAtho37D1uplaVPh6c=; b=TMlvXASDPdUxoq
	BVGFVL4OP18Wq/bt0IiAQOKtXuoRvF5n3Rf9SQVk/NkIi3SvCJKWX2tJJSmXZllIanAug0GtZKc6y
	6j031xL42A7PSDHAoaXBPfsyePQ+8a9lEyCHwFkiq7CJ+OGJ8AV1EdHesEYMKcQAVHPL32/kOeidn
	6y0DvFEYNcS4b4tseWgRtISc/Nfpn5eA04yp+vEw1IJGTwifkbophyzoQobpeFYJMQjkGWaDOLmVC
	WBqGJ/uo2xRXcAZ0wjUFYCe58sU0s9pgESYXoB6v6gF762RkoRpiJ+bdtoeMB+2DTL2FTNIAPzMYP
	jIlJREhSlnB63RpfcLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVORH-00367N-4M; Sat, 19 Mar 2022 02:03:31 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVORE-00366o-K6
 for linux-snps-arc@lists.infradead.org; Sat, 19 Mar 2022 02:03:29 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so9852931pjp.3
 for <linux-snps-arc@lists.infradead.org>; Fri, 18 Mar 2022 19:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xoAR2yJVMUeB0bOOrib4HlR43jGO+3UNSvj/b9LiFUQ=;
 b=aNK7F9MGvu9GmcJTkBB1frsQTl+WFfM31pE8duZPG/4vLLu1sV8crLU1Cjqt6ZITBV
 j+ebcjdv7EEakCVNOmFTCad+rRqiylDyuit2aDM3kqwICNqk8IVP9Kw2C0K+0fqDTlgd
 HidoSZmLFdKJ62j9Tey+JqCvKeuR7G8B/D8DU169H/d4Lg4OtgYks7zl8jsBqwYgjwiP
 /xQBjnhKGUvX86jVpltZ9UVSzLCuKx5/mhhWxJ9TjGX0TwB6yiVjEBbbsTf740SHZbZ6
 L6VhC0ALhnGwOGKScXhMnPcZq0PjKtMn30sVgzl71M6PXrqiClBe/r0qwAtnOYP+qWa9
 12kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xoAR2yJVMUeB0bOOrib4HlR43jGO+3UNSvj/b9LiFUQ=;
 b=6P6a83fhN+lVwUv7Zo9d9O/fwJbb/GKz+ZX79Vkz357eKrHnYkGFlQzbukjHubL8hp
 9U4AzUX0Rrlk5Y26FUMB0DZVTnuLF4LG7TUlouQEQbqoPcDuIS4/ERSjfGx5XfJfx/vv
 TxtIuUvR8jfaarMY5CZaTZRUh1scwIV7ToBGkOISGG/vICwgDsggr+AXgdwA+aX3POgM
 8Iki/8DdU6yQiXJS4h4+v2FFn5k7Bu3ZueAJZcNbsiOcFHj1/dc6EmHJQIOeU336cPhk
 GO7Thh32vbUEziRYfXGN2um48tx5I8b+2TD/J3Bf9WRrHcCNUbW1RUahaHEWxpZ4USF3
 OshA==
X-Gm-Message-State: AOAM532jCZPa4U2o0Vc884aJ+l8PRcpqKXLPQRIa93gB6kKd4v7UgWOF
 1wqvkrf/Yy0oPrWvaqqL8k/rturAg66EXXtR
X-Google-Smtp-Source: ABdhPJwTP3VMs0asgQeocvUNjtfID3/u/2reGMDGPKYUq8a2WBpC0xyak0M/1dQ+o9h1SLCVcackkw==
X-Received: by 2002:a17:902:e94e:b0:154:3a4:c5e8 with SMTP id
 b14-20020a170902e94e00b0015403a4c5e8mr2413704pll.19.1647655406845; 
 Fri, 18 Mar 2022 19:03:26 -0700 (PDT)
Received: from localhost.localdomain ([119.3.102.56])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a056a0021c900b004f7b425211bsm10225674pfj.36.2022.03.18.19.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 19:03:26 -0700 (PDT)
From: Bang Li <libang.linuxer@gmail.com>
To: vgupta@kernel.org
Cc: peterz@infradead.org, mingo@kernel.org, valentin.schneider@arm.com,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bang Li <libang.linuxer@gmail.com>
Subject: [PATCH] ARC: remove redundant READ_ONCE() in cmpxchg loop
Date: Sat, 19 Mar 2022 10:03:16 +0800
Message-Id: <20220319020316.142479-1-libang.linuxer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_190328_716138_FFA1C0C0 
X-CRM114-Status: UNSURE (   9.85  )
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

This patch reverts commit 7082a29c22ac ("ARC: use ACCESS_ONCE in cmpxchg
loop").

It is not necessary to use READ_ONCE() because cmpxchg contains barrier. We
can get it from commit d57f727264f1 ("ARC: add compiler barrier to LLSC
based cmpxchg").

Signed-off-by: Bang Li <libang.linuxer@gmail.com>
---
 arch/arc/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index 78e6d069b1c1..56c23f3e1309 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -274,7 +274,7 @@ static void ipi_send_msg_one(int cpu, enum ipi_msg_type msg)
 	 * and read back old value
 	 */
 	do {
-		new = old = READ_ONCE(*ipi_data_ptr);
+		new = old = *ipi_data_ptr;
 		new |= 1U << msg;
 	} while (cmpxchg(ipi_data_ptr, old, new) != old);
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
