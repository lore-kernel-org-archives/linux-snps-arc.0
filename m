Return-Path: <SRS0=KE/D=FF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7BEC64E7A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 12:10:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6922080A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 12:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uMd4uPqG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwWnBV1x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6922080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9xg7VW5pax5n9NN8ymClb9FhoruKHQDNZV8B77z0Zlo=; b=uMd4uPqGYvDYlWUzUef2j89Wy
	m8ZHXa9H8Ys8qjMOf0xbPbcQSzM64d3VIBEH3VrO8vAgvSLoy9CJQ60hcgb4LABSJpdYR1pamB9e0
	htGm2fXT6WwDay/QTnlvt1B5fBVCYyv0CUXpY3wuGcaef7gN1nNwGWVYPusBpP/oNtgKqT24mXSKc
	Fa3zRDhaYCx6HXDaCZOpUC1oE0wS1OSKVYmWFQb8sJbvlydVwdLRvWfw8gr5eQXN9p0ur7OpmQdc3
	iuWmqd/oLfOG4G6rf8viK9oucr4FiY3noRMNQf6NAHQ3fAy/ZNKCVlPfIL+EmlDQlj0G1FstaCxtQ
	30ZWq9CUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk4Uc-0006Xz-KY; Tue, 01 Dec 2020 12:10:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk4UY-0006Wy-B4; Tue, 01 Dec 2020 12:10:47 +0000
Received: from kernel.org (unknown [87.71.85.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF3C620770;
 Tue,  1 Dec 2020 12:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606824645;
 bh=3UWBuUpLQ/U5hRfLC4gft5L+4j9/v/pcU/sPZKvrxZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SwWnBV1xCIhVvU9x0mK1pgRGpkHqFlT1hqcTXr0/nvDGqUPHUABBTNM0agnkIe3U3
 UkybY5+2Fg7ba3y6mnneoWfhFZQlBlUqm4qaUir9UJOYoGhL+Mv/tG3nQR3yKEpQSZ
 R7wXQoBGjR007g9wr7gE9jMaHOZ84lOxt2eQt7f4=
Date: Tue, 1 Dec 2020 14:10:33 +0200
From: Mike Rapoport <rppt@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
Message-ID: <20201201121033.GG557259@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_071046_477303_1B32AD31 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Dec 01, 2020 at 12:35:09PM +0100, John Paul Adrian Glaubitz wrote:
> Hi Mike!
> 
> On 12/1/20 11:29 AM, Mike Rapoport wrote: 
> > These changes are in linux-mm tree (https://www.ozlabs.org/~akpm/mmotm/
> > with a mirror at https://github.com/hnaz/linux-mm)
> > 
> > I beleive they will be coming in 5.11.
> 
> Just pulled from that tree and gave it a try, it actually fails to build:
> 
>   LDS     arch/ia64/kernel/vmlinux.lds
>   AS      arch/ia64/kernel/entry.o
> arch/ia64/kernel/entry.S: Assembler messages:
> arch/ia64/kernel/entry.S:710: Error: Operand 2 of `and' should be a general register
> arch/ia64/kernel/entry.S:710: Error: qualifying predicate not followed by instruction
> arch/ia64/kernel/entry.S:848: Error: Operand 2 of `and' should be a general register
> arch/ia64/kernel/entry.S:848: Error: qualifying predicate not followed by instruction
>   GEN     usr/initramfs_data.cpio
> make[1]: *** [scripts/Makefile.build:364: arch/ia64/kernel/entry.o] Error 1
> make: *** [Makefile:1797: arch/ia64/kernel] Error 2
> make: *** Waiting for unfinished jobs....
>   CC      init/do_mounts_initrd.o
>   SHIPPED usr/initramfs_inc_data
>   AS      usr/initramfs_data.o

Hmm, it was buidling fine with v5.10-rc2-mmotm-2020-11-07-21-40.
I'll try to see what could cause this.

Do you build with defconfig or do you use a custom config?

> Adrian
> 
> -- 
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
