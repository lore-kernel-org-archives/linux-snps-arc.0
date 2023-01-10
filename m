Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F651C46467
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Jan 2023 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n05kAmn/8mXq1f3C/YIJYS/WIewJj9uTs5BF3oVPpn0=; b=jY9FzD6Ti5PArN
	/4I9/tRSR663jD7ZW1JySG7cl1HkFW/4PQhSSWXJSHK1vIrd9VCDNlRwP2SQIkabVxJ9usPoYr8sW
	GFHL+M+06yLFmnHDb3iLAzXwMql2wSShcJsVp7cj3xYcsnq7GsfG599kVpHqVDjutVDuskc4K3ixF
	phQ8fBqf0vnllrzZaW2GNWWDdjPcl5Tpvn8fBBxcwdPgoXe4ESChHZjXi3jFN271331uX9b7pKZjr
	QqnyGo6Ak2arQAsD+x8copY6p6YPDaNJN5ZV4Dgg6XQnrvgO+o+XkybLWb2YDcnibL7e1OT88mWqm
	ZBYBmqWLhE0aInUfKGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFE1z-006vj7-Su; Tue, 10 Jan 2023 12:47:07 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFE1o-006vet-3Q; Tue, 10 Jan 2023 12:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673354816; x=1704890816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JjCURNXFRNcYm6qc3FnZISad0UB5+7XjMdbu/B0f1Fo=;
  b=AF/LrIZHIjUrlEw05KEt5x3jhyEPffI6eAIkh+dvqgZbQ+tYXorF4F0l
   IGA4HFqP6hzls+8naTwSlQX/zcMtAVc7s2ThtIslH+qPHpI3Z/aQ7ERTP
   vdpLrC2CymAUlgEnt+efhhiCdFGbDc8VQayK0FYuPEQpRRFf51scNL7K1
   vJr1lAFy8ZxmE8d24+8VASgVQux2owin41g1ALHyKOSMZYfqAi0pf++px
   OPX1h0Vg8PImDJV+JLHZWZaMIOcVpi38ouRfivcBNfzC7ZiUveISxB7Yu
   nXkIdc7ssoVI68oH9ykL81i5yvxKvNQj/9CHtlfGb6M+kXZ5GFyHBnkFi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="302834343"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="302834343"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 04:46:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="689393555"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="689393555"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.8.19]) ([10.213.8.19])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 04:46:39 -0800
Message-ID: <1bfae3d0-8c0b-ea83-7184-db847a4a969f@intel.com>
Date: Tue, 10 Jan 2023 13:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC DO NOT MERGE] treewide: use __xchg in most
 obvious places
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, loongarch@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
References: <Y7b6/7coJEVlTVxK@phenom.ffwll.local>
 <20230110105306.3973122-1-andrzej.hajda@intel.com>
 <Y71G1tkmUzM4BLxn@smile.fi.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Y71G1tkmUzM4BLxn@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_044656_236527_8C230259 
X-CRM114-Status: GOOD (  22.57  )
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

On 10.01.2023 12:07, Andy Shevchenko wrote:
> On Tue, Jan 10, 2023 at 11:53:06AM +0100, Andrzej Hajda wrote:
>> This patch tries to show usability of __xchg helper.
>> It is not intended to be merged, but I can convert
>> it to proper patchset if necessary.
>>
>> There are many more places where __xchg can be used.
>> This demo shows the most spectacular cases IMHO:
>> - previous value is returned from function,
>> - temporary variables are in use.
>>
>> As a result readability is much better and diffstat is quite
>> nice, less local vars to look at.
>> In many cases whole body of functions is replaced
>> with __xchg(ptr, val), so as further refactoring the whole
>> function can be removed and __xchg can be called directly.
> 
> ...
> 
>>   arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
>>   				  struct pt_regs *regs)
>>   {
>> -	unsigned long orig_ret_vaddr;
>> -
>> -	orig_ret_vaddr = regs->ARM_lr;
>> -	/* Replace the return addr with trampoline addr */
>> -	regs->ARM_lr = trampoline_vaddr;
>> -	return orig_ret_vaddr;
>> +	return __xchg(&regs->ARM_lr, trampoline_vaddr);
>>   }
> 
> If it's not a callback, the entire function can be killed.
> And this is a good example of the function usage.
> OTOH, these places might have a side effect (if it's in deep CPU
> handlers), means we need to do this carefully.
> 
> ...
> 
>>   static inline void *qed_chain_produce(struct qed_chain *p_chain)
>>   {
>> -	void *p_ret = NULL, *p_prod_idx, *p_prod_page_idx;
>> +	void *p_prod_idx, *p_prod_page_idx;
>>   
>>   	if (is_chain_u16(p_chain)) {
>>   		if ((p_chain->u.chain16.prod_idx &
>> @@ -390,11 +391,8 @@ static inline void *qed_chain_produce(struct qed_chain *p_chain)
>>   		p_chain->u.chain32.prod_idx++;
>>   	}
>>   
>> -	p_ret = p_chain->p_prod_elem;
>> -	p_chain->p_prod_elem = (void *)(((u8 *)p_chain->p_prod_elem) +
>> -					p_chain->elem_size);
>> -
>> -	return p_ret;
>> +	return __xchg(&p_chain->p_prod_elem,
>> +		      (void *)(((u8 *)p_chain->p_prod_elem) + p_chain->elem_size));
> 
> Wondering if you still need a (void *) casting after the change. Ditto for the
> rest of similar cases.

IMHO it is not needed also before the change and IIRC gcc has an 
extension which allows to drop (u8 *) cast as well [1].

[1]: https://gcc.gnu.org/onlinedocs/gcc/Pointer-Arith.html

> 
>>   }
> 
> ...
> 
> Btw, is it done by coccinelle? If no, why not providing the script?
> 

Yes I have used cocci. My cocci skills are far from perfect, so I did 
not want to share my dirty code, but this is nothing secret:

@r1@
expression x, v;
local idexpression p;
@@
-       p = x;
-       x = v;
-       return p;
+       return __xchg(&x, v);

@depends on r1@
expression e;
@@
         __xchg(
-       &*e,
+       e,
         ...)

@depends on r1@
expression t;
@@
-       if (t) {
+       if (t)
                 return __xchg(...);
-       }

@depends on r1@
type t;
identifier p;
expression e;
@@
(
-       t p;
|
-       t p = e;
)
         ... when != p

Regards
Andrzej


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
