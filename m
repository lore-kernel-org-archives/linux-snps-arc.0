Return-Path: <SRS0=AMLI=7E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249ABC433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 May 2020 00:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E38E8207D8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 May 2020 00:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jffeQkEW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E38E8207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWrQ3CKPg3IU8uvUT0u79Nm7EII5P1zTFvW4xGMvlOY=; b=jffeQkEWCXOzzu
	zMSU1yj9Wytd5a0pYcKkUJRjceC+aV1k1PWl6l4VBgmBpOqqSa22or3G8laFgJfcIb5PC4grWP47k
	Phnjj90NCQg7qapca1FRg4cnKSJfngNTlUK2RdQo95hyhpFOV7o74bERDJ6abPSaUMdvvwU7dLIkl
	93C2/nY5MY+dd4bkF7xmxcUcYitYI9ikC7r2e4MA+Rv3Dvty0Xoqid8xx/4phMtvwvZBV/D3fVvK1
	FGovTwoaRfsandURrrnNR/UvEdIjhLlvw7Jhhg2ChTv9stn8OErddCwHU0pXnGAvtkcQGQcUc6F1Q
	uACM78p6RCu8JgcrFSpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbvpz-0005Pp-Jf; Fri, 22 May 2020 00:46:59 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbvpx-0005PS-Rv; Fri, 22 May 2020 00:46:59 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1jbvpK-00DESM-Ds; Fri, 22 May 2020 00:46:18 +0000
Date: Fri, 22 May 2020 01:46:18 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200522004618.GA3151350@ZenIV.linux.org.uk>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200521172704.GF23230@ZenIV.linux.org.uk>
 <bdc8dc64-622c-3b0d-1ae1-48222cf34358@roeck-us.net>
 <20200521224612.GJ23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521224612.GJ23230@ZenIV.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_174657_906478_E5E6C55A 
X-CRM114-Status: GOOD (  17.79  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 ira.weiny@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, May 21, 2020 at 11:46:12PM +0100, Al Viro wrote:
> On Thu, May 21, 2020 at 03:20:46PM -0700, Guenter Roeck wrote:
> > On 5/21/20 10:27 AM, Al Viro wrote:
> > > On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> > >> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> > >>> From: Ira Weiny <ira.weiny@intel.com>
> > >>>
> > >>> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> > >>> enables when vaddr is not in the fixmap.
> > >>>
> > >>> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> > >>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > >>
> > >> microblazeel works with this patch, as do the nosmp sparc32 boot tests,
> > >> but sparc32 boot tests with SMP enabled still fail with lots of messages
> > >> such as:
> > > 
> > > BTW, what's your setup for sparc32 boot tests?  IOW, how do you manage to
> > > shrink the damn thing enough to have the loader cope with it?  I hadn't
> > > been able to do that for the current mainline ;-/
> > > 
> > 
> > defconfig seems to work just fine, even after enabling various debug
> > and file system options.
> 
> The hell?  How do you manage to get the kernel in?  sparc32_defconfig
> ends up with 5316876 bytes unpacked...

Incidentally, trying to load it via -kernel/-initrd leads to
Configuration device id QEMU version 1 machine id 64
Probing SBus slot 0 offset 0
Probing SBus slot 1 offset 0
Probing SBus slot 2 offset 0
Probing SBus slot 3 offset 0
Probing SBus slot 15 offset 0
Invalid FCode start byte
CPUs: 1 x TI,TMS390Z55
UUID: 00000000-0000-0000-0000-000000000000
Welcome to OpenBIOS v1.1 built on Dec 27 2018 19:17
  Type 'help' for detailed information
[sparc] Kernel already loaded
switching to new context:
PROMLIB: obio_ranges 1
PROMLIB: Sun Boot Prom Version 3 Revision 2
Linux version 5.7.0-rc1-00002-gcf51e129b968 (al@duke) (gcc version 6.3.0 20170516 (Debian 6.3.0-18), GNU ld (GNU Binutils for Debian) 2.28) #32 Thu May 21 18:36:07 EDT 2020
printk: bootconsole [earlyprom0] enabled
ARCH: SUN4M
TYPE: Sun4m SparcStation10/20
Ethernet address: 52:54:00:12:34:56
303MB HIGHMEM available.
OF stdout device is: /obio/zs@0,100000:a
PROM: Built device tree with 30051 bytes of memory.
Booting Linux...
Power off control detected.
Kernel panic - not syncing: Failed to allocate memory for percpu areas.
CPU: 0 PID: 0 Comm: swapper Not tainted 5.7.0-rc1-00002-gcf51e129b968 #32
[f04f92a8 : 
setup_per_cpu_areas+0x58/0x90 ] 
[f04edbf4 : 
start_kernel+0xc0/0x4a0 ] 
[f04ed43c : 
continue_boot+0x324/0x334 ] 
[00000000 : 
0x0 ] 

Press Stop-A (L1-A) from sun keyboard or send break
twice on console to return to the boot prom
---[ end Kernel panic - not syncing: Failed to allocate memory for percpu areas. ]---

Giving guest more RAM doesn't change the outcome (well, the number HIGHMEM line is
obviously higher, but that's it).

So which sparc32 kernel have you booted with defconfig and how have you done
that?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
