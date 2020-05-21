Return-Path: <SRS0=rPSH=7D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F817C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 May 2020 17:43:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00CAF207F7
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 May 2020 17:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jt/g9B3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00CAF207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggIZSCv1gI0YRZzxWSdQYGVu8ZEtQ5vg1k/ichJkdy0=; b=Jt/g9B3FbaBxUn
	4gZ/1cBgDsOiR8wV0f9xQPzv+DgY/X4jkSOCXG5mxlw+FJM6ysdfZMRQbDygiB12nDfH/r19Kgj8u
	Pyxek3cGshWINs/UZWOoNHvMSJOnZtUJO4SMSotyzTd08+1FBnezDLhmPhSLq618yf+KZC5KHw2Vv
	Egi6CUAKAgMfDcTXNfOBGxMB/LGyY5fUUUvu/tiC8hX3FYnBJSbRZ2y8Q5wqboM2R9NkEcx4hhAKY
	Wwt3uyB7KjkfkbIuGTw5U4sXvNRN8+8H/z/n0Pzmd4cG28InPKaN/vmjwumY+u/kVyLCHgT7b1s4H
	QG9wJuBpRafrzxisJ0Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbpDl-0008OH-Pj; Thu, 21 May 2020 17:43:05 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbpDY-0008EW-Pj; Thu, 21 May 2020 17:42:54 +0000
IronPort-SDR: AGeZguzjqbHKQQSi828KWF/U+WQ3ON8FkdfMr5FhGH64Hb5WhZSq0Rn8ScTeRkhDSDhvBOCQrz
 /xqc8zO0NPSg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 10:42:51 -0700
IronPort-SDR: s5ulawStg94Cu9y3YOCakFhS9iVyiQrqWbqZMNZIpr4rCQpdet6Bu4hecbYJ8KDWYPUF1KKYgT
 4/nzZR2X+tUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,418,1583222400"; d="scan'208";a="265129438"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga003.jf.intel.com with ESMTP; 21 May 2020 10:42:50 -0700
Date: Thu, 21 May 2020 10:42:50 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_104252_850560_C51638E0 
X-CRM114-Status: GOOD (  22.00  )
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
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

On Thu, May 21, 2020 at 09:05:41AM -0700, Guenter Roeck wrote:
> On 5/19/20 10:13 PM, Ira Weiny wrote:
> > On Tue, May 19, 2020 at 12:42:15PM -0700, Guenter Roeck wrote:
> >> On Tue, May 19, 2020 at 11:40:32AM -0700, Ira Weiny wrote:
> >>> On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> >>>> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> >>>>> From: Ira Weiny <ira.weiny@intel.com>
> >>>>>
> >>>>> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> >>>>> enables when vaddr is not in the fixmap.
> >>>>>
> >>>>> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> >>>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> >>>>
> >>>> microblazeel works with this patch,
> >>>
> >>> Awesome...  Andrew in my rush yesterday I should have put a reported by on the
> >>> patch for Guenter as well.
> >>>
> >>> Sorry about that Guenter,
> >>
> >> No worries.
> >>
> >>> Ira
> >>>
> >>>> as do the nosmp sparc32 boot tests,
> >>>> but sparc32 boot tests with SMP enabled still fail with lots of messages
> >>>> such as:
> >>>>
> >>>> BUG: Bad page state in process swapper/0  pfn:006a1
> >>>> page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
> >>>> flags: 0x0()
> >>>> raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
> >>>> page dumped because: nonzero mapcount
> >>>> Modules linked in:
> >>>> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
> >>>> [f00e7ab8 :
> >>>> bad_page+0xa8/0x108 ]
> >>>> [f00e8b54 :
> >>>> free_pcppages_bulk+0x154/0x52c ]
> >>>> [f00ea024 :
> >>>> free_unref_page+0x54/0x6c ]
> >>>> [f00ed864 :
> >>>> free_reserved_area+0x58/0xec ]
> >>>> [f0527104 :
> >>>> kernel_init+0x14/0x110 ]
> >>>> [f000b77c :
> >>>> ret_from_kernel_thread+0xc/0x38 ]
> >>>> [00000000 :
> >>>> 0x0 ]
> >>>>
> >>>> Code path leading to that message is different but always the same
> >>>> from free_unref_page().
> > 
> > Actually it occurs to me that the patch consolidating kmap_prot is odd for
> > sparc 32 bit...
> > 
> > Its a long shot but could you try reverting this patch?
> > 
> > 4ea7d2419e3f kmap: consolidate kmap_prot definitions
> > 
> 
> That is not easy to revert, unfortunately, due to several follow-up patches.

I have gotten your sparc tests to run and they all pass...

08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
Build reference: v5.7-rc4-17-g852b6f2edc0f

Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
Building sparc32:SS-4:nosmp:initrd ... running ......... passed
Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed

Is there another test I need to run?

Ira


> 
> Guenter
> 
> > Alternately I will need to figure out how to run the sparc on qemu here...
> > 
> > Thanks very much for all the testing though!  :-D
> > 
> > Ira
> > 
> >>>>
> >>>> Still testing ppc images.
> >>>>
> >>
> >> ppc image tests are passing with this patch.
> >>
> >> Guenter
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
