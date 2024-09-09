Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A594EECE577
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Sep 2024 18:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a3TxuJoXs943eU45Ezo3HjFRaZneDCIEQ5z8kY279QA=; b=NSLIKLnkoS7K/E
	eAJvERqUCHDhp3BJI5zkxHMK7WdcgAa7dLyHLnrVXhSQkk64vciT5deP79Nj1s+qrZW6PNhofKiQQ
	tUTfOcBYMa17YKmhrSBLNlTUdVk8rWmNtfBOxhgBkcmc3TzQi+2+a+MTY2a8wmf0nHuuMydgDX0Fc
	T0hWp8QlXC0KAldfMpyZdPqhVo7TzqrhSF97W8MasXpsIG7rTmczBEdPYlEIt8s4zIc+T5/6eYbIS
	BQs9hflKepow1AqBz0yUSL3rKQpqW5ddcSKHuR0D/cixVVMz5AZ/8mMZsgIEgRJvoiSPJLhJa+CLQ
	fwoI0zZIMP0IqyJlYcCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjRG-000000030Yq-3zJx;
	Mon, 09 Sep 2024 18:48:38 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjRC-000000030YA-2b6p
	for linux-snps-arc@lists.infradead.org;
	Mon, 09 Sep 2024 18:48:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1725907704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PKmtkxoc5b8vnoy7LbP0ElooXwR7zC0BNINP6TdpxSQ=;
	b=WvISwyI/Di4GHENFrrPuFAShHwKXHCX0lJrJVi9fUy2qTKXEOHTee3HwV8jh0x6eaUeFbr
	GoXl9ZIc9/hSfeJSTqUCoID9rt8iQD/e4kuWZs33BC8vyAL69uoHdZeVbZE1alf8IasPek
	PdA9bHEhxkuy6qWD2elGFQl/75z9zsioIloiSKrREmV7v9tgu2RMI7SewXWEzcAKcZJk7d
	jaebIOQBmU1mqY87Lkgow1t/hTWELRBO9AU8eCXG8ucThrQ/35woQP2X8/zgxNLjJE2N+7
	1BpplNenXd40xyBlD8iyIdZdqd5BMlb1VTw/U00C8P3A5uBporod8FNreNQWMA==
From: Shahab Vahedi <list+bpf@vahedi.org>
To: bpf@vger.kernel.org
Cc: Shahab Vahedi <list+bpf@vahedi.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Francois Bedard <fbedard@synopsys.org>,
	linux-snps-arc@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: [PATCH bpf-next] MAINTAINERS: BPF ARC JIT: update my e-mail address
Date: Mon,  9 Sep 2024 20:47:54 +0200
Message-ID: <20240909184754.27634-1-list+bpf@vahedi.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_114835_488069_9B8E1895 
X-CRM114-Status: UNSURE (   7.47  )
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

The previous e-mail address from Synopsys is not available anymore.

Signed-off-by: Shahab Vahedi <list+bpf@vahedi.org>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Francois Bedard <fbedard@synopsys.org>
Cc: linux-snps-arc@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..ebd4bca26e20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3931,7 +3931,7 @@ F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
 F:	drivers/iio/imu/bmi323/
 
 BPF JIT for ARC
-M:	Shahab Vahedi <shahab@synopsys.com>
+M:	Shahab Vahedi <list+bpf@vahedi.org>
 L:	bpf@vger.kernel.org
 S:	Maintained
 F:	arch/arc/net/
-- 
2.46.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
