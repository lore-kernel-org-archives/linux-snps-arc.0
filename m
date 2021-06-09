Return-Path: <SRS0=1R09=LD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B471C47095
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 06:52:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C1D661249
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 06:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C1D661249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIR+01eXYeoIFPHNifFWjDpqxxJDHq5yUhZtyA4cz6g=; b=z6ECOE+EQJvGW6
	6Jw0kvo5CFqh96dze068YpEFRSlVm0sorN6xrM4sGPjm06vsp7kefhLDwCPsDlVFubc5dYzR8I6EX
	gGPUZUq2pgF8AfdXukITEmcJtag2KZC3NaeoQNBJF4NF7E+XnMFMWDxzaYHKqIxow8jYZqHYnq9/b
	YMr+fbYR3AVI1b8tgUa2FagOGCvbjoURGKhjDVSasQ+ndDOnRPPJQLTeiDqRH82Mfl3e4buqSm1Df
	VtbWLCRjxvern7fowgOT7imQ8HBdmdBjgaHxPo0KMsvYJczzwqZGDZ6LMRPwIxUeTPZOJGV4gQk9I
	i8e6RpoUdUQ9VlPgyJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqs4w-00C213-Vz; Wed, 09 Jun 2021 06:52:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqs4c-00C1vd-2e; Wed, 09 Jun 2021 06:52:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F40D661249;
 Wed,  9 Jun 2021 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623221541;
 bh=1NOcR9X1qrsVWC8pZ+WOBsJYlerWmKCJZFjAHZSyi1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R3Ua7SSrAmPcigjQENQSeeEMj920XMPbd0mRAH+B4DHPNXP+taIOYwYUWcVIXb5j6
 VJBySmzsOYZnbE6P4kMoE9ZvUpFBLiddGWhEYtU+E0KEUzEdWHkJqeLVtgBH6jO4C9
 Pe9x2UVR5RoSXUB4d6262LpkrrGlAOAE5RSKB4ZbL931VU3fcHDPQIgBFXazdDNmx0
 KYGm7I3vStPQPXah/NfmgtdSVOkJw8ewGPxvh3kYk2hvG8vZe26iLuJ3PqURc/rI07
 p6tkwWjdfIcQ6IB7Wn8wiS2wG0e2oDGZCpnQAvL+zgWVSStPrtFhj2bz5Vv7w2pP3G
 OCNYfrxKsGSKw==
Date: Wed, 9 Jun 2021 09:52:08 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 8/9] mm: replace CONFIG_NEED_MULTIPLE_NODES with
 CONFIG_NUMA
Message-ID: <YMBlGBxaWDPV1ouT@kernel.org>
References: <20210608091316.3622-1-rppt@kernel.org>
 <20210608091316.3622-9-rppt@kernel.org>
 <20210608172544.d9bf17549565d866fbb18451@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210608172544.d9bf17549565d866fbb18451@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_235222_162896_8F1512D5 
X-CRM114-Status: GOOD (  14.19  )
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

On Tue, Jun 08, 2021 at 05:25:44PM -0700, Andrew Morton wrote:
> On Tue,  8 Jun 2021 12:13:15 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > After removal of DISCINTIGMEM the NEED_MULTIPLE_NODES and NUMA
> > configuration options are equivalent.
> > 
> > Drop CONFIG_NEED_MULTIPLE_NODES and use CONFIG_NUMA instead.
> > 
> > Done with
> > 
> > 	$ sed -i 's/CONFIG_NEED_MULTIPLE_NODES/CONFIG_NUMA/' \
> > 		$(git grep -wl CONFIG_NEED_MULTIPLE_NODES)
> > 	$ sed -i 's/NEED_MULTIPLE_NODES/NUMA/' \
> > 		$(git grep -wl NEED_MULTIPLE_NODES)
> > 
> > with manual tweaks afterwards.
> > 
> > ...
> >
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -987,7 +987,7 @@ extern int movable_zone;
> >  #ifdef CONFIG_HIGHMEM
> >  static inline int zone_movable_is_highmem(void)
> >  {
> > -#ifdef CONFIG_NEED_MULTIPLE_NODES
> > +#ifdef CONFIG_NUMA
> >  	return movable_zone == ZONE_HIGHMEM;
> >  #else
> >  	return (ZONE_MOVABLE - 1) == ZONE_HIGHMEM;
> 
> I dropped this hunk - your "mm/mmzone.h: simplify is_highmem_idx()"
> removed zone_movable_is_highmem().  

Ah, right.
Thanks!

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
