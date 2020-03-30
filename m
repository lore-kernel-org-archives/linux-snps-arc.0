Return-Path: <SRS0=blQs=5P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BFCC43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Mar 2020 22:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 952EA20774
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Mar 2020 22:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YMwSoOyB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z2ihfI3s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 952EA20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05mI83IxyVW597K7ah5HO5AemOwDTqTJFEUhu2llQro=; b=YMwSoOyBW4aWFA
	9xrm28y+bXJCX3CNI30kS3MWjSAuTOft8jVB/QnkhKxr8nLfVJYvr3mdjCEhcM+AfrgtO+gzsrPJc
	KGlTjrR8oMPFSBqu+/X0fFAWPrRu73hdySkTA7cPn64r8UHy9v/7PRO7wGYRg1fFRH2EEjyMB2lQj
	uhQpKP+fLJM1e+EPKQVlVPaNdEUzwgZR0nPHLueRGFDyemSXuXmvh5iLSwHYJ2dCUPrf0FJDs4g3B
	BcfI3bzfkfCIWX+9Z+e6itII8idug8NFTRSRlPFZCzbEBjEUv/JaRG2H4H12k+zCzFkeONC8oKlgX
	YqZyla8s1Eju4gU3tFeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ3GH-0000VA-F2; Mon, 30 Mar 2020 22:52:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ3G7-0000Lp-95; Mon, 30 Mar 2020 22:51:56 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C8F620733;
 Mon, 30 Mar 2020 22:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585608711;
 bh=EXmX9dErmlEkFgnbipzAfMRYR83Acb60UF9bDXiz0DI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=z2ihfI3sBMfsr5Wfl0ingXQoY+GET5tztqWSEKsLwaPrr7s+ZlNiSAKTokhw8O+xN
 ZHVynMZSxwgLZ5vqpo7pk6F7cOLNDYCHpT8EuVMpy6pEAuagf741mQ/aHK8qub7GET
 5sfIGbrfC8VOGI745W0EmSJ89zj6DGCdOS5BwtB0=
Date: Mon, 30 Mar 2020 15:51:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 0/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
Message-Id: <20200330155150.750ef923d297c455c7b418e0@linux-foundation.org>
In-Reply-To: <2e67f1b8-d196-89e4-aee1-f552db1433a0@arm.com>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <2e67f1b8-d196-89e4-aee1-f552db1433a0@arm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_155155_344097_8CCFE5EC 
X-CRM114-Status: GOOD (  13.67  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, 29 Mar 2020 19:12:35 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> 
> 
> On 03/20/2020 10:24 AM, Anshuman Khandual wrote:
> > This series renames pmd_mknotpresent() as pmd_mknotvalid(). Before that it
> > drops an existing pmd_mknotpresent() definition from powerpc platform which
> > was never required as it defines it's pmdp_invalidate() through subscribing
> > __HAVE_ARCH_PMDP_INVALIDATE. This does not create any functional change.
> > 
> > This rename was suggested by Catalin during a previous discussion while we
> > were trying to change the THP helpers on arm64 platform for migration.
> > 
> > https://patchwork.kernel.org/patch/11019637/
> > 
> > This series is based on v5.6-rc6.
> > 
> > Boot tested on arm64 and x86 platforms.
> > Built tested on many other platforms including the ones changed here.
> 
> Gentle ping, any updates regarding this ?

We're in the merge window so I have parked this for consideration after
-rc1.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
