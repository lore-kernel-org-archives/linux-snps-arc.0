Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB50C76188
	for <linux-snps-arc@archiver.kernel.org>; Wed,  5 Apr 2023 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtrGp1BkY4/jgN4bZKwAzzQKlp9o9zRdjlV5ApKvHag=; b=yJAMwLVFxZ0SM0
	ZCNtjbAAZz+ZMQQYSwOYo73Ay2Cax8OvSomPPVCkl+gumb1LIfxZNZFB7yGzVgvyFd1fuSphdWPKl
	ogy4KJddkXAHb09R5h/so07fz5hqet1JwD3IWagx80Opl4PO4C6lSdCCzSBERKfu/aW11SkvfZDSu
	uJ844HXxFZGCSzLBTCGg3qql2ol/oHgVLWqlqzYk3cFgZaRv5tUePP2/7apkzhpGfqU1Nv+5l9wLx
	uJnFtgFDmPx3MzjtD0lHjMmziDTTkvPAc+3TPRdjGxQalpfrpcD7qDm7XgGw26xjj745t6objsUf1
	e4eQVy6OppE8HLiD2C5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5S8-00528g-1w;
	Wed, 05 Apr 2023 15:53:40 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5S0-00525f-0q;
	Wed, 05 Apr 2023 15:53:37 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 958B632007CF;
	Wed,  5 Apr 2023 11:53:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 05 Apr 2023 11:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680710005; x=1680796405; bh=Nw
	bB+EHW5S+V11givdbxuIy2Uf+thntoCfTqZWxMcBg=; b=YAuUXEBHlJ+kw9Zmtu
	9I5T+IGhxkBqddi19dn4r+kNWXx/0s7MbpimtmFPL+aPlqdAyBvCvEsdsYUd5tTf
	dBua9XG68Yl0nAEEaOyNWPgbGp6alKd9HHDJSvPFHUNlT8zuWj1g9huygqraxlWC
	Y+7aQ0Y5o6JpEn9vn6pvB592FVfSJZTE0wQ53CHjaAn3N3A83rdRSbIzi5UNwgov
	IcI7SaTPzh0bHkde+aJv1IK0dSQpj45he+L1xtfkD90bXKLSnl9xy0H9KtD29GkI
	2+G9FZEVKV8Ap9yXYVustJlay4HAIUJFWpO3k3GqLJgcjagxLjHlqMCd0ESl4Zi8
	VyAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680710005; x=1680796405; bh=NwbB+EHW5S+V1
	1givdbxuIy2Uf+thntoCfTqZWxMcBg=; b=X0YUdqlMVBOCdYHJ8fMsj7rw5LYNz
	ZGJ0nWIBBIL3CKMDRVVw2YGPAAiFOVnx7L1394T+EXUfeUzEKvYMxNmF0dJpg65D
	qT9JFnQfBWcM5VGeF55Js0uJ5ogNkDIdRPUREUIHT1EtxI8FePekTl0V4NAuAe5Y
	qNymd5gN9jUrHF8b/D8IDIAoOBs1X79EO2v/otVPN+ytEPy8eYxvMw6YOZAONkMt
	5RApka5ld90qALBZBcg+sniYxlayLf3ViaDFB298sG58vLKWLb118o2FnrdR0eT0
	dNfDQuIkc53XS6ntd6jHdr0SIi5xBB7v6AC/Ua1W+XfuOjYh6m52RqtGw==
X-ME-Sender: <xms:dJktZBPFWqBnr6mfzO8DOWuR7c2ENV4acvVeClXUTDoQiGEtbLwiIg>
    <xme:dJktZD8XL0MU9X_rpIxSZPrpwdJrQZi4UNvkvOPT8n1qmRwJJhnzaxlhv6m8EtCUs
    E1IXfLm605CI-wMb7E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:dJktZATYY_Gq6fxyBxmSUcz4MrTxtMytmGT595pv1iPmDASW8AykXw>
    <xmx:dJktZNv9KVxTxhp3cBNuP4GxEpbXZJqZRlFfZTzbjmsLL8Lq-zBh9Q>
    <xmx:dJktZJecGyTQlt79mmyr2IRJEdz3IZbauZ6UTCmdguaRSG1KRzZvdQ>
    <xmx:dZktZMB0Nzly1u5fZB3wNDYr-LgmhzIWAQJpCsBbi2IUq8MXyn4L5g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C4968B60098; Wed,  5 Apr 2023 11:53:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>
In-Reply-To: <20230405150554.30540-2-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>
 <20230405150554.30540-2-tzimmermann@suse.de>
Date: Wed, 05 Apr 2023 17:53:03 +0200
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
Subject: Re: [PATCH 01/18] fbdev: Prepare generic architecture helpers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_085332_615678_682756D0 
X-CRM114-Status: GOOD (  16.84  )
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

On Wed, Apr 5, 2023, at 17:05, Thomas Zimmermann wrote:
> Generic implementations of fb_pgprotect() and fb_is_primary_device()
> have been in the source code for a long time. Prepare the header file
> to make use of them.
>
> Improve the code by using an inline function for fb_pgprotect() and
> by removing include statements.
>
> Symbols are protected by preprocessor guards. Architectures that
> provide a symbol need to define a preprocessor token of the same
> name and value. Otherwise the header file will provide a generic
> implementation. This pattern has been taken from <asm/io.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Moving this into generic code is good, but I'm not sure
about the default for fb_pgprotect():

> +
> +#ifndef fb_pgprotect
> +#define fb_pgprotect fb_pgprotect
> +static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
> +				unsigned long off)
> +{ }
> +#endif

I think most architectures will want the version we have on
arc, arm, arm64, loongarch, and sh already:

static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
                                unsigned long off)
{
       vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
}

so I'd suggest making that version the default, and treating the
empty ones (m68knommu, sparc32) as architecture specific
workarounds.

I see that sparc64 and parisc use pgprot_uncached here, but as
they don't define a custom pgprot_writecombine, this ends up being
the same, and they can use the above definition as well.

mips defines pgprot_writecombine but uses pgprot_noncached
in fb_pgprotect(), which is probably a mistake and should have
been updated as part of commit 4b050ba7a66c ("MIPS: pgtable.h:
Implement the pgprot_writecombine function for MIPS").

    Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
