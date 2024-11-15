Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53234D68BC8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Nov 2024 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Subject:
	Message-ID:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DERzEX8LU8FrvlsKn5LDB0sxYRl6bcvuphjYmSEpuc=; b=xULd9eWS3iRPEc
	l9rWtHiwPZy4rXmeaeFu43NDe1PmyO8BfiDY0XMKwqtR7kJk+FrR5svsDzYxZ0gNb9M78n5vOFJ7u
	FHSBgN3REtwk3hS/gbnowIds7iyLSJR3jrIbsrdP4sf32FDeQizKepNZ3cRgyRIuE3p7YlCsbZ2ID
	ggCKEIHMnkAwzy3ZvkuHUmt1Co99JP/0XOI+zZ8o4cqSX/YmMEkweFTdLGCiYvDsykSMcsAEkZ0xl
	plGWzH+zIhZ/FdoBFjoWPpQKLtpNxzG30z7hbSt9wkUEMPgNAaDg2LYWDI2FVZ+g7no2A2PZzcKdD
	0U47Sil7Z8L1nTqdYAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tByfu-00000003Fz9-3zFl;
	Fri, 15 Nov 2024 15:55:58 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tByfr-00000003Fy5-1go8
	for linux-snps-arc@lists.infradead.org;
	Fri, 15 Nov 2024 15:55:57 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1731686146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HdWjOHueCR6/5j65kCwu4Zc3r5ik3HUAa5hvMDkF9UU=;
	b=tuYIJEXbIJ92o4581lKLOsQO76OU5Ni2ZxiKU5sCYcalYdUOBSX0Bdz0/q16PXvT/+TeH4
	pFXIHV3+F5o+gPbHTT3pFvcwHRWj14mgrlrAxMRJcSmuaJNW972j50FheZqs2GpGRm3Pk9
	1ou93iJYHP6copcs2FWuCXwc4iQvR4TUs67jo/ghdxH1YD6LDsEmLhQmkDgBB5VR9FLel+
	GLG+JVrPKijvs/1UcMTbyDKRyjshMm0yybf4WkEYjjOIlcl6bUMo4J+hyO3RNMa2urGwGV
	Douas6ye4fGV10pRXssIc4kQlj9wOaWVXI5ga7b/CN2C76+D1J01XyROLMNBdg==
Date: Fri, 15 Nov 2024 15:55:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Shahab Vahedi" <list+bpf@vahedi.org>
Message-ID: <f5f49eee8979985439408e7bd6fbd1534e91a115@vahedi.org>
TLS-Required: No
Subject: Re: [PATCH v2] ARC: bpf: Correct conditional check in 'check_jmp_32'
To: "Vineet Gupta" <vineet.gupta@linux.dev>
Cc: vadim.fedorenko@linux.dev, tarang.raval@siliconsignals.io, "Vineet Gupta"
 <vgupta@kernel.org>, bpf@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Hardevsinh Palaniya" <hardevsinh.palaniya@siliconsignals.io>, "Shahab
 Vahedi" <list+bpf@vahedi.org>
In-Reply-To: <920e71ab-2375-4722-bcf3-d6aaf8e68b3a@vahedi.org>
References: <20241113134142.14970-1-hardevsinh.palaniya@siliconsignals.io>
 <920e71ab-2375-4722-bcf3-d6aaf8e68b3a@vahedi.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_075556_004676_83298210 
X-CRM114-Status: UNSURE (   2.18  )
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

Hi Vineet,

Could you pick up this patch [1] in your "next"?

Thanks,
Shahab

[1]
https://lore.kernel.org/bpf/920e71ab-2375-4722-bcf3-d6aaf8e68b3a@vahedi.org/T/#t

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
