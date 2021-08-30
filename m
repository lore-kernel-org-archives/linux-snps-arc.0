Return-Path: <SRS0=iJlA=NV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E535AC432BE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 19:13:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEC660E77
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 19:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CEC660E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=breakpoint.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fG8H+DtvqbXfmbonNRiTt3oB0jBI23Rdxr6zRXYoDY=; b=j4Lvcy43/m2GJr
	SC4ElM61dn9hmxkLbd2j8KjpsB0hj+Ufufu9O2nRMb8jcuK3EazmQoJ121V5Glue1hg3dbECFQJd4
	sPgzEd+EnAuFXCMQWJFjzreb+k+511ZoqEw7FTXxZGNbkYgaIdiP8V6qW47vR47ORNoPJ5nJKclme
	nMaCmH0jnkQ+up9VYnWCuPBG/c3hXsHMEJ4EPubw8mpXNKkYGntC+y8vInGBsOmDhWz92bAVAR2z9
	4R22yt7pfj2qtUvomWCCMNxyu1rmyqJ9vfFTIfzCd8BAELeby3fA241Zf22+DCzP76Zt4Tq+WDkNs
	0Db6chcwMJOL9CRwzmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKmiW-000PxV-Tl; Mon, 30 Aug 2021 19:13:12 +0000
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:12e:520::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKmiR-000PwU-VN
 for linux-snps-arc@lists.infradead.org; Mon, 30 Aug 2021 19:13:11 +0000
Received: from bigeasy by Chamillionaire.breakpoint.cc with local (Exim 4.92)
 (envelope-from <sebastian@breakpoint.cc>)
 id 1mKmiH-0006Hs-S9; Mon, 30 Aug 2021 21:12:57 +0200
Date: Mon, 30 Aug 2021 21:12:57 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: "Package Development List for OpenSSL packages."
 <pkg-openssl-devel@alioth-lists.debian.net>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, 989442@bugs.debian.org,
 Helmut Grohne <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [Pkg-openssl-devel] Bug#989442: Debian: openssl: Add ARC target
Message-ID: <20210830191257.amgdhiasypcpupnc@flow>
References: <a04109c1-e502-b979-d342-5c28ed558863@synopsys.com>
 <PH0PR12MB5401221D5C33C6E7BC9D440DA1CB9@PH0PR12MB5401.namprd12.prod.outlook.com>
 <20210830173007.yjcdqduzdczwqizq@flow>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830173007.yjcdqduzdczwqizq@flow>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_121308_049274_BB5900CF 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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

control: found -1 1.1.1g-1
control: tags -1 + pending

On 2021-08-30 19:30:07 [+0200], To Alexey Brodkin wrote:
> On 2021-08-30 16:37:11 [+0000], Alexey Brodkin wrote:
> > On Thu, 3 Jun 2021 19:14:24 +0000 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote: 
> > > This is needed to bootstrap arc port. 
> > > Patch attached. 
> > 
> > Ping!
> 
> Urgh. Sorry, thanks for the ping.

I pushed it to the unstable/experimental branch so it will be part of
the next upload.
 https://salsa.debian.org/debian/openssl/-/commits/debian/unstable
 https://salsa.debian.org/debian/openssl/-/commits/debian/experimental

Feel free to yell if something ain't right.

> > -Alexey

Sebastian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
