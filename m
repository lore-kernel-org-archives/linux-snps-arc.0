Return-Path: <SRS0=NSlt=25=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B7AC00523
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 09:07:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E7220705
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 09:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rmbuUGbS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E7220705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaMSGQVMylMxugpvPmeYTFZghEBSjPNh3u2svKC3Yeo=; b=rmbuUGbS/iBmlu
	wEV2rSRuhnlzizQ3tUm8rO0S7cqs7Pp57HEH2IoZFXfB7RlnCxtsshI/0CM7aaRoFCqr4M5sLnc15
	1mfwqHfufoyM6K5qDXg1s8uQO3gvEydme7nHSm6kHnAS+ZeRq6S+psrCUlRnkW8+hTpwOj3Ca1kQO
	Ae99sKXQYrPTpaoZiMv8kSbPgwqeH8JtZsY5fYvADYnWOiQnPtNXbW8RRUjMpGK/dTIyqNpSCW6RC
	hOb37fl2kP9pjXnFVDzCSJBDvs12//Ilre4e+YuYhE138UUL3VDX5u30lU5STi/lpRB6H3VXAzwE1
	R9roHBZOVqkVcfOLXn6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip7JV-0005ZU-7O; Wed, 08 Jan 2020 09:07:41 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip7JS-0005W1-M8
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jan 2020 09:07:39 +0000
Received: by mail-ed1-f66.google.com with SMTP id i16so1948872edr.5
 for <linux-snps-arc@lists.infradead.org>; Wed, 08 Jan 2020 01:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0jRYcccy+K8+wcIcmevpt3CSwH1FRXDhvGLKKsO8/R8=;
 b=qXg+kZWUltnOu3VlRGkv8BQWJZW3TGsnc+6L6VxScazdDalxT+Qckber3P8tdELhbr
 2F9oDSdzZ0RnNdLsKvHirZXUXOdE/TAgvh84sQoDLqmgB+KFdYI7XpEOCBsymplbSPSN
 K3hneU6jzgkMmVi+fKs7pCpCGzkS3weh+QMLvQoa1mVIzrD298M8EBY6r4ALjN5+gvH1
 eZdN1qBOnQM13o9b/4nsEcEbv6C1Qh3DPCnmjAtO4K7tiXZmsF6+RgHsrZC3PPk6axcd
 vhOJPYPN9nMwMexu2olg91ARxQZiXcEY5KORsvRAGmb9UUt5eVXDlhqCxDw7uYAkgDzC
 oCuA==
X-Gm-Message-State: APjAAAXfeMr38StRl31n+fc5pr/QRMd5EMpuwQtej2ilobwZ7CKt6ahr
 Q/X6JWc6fj+TLlnnSa+pOW4=
X-Google-Smtp-Source: APXvYqx7lojzs5eJ7tjc2OaNpqjg4Ds4/tRmp0l0ATPp14XCcF7ovHyFxsvNMuPIHycIcD1wSckgnw==
X-Received: by 2002:a17:906:404:: with SMTP id
 d4mr3768395eja.326.1578474456276; 
 Wed, 08 Jan 2020 01:07:36 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id j3sm53121edb.50.2020.01.08.01.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 01:07:35 -0800 (PST)
Date: Wed, 8 Jan 2020 10:07:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFT 02/13] alpha: Constify ioreadX() iomem argument (as in
 generic implementation)
Message-ID: <20200108090732.GA10145@pi3>
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-3-git-send-email-krzk@kernel.org>
 <CAMuHMdXHhF6GhS1W8qS4j7Jv5YnxXjcRopT5QSA=+trc8qwFng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXHhF6GhS1W8qS4j7Jv5YnxXjcRopT5QSA=+trc8qwFng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_010738_728669_54219427 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jan 08, 2020 at 09:10:06AM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > The ioreadX() helpers have inconsistent interface.  On some architectures
> > void *__iomem address argument is a pointer to const, on some not.
> >
> > Implementations of ioreadX() do not modify the memory under the address
> > so they can be converted to a "const" version for const-safety and
> > consistency among architectures.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> > --- a/arch/alpha/include/asm/io.h
> > +++ b/arch/alpha/include/asm/io.h
> > @@ -151,9 +151,9 @@ static inline void generic_##NAME(TYPE b, QUAL void __iomem *addr)  \
> >         alpha_mv.mv_##NAME(b, addr);                                    \
> >  }
> >
> > -REMAP1(unsigned int, ioread8, /**/)
> > -REMAP1(unsigned int, ioread16, /**/)
> > -REMAP1(unsigned int, ioread32, /**/)
> > +REMAP1(unsigned int, ioread8, const)
> > +REMAP1(unsigned int, ioread16, const)
> > +REMAP1(unsigned int, ioread32, const)
> 
> If these would become "const volatile", there would no longer be a need
> for the last parameter of the REMAP1() macro.
> 
> >  REMAP1(u8, readb, const volatile)
> >  REMAP1(u16, readw, const volatile)
> >  REMAP1(u32, readl, const volatile)
> 
> Same for REMAP2() macro below, for iowrite*().

Good point, thanks!

Best regards,
Krzysztof


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
