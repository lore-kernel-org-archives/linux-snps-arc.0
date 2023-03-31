Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B661C761A6
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Mar 2023 20:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggBAZsDbd7RsdHbIFvCGun4NTVEPx9jYcF95ULT1ReY=; b=nRZSin6wKRB5i8
	cYxQbr9khXtpPguEVEOpQjqWlXdXtGSBScum9IC9I6SskbW3Zr53RCUPcW9NNxdH7RF4yYoJpbJen
	ZyIEPDWEW0EcaUIVDHY72fBq7823md6mKbobaY9a0uOy+emAbL+g6vcFf2RBPKD/rNEs2bMRBBOCp
	5u8epg0PL9wL7CmAuRpNNp216d4ODmNdgf7vJ0UFGEOtBHK7mQpFRRbjLkpG5youAYoNlVAeXE5fn
	Yya9O9nKTvvkqy7IXNqB48Qpz9CmPDguvGO2yiLV0zBbiCk7gtJNK0Uh9nj6Z3ummwCAnxAtv/hUv
	CiUyStfGQQkcjlzPlGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piLLv-008lcf-1I;
	Fri, 31 Mar 2023 20:28:03 +0000
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piLLq-008la0-23;
	Fri, 31 Mar 2023 20:28:00 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 53B902B0675A;
	Fri, 31 Mar 2023 16:27:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 16:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680294472; x=1680301672; bh=/s
	Pv/U5zGrhU1zcR9PvlFx9Mj6SaMuREGSBaNy/AOF4=; b=ga32HoREWznYqBsSqM
	hn2DgPhI0+UmwSJFnXp6cXUsAyk1RZOXfq4b1WpgTwt3IraMWAxdDHHwFHQwBWRE
	TlsHkLIB3Nc4l8Bq6wSMeqIIyToWRVX/9f0t7rNKj/mDhGRzzkvtwaJ1p5UpYAuF
	Z8rGx9r19iaVplZvj6iIVKmJ3wxEDol/ZCX+kvVRcieGj5+X8Yk4mNrXKl02EzG1
	O78oDXTRdwjh2SHkZPsjwwsywB0J05PUo7W3k2TfteNL/nInrhKIiqrlfLqOpaH2
	gfSyNuJsTvaCC7NaTMNKQDKVNF1f8g489075mkua2DPfSTRqEHVWobPvSnhWQi8c
	vjHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680294472; x=1680301672; bh=/sPv/U5zGrhU1
	zcR9PvlFx9Mj6SaMuREGSBaNy/AOF4=; b=dW2djYMpYmfXAs+yd/mPO4TOJPOfU
	DV9D3TLO5Cwx60AN2ozaZ1sIoj1IN10iqG7fO5heya/Cg3MohERkBeh3ap3w9dhj
	sJFkvHI4fXsy8Q+qeBBqlnPkR+t4SXMIO4JB3c9b1mmQmo31q8RxeeafqW4SIcqP
	fnxTPr7MCW1EmoykWd6eoPr6eF59XoPpd22azkOEW5Mr9WH4A0XXyV8IeEsZIe0k
	85q8QcqlxSt6yntoYMxaNEARIaZqm5Hr0r3F7jiqQoP8/MeIKFBIoHwkM3jUUU9o
	ffdqAx7D0BFQxh01VCVU3tMUBATkOZmczDXHy4vypo6Qq38qKVE2G/xQw==
X-ME-Sender: <xms:R0InZP2mM_jrWmep9R1hMYGS1afrnIVPBm0ykREhzG_PlyR_ZhfVOA>
    <xme:R0InZOGDN7XwS-J5hXnOlgqdR_R6uQosDr5uEehGnwIeoZ4DwsslXeL5s7Xo91zNJ
    7giAHsIobNDzZFvPEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:R0InZP6k67FFoQSeK-rPwxdXX5GSxL1R6Umkg6_gzhijRjjk7V5A-A>
    <xmx:R0InZE3gnBqZ6ZPKwy_FeRDQP9lj8gZgguMivD1IW1Vv3ysgM41tAQ>
    <xmx:R0InZCFzkA8cx1WWrkfB02CceyZH0_s-MOw2UePZSeGhx5AG193e3A>
    <xmx:SEInZCmDOJpTgqXceVn7aabci-LbPxTXfmZUbcZRySBalaI8jnVt7HFkay8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F12FCB60098; Fri, 31 Mar 2023 16:27:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <578fda41-4a69-44f5-8a58-1eacd49e1347@app.fastmail.com>
In-Reply-To: <ZCcQGX/i8xBPiG7T@arm.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <ZCcQGX/i8xBPiG7T@arm.com>
Date: Fri, 31 Mar 2023 22:27:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Christoph Hellwig" <hch@lst.de>,
 "Robin Murphy" <robin.murphy@arm.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 00/21] dma-mapping: unify support for cache flushes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_132758_913797_15C53FF8 
X-CRM114-Status: GOOD (  17.54  )
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

On Fri, Mar 31, 2023, at 18:53, Catalin Marinas wrote:
> On Mon, Mar 27, 2023 at 02:12:56PM +0200, Arnd Bergmann wrote:
>> Another difference that I do not address here is what cache invalidation
>> does for partical cache lines. On arm32, arm64 and powerpc, a partial
>> cache line always gets written back before invalidation in order to
>> ensure that data before or after the buffer is not discarded. On all
>> other architectures, the assumption is cache lines are never shared
>> between DMA buffer and data that is accessed by the CPU.
>
> I don't think sharing the DMA buffer with other data is safe even with
> this clean+invalidate on the unaligned cache. Mapping the DMA buffer as
> FROM_DEVICE or BIDIRECTIONAL can cause the shared cache line to be
> evicted and override the device written data. This sharing only works if
> the CPU guarantees not to dirty the corresponding cache line.
>
> I'm fine with removing this partial cache line hack from arm64 as it's
> not safe anyway. We'll see if any driver stops working. If there's some
> benign sharing (I wouldn't trust it), the cache cleaning prior to
> mapping and invalidate on unmap would not lose any data.

Ok, I'll add a patch to remove that bit from dcache_inval_poc
then. Do you know if any of the the other callers of this function
rely on on the writeback behavior, or is it safe to remove it for
all of them?

Note that before c50f11c6196f ("arm64: mm: Don't invalidate
FROM_DEVICE buffers at start of DMA transfer"), it made some
sense to write back partial cache lines before a DMA_FROM_DEVICE,
in order to allow sharing read-only data in them the same way as
on arm32 and powerpc. Doing the writeback in the sync_for_cpu
bit is of course always pointless.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
