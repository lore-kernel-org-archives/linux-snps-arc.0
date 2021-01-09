Return-Path: <SRS0=tBYF=GM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6882C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Jan 2021 00:34:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD2D23A1E
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Jan 2021 00:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD2D23A1E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=62Mp5ItIlEH2ukMIU0CzaFPeHw/RPWhkv9dNcMkXkiI=; b=0hyhG7QuOc5u0Yz5qY8tg42O1
	6UvCKHCgjBkm+Du9fia007PlpjMpCu9QfzyQVAk/BENpQYWv7fHzkHrU5+v8pifr0b+0DWJ46chE4
	43hzCG0++IHJ4ABYUi+YYyY8V/MKVvNKa7NH3o8aC895G6k6F4Hb1A1ZN2vgp/dtRgOOIL1N64Fx9
	LorWiWJNqk55OyXbyhhEmRZFRT3gqLXU0W2kqbJF1QiJmecITIG7haNt6MX5ZSKeKXxkxUN5fh7RU
	5Upy5JhN7C+FszJx8h2SMi7zkv/1b/KnCf1QnCToQ/EF8y/nhDYLQ4XmJwzX+YuhYSXyU50LaCHBh
	nq92/Pr2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky2DB-0006BH-FB; Sat, 09 Jan 2021 00:34:33 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky2D9-0006Av-OX; Sat, 09 Jan 2021 00:34:32 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1ky2D2-0008AZ-00; Sat, 09 Jan 2021 01:34:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id AFC99C0870; Sat,  9 Jan 2021 01:33:52 +0100 (CET)
Date: Sat, 9 Jan 2021 01:33:52 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Message-ID: <20210109003352.GA18102@alpha.franken.de>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
 <20210108235805.GA17543@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108235805.GA17543@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_193432_023854_A5DDC367 
X-CRM114-Status: GOOD (  13.82  )
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

On Sat, Jan 09, 2021 at 12:58:05AM +0100, Thomas Bogendoerfer wrote:
> On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
> > Hi Thomas,
> > 
> > 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this commit.
> > 
> > Any idea what could be happening?
> 
> not yet, kernel crash log of a Malta QEMU is below.

update:

This dirty hack lets the Malta QEMU boot again:

diff --git a/mm/highmem.c b/mm/highmem.c
index c3a9ea7875ef..190cdda1149d 100644
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -515,7 +515,7 @@ void *__kmap_local_pfn_prot(unsigned long pfn, pgprot_t prot)
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 	pteval = pfn_pte(pfn, prot);
-	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
+	set_pte(kmap_pte - idx, pteval);
 	arch_kmap_local_post_map(vaddr, pteval);
 	current->kmap_ctrl.pteval[kmap_local_idx()] = pteval;
 	preempt_enable();

set_pte_at() tries to update cache and could do an kmap_atomic() there.
Not sure, if this is allowed at this point.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
