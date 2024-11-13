Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FEAD462A5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2024 14:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/ZMCrscDvc7XqBwFR7jpd1xtbcYP+wgo0mmM3Dzm1c=; b=v6zNWic/VTDrin
	Oh4nBhpmspObX7tAxvlxSspb23XEzpSXO5gwnV7/ZiW4i32zKz8ZwbgAvbpLjiVYYR8zGIVxDmxeL
	g06kSOrwJ+9HEjUhWUMjKTaHaJZXikHeQEHxywPgOrxHYisB46b+aGMf998WGsui4SSXtro8t+ZKo
	0t32k75UoHuSIjbpGiCpXuONu9Mkg8NAn2A+Bqkoldg9pbxdm6Kgdca/uJcQR0hubtOxCQA+L4WSC
	lduXDzERUJEiNeevZ/MpSOvqBVyxo+UHuC+5LbssA5TyQdZMS4Ib5fFF4nEIyoXFOOcgimBiCdrI4
	LSDHa+UEVTFCVuwj86rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBE0w-000000072Is-4At9;
	Wed, 13 Nov 2024 14:06:34 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBE0s-000000072GT-3DEB
	for linux-snps-arc@lists.infradead.org;
	Wed, 13 Nov 2024 14:06:33 +0000
Message-ID: <3084f512-7476-4de7-9c28-92546d0358c7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731506786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b1LpJSEXTIsVtvFtU7z5WsJvp58+MoemqzStkxUQMbQ=;
	b=SEBQkpTAMyNiBlmpqvIV935RROsFBT19EGk+IojLYpvzHL0BIvGIv+vvWtPSsL6ueUWMqU
	lNygzxtR7O26eKosip7dBKlaBKnOzLq2bGd1LDCDo3petjqeNVlTOkncKmCQ/duoAuF0GS
	YFD9LM4zYRlxG51SMvBEynQqIvLODrc=
Date: Wed, 13 Nov 2024 14:06:18 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ARC: bpf: Correct conditional check in 'check_jmp_32'
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 ast@kernel.org, list+bpf@vahedi.org
Cc: tarang.raval@siliconsignals.io, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 bpf@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241113134142.14970-1-hardevsinh.palaniya@siliconsignals.io>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20241113134142.14970-1-hardevsinh.palaniya@siliconsignals.io>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_060631_375710_9C405E9F 
X-CRM114-Status: UNSURE (   8.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 13/11/2024 13:41, Hardevsinh Palaniya wrote:
> The original code checks 'if (ARC_CC_AL)', which is always true since
> ARC_CC_AL is a constant. This makes the check redundant and likely
> obscures the intention of verifying whether the jump is conditional.
> 
> Updates the code to check cond == ARC_CC_AL instead, reflecting the intent
> to differentiate conditional from unconditional jumps.
> 
> Suggested-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> ---
> 
> Changelog in V2:
> 
> - Changed subject line
> - Updated condition check to 'if (cond == ARC_CC_AL)' instead of removing it
> 
> Link for v1: https://lore.kernel.org/bpf/e6d27adb-151c-46c1-9668-1cd2b492321b@linux.dev/T/#t
> ---

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
