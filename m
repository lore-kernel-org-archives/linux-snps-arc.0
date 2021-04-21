Return-Path: <SRS0=2K9J=JS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170F2C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 05:53:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4E86101D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 05:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA4E86101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VoIpm6IA4L0KSgR/+xkKUWM0IPzQMeS5wJM5ovac4r8=; b=f1+MKBu62rnxRpN9X6p3eQvX6
	xT+sd7PIpA9WpBIdxO4Dm5xYx09Pr/LowdRkByCNVMn/29aMfuym5/DFyrpmQ0dULhOoaWjvQtxF9
	zRsD5Yam5ymQ1HMLaWl2ZDC+aVffTQs37IybLn5VbAhJmiY0TzaAEGTlWaauHpL2Xaec7yq+Fvp/l
	zvAWxyXDFHbhXLlMLcfcF7arQsok7ct3e+kcYLvGAv20WQ0rRbZ+FQKSFrYHkPx52h4GQa1uEMWSq
	tHsx6xf9wnaTgKqUkw8yE8FvSbqW1+g9xfKpWLQmmWd767UfGTt7/d9eENSxkqoAzmZdXLW3p7RdL
	5oLGtqIVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ5nt-00DkDe-A0; Wed, 21 Apr 2021 05:53:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5l1-00Dk4u-4g; Wed, 21 Apr 2021 05:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0o20uUyQbXpIdOmISRlMctevF68FLP2jvzldjMJ+Deo=; b=X/P+vHG1Lk31DhfD94OI+cQTE3
 8WuHEhT0WmEGM/QfCMqnNSA4IDqzh6o19oTCOP36JZ7M7VCOiynYds24EVKgS2MYUbnHv7khkewL8
 pi15UL2YCpwk0371297uiolznqm3xIFFl7DGVhIKG94Y7tCD83lInFB1R82C0pRfnzexj/g4Akz4u
 ofboWCIiToX1vrFNAxsCQkjzeaMOW9hUMByN6IAk8TrRtb+mvm5kqwWRI/jQJLyhcfFIS+HO3qDwb
 hGd2tYeyWKF3thtocw/n1CpWpJzdmbIQRob/VougPDYzw1JU0QpAsEz1nrAELUrjexm95k8w3nI9C
 VGs0MFtQ==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5kv-00CceZ-1B; Wed, 21 Apr 2021 05:50:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7324868BFE; Wed, 21 Apr 2021 07:50:28 +0200 (CEST)
Date: Wed, 21 Apr 2021 07:50:28 +0200
From: "hch@lst.de" <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Matthew Wilcox <willy@infradead.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "mgorman@suse.de" <mgorman@suse.de>,
 "brouer@redhat.com" <brouer@redhat.com>,
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210421055028.GA28910@lst.de>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
 <20210420031029.GI2531743@casper.infradead.org>
 <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
 <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
 <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_225033_241386_8D6A1846 
X-CRM114-Status: GOOD (  13.62  )
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

On Tue, Apr 20, 2021 at 11:20:19PM +0200, Arnd Bergmann wrote:
> In that case, there should be no problem for you.
> 
> The main issue is with system calls and ioctls that contain a misaligned
> struct member like
> 
> struct s {
>        u32 a;
>        u64 b;
> };
> 
> Passing this structure by reference from a 32-bit user space application
> to a 64-bit kernel with different alignment constraints means that the
> kernel has to convert the structure layout. See
> compat_ioctl_preallocate() in fs/ioctl.c for one such example.

We've also had this problem with some on-disk structures in the past,
but hopefully people desining those have learnt the lesson by now.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
