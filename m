Return-Path: <SRS0=5IfC=AN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6712C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 16:27:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F6B20720
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 16:27:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8IRyPz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86F6B20720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qibkGfXVBZqgWw0tC8vFoSR11xuRWYDDKJzo32COQ7s=; b=f8IRyPz62XjMXYJaDkFQqtIch
	AGW2RC1EoDMtt+8pFZtJJQp9ZQV07DiPAhL5FvcdmF3QiSKvno5zuzX87uNKg4CgFYR+ojtlf9WBt
	gXYiNlje7dKQZX2Inr9t6D3N+9XcAou5RPzqwrwW2CIv8mgG1ToVuZ2/USohmKGi+0Ul6C5lz6ZCD
	swkI/blevZemR3mzGzARb8rfiFBGZ/8r07NYO3sFID+Vz+0PdL/gDpJRIevtfxoQ9YzRdrOZg99RN
	EbphaV+eKx8OZJzCjcCqcd5BaELybnm1VHyEpKaSz+PeYS7Jo1s5AnvgqYYFIbuLR43KE4esZKd1j
	kTXmX4OqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr23l-0001IS-07; Thu, 02 Jul 2020 16:27:37 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr23h-0001H8-LI
 for linux-snps-arc@lists.infradead.org; Thu, 02 Jul 2020 16:27:34 +0000
IronPort-SDR: sLS9BUx5xsuzlX6RpWsHOIbCTw+Tzbawk4QsH7zIuJ3X8OlzFXZAKUW5/dDAEC4YJSc+9P7Cla
 Za8CdXi+PPzGMkNRCxyqTeIWQfeCs0by7qQEMHR+G5pLU3Sd54FvdJZGrbARTPUz/logArxZqc
 iGc2OLDFC1qw44eEpzYMXupBGemFJ+sOmSfvmQEEMfBbTXmZ9UOzhjh05QrI1Uvaom1d/lWJ8A
 DjawEffdOminPLruPSqQr2qPUgdnDilKGoKlaM5gEaDEXKN2j0pYvuNY3xkCkfDX9YAIS70E+S
 +Gk=
X-IronPort-AV: E=Sophos;i="5.75,304,1589270400"; d="scan'208";a="50669851"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa4.mentor.iphmx.com with ESMTP; 02 Jul 2020 08:27:30 -0800
IronPort-SDR: NEYitbOqcEScyJxYadHToBLDoUtyu7cjlvFDSrfHQcJXtBF+tt1VuQfwrEKfD0Rcj3kNfIIytw
 DfyjAU+PLevgjWVH84AXTRwWk7L56JMu5oJEfIV+pNbzeYXZkW3L8EPuHNn/ikwfKcPaM5ziin
 sQN6VPCLhZa4Fp/Koaqq8ClDRhAHjTUyB9cM1/G8moThxoRu7Oy1BopRJ0yg4JnKr6IMLM+u9S
 KeF6QBWWU+1HD62YWV9RdbsU+HgmdATvayo8eR+N0wZ6mHzOfjXFfnhSC5iTV/rIN4UemNfYCN
 HGY=
Date: Thu, 2 Jul 2020 16:27:25 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: ARC math test regressions (was Re: [PATCH v7 00/13] glibc port
 to ARC processors)
In-Reply-To: <4a04f8dc-c888-1411-0add-8603822d5ee4@synopsys.com>
Message-ID: <alpine.DEB.2.21.2007021618480.21468@digraph.polyomino.org.uk>
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
 <a3afd7ef-87d9-f033-fea3-f4854b9188ef@synopsys.com>
 <9c1ae166-4e37-e8ab-d6c6-cdbda5b15d83@linaro.org>
 <e88bc836-ff16-d32b-cc06-fa473c4c6744@synopsys.com>
 <4a04f8dc-c888-1411-0add-8603822d5ee4@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_122733_826411_23970DA3 
X-CRM114-Status: UNSURE (   3.69  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 2 Jul 2020, Vineet Gupta via Libc-alpha wrote:

> Now acos can come from 2 places depending on LIBM_SVID_COMPAT
>  - math/w_acos_template.c	<-- sets errno only

This wrapper, unlike the compat one, always calls __ieee754_acos 
(appropriately suffixed), relying on it to raise appropriate exceptions.  
The implementation in sysdeps/ieee754/dbl-64/e_asin.c raises the exception 
by doing an Inf / Inf computation.

    u.i[HIGH_HALF]=0x7ff00000;
    v.i[HIGH_HALF]=0x7ff00000;
    u.i[LOW_HALF]=0;
    v.i[LOW_HALF]=0;
    return u.x/v.x;

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95115

The right place to fix this is in GCC, to stop it constant-folding Inf / 
Inf when flag_trapping_math.  That should be a straightforward fix.

It would also be reasonable to change the above code to just "return 0.0 / 
0.0;", as a simpler, more idiomatic way of returning a NaN with "invalid" 
raised.  (Any code constructing infinities / NaNs via bit patterns likely 
predates built-in functions that can be used to represent such values 
directly.  Though the GCC bug means a literal replacement with "return 
__builtin_inf () / __builtin_inf ();" wouldn't fix the present problem.)

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
