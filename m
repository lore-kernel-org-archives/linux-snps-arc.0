Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53616C4345F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Apr 2024 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nArR35SoCH+JJYpn71nsNduxrKY2AURJjrZl7t33lTE=; b=RIg19ssW7LNbgz
	uUR6VfnYSntqjGmksZrnypuWwG6CJnwxQppzLoWZ6FNweQC0MiDuQ4xWDJx0ypMYHyz6rK9n6N8DO
	2xDQVoeEK7sOkXEmPNtiVDln8YHqzuShtn+I8ZkPXxqVUZQR/knvFeeJ6f4bhdVV6mJcECpc1AM9w
	zpHgTiv4r2NMZ+8fjI8iKfEbFV0uzR4gDAnsYwIwoxbEweGB5L75yDNyr2pxjfUe+fkStitkBhMee
	4ncdbVUNpupYjY+XeXL4nA2ZPCIRyGlhDLwLmgRcMSvgAwrgt9Bt8o9audk5OCqBtcAFqtELAFpgc
	u3zYdyyxcJdqW51+2bng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7Y-0000000701Q-35yL;
	Tue, 30 Apr 2024 15:10:16 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7T-00000006zvz-2U3Z
	for linux-snps-arc@lists.infradead.org;
	Tue, 30 Apr 2024 15:10:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1714489808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ThTd2juqdVL308+cYDL98JCaciOljdIvUBHbbZggJQ=;
	b=ACU259mxRShPhuGVsVphiAcDszt2IU0kiEMJrvUyfJ1S/0rvLzPN39REuYu1bV1WicOFLd
	AA+EbDMP/wPErJIhknol+JDFeKeYjq89v2RaWTiVjYkagy4aOUkwpe6cGwU4LGePmMAaQt
	1LnZw+V/XXrMu4L8i7kNQpbS2/oKsF8JlMabsiFI2AzVmqx9NF9t0R5nc0wB8fJcqR0B3P
	arQ8kqMX6YNs43sVPREO0qIr7hqwXVz2FFoMtB8PfSpeZuC8waRF8vWM/yJPHqTdEFsowN
	J3ki315r+8JQYxbLgryqwBppFanz7VYqFys/nFVjcn5B77HLngn2cBqqcjFmJw==
From: Shahab Vahedi <list+bpf@vahedi.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Cc: Shahab Vahedi <list+bpf@vahedi.org>,
	Shahab Vahedi <shahab@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 4/7] v2: MAINTAINERS: Add "BPF JIT for ARC" entry
Date: Tue, 30 Apr 2024 17:09:34 +0200
Message-Id: <20240430150937.39793-5-list+bpf@vahedi.org>
In-Reply-To: <20240430150937.39793-1-list+bpf@vahedi.org>
References: <20240430150937.39793-1-list+bpf@vahedi.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_081012_073244_5C0FD015 
X-CRM114-Status: UNSURE (   6.29  )
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

From: Shahab Vahedi <shahab@synopsys.com>

---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 943921d642ad..b6a946d24f00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3712,6 +3712,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
 F:	drivers/iio/imu/bmi323/
 
+BPF JIT for ARC
+M:	Shahab Vahedi <shahab@synopsys.com>
+L:	bpf@vger.kernel.org
+S:	Maintained
+F:	arch/arc/net/
+
 BPF JIT for ARM
 M:	Russell King <linux@armlinux.org.uk>
 M:	Puranjay Mohan <puranjay12@gmail.com>
-- 
2.35.8


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
