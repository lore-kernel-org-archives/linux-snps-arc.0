Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1116BD597C5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2024 02:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To:Subject:
	Message-ID:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efV66XzQF9eve7cBj8i5DWiCpf4PSKj2zJ2onP2Jw3E=; b=QPg4tKa0zg6OIX
	d4xE+D/ylKNPKXuA+t3iCbUxWcafLBiEqihrSEXboi+SvMwoRdODxT4VGn5myguWkXFs9VpD9H5Qm
	Lbi1k5jOtVj4nfB+/O0TMZgFxMI4Fv7DjPIEwE5sxFUtOxICZJ2Lt7AGF6s7cBdDY/LuYDC6aFJMF
	j0tfnELfhDDTh5nU/VUnpHPOGIaRC9OCx2wzBMgtQqPBX8MulhSD/sdUv9F4Xo5k3WAan5qr8Rv0M
	6HzrMW6zIt/L2vL3NBvjIEGYb03MXaF0D2yqWk2m7PgfnZOMlGVteg3zTrYq+gsjVB5AaXWubGZ6G
	tAoGbJfWAeWz+hzOvofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2rc-00000005a8t-37q4;
	Wed, 13 Nov 2024 02:12:12 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2rX-00000005a84-3fBI
	for linux-snps-arc@lists.infradead.org;
	Wed, 13 Nov 2024 02:12:10 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1731463920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPAFNR/5ZvSKqaLMt8rTiosnu4xB/7YjXsTMr1zPqOs=;
	b=H2f2josUl02/QYj8HZeK0rhfBW6wwfVszOKFy00+KMFCobNMnOgLX3ceyVgX5NmtlRw6zd
	8G8Xv2G+3sz83sam2oY8/QuiGn7+pZwBn1Chh8Vazt6mWq3fk9uAVEraWPhm7F2B47Q3Q8
	9lyp+fMnJIj8pgcBbJU7hUNVPHsjr2aDml1RU+nDl66E5eqVotaz/qY6ri6AOjjhuEg9km
	BUpn19H7FWrEPcslYwLfLL27hkE23aQK4D6pA+PF4WA0rNGates1me/kgFJUTdKDLF2b+j
	tQlbG7VpURI233Ox21yfSYt7Hk6TtsaFOglq+5akdVm7R9HghmdvpVs+xoJxVQ==
Date: Wed, 13 Nov 2024 02:11:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Shahab Vahedi" <list+bpf@vahedi.org>
Message-ID: <6454497ff35d2a534cd34b7635fb044e4033fe6b@vahedi.org>
TLS-Required: No
Subject: Re: [PATCH] ARC: bpf_jit_arcv2: Remove redundant condition check
To: "Vadim Fedorenko" <vadim.fedorenko@linux.dev>, "Hardevsinh Palaniya"
 <hardevsinh.palaniya@siliconsignals.io>, ast@kernel.org,
 andrii@kernel.org
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "John
 Fastabend" <john.fastabend@gmail.com>, "KP Singh" <kpsingh@kernel.org>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Vineet Gupta" <vgupta@kernel.org>,
 bpf@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <e6d27adb-151c-46c1-9668-1cd2b492321b@linux.dev>
References: <20241111142028.67708-1-hardevsinh.palaniya@siliconsignals.io>
 <e6d27adb-151c-46c1-9668-1cd2b492321b@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_181209_002349_2456738B 
X-CRM114-Status: UNSURE (   6.24  )
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

Vadim Fedorenko wrote:
 
> The original code is obviously optimized out, but the intention, I
> believe, was to check if the jump is conditional or not.
> So the proper fix should change the code to check cond:
> 
> - if (ARC_CC_AL)
> + if (cond == ARC_CC_AL)

That is absolutely correct. If a new patch is not submitted soon
I'll try to fix it myself.

Cheers,
Shahab

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
