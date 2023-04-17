Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50DC77B70
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZh46C3q93rW8kGO/07oj/xd4fQX2IppLYSqoCxjaVw=; b=I+q+bXHdOFPuaw
	UjhTdeg4pKkEjrl2aRxLSJbtfsE4YOgHFuTcgw/GDSb4O+qJj9a7r1GhrGyIsa98HcttxjHv1qSJy
	yZEVzqSiYkUni3GAOjOSXqnfXmmg0AobRuJxI/RHZGwqhEIdQMp6Eti6NxciY4AfmK/vvRAlvpqiQ
	E9m8XQrVfoqTvQUTQ0frU0yTk6fIC5pX75HfRBKh4Ff+RC+PNMovO3/3fPbQ18+e/lmw9rcuYCgDn
	qEio+n5oGrb90qiDX/vx0loYuIAPDxoBTaFN6dBVdWUlBO3T/7gfjk2hCzLCT5ypFci3egXRz6NPT
	dJhbzfl9psILGeg4R2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPbM-00GYq8-2C;
	Mon, 17 Apr 2023 14:13:04 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPbG-00GYfP-1I;
	Mon, 17 Apr 2023 14:13:01 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 3CB715C0076;
	Mon, 17 Apr 2023 10:12:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 17 Apr 2023 10:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1681740756; x=1681827156; bh=rt
	mXUVStrgw6nKVv7ID95dfZD6+whmhR2sZpfAx2JC8=; b=cvpI950jylHNWGGxX3
	ffHYboh+iDIsBvhpEDw08gT0LYZ8oMMkcdcXDZVKzSkh8esFParV3MdHeic+dgn+
	kH0rbkdfurwqLl5v5uDyvgv2Zfru5aIsiX+9hVd4psY1p8GfC9rDavxuvI0+p+vV
	HopcxWe/RDLjKvGegghWwXZuxEWZTQL17wUgNwlbJVpWThS7jri3Bq5bz/+fBp8a
	C9ogLLe/DWQcOTqHQ3w2nVO8Jy28kXGWEQlTt1fhSgoUOE5X4sfausj36i66OtQq
	n+sFD0KYJ9gc9yFZJbxxbxucxrkLiwRn2Ike/DVt9GdSUl4cglZbI9zSDG53SEdY
	jt2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681740756; x=1681827156; bh=rtmXUVStrgw6n
	KVv7ID95dfZD6+whmhR2sZpfAx2JC8=; b=aD83kUhjQpSMNmNM/jNLZdKF7Z1Y9
	aAF8LixyaBK3Kb9Alnq4xfmtqhcmzQfzFzhW54TeND6tHtJ6DlFW0p7RY6giFVXL
	tf9egb1+THfNCfp2se+/8HsOhTd+4Sq7v2bWd17TyxcJ4+J4B0MofIb6m9cSZrEQ
	wzfIBj34Bfh2DUjI/GhTces0G4/SxB0KIBf+7D0zRQHMGkLcJ/1RMKY97H8eThSf
	aqCPgo8YFDSNijB+9gI6uSiAa1ep9EHgcG7rmPXjeQSNwIvQjZ+dOlNI9Q2dvc5A
	i2eHfsj9szgXcC+xocDDLHhNF3PDLhPslESBV1Jdy07DSiQsw8Vhd5Z+g==
X-ME-Sender: <xms:01M9ZLDvPtWAPmi3WXNzECAofp8SL7yIxzpWl6AAWPVMnFZITSexig>
    <xme:01M9ZBhKWjWONa2OiIi9-RqJwrx92V0sTYJWqtEZOVy0Lm4y32eWpPkSBIKJxwd9n
    z3hjS-kxClz5Wygqt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeliedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:01M9ZGl0g-tLHtvweyZxjzJgmeNqpttS9QZsz_hHc4GKSgFu8tXu5Q>
    <xmx:01M9ZNxSPgUXj44dwCEqX3eLnDK1yoDkjqmHV181SYugEkImQvHuiw>
    <xmx:01M9ZAS0DqGZ_SAOY1Oquyq7riLCXVeBCKulpduFz67EWr0UDhOBtg>
    <xmx:1FM9ZCFTyE9BhjDjf2qCzcWdgAa-x5jPF0aSST4sLwe56mYmcMZMXA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C62C0B60089; Mon, 17 Apr 2023 10:12:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <1641007d-7953-426a-a3de-ca9c90f6c5a9@app.fastmail.com>
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
Date: Mon, 17 Apr 2023 16:12:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 00/19] arch: Consolidate <asm/fb.h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_071258_636653_4F925541 
X-CRM114-Status: UNSURE (   7.08  )
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

On Mon, Apr 17, 2023, at 14:56, Thomas Zimmermann wrote:
> Various architectures provide <asm/fb.h> with helpers for fbdev
> framebuffer devices. Share the contained code where possible. There
> is already <asm-generic/fb.h>, which implements generic (as in
> 'empty') functions of the fbdev helpers. The header was added in
> commit aafe4dbed0bf ("asm-generic: add generic versions of common
> headers"), but never used.
>
> Each per-architecture header file declares and/or implements fbdev
> helpers and defines a preprocessor token for each. The generic
> header then provides the remaining helpers. It works like the I/O
> helpers in <asm/io.h>.

Looks all good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
