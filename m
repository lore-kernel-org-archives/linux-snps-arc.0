Return-Path: <SRS0=EQnS=EX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C75C63697
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Nov 2020 06:23:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D804223AB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Nov 2020 06:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eh3aFGVK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAUA5RVC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D804223AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LzZ4sXXEMm2xoFLToyx3EFa5F0cjEPobQsNxZcNjEHo=; b=Eh3aFGVKTOAsSPWKEbnkgfDvf
	ty8v/Vm/D1ZHeMfhcGLZ1bSR6c78Mz0qRd2bGe2L8CWHE0itO4Vs/6SaVti+cRhCnI87B7l47fmjo
	0jtmMPAzNykHRe3ohhXAUM8wupX7ac4IU7NBKcwOJfcNgqrtZMizrg+PlNvTOFVqBh0dfvZb8IJsD
	yN0hrnfVZfStOpgTvX2d6WjpMfhybUBY7AEfFKI19FcyX/U3/656F4tuTX3mY4kkFNw+CnNAisbra
	66v4H16GoTwSu3U78eAGlBkiJefm2HBbjcfdWb4m6N8WkZ2QW0IdnuabQB+IQ+X65scCCUwM1Omya
	Moey3IYyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keuOq-0006mp-NU; Tue, 17 Nov 2020 06:23:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keuOn-0006lp-5G; Tue, 17 Nov 2020 06:23:29 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DA1C223AB;
 Tue, 17 Nov 2020 06:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605594206;
 bh=i6knV0DMO2RXQJYhiZxatZGtoKHulkxOl5sSaGDS0gM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qAUA5RVCTP0npaeRBIO8YpdBuUTgIPD0QBwHOr2UeiElqlVtKRczsIc13jS9qXhSM
 /m8cTkIY+QMvxEbuFwI36fTIAAvpIJ9fhQtB5SdUWJTnAGZetOklMyr9EQ9DA4BJIQ
 QteWhvERMCEW1EUrOIOHXVbp4uevZfdG2TI7hGQ8=
Date: Tue, 17 Nov 2020 08:23:16 +0200
From: Mike Rapoport <rppt@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
Message-ID: <20201117062316.GB370813@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_012329_322952_DC453E80 
X-CRM114-Status: GOOD (  25.70  )
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

Hi Adrian,

On Tue, Nov 17, 2020 at 06:24:51AM +0100, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> On 11/1/20 6:04 PM, Mike Rapoport wrote:
> > It's been a while since DISCONTIGMEM is generally considered deprecated,
> > but it is still used by four architectures. This set replaces DISCONTIGMEM
> > with a different way to handle holes in the memory map and marks
> > DISCONTIGMEM configuration as BROKEN in Kconfigs of these architectures with
> > the intention to completely remove it in several releases.
> > 
> > While for 64-bit alpha and ia64 the switch to SPARSEMEM is quite obvious
> > and was a matter of moving some bits around, for smaller 32-bit arc and
> > m68k SPARSEMEM is not necessarily the best thing to do.
> > 
> > On 32-bit machines SPARSEMEM would require large sections to make section
> > index fit in the page flags, but larger sections mean that more memory is
> > wasted for unused memory map.
> > 
> > Besides, pfn_to_page() and page_to_pfn() become less efficient, at least on
> > arc.
> > 
> > So I've decided to generalize arm's approach for freeing of unused parts of
> > the memory map with FLATMEM and enable it for both arc and m68k. The
> > details are in the description of patches 10 (arc) and 13 (m68k).
> 
> Apologies for the late reply. Is this still relevant for testing?
> 
> I have already successfully tested v1 of the patch set, shall I test v2?

There were minor differences only for m68k between the versions. I've
verified them on ARAnyM but if you have a real machine a run there would
be nice.

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
