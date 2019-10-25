Return-Path: <SRS0=Dz6H=YS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C41CA9EAF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Oct 2019 03:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6632B21929
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Oct 2019 03:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHKpz1l6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6632B21929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPB1jJqILCiebgX8aS4pB78Z64RdaSIzEhiWCwhe3sc=; b=IHKpz1l6i6VuRQ
	xC5Ew6pUZnaAdd2flkV9OxCePOhRfVtpstlQy4yFLmxed/szKvnPyPZYrApUoNHVDYWP/qVGS/vmi
	Ic1HHQE67X11TM8/DJRnxp+a/IPVCFnX5A6KQTu+XL7WzkBsqD+BvpaY0Mmg8FuaK3fI59nazUk6P
	yiJPps7JcEt/CzVvxAS9vgf8TXCufS+b+YuiApBNZxPJkTwyogSCSP6qkFWIvNLGC0m+TQf4M87UF
	Wa5nocnFqcWQfGe+BUp0oziI9xNfqsg2rSLwA2a6+2IaiyhgjCWV6uXwX5kEL2iPhaRUIAt5vWT+P
	96As5c6aCThZXOBgZxRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNqYD-0003p0-AR; Fri, 25 Oct 2019 03:46:09 +0000
Received: from [217.140.110.172] (helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNqY2-0003fs-Lp; Fri, 25 Oct 2019 03:45:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5D211FB;
 Thu, 24 Oct 2019 20:45:47 -0700 (PDT)
Received: from [10.162.41.137] (p8cg001049571a15.blr.arm.com [10.162.41.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 A4C213F718; Thu, 24 Oct 2019 20:45:36 -0700 (PDT)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table
 helpers
To: Qian Cai <cai@lca.pw>
References: <1571625739-29943-1-git-send-email-anshuman.khandual@arm.com>
 <FCAFFD72-3781-4474-8393-A4E40264473A@lca.pw>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <ccdd4f7a-c7dc-ca10-d30c-0bc05c7136c7@arm.com>
Date: Fri, 25 Oct 2019 09:16:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <FCAFFD72-3781-4474-8393-A4E40264473A@lca.pw>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_204558_758301_10D098F3 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
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
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
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
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 10/24/2019 10:21 PM, Qian Cai wrote:
> 
> 
>> On Oct 24, 2019, at 10:50 AM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>
>> Changes in V7:
>>
>> - Memory allocation and free routines for mapped pages have been droped
>> - Mapped pfns are derived from standard kernel text symbol per Matthew
>> - Moved debug_vm_pgtaable() after page_alloc_init_late() per Michal and Qian 
>> - Updated the commit message per Michal
>> - Updated W=1 GCC warning problem on x86 per Qian Cai
> 
> It would be interesting to know if you actually tested  out to see if the warning went away. As far I can tell, the GCC is quite stubborn there, so I am not going to insist.
> 

Nothing specific. But just tested this with x86 defconfig with relevant configs
which are required for this test. Not sure if it involved W=1. The problem is,
there is no other or better way to have both the conditional checks in place
while also reducing the chances this warning. IMHO both the conditional checks
are required.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
