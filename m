Return-Path: <SRS0=pfY0=ZE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA92C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 06:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46105206A3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Nov 2019 06:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QJqQ0fGR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46105206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTlk9dBX7xZ5n3uI1fR1Fr/N6v91UOCuAXvgFN13Zl8=; b=QJqQ0fGR72vZzD
	uir0qHyCqenODCXBWIYfyri556huXoxKP5BTIkhUQ65xaza3WMQeExPwGbL88uZ/QyuQsFPiIjAIx
	IQwgKMJAvo5B5huoOiHqwqndtetBuQS7/dtGF2BshmgWNbHBOZTLMAkxkd/4AeNO0e1g4Z/0uZHVr
	JDSfe1bYpNYazOTGYyxJYyhyg7ha2WHVbDcXMYx1fCV3l3sWjCEmucuAwC8yJ/dzZRt6BDziQnVZ0
	pE24gG4bO2gm0tgjN4NDrWZYfJECZVTrf99u9p+ctcjWKhR7yYJZpz9NKHvtb7d3MXmWq5V/8R4Ce
	3jpy/UA+tqC3JaLYMaIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUQ5C-0006mh-LF; Tue, 12 Nov 2019 06:55:22 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUQ2U-00035f-Of; Tue, 12 Nov 2019 06:52:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 741C81FB;
 Mon, 11 Nov 2019 22:52:33 -0800 (PST)
Received: from [10.163.1.187] (unknown [10.163.1.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BA6A3F52E;
 Mon, 11 Nov 2019 22:55:07 -0800 (PST)
Subject: Re: [PATCH V9] mm/debug: Add tests validating architecture page table
 helpers
To: Ingo Molnar <mingo@kernel.org>
References: <1573532326-24084-1-git-send-email-anshuman.khandual@arm.com>
 <20191112062951.GA100264@gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <fe6b8140-1017-d081-570c-62213fe39624@arm.com>
Date: Tue, 12 Nov 2019 12:22:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191112062951.GA100264@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_225234_871595_E1940A7F 
X-CRM114-Status: GOOD (  16.85  )
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
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
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



On 11/12/2019 11:59 AM, Ingo Molnar wrote:
> 
> * Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> +config DEBUG_VM_PGTABLE
>> +	bool "Debug arch page table for semantics compliance"
>> +	depends on MMU
>> +	depends on DEBUG_VM
>> +	depends on ARCH_HAS_DEBUG_VM_PGTABLE
>> +	help
>> +	  This option provides a debug method which can be used to test
>> +	  architecture page table helper functions on various platforms in
>> +	  verifying if they comply with expected generic MM semantics. This
>> +	  will help architecture code in making sure that any changes or
>> +	  new additions of these helpers still conform to expected
>> +	  semantics of the generic MM.
>> +
>> +	  If unsure, say N.
> 
> Since CONFIG_DEBUG_VM is generally disabled in distro kernel packages, 
> why not make this 'default y' to maximize testing coverage? The code size 
> increase should be minimal, and DEBUG_VM increases size anyway.

Sure, will do.

> 
> Other than that this looks good to me:
> 
>   Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thank you.

> 
> Thanks,
> 
> 	Ingo
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
