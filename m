Return-Path: <SRS0=Bf7c=OU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E176C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 22:11:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0410161882
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 22:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0410161882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prvvbt22Qo51cgHlBO5ELTJi9hcdn7PxaKKyCTNN2I0=; b=D2BOxF7Pp7k1j/
	iJjZr+k9kDrZI0bkovCieJPzEg9tN7dOVS+6khEB18wjH3gwkFoMjET6KK0g5xG1Dr3yAmIqRJm0J
	0cdfBpttDDwtGfoIgaFbX9gnMoTfxlDbu0odbi+yvJ4arrK1Wyps8NEg/giAMH6bsC9Aq7K6PuDDs
	W0K9spToCvJgBzlAW/ELNAQINbFFRY77bBKS01deRJqGZ0TLPfeLWVFPA19Odc+xi1TLdEjX1xcaj
	gt1cXW1spr26/1iIGO6Uw8zE3GV08/CeHw93rr/7/2guVVzJxCT+9B7KdsbxLiFihSPOrCU8UmLtj
	jLz3Tv7lexhsGF/hBjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW4Gc-00G5Nw-F7; Thu, 30 Sep 2021 22:11:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW4GO-00G5Lb-8Z; Thu, 30 Sep 2021 22:10:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 965D361390;
 Thu, 30 Sep 2021 22:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633039847;
 bh=IwzBemW+hy1M1ewr7atFO0cSMjKx7nF1iOUj3EQWXE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VMFkm4a+fgdg4zYaCkaWnSOTeOZ8uAbKkitUxM0+m4BBfXT2b5oLMM7rDTLawyLAE
 NhhBOznSRQz5yRbiTNsvbV6E0IU3T5qz407KpFRCdUtW5hyDqK4d2pDAOMg4JRadt6
 KWrjYIXEm0KrNBVtP+JPzhB2VrG3+5vrqbM5hiSfUBy+07gwCIoejO0uW/sH7DYI6V
 pgwC0QydyQR/hM9nqnvQyR6gIiVBVoszYMQd2xY8yoPecdNAhtt2AC8GtVh+C0O4VI
 bPLArmwwdAbQbiLreQFVTZM6xuVy7lVHSRkS66W+8O7Twsm9hTlzsCUC2ioP79rEse
 MlAOzYU2R7N3A==
Date: Thu, 30 Sep 2021 15:10:46 -0700
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Juergen Gross <jgross@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 devicetree <devicetree@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 KVM list <kvm@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>, linux-usb@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-sparc <sparclinux@vger.kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/6] memblock: cleanup memblock_free interface
Message-ID: <YVY15nd56j8x8udh@kernel.org>
References: <20210930185031.18648-1-rppt@kernel.org>
 <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjS76My8aJLWJAHd-5GnMEVC1D+kV7DgtV9GjcbtqZdig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_151048_365927_E4F84AFC 
X-CRM114-Status: GOOD (  18.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Sep 30, 2021 at 02:20:33PM -0700, Linus Torvalds wrote:
> On Thu, Sep 30, 2021 at 11:50 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > The first patch is a cleanup of numa_distance allocation in arch_numa I've
> > spotted during the conversion.
> > The second patch is a fix for Xen memory freeing on some of the error
> > paths.
> 
> Well, at least patch 2 looks like something that should go into 5.15
> and be marked for stable.
> 
> Patch 1 looks like a trivial local cleanup, and could go in
> immediately. Patch 4 might be in that same category.
> 
> The rest look like "next merge window" to me, since they are spread
> out and neither bugfixes nor tiny localized cleanups (iow renaming
> functions, global resulting search-and-replace things).
> 
> So my gut feel is that two (maybe three) of these patches should go in
> asap, with three (maybe four) be left for 5.16.
> 
> IOW, not trat this as a single series.
> 
> Hmm?

Yes, why not :)
I'd keep patch 4 for the next merge window, does not look urgent to me.

Andrew, can you please take care of this or you'd prefer me resending
everything separately?
 
>              Linus

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
