Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCACC4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tktGzT3EMt9MRufOsR2NFNSoCiEMu57u6J9zwPp8s/Y=; b=Tzc3Lt2JibiEO5
	6BY9xUPPDOecuAXLNBxXc+d6NLrwLRaZl9/BJg/uwKQPcphUiP+JX+UvcIwmlHfuPxvxOQLOsF0O+
	VmKqvAWJRKH4Q24te/lSiUwEEWc+CHn8yZB7YkCuS27+bDlGIbgJLeqxrpqrpV48oWr96QfAkUKCY
	vdA2meTWYezHvjS1KzclQDTQCzDo5pE99KwFt01SEvRspvyX3o9bDxw8WMyie9v7GNLsXsmGl6pS+
	LTWTF6SzECc6/8S2gD+3x0fd4KbJ7JHmUv5cKmNOm/eXlLiF4P5u2SVfYaMzgY3EzyVgnALtBA5nX
	WqvVBHL7bc1LXEJtCo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8MjI-00D4I0-Cq; Thu, 22 Dec 2022 14:39:28 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8MO2-00Crqe-DK; Thu, 22 Dec 2022 14:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671718650; x=1703254650;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=meZJDY1PMUtgLkPrUblSxd3HYWLxd7p0iVKy4Ko1qbk=;
  b=T7e+hTc/PkN2A4Z/rpARpVc49NoVDvgl9Sb93ogzK1Y4eM9npwpvCfni
   wEvabfnFs7r/EglMGelDo9LgxwNsUaKZOX6c6TkmrRz/49bPsIr3SPGXZ
   OQxx4ZSJ4wZWF9M7a04IPS3d720SJ0WXeFNQUPvRTOCukD469rgzLGqJs
   Ofgv+p5zWVb3BjagxXYczrnK5moeByfWwjTAj5nW5dH/CWpDtuc5br0UM
   2fYF7i6+C6GM1+oF4xlOYTI77m9AjCCs6sI3K5rXhimKdFBnPJE/pHmyL
   v0wUix/DCDIKrSPO97nity36LyZ5H0yfmW2kePew7qy8o+rSduToFvp7L
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="307820232"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="307820232"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 06:17:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="651797661"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="651797661"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.17.92]) ([10.213.17.92])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 06:17:21 -0800
Message-ID: <286f817c-2e3a-aba9-1083-73f25bafd84c@intel.com>
Date: Thu, 22 Dec 2022 15:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_061730_910731_D04584EE 
X-CRM114-Status: GOOD (  27.54  )
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



On 22.12.2022 15:12, Geert Uytterhoeven wrote:
> Hi Andrzej,
>
> Thanks for your series!
>
> On Thu, Dec 22, 2022 at 12:49 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>> I hope there will be place for such tiny helper in kernel.
>> Quick cocci analyze shows there is probably few thousands places
>> where it could be useful.
>> I am not sure who is good person to review/ack such patches,
>> so I've used my intuition to construct to/cc lists, sorry for mistakes.
>> This is the 2nd approach of the same idea, with comments addressed[0].
>>
>> The helper is tiny and there are advices we can leave without it, so
>> I want to present few arguments why it would be good to have it:
>>
>> 1. Code readability/simplification/number of lines:
>>
>> Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
>> -       previous_min_rate = evport->qos.min_rate;
>> -       evport->qos.min_rate = min_rate;
>> +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);
> Upon closer look, shouldn't that be
>
>      previous_min_rate = __xchg(&evport->qos.min_rate, min_rate);
>
> ?

Yes, you are right, the first argument is a pointer.

Regards
Andrzej

>
>> For sure the code is more compact, and IMHO more readable.
>>
>> 2. Presence of similar helpers in other somehow related languages/libs:
>>
>> a) Rust[1]: 'replace' from std::mem module, there is also 'take'
>>      helper (__xchg(&x, 0)), which is the same as private helper in
>>      i915 - fetch_and_zero, see latest patch.
>> b) C++ [2]: 'exchange' from utility header.
>>
>> If the idea is OK there are still 2 qestions to answer:
>>
>> 1. Name of the helper, __xchg follows kernel conventions,
>>      but for me Rust names are also OK.
> Before I realized the missing "&", I wondered how this is different
> from swap(), so naming is important.
> https://elixir.bootlin.com/linux/latest/source/include/linux/minmax.h#L139
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
