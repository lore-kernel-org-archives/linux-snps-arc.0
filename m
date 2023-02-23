Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20A6C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Feb 2023 21:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFlRJIx864i9vsouunBcNwa5lEBS63eFF0dxnPapx8M=; b=w0JoI2SRQGlGOv
	s1NEdlRCdSQPbrDQhAo6rrhADZknNJj2kHA2u0IxEP4ABfpEeLMcoTxRHWmyzohAobSHyV7ih5dMI
	UrtAvoL+pLu+fFcv7eT6e5QHh28UA0nSF9ZOGiFxAFuy64V0PpebRFGitLFqRCoH7iSFs78igTDIQ
	YnsfyFG0Ljf1npXDInoBF/TOC/hiiNKYjuw5Ml9MDLN3rKhZRt3G/L+yYaTKIf+aBBVjxTmsLDgum
	9vkG40Yr7xlkpXFkM0nwcYV7BWoxsDTQBjYTQ/28X5hP61xtW+inuqYjPf5t/ta6F27FM3qW8P/PP
	u+yKkv68hdyiv/c4qi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJ59-000Njy-5m; Thu, 23 Feb 2023 21:24:51 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVJ4z-000Ngk-Lk; Thu, 23 Feb 2023 21:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677187481; x=1708723481;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mVoVfL5vlPHnSouV6VBABWbzjtaVYznfmLZ6wrrIyJs=;
  b=AwQJUMxNqJ31wQmhtGu0LSCBEtlwnqGAvdAIFyBRZBKBK3+aWfFUiF9X
   03q759M+DBnAdbY+8b9eQiK5uolkUlvDVpkDS7RzKHuQ2h5LiZOKpaEKz
   aLbclSdMXHVg07oqNzUhwZ/C7ryf40wDfDi27ASLY9m4oYgmtJAr/gXzY
   heDB3vkML0VGe2MPyHlO7VAV+DW0onDHuGJR22ImlFFFTYNf1ddfSXoAA
   Y8RVIq+AEuN3M3Cq8+brt3mX6HT/xf/FSZ6cZVrY3GqZog10xH6zWgE2Z
   gSHVEDdtVsRgSadN2K1EXGjzAm8VTUzrq2D1/amCt5msNJi59X67Pazu+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332006826"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="332006826"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 13:24:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="665941632"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="665941632"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.25.22]) ([10.213.25.22])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 13:24:21 -0800
Message-ID: <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
Date: Thu, 23 Feb 2023 22:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_132441_814150_5E5B04EF 
X-CRM114-Status: UNSURE (   9.83  )
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

On 22.02.2023 18:04, Peter Zijlstra wrote:
> On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:
> 
>> Andrzej Hajda (7):
>>    arch: rename all internal names __xchg to __arch_xchg
>>    linux/include: add non-atomic version of xchg
>>    arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
>>    llist: simplify __llist_del_all
>>    io_uring: use __xchg if possible
>>    qed: use __xchg if possible
>>    drm/i915/gt: use __xchg instead of internal helper
> 
> Nothing crazy in here I suppose, I somewhat wonder why you went through
> the trouble, but meh.

If you are asking why I have proposed this patchset, then the answer is 
simple, 1st I've tried to find a way to move internal i915 helper to 
core (see patch 7).
Then I was looking for possible other users of this helper. And 
apparently there are many of them, patches 3-7 shows some.


> 
> You want me to take this through te locking tree (for the next cycle,
> not this one) where I normally take atomic things or does someone else
> want this?

If you could take it I will be happy.

Regards
Andrzej


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
