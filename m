Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682C5E77188
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4iY+JQ8rWRimd04xUk8od0aUVR2vdCKVPz33m2ECCg=; b=ZbQKBy7gG8XdPJ
	2kG4UgsF7V3brALBczmkql3Qv1gBWwc4Yq29mqiFrf/FcO7Q5BcfLTq0S2W0cKyL4pkmJjen0kaEU
	dCowjIvmGrdaH7iwsRtFlapdYAx7dFaaBE5jRhgz8VV9O3dN9M6O6ObMcgkbSsI4XheLs10vTLCUj
	QN7DZn7l7d9XoW+mrPsA1sECPl2+BOnSolUQjRn0J2nDRXNTauYiXAUXAnsqkBBAaW8X/3n+2BZO3
	kMcP7NWnaUbg3bwK3pfEdp4u7oemrZENgOR5XcOx7WtJlCUg3lWhF6Nv5JTcyf6bfQMYb2W1j2l2L
	7PvVg6ZDixQo5TsHm8oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaxM-00000004iGo-0Fe0;
	Fri, 20 Dec 2024 11:14:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaZq-00000004djy-4404;
	Fri, 20 Dec 2024 10:49:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D0A81480;
	Fri, 20 Dec 2024 02:50:18 -0800 (PST)
Received: from [10.57.72.191] (unknown [10.57.72.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8254C3F58B;
	Fri, 20 Dec 2024 02:49:44 -0800 (PST)
Message-ID: <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
Date: Fri, 20 Dec 2024 11:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
To: Peter Zijlstra <peterz@infradead.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241219171920.GB26279@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_024951_055240_4F7713C6 
X-CRM114-Status: GOOD (  13.38  )
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

Hi Peter, Qi,

On 19/12/2024 18:19, Peter Zijlstra wrote:
> On Thu, Dec 19, 2024 at 04:44:16PM +0000, Kevin Brodsky wrote:
>> Besides the ptlock management at PTE/PMD level, all the
>> pagetable_*_[cd]tor have the same implementation. Introduce common
>> helpers for all levels to reduce the duplication.
> Uff, I forgot to Cc you on the discussion here, sorry!:
>
>   https://lkml.kernel.org/r/cover.1734526570.git.zhengqi.arch@bytedance.com
>
> we now have two series doing more or less overlapping things :/
>
> You can in fact trivially merge the all the implementations -- the
> apparent non-common bit (ptlock_free) is a no-op for all those other
> levels because they'll be having ptdesc->lock == NULL.

Ah that is good to know, thanks for letting me know about that and Qi's
series! Fortunately there isn't that much overlap between our series - I
think we can easily sort this out.

Qi, shall we collaborate to make our series complementary? I believe my
series covers patch 2 and 4 of your series, but it goes further by
covering all levels and all architectures, and patches introducing
ctor/dtor are already split as Alexander suggested on your series. So my
suggestion would be:

* Remove patch 1 in my series - I'd just introduce
pagetable_{p4d,pgd}_[cd]tor with the same implementation as
pagetable_pud_[cd]tor.
* Remove patch 2 and 4 from your series and rebase it on mine.

Let me know if that makes sense, if so I'll post a v2.

Cheers,
- Kevin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
