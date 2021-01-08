Return-Path: <SRS0=cuW9=GL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	MAILING_LIST_MULTI,MONEY_NOHTML,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184E7C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 23:58:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B907123A7B
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 23:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B907123A7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lpgi5PLDwzVyMB3GSVchok2CtRt2Bk3M1hHTU0RiUx8=; b=RNXDexDvjzCTWMNODJd9X8DCe
	tsRTun/KXTKS5sqQRibN92GLfrcqfpMRGd0wiq6zodqWRO0H+5yrNmMw4U4ey7eyF1UCG/cXHtW/Z
	LsAgyr9mgK7HxsyLJpyHjroO325jg5YvB2Pk9aJ0Emqf+fm+AQKfymTQ7yqjhcxHvitYZ7c/h8MI+
	WfUfwQ3ajNqAXDC9rxDnqhErxWi+pd7554CQl/7lgVE0quWiQf27bRBwk/0eskxEMyEc4z/HTxkOU
	gHGvB65ozeEYGyut+kDG8K0EAfFrfBkmsPfxIkeTprXYPHJiZqAvX6cIjpIS+DzIkv7azigo88LVN
	PbjdyfMOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky1eX-0002J0-O9; Fri, 08 Jan 2021 23:58:45 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky1eV-0002Ib-TH; Fri, 08 Jan 2021 23:58:44 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1ky1e2-0007pu-00; Sat, 09 Jan 2021 00:58:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 804DDC086F; Sat,  9 Jan 2021 00:58:05 +0100 (CET)
Date: Sat, 9 Jan 2021 00:58:05 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Message-ID: <20210108235805.GA17543@alpha.franken.de>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_185844_177716_EE6D4F21 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: juri.lelli@redhat.com, linux-aio@kvack.org, airlied@linux.ie,
 nouveau@lists.freedesktop.org, bigeasy@linutronix.de,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 bsegall@google.com, jcmvbkbc@gmail.com, ray.huang@amd.com, paulus@samba.org,
 kraxel@redhat.com, sparclinux@vger.kernel.org, deanbo422@gmail.com, hch@lst.de,
 vincent.guittot@linaro.org, paulmck@kernel.org, mpe@ellerman.id.au,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@kernel.org, peterz@infradead.org, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, airlied@redhat.com, linux-snps-arc@lists.infradead.org,
 linux-mm@kvack.org, mgorman@suse.de, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, intel-gfx@lists.freedesktop.org, sroland@vmware.com,
 josef@toxicpanda.com, rostedt@goodmis.org, torvalds@linuxfoundation.org,
 green.hu@gmail.com, rodrigo.vivi@intel.com, dsterba@suse.com,
 tglx@linutronix.de, virtualization@lists.linux-foundation.org,
 dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org,
 chris@zankel.net, monstr@monstr.eu, nickhu@andestech.com, clm@fb.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, bcrl@kvack.org, spice-devel@lists.freedesktop.org,
 vgupta@synopsys.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 bristot@redhat.com, davem@davemloft.net, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
> Hi Thomas,
> 
> 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this commit.
> 
> Any idea what could be happening?

not yet, kernel crash log of a Malta QEMU is below.

Thomas.

Kernel bug detected[#1]:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc1-00017-gccb21774863a #2
$ 0   : 00000000 00000001 00000000 00000010
$ 4   : 00000001 000005cf 9e00059f 00000000
$ 8   : 00118173 809e6db8 9e00059f 00000000
$12   : 82023c00 00000001 810da04c 0212422f
$16   : 810da000 00027800 000005cf 80b4bf9c
$20   : 809e968c 82602400 810da000 0000000b
$24   : 021558f9 00000000                  
$28   : 820e0000 820e3928 80b10000 802710d0
Hi    : 0000346c
Lo    : 000002dd
epc   : 80271114 __kmap_local_pfn_prot+0x78/0x1c0
ra    : 802710d0 __kmap_local_pfn_prot+0x34/0x1c0
Status: 1000a403	KERNEL EXL IE 
Cause : 00800034 (ExcCode 0d)
PrId  : 0001a800 (MIPS P5600)
Modules linked in:
Process swapper/0 (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=00000000)
Stack : 7fffffff 820c2408 820e3990 ffffff04 ffff0a00 80518224 000081a4 810da000
        00000001 000005cf fff64000 8011c77c 820e3b26 ffffff04 ffff0a00 80518440
        80b30000 80b4bf64 9e0005cf 000005cf fff64000 80271188 00000000 820e3a60
        80b10000 80194478 0000005e 80954406 809e0000 810da000 00000001 000005cf
        fff68000 8011c77c 8088fd44 809f6074 000000f4 00000000 00000000 80b4bf68
        ...
Call Trace:
[<80271114>] __kmap_local_pfn_prot+0x78/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<802c49a0>] copy_string_kernel+0x168/0x264
[<802c5d18>] kernel_execve+0xd0/0x164
[<801006cc>] try_to_run_init_process+0x18/0x5c
[<80859e0c>] kernel_init+0xd0/0x120
[<801037f8>] ret_from_kernel_thread+0x14/0x1c

Code: 8c630564  28640010  38840001 <00040336> 8f82000c  2463ffff  00021100  00431021  2403ffbf 

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
