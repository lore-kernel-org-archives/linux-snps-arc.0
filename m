Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB16C77B6C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  5 Apr 2023 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuInJ1hGvbFHXyzM7MsmNuPa1IYUU6OC3h00C2o5dd8=; b=2w6nEuuq9FiUoC
	TzXSGPMsyZVReRA5dXDHB4Xev53CxHunaY0q87doUvHh6hLMctdnum7Lo7BnEGQK2+DgSxy9eWJfD
	xXRfzPswyXLDD1d5VY2+Uu1TUxupW2vD1aRrJ0vqDzMHaB/RMDeorI6aazxxkRlrO4abLowEo4vrc
	faLuOtZRyLE8HNuCXtrq4nCQjhMeklg6M9jKMpY/sHPX7wn3o2qiEQi8nx5wO4skPecy/qN/hC6Zs
	YezZGUsdHUzGfKRbLt8yCVJ3VV+ykQa5RiqIUXvZ8eV6Q4yqXvBNzSJ8rovWb2HWfvnbE1he5Y2tO
	zXkPBLhyn8gOSFWp4WPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5fc-0054KQ-3C;
	Wed, 05 Apr 2023 16:07:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5fa-0054J9-0e
	for linux-snps-arc@lists.infradead.org;
	Wed, 05 Apr 2023 16:07:35 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5002f12ccfeso76122a12.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 05 Apr 2023 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680710851; x=1683302851;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir3s/Lf5lvCAlrm1TfcesrDtB2jAmtZCISN/6dp3hBc=;
        b=VNUObGKko6sqyyipxJHZOjjD7Vgl2nINPanPLg9CF5dNFM42M+zPkinw5lJovFp5IT
         KgryiwfHZwGoUCHvFhE9cgxsLTI65w6qpIN9bd0/wPOfFcL5qWWLKMUORCChrg/EDytj
         /mEZ5jrCc5FzC1si2MslaSmste3VoXKbRjv7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710851; x=1683302851;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir3s/Lf5lvCAlrm1TfcesrDtB2jAmtZCISN/6dp3hBc=;
        b=sPyCjy91Z79HfTtBVm+bTW3FlL6MlR+pC7iWEHEgGrjBIgLozIWubo3Crzcs3sLRiv
         Kq5QHFoi0rcbtBe7QPTN1ZitVwuo+Kwa+7g86wmB2y96zff2OUFybKyL+B5UvvjSrnDG
         KJAg6AMBhVEhFC02Gl2WcYdypB/JuAqBFT/0hBrtiw0XcIvrsJm2kJxIl0bdio9vMiUl
         ALgvG8i7Fo2xAkKw7gqmAgSsKxEJ44G5lnErRF+DLSKCubFBtld+vXOGIPuuCwESCizu
         fiqNuERHP+oUMwZZVFylZPgituWOEb0qqCry37bQfkxGp2Z1TdXmfvQ/PcEoU4GKWaCY
         fY2g==
X-Gm-Message-State: AAQBX9ebK1Fby+a18hYqR4hEFOxU87o+PGC3KAvy0ANn5JCBEGCwyQqj
	Q/Ap+yCj2oLH3ZVrZKfEoVRtbA==
X-Google-Smtp-Source: AKy350aQMCCIGd+ttlIn6lmvnbNQhhwBJ1Oi0jxEBwn9z6WIX2aUYNMX4MoVCA82q+F4FspzQF+uZA==
X-Received: by 2002:a17:906:10c9:b0:931:4285:ea16 with SMTP id v9-20020a17090610c900b009314285ea16mr2360239ejv.7.1680710851411;
        Wed, 05 Apr 2023 09:07:31 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id a23-20020a170906369700b0092a59ee224csm7492153ejc.185.2023.04.05.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 09:07:31 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:07:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 01/18] fbdev: Prepare generic architecture helpers
Message-ID: <ZC2cwIJJlyDWge+B@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
References: <20230405150554.30540-1-tzimmermann@suse.de>
 <20230405150554.30540-2-tzimmermann@suse.de>
 <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_090734_236499_F316F772 
X-CRM114-Status: GOOD (  28.50  )
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

On Wed, Apr 05, 2023 at 05:53:03PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 5, 2023, at 17:05, Thomas Zimmermann wrote:
> > Generic implementations of fb_pgprotect() and fb_is_primary_device()
> > have been in the source code for a long time. Prepare the header file
> > to make use of them.
> >
> > Improve the code by using an inline function for fb_pgprotect() and
> > by removing include statements.
> >
> > Symbols are protected by preprocessor guards. Architectures that
> > provide a symbol need to define a preprocessor token of the same
> > name and value. Otherwise the header file will provide a generic
> > implementation. This pattern has been taken from <asm/io.h>.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Moving this into generic code is good, but I'm not sure
> about the default for fb_pgprotect():
> 
> > +
> > +#ifndef fb_pgprotect
> > +#define fb_pgprotect fb_pgprotect
> > +static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
> > +				unsigned long off)
> > +{ }
> > +#endif
> 
> I think most architectures will want the version we have on
> arc, arm, arm64, loongarch, and sh already:
> 
> static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
>                                 unsigned long off)
> {
>        vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> }
> 
> so I'd suggest making that version the default, and treating the
> empty ones (m68knommu, sparc32) as architecture specific
> workarounds.

Yeah I was about to type the same suggestion :-)
-Daniel

 
> I see that sparc64 and parisc use pgprot_uncached here, but as
> they don't define a custom pgprot_writecombine, this ends up being
> the same, and they can use the above definition as well.
> 
> mips defines pgprot_writecombine but uses pgprot_noncached
> in fb_pgprotect(), which is probably a mistake and should have
> been updated as part of commit 4b050ba7a66c ("MIPS: pgtable.h:
> Implement the pgprot_writecombine function for MIPS").
> 
>     Arnd

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
