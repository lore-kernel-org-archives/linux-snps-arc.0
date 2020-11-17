Return-Path: <SRS0=EQnS=EX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE8BC63697
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Nov 2020 05:25:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A9C2468E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Nov 2020 05:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O9BOIDs+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A9C2468E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DVcAwdJjaYLUpPh3nnX25q3yLetUXDpeJmeFhosg8Gg=; b=O9BOIDs+XYRpDp3o+KuEBJHHl
	dPv4tWZ93iVSG5tjah/EEd6B2vCiSpW9ruL6PMVsgMa1T5c6xHjaYTUVk+0QZiaKrqCWPTY1GLv6n
	fFMg8x8MKW723qxnlKBbI+HN1pr/PUp1IAyatUz2NxXCHWuUD+rij95v5oBvbrkKfaAUbdvOiMkXz
	X9zo20j0he7MPGXM26ClQsx8j1zv138GoB8fSTfJFAf4oOW5vsV7e6ro/kcleIcRGQ0LmjhsLLDWk
	OcbXdZlKVeleEKDr8jTdikMlG+ma0J2vLmb3JD9fBcmeFERMHVicMGIPygtTY6I1rSrzXSC4PwbHt
	ewuchHlCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ketUG-0003vj-5I; Tue, 17 Nov 2020 05:25:04 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ketUD-0003ul-C5; Tue, 17 Nov 2020 05:25:03 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1ketU5-001CTB-2k; Tue, 17 Nov 2020 06:24:53 +0100
Received: from p57bd9382.dip0.t-ipconnect.de ([87.189.147.130]
 helo=[192.168.178.139]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1ketU4-000ZYQ-Qv; Tue, 17 Nov 2020 06:24:52 +0100
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20201101170454.9567-1-rppt@kernel.org>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
Date: Tue, 17 Nov 2020 06:24:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201101170454.9567-1-rppt@kernel.org>
Content-Language: en-US
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.147.130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_002501_624379_AC3ACBED 
X-CRM114-Status: GOOD (  20.01  )
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
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi!

On 11/1/20 6:04 PM, Mike Rapoport wrote:
> It's been a while since DISCONTIGMEM is generally considered deprecated,
> but it is still used by four architectures. This set replaces DISCONTIGMEM
> with a different way to handle holes in the memory map and marks
> DISCONTIGMEM configuration as BROKEN in Kconfigs of these architectures with
> the intention to completely remove it in several releases.
> 
> While for 64-bit alpha and ia64 the switch to SPARSEMEM is quite obvious
> and was a matter of moving some bits around, for smaller 32-bit arc and
> m68k SPARSEMEM is not necessarily the best thing to do.
> 
> On 32-bit machines SPARSEMEM would require large sections to make section
> index fit in the page flags, but larger sections mean that more memory is
> wasted for unused memory map.
> 
> Besides, pfn_to_page() and page_to_pfn() become less efficient, at least on
> arc.
> 
> So I've decided to generalize arm's approach for freeing of unused parts of
> the memory map with FLATMEM and enable it for both arc and m68k. The
> details are in the description of patches 10 (arc) and 13 (m68k).

Apologies for the late reply. Is this still relevant for testing?

I have already successfully tested v1 of the patch set, shall I test v2?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
