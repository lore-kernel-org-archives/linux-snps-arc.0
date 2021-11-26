Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F37C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Nov 2021 22:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pY1En/QIVmFHkcx7DaR+rRtxMYmyKigP+u/Hhwb9jb4=; b=QZHw3ioltQq/vL
	zFZ8duSYu/9Mw5PcTzovyhHoDyKX1qN9NmfmRp1jZZ0aukr9m2p622Iq+wrKEMOEitfbHusuQBEiA
	e+8VaHWhHVSo6J7RhVGUzjIALTBwZMiFFkgtVv15+EfMyD3HW5ebBxrSKzwSL8LWgip0MGMR2390B
	opWENFLVo6pO6jJdIvF1H/MnDzY2L+4le9vRBtkDzZYH6F8fRn653D4+dSzyNfnrHLouyE2TRJ9ct
	wJcd5HPLsSM6DxwC9novikW7n0NwR0Mb9Fthm3Wltz0SZtuN3WpNxMY51dFpIhEBRqhdd7Z6oo3jo
	+8W3b+Ihg6uC6hsA5Pxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqjcj-00Btmo-19; Fri, 26 Nov 2021 22:23:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqjch-00BtmT-6J
 for linux-snps-arc@lists.infradead.org; Fri, 26 Nov 2021 22:23:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so7666233wmd.1
 for <linux-snps-arc@lists.infradead.org>; Fri, 26 Nov 2021 14:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z+4t5OMP+y8asfHJx9yemcdXWelcG0CCFormBoppS2w=;
 b=Gzxae8UGy2wtl+rrwGkZkZQPrLUDgc0Nc9kSYiZm5VyR4AcHrSzQE1oIXHanuNvRlS
 1COJ8mspv1pFLIiNp+fQiWfqN+bt1VwfFl4A53f95zL/Dgz8Nf5Qrbz1TN6DY79QXC5n
 I1C8c9Vr859QaoU2P23LgpGx2F861z9dHPKs/okYG9jkSjH6NoayVuMnjkw90spw6aSy
 vd30uuk2MUSBBVJ5oSdHS2ERGWYE3nswWJLhmne6f0d4EM0LhIXvvZSJpJuHvvVKM/Gd
 W/Pyj6CStsRIcW6pj7SzAE0Z8A7LYK2qnJ65VdusgNkoZisOd6e4qedsS+52/dEtREPr
 w+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z+4t5OMP+y8asfHJx9yemcdXWelcG0CCFormBoppS2w=;
 b=5r23lEeLmj8dTSRne7plTTHquvzKA3my685YEVdWOPuaWiERRxykHfzNwKwUgTkXBU
 Cn9+fyGDBlORN5svghpS04Ag4nVT8PaT7ShFEQHaw1d0UVrB61j4snBZbcDz0WaWACyD
 b0XQzgsh2iALcUVGN68IMRYanoFnW/JpMJRKgSNSwUImlXIkA6yWxr1EpOUo7/Lbl7cu
 QG9rGoO+snVQrLOuMUWh6r5eo9l9p3B2CZVMw88NKrcgGDaeLo/cPYgtkQLz1UCpJJDn
 7anKNn2Zy67Lc9WO5CycnX715YFsWoHXUsjeQRbvu42VyVcyBPj/lI5uieTzUNpT3Mjj
 qp4w==
X-Gm-Message-State: AOAM532xGA7E9ASrrFfAwG59II34lvWNSlLDRlaXk/XHi8kGDNaqxTH4
 803OExYCC1WJHw==
X-Google-Smtp-Source: ABdhPJzMntEXDyGjqAPNcqmlryFDYENzBgRQiOuclEM7RYDtf91okuklzP7kFyID/PcFnkVcWS1P5Q==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr18789968wmq.148.1637965393404; 
 Fri, 26 Nov 2021 14:23:13 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id d7sm6349690wrw.87.2021.11.26.14.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 14:23:13 -0800 (PST)
From: Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Vineet Gupta <vgupta@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARC: perf: Remove redundant initialization of variable idx
Date: Fri, 26 Nov 2021 22:23:12 +0000
Message-Id: <20211126222312.1125594-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_142315_256962_FEE02D47 
X-CRM114-Status: GOOD (  13.10  )
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

The variable idx is being initialized with a value that is never
read, it is being updated later on. The assignment is redundant and
can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/arc/kernel/perf_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 145722f80c9b..f5dd799ddb9e 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -361,7 +361,7 @@ static int arc_pmu_add(struct perf_event *event, int flags)
 {
 	struct arc_pmu_cpu *pmu_cpu = this_cpu_ptr(&arc_pmu_cpu);
 	struct hw_perf_event *hwc = &event->hw;
-	int idx = hwc->idx;
+	int idx;
 
 	idx = ffz(pmu_cpu->used_mask[0]);
 	if (idx == arc_pmu->n_counters)
-- 
2.33.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
