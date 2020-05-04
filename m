Return-Path: <SRS0=eyJ8=6S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225EEC3A5A9
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 May 2020 05:05:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C60206EB
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 May 2020 05:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H7bJGdnC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C60206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGbPAxmDMsjYVGOPSK4GD5asMqVg6Sc73UNkgSRZM/c=; b=H7bJGdnCeYbsCw
	QkDCYro0vhpWtazrT4fxj3UNxcxqZsk2MuVhDE+hZhFRzjiV/5+Noa/riIjikch9FnaAhthAhk2o3
	25ufVzgM0y2alMg2pNpoEFoqOXbYQ0ioBsfFzNz77tR+WHA0CJ6bbXwry8quwqqnuabAqiQOtZ7JV
	yfqLviCUCV44MQaP7x1fPGYzt3HlTUJLWQt15ousmRSEEd4LVWQcJxT06rQUcLsDq7XBUBEBWeij0
	7ADlanbnVbaNlcxYqf9Ygbi5SV+dwjRzeHum7Cp+irgfj9SRjmr9QE33NggCPMpcceKWH+AqLYytX
	AWXs3zXxgKlfl1xJPcZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVTID-0005qo-EO; Mon, 04 May 2020 05:05:25 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVTHj-00033f-HT; Mon, 04 May 2020 05:04:57 +0000
IronPort-SDR: EyrQvHM6T8HUKXyN+om+XE88mJWFlcYoQTgQVeuVnhPu2nt4Fk+4nBTUbXp2eiG+wKlWo0oRV7
 nTpKWb1gU0Eg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 22:04:52 -0700
IronPort-SDR: MxCGejezytWAFr2qtWtnEu9Zlbx9sDBny4KBWGPuntnxpb8eeVieC20Y3SJ8U7XteAAgk3t7Pj
 fSoUNNLnXPgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; d="scan'208";a="295395757"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga008.jf.intel.com with ESMTP; 03 May 2020 22:04:48 -0700
Date: Sun, 3 May 2020 22:04:47 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V2 00/11] Subject: Remove duplicated kmap code
Message-ID: <20200504050447.GA979899@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504013509.GU23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504013509.GU23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_220455_694994_65BEAD9B 
X-CRM114-Status: GOOD (  21.20  )
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
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, May 04, 2020 at 02:35:09AM +0100, Al Viro wrote:
> On Sun, May 03, 2020 at 06:09:01PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The kmap infrastructure has been copied almost verbatim to every architecture.
> > This series consolidates obvious duplicated code by defining core functions
> > which call into the architectures only when needed.
> > 
> > Some of the k[un]map_atomic() implementations have some similarities but the
> > similarities were not sufficient to warrant further changes.
> > 
> > In addition we remove a duplicate implementation of kmap() in DRM.
> > 
> > Testing was done by 0day to cover all the architectures I can't readily
> > build/test.
> 
> OK...  Looking through my old notes on kmap unification (this winter, never
> went anywhere),
> 
> * arch/mips/mm/cache.c ought to use linux/highmem.h, not asm/highmem.h
> I suspect that your series doesn't build on some configs there.  Hadn't
> verified that, though.

Yes patch 6 makes the change because kmap_atomic() was no longer declared in
asm/highmem.h.  I'm pretty sure 0-day caught that ...  but I seem to remember
noticing some oddness in that file and I did go through it by hand.

> 
> * kmap_atomic_to_page() is dead, but not quite gone - csky and nds32 brought
> the damn thing back (nds32 - only an extern).  It needs killin'...

Easy enough. Added as a follow on patch.

> 
> * parisc is (arguably) abusing kunmap()/kunmap_atomic() for cache flushing.
> Replace the bulk of its highmem.h with
> #define ARCH_HAS_FLUSH_ON_KUNMAP
> #define arch_before_kunmap flush_kernel_dcache_page_addr
> and have default kunmap()/kunmap_atomic() do
> #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
> 	arch_before_kunmap(page_address(page));
> #endif
> and
> #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
> 	arch_before_kunmap(addr);
> #endif
> resp.  Kills ARCH_HAS_KMAP along with ifdefs on it, makes parisc use somewhat
> less hacky.

Agreed.  Done in a follow on patch.

> 
> I'd suggest checking various configs on mips - that's likely to cause headache.
> Said that, my analysis of include chains back then is pretty much worthless
> by now - I really hate the amount of indirect include chains leading to that
> sucker on some, but not all configs ;-/  IIRC, the proof that everything
> using kmap*/kunmap* would pull linux/highmem.h regardless of config took several
> hours of digging, ran for several pages and had been hopelessly brittle.
> arch/mips/mm/cache.c was the only exception caught by it, but these days
> there might be more.

Grepping for 'asm/highmem.h' and investigations don't reveal any issues...  But
you do have me worried.  That said 0-day has been crunching on multiple
versions of this series without issues such as this (save the mips issue
above).

I have to say it would be nice if the relation between linux/highmem.h and
asm/highmem.h was more straightforward.

Ira


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
