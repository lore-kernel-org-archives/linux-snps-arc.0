Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE8ACD11C2
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Apr 2024 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivkAi/rlvHvJy3K8DJz+cI/Zh3RRN5qvXUDrTCDO/KE=; b=F2J1FAaU/XV21w
	oBuYrEzZoK9TfLmVwWPTsu/EznC1VoDdPf/az+j4gO6CxrKdYbbrIw1s4hMxMwpBPstiiDScLJswX
	k1trJ8rV8lOcBZVqBOqeHsWZEohMzyqDzbxnOTLfJzK51XsJn+f2rYHEbDyRAw81FK5HpOAO7DW4p
	n5wuywjTYtmdvimVTVc9+RK4G/b/X5XTd7HJfr+oBhVgVYdMceNx6Rx1/BYbuqifY+RIXvrrGW6Wx
	e+yf5qFfAUv6V457StlgEhSZWkJomkhE3rKsRK7gW05cTYWtKeohkxoUrP2QAtcHMN8e9rCX2OVGX
	mQzuTN+Dduw2C1NPzT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsnSt-00000008Fpr-2Nwa;
	Fri, 05 Apr 2024 17:34:59 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsmIo-00000007yO6-0HZ7;
	Fri, 05 Apr 2024 16:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712334030; x=1743870030;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=STODT/c3z6ypoEyUkP1OAtZ6EfyLMQK08sm/bPAw1AU=;
  b=QNra9vHvc0tIXqg/7BPD80y4E+NZmNvtXQ17IMzwZ3Bz4BrO3wEgCiOa
   YJYNAD3QDgJfUn/++KJFavcC06y+HNcUEF4b3g89zKBag5SkEhhkxHjp1
   7jk/uEIRVzibOcSe27I1e9Ur8j9fFgf+BjhpEypcgMQcxeIqcAZndV7eT
   DMBTaIo8YWnbivrctMZDswL9+mpI0NArARC2WyaTq1MtGXSeLas5HS9rZ
   zMkApI54N29/hUNrvjWGReovaxkjC1A/fP3Fr5YfVQPHwHzoZhgQPCvPx
   x4uwi8fR5FYqLfjp/ZV1Z6jfxEylZEqtAjWdjXGKCOnLGOaALf2BaaAKS
   g==;
X-CSE-ConnectionGUID: 01Ahg4GpQ7aK1IUD5r2T3g==
X-CSE-MsgGUID: vdNsx1eTSw+npvazDovbqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11462795"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="11462795"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 09:20:21 -0700
X-CSE-ConnectionGUID: EGOUsw1jS4iffZcF7In7vA==
X-CSE-MsgGUID: OzVkpaElRkSa/fAWFgBa3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19141333"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.80.70]) ([10.245.80.70])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 09:20:15 -0700
Message-ID: <340d23fc-7abf-4ad0-bd95-f1760b9ac458@intel.com>
Date: Fri, 5 Apr 2024 18:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
 <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
 <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net> <87r0fjc1cz.fsf@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <87r0fjc1cz.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_092030_318425_FDCF9286 
X-CRM114-Status: GOOD (  16.23  )
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



On 05.04.2024 16:47, Jani Nikula wrote:
> On Mon, 27 Feb 2023, Peter Zijlstra <peterz@infradead.org> wrote:
>> On Thu, Feb 23, 2023 at 10:24:19PM +0100, Andrzej Hajda wrote:
>>> On 22.02.2023 18:04, Peter Zijlstra wrote:
>>>> On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:
>>>>
>>>>> Andrzej Hajda (7):
>>>>>     arch: rename all internal names __xchg to __arch_xchg
>>>>>     linux/include: add non-atomic version of xchg
>>>>>     arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
>>>>>     llist: simplify __llist_del_all
>>>>>     io_uring: use __xchg if possible
>>>>>     qed: use __xchg if possible
>>>>>     drm/i915/gt: use __xchg instead of internal helper
>>>> Nothing crazy in here I suppose, I somewhat wonder why you went through
>>>> the trouble, but meh.
>>> If you are asking why I have proposed this patchset, then the answer is
>>> simple, 1st I've tried to find a way to move internal i915 helper to core
>>> (see patch 7).
>>> Then I was looking for possible other users of this helper. And apparently
>>> there are many of them, patches 3-7 shows some.
>>>
>>>
>>>> You want me to take this through te locking tree (for the next cycle,
>>>> not this one) where I normally take atomic things or does someone else
>>>> want this?
>>> If you could take it I will be happy.
>> OK, I'll go queue it in tip/locking/core after -rc1. Thanks!
> Is this where the series fell between the cracks, or was there some
> follow-up that I missed?
>
> I think this would still be useful. Andrzej, would you mind rebasing and
> resending if there are no objections?

The patchset was rejected/dropped by Linus at the pull-request stage.
He didn't like many things, but the most __xchg name. However he was 
quite positive about i915 name fetch_and_zero.
I can try to revive patchset with fetch_and_zero, and maybe 
fetch_and_set, instead of __xchg.

Regards
Andrzej

>
> BR,
> Jani.
>
>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
