Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5767CCF2C9
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Oct 2026 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBkRPhHofAXCHa+Gn5dVeNIWmipmuhObXgc5W9cQRgg=; b=vhlmh8VDd5B7sb
	1xzn9lpJJb99hdHb9KRfcR9JaafKP9zxfJSTjjdQoE/hZV0dZ0ItRN9+lfrcsybChL7knbn1GoASQ
	I2cHFUqQZLh7u2vILfb9zgQqdj2V8g35/w7FeP3gfd9wbBPHW5mafNoxy8E0MNSY7IoA7ASUUgxiZ
	wza6QCkKUOuboB6HiM+0hzQfigS/SoipkURvg1lOGAWNVLe72HUmqujT5YVNrN5MzL3O51qSUci44
	1Wp30d0UG1wcDukQmaBvS6Ca4qhUSz0FCJBLSYKXtgOmP2zvsE/sOpDgcypomZv/T2GHQID7eDE76
	rWqkqBF1lAf+cdUkPJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISnM-00000005zUr-1DlW;
	Sun, 18 Oct 2026 15:27:32 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISnK-00000005zUU-1RjE
	for linux-snps-arc@lists.infradead.org;
	Sun, 18 Oct 2026 15:27:31 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8a06b44bd01so48538b3a.0
        for <linux-snps-arc@lists.infradead.org>; Sun, 18 Oct 2026 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792337249; x=1792942049; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PLi9hVkCsH3YiZ+w7j8S3/cxhLWAMV2a1RCiWoqeuBU=;
        b=itWpbL3xvU16/FmrG/92PWczGzGzkFaXl7jcBkPlhcTPcaYEQBFPH+Nxh+Q1WzfhBG
         7ONJhaxDvanoghMynB5jVTm06NfvrrEzCFjjyvtJv8MA0gYNlhtEaMzIQi+iaBbfYds8
         VfASiU5xjMBFgBq7E9+rsn8IuVVzhmBUVO+jD5qQY8dxPVWdkZCC6fAY17M+AKevDetX
         iaJH5yi1KxzlZ+hQcQIIDcjDP69Pcd9EZxLSferhT8svzZgbg+8YYt/L/6epXQlFqlad
         IcxAwJapPf+1xcVYBQzSZ9zGFUAl4X3WrcQ/6sZ5mDeouuKVdGU03OMGaSaVZ0EqHEQ1
         rMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792337249; x=1792942049;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLi9hVkCsH3YiZ+w7j8S3/cxhLWAMV2a1RCiWoqeuBU=;
        b=gsQL4uiqmpyzeSuAFyN3LdOwnc/uX5FMqi9zsklu7B4zLZ63jiGWhKCpjUDTij+GSz
         skzk6nAKCnilBA42xV1ALxc8Wy8AZcM0LQ/VFdT4ElGt8Vx144sgR1HrkOXn6b8Jq4ea
         UDj9ZoG7BNYH2bEqvP0cU2wFmPnh/sBaflSeh8QHo498sL3094u6vSoj0Ax+nasMhhNM
         qJIsxswrUJb8RpQDL5fZ29g19XRqiqNWT1T9KuEPjFic5ocGRDH1+gcFyzv+xBRqFNYL
         tkZs924quxaG7jrHI1MhBFrJBvzlSYGCbZ2gA4ufgavInhybVvm2D7oJePMhmwx3QaFH
         RGzg==
X-Forwarded-Encrypted: i=1; AKwUvBzURXAS2MgEQzniz/rsJ+eGt0+7hDbb5v+a1PQp6nJXgKwsTP61/uDfvOQeSkDnqOl8j8YjgCoBJLQwex1rxw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIbNwJXTI2veyJbA5kO4I/vzbdQNGCtrPr2jXGri1ZloTLawSWf
	0BqnOFhuaUJ9a92AM+5zqpmdFxF6W4GAGd/8AOsMdjjeOcqDNZij1UuR
X-Gm-Gg: AYBFou2ZUWipnvHZQYVUgrLIj/jIadR4TG93ShBRE4n3nkcP0KAZTqcjhYfmiHe9nfO
	QlJPKmqHfvRK1rJXrQWYBrORfihfpuz6SJy5VszW+ka5A/INYVCUBm6mWDpwHKjtGCgKODV/Ddm
	AEDDRTbgcHVangU3AHtgtAeKEN8nC19/C33mKDyAsyviM2bQlznvejLMbg0XjFOyKQGhJ8A8hqb
	WDAPxEKRE3ccv9ff7JShzKxHfD9WtW8gb5+QBPHx3+xIriDnzIMyNz3O07NtlmmRCOjzdPQDCn/
	DoHLv4257/r+eTj9X9GvkbLp90ThxD4DbePoDRz6yyJKZ+nwEM/A8KVsqAW/O9yrn89FlM6uNKu
	ZUW4gBno6Rw3qxgrWDRwdl2Qt1wGtRbmOnsIRcmvJCRgJ8jBQxi1ShmTVeATOaKzZIiYl+2/Ln6
	CM/stXNnwXVWB7UUyETvE/1RaDmUiqRNtLoB/Xye6hTJgepN+huI8OF38XGxC2NvcBVIxWG1HQg
	cb5lxTZBEl8GLW+9W+Eeht/bh8XxwNyy6b4vlLHwmbr78mTgX064x34LNIR2TRPu14yhxS4Irkr
	mt4Ote8dCBcB/w==
X-Received: by 2002:a05:6a00:b84:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-8a04cc24de8mr4216832b3a.32.1792337248874;
        Sun, 18 Oct 2026 08:27:28 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm2997008b3a.42.2026.10.18.08.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 08:27:27 -0700 (PDT)
Mime-Version: 1.0
Date: Sun, 18 Oct 2026 15:27:26 +0000
Message-Id: <DM82J03M6JWF.39ILAQJO5Z6E2@gmail.com>
Cc: "Josef Bacik" <josef@toxicpanda.com>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Jonas
 Bonn" <jonas@southpole.se>, "Stefan Kristiansson"
 <stefan.kristiansson@saunalahti.fi>, "Peter Zijlstra"
 <peterz@infradead.org>, "Will Deacon" <will@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, <bpf@vger.kernel.org>,
 <linux-snps-arc@lists.infradead.org>, <linux-hexagon@vger.kernel.org>,
 <linux-openrisc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "kernelci.org bot" <bot@kernelci.org>, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH bpf-next] locking/atomic: arc, hexagon, openrisc: Define
 arch_cmpxchg_local()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sasha Levin" <sashal@kernel.org>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Vineet Gupta" <vgupta@kernel.org>, "Brian
 Cain" <bcain@kernel.org>, "Stafford Horne" <shorne@gmail.com>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261018132907.3823160-1-sashal@kernel.org>
In-Reply-To: <20261018132907.3823160-1-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_082730_415693_CBCF01A1 
X-CRM114-Status: GOOD (  14.02  )
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

On Sun Oct 18, 2026 at 1:29 PM UTC, Sasha Levin wrote:
> Commit ccb88db8dac8 ("bpf: Don't hand out a linked element as extra
> element") made alloc_htab_elem() take the per-cpu spare element with
> try_cmpxchg_local(), the first caller of cmpxchg_local() outside of
> architecture code. It doesn't build on arc, hexagon and openrisc:
>
>   include/linux/atomic/atomic-arch-fallback.h:384:27: error: implicit declaration of function 'arch_cmpxchg_local'; did you mean 'raw_cmpxchg_local'? [-Werror=implicit-function-declaration]
>
> raw_cmpxchg_local() maps to arch_cmpxchg_local() unconditionally, but
> these three architectures don't define it, and unlike nios2 and
> microblaze they don't get it from asm-generic/cmpxchg.h either.
>
> cmpxchg_local() only has to be atomic with respect to the local CPU, so
> an architecture's own arch_cmpxchg() can serve for the sizes it
> supports. arc uses its relaxed LLOCK/SCOND variant when ARC_HAS_LLSC is
> set and its atomic_ops_lock() variant otherwise, and openrisc uses its
> LL/SC arch_cmpxchg(), the way arm64, riscv and s390 alias theirs. The
> hexagon arch_cmpxchg() only handles 32-bit words, so hexagon uses the
> generic version that disables interrupts, like sh, sparc32 and xtensa
> do. Linux has no NMIs on hexagon, so that is sufficient there.
>
> Fixes: ccb88db8dac8 ("bpf: Don't hand out a linked element as extra element")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://d.kernelci.org/i/maestro:78b65519ee4561df1fbf1e72f1dec9da7e5b153e
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610181750.BoqAddaF-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202610182048.aEaiBP8W-lkp@intel.com/
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> The only user is in bpf-next, so it is probably easiest to take this
> through bpf-next with acks from the arc, hexagon and openrisc
> maintainers. A similar change was posted in 2023 for objpool and
> stalled once objpool stopped using try_cmpxchg_local():
> https://lore.kernel.org/all/20231121142347.241356-1-wuqiang.matt@bytedance.com/
>
> Build tested on arc with and without LLSC (including both KernelCI
> configs), hexagon (clang) and openrisc.

Thanks for the quick fix. Applied.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
