Return-Path: <SRS0=+QI7=4B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41E7C352A4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 13 Feb 2020 02:16:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBB1206DB
	for <linux-snps-arc@archiver.kernel.org>; Thu, 13 Feb 2020 02:16:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pokdazGn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CBB1206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IU5zUUfso/fIHhdwUzE9Zb7DTdairVUU2mo/IGmgR0k=; b=pokdazGnI6I//4
	QFXyTvE3YKP3WIehxclbD38xdSuoJJWpOUQWY9vAOSzGKsBbhqzEpFk0S+GsMfAcKHHuzOX9jodT4
	EhwlYnOg1DAd2n02jjuBto41p1J7oDKe+KF+6453Nt8K5srschm6vXKaxUlKdOk6rZPf91873OLFc
	u4f57lt+tl9sqZMR/C4zW55X0GX3i+e9J/Ygxjxb9jcmc/FHGKpqWMluAWhvPCay3+kSz4f+Oxmk0
	d1B5AUQvHgLamyqxKHUUAqnz9XQGBU/AZYdxx6Vc0x9TsZJAONXPZ6Lafkl4FGtgZGJ3x2mtRXpJI
	wuYHI1cAhTNBWhGja9Ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j243U-0003F3-Kq; Thu, 13 Feb 2020 02:16:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j242y-0002jE-TC; Thu, 13 Feb 2020 02:16:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0600030E;
 Wed, 12 Feb 2020 18:16:07 -0800 (PST)
Received: from [192.168.0.129] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 017A33F68E;
 Wed, 12 Feb 2020 18:15:52 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <20200210153716.GB9283@E121110.arm.com>
 <b169ff9d-7b87-91f4-b3d0-e97f86680d0c@arm.com>
 <20200212185548.3274ec2e@thinkpad>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <085cdec7-1759-82c6-7a65-9b7d28c1c458@arm.com>
Date: Thu, 13 Feb 2020 07:45:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200212185548.3274ec2e@thinkpad>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_181609_044016_0E6F7E31 
X-CRM114-Status: GOOD (  19.02  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 linux-s390@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Vlastimil Babka <vbabka@suse.cz>, James Hogan <jhogan@kernel.org>,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@kernel.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Dave Hansen <dave.hansen@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 02/12/2020 11:25 PM, Gerald Schaefer wrote:
> On Wed, 12 Feb 2020 15:12:54 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>>>> +/*
>>>> + * On s390 platform, the lower 12 bits are used to identify given page table
>>>> + * entry type and for other arch specific requirements. But these bits might
>>>> + * affect the ability to clear entries with pxx_clear(). So while loading up
>>>> + * the entries skip all lower 12 bits in order to accommodate s390 platform.
>>>> + * It does not have affect any other platform.
>>>> + */
>>>> +#define RANDOM_ORVALUE	(0xfffffffffffff000UL)  
>>>
>>> I'd suggest you generate this mask with something like
>>> GENMASK(BITS_PER_LONG, PAGE_SHIFT).  
>>
>> IIRC the lower 12 bits constrains on s390 platform might not be really related
>> to it's PAGE_SHIFT which can be a variable, but instead just a constant number.
>> But can definitely use GENMASK or it's variants here.
>>
>> https://lkml.org/lkml/2019/9/5/862
> 
> PAGE_SHIFT would be fine, it is 12 on s390. However, in order to be
> more precise, we do not really need all 12 bits, only the last 4 bits.
> So, something like this would work:
> 
> #define RANDOM_ORVALUE GENMASK(BITS_PER_LONG - 1, 4)
> 
> The text in the comment could then also be changed from 12 to 4, and
> be a bit more specific on the fact that the impact on pxx_clear()
> results from the dynamic page table folding logic on s390:
> 
> /*
>  * On s390 platform, the lower 4 bits are used to identify given page table
>  * entry type. But these bits might affect the ability to clear entries with
>  * pxx_clear() because of how dynamic page table folding works on s390. So
>  * while loading up the entries do not change the lower 4 bits.
>  * It does not have affect any other platform.
>  */

Sure, will update accordingly.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
