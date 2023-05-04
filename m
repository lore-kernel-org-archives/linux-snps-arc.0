Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D431C7EE21
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 May 2023 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3t6SQ08PTqRWz2UTqAxJLlK40nq5KFlFtIZoc0MWLo=; b=r/n+qN3QmItVY7
	QJ/QoroUTn6/gGdLR0IE+jynwxIQrXuYZry/z4BcJ39dz1nCwpQwz/BWff+YwGSS0kqchCUPQYa9f
	WPR8v0lUHiZhctdzsAOcgSsLwgMytszl4J8Y9luMY0x96k0iP3CvNrJQyytvbA3VOLRjIC4hISA7C
	AwT91yWVi202smFiawTbgGjOIp3qXRIa2+/nVbb+ySiZSpkLNclwf2GQrw/Qk5ih3G60tMxz1db4k
	+NIEoxQH+VaguDBVV2+fFJUNEvhIRsCxT7pgFg7UIShu2uy4FZ/Tk7Jr5UvoKZtajiT2Q6ZDlwAnv
	kaqQlBy9qULy6p7nyqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puU0w-0072UY-2R;
	Thu, 04 May 2023 08:08:34 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puU0t-0072Sd-01;
	Thu, 04 May 2023 08:08:32 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id C953F580E95;
	Thu,  4 May 2023 04:08:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 04 May 2023 04:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683187707; x=1683194907; bh=7I
	vu6rn6B1NGFOZyVTFGNG5QNTPEE1cpZNNy0FHXEjE=; b=fWn6u6lEuEOEz732Wx
	rmayNAhve5wq+evaQfFvpEc5R6ye2SWH72iSWHn1otWQC1ahiQ8t9gXIp8XfuKdP
	gw7yALeMRyEJ/QwP/xbB2gkjd/8276PjG9S2y8tv15DrZjy36ESbn/kfrtHRaByU
	AQnZxbtjrPQBJI7g+kiMYM/yUNCwanHgR1RxjXfRlWRRxRo1OK/Tm5U3jWxHAKEH
	QO9xny6tg6v+0Ltcw8bU5Xj3QxjTMznmB7/XBRGl3oqX4MZD0yJu6NDaeEzfu2W3
	AKTj/VdOxrUNdwDJr1X6v7nJ3+YevXi+ScssrwbkNXmt3QiF4LN7nmEYgbel8aF5
	7nQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683187707; x=1683194907; bh=7Ivu6rn6B1NGF
	OZyVTFGNG5QNTPEE1cpZNNy0FHXEjE=; b=BY0CkEdf22oXu9QS+93gEkE+r+1KL
	y4q2EzAPSeXPlQHoIn5PPogsePeb2EtPSdD77LsuSbHRCs9Hos3Au0vYQyA0RyE2
	d4AS/QwSrLJyCVUMvrf2MoaPAwX4TebJVh38wsMNgrKZnd3CTjq2ram0SP3S2mC3
	UKv05OqeACoP9cQxSs0G8kJ9Tj1Z7lHJwMCCAZO87eeFgS5QP7I1dEASPKfMGDmZ
	kMLSzhyF0OnlR6P7d3sADZ4XOyPTUuOhFfBGUQw043OqExMXRj1wKSKT9o3zMDLA
	AaOHJNQD6RcQ/xG0v7VdJeSXy0atqxicuKYDU46a+oiTN8n2u5awSGS3w==
X-ME-Sender: <xms:-mdTZKvpe77Ggd55l7QklkXVLdjfMWwkvcfsgL6xYuT9kl-opXPMQQ>
    <xme:-mdTZPc7TGrAEu-sq9LVOHxH6C6sW62ghk6jE0OTZCHOC5XvGmjDCG4naf5DLoXB8
    ogQmLW6DnnkrnAm7po>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvledguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:-mdTZFzKaTEBCz5YZ6VEL5PbwzD84xZUykvo2kpZRgf8jJl3WFo6tQ>
    <xmx:-mdTZFM9ja9VRjcYH6gnljzqTpzuYZ8K0ABfc6pNxosU5UAvkgn3oA>
    <xmx:-mdTZK9yA2NopA9LXitQq9QqfUe7AExDqkaJjSEZs_iY6EhOz893cw>
    <xmx:-2dTZNjT4047igFwdLFr9BK1zu7YSDGszq7TkVg743YjZX4Z6vfdnw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C2C61B60086; Thu,  4 May 2023 04:08:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <ee4cea3d-282e-4e90-897e-4ba576731f6e@app.fastmail.com>
In-Reply-To: <20230504074539.8181-1-tzimmermann@suse.de>
References: <20230504074539.8181-1-tzimmermann@suse.de>
Date: Thu, 04 May 2023 10:08:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Vineet Gupta" <vgupta@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "David S . Miller" <davem@davemloft.net>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Sam Ravnborg" <sam@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org
Subject: Re: [PATCH v4 0/6] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_010831_108883_126656A6 
X-CRM114-Status: GOOD (  11.73  )
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

On Thu, May 4, 2023, at 09:45, Thomas Zimmermann wrote:
> Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
> fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
> depends on the architecture, but they are all equivalent to regular
> I/O functions of similar names. So use regular functions instead and
> move all helpers into <asm-generic/fb.h>
>
> The first patch a simple whitespace cleanup.
>
> Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
> will go away, patches 2 to 4 prepare include statements in the various
> drivers. Source files that use regular I/O helpers, such as readl(),
> now include <linux/io.h>. Source files that use framebuffer I/O
> helpers, such as fb_readl(), now include <linux/fb.h>.
>
> Patch 5 replaces the architecture-based if-else branching in 
> <linux/fb.h> by helpers in <asm-generic/fb.h>. All helpers use Linux'
> existing I/O functions.
>
> Patch 6 harmonizes naming among fbdev and existing I/O functions.
>
> The patchset has been built for a variety of platforms, such as x86-64,
> arm, aarch64, ppc64, parisc, m64k, mips and sparc.

The whole series looks good to me now,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
