Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588A8C77B78
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 May 2023 19:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FP6K9GvHfcUTzIz2qYfuz6r0cGx5YjDzP4qKcRLxO+w=; b=c1v5aoOzNSyphk
	kNzwBy8NbRYNI3mZW8hh8MSwaXsHXjXFwzF+3BE/Qd34ttaZZW4+/EEhnZtBevc6c0Mhs+7RwdxUb
	WgFWIGTH3OfgNrobHP8t9+mcP4feqNSSLj5WXukew0k+ErPGPsnJdWT6uGhtfyHxuMpthSzevCv+g
	3UxsHAJkId38GCMQyi98h39F/v/eDFMZZIlgI3FdwsTfFdBRSCyNaV+WjEnRE63jaR4BFzj+B39nM
	awM7nJ43FcMloBkn1Ej8hwd6/CV8lYKYOKbsVC0RKsatzyBbRiKiYfah/w+CObQP/taxDVuoBF6H+
	ntW2GJMjF5ooVLTOLFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puHlE-005X6x-0v;
	Wed, 03 May 2023 19:03:32 +0000
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:401::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puHl8-005X3T-1b
	for linux-snps-arc@lists.infradead.org;
	Wed, 03 May 2023 19:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=VwK1Pxwllknm05RC4IcE4UF09296VmV5/KUmDsmc45k=;
	b=XsHl84HrOPhHgBPqV3PW6yB/AvFhQII0nRtKV/8h8T+dCcMr5Tik6QMi/wSHQOzhOhtbUHSqfhZgd
	 WSx/Z0hPEz3w+9sT8inTO8HUZ7mXKy80p1Hkngiwyx5WeGAS6L3ICdE9j4k0MYAt439GYTv80H30JL
	 Wa3Kt+e0ozxs6GkaFSJ4Ggac50LASOD5G3YVJoy/Rrtbtu+bkuBlS+VFLgSy90XJkkej9/oXpWU/kv
	 CxJ9i3AgBzyz7jKenTHVv5rGIZw0qOt+yq1IzXFIz2dG2+JZP65n87Ub2Ux9raWeeAjrFYUvEdc0tG
	 etwNu46L2bAupljCsQC8YEYAHO7kJWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=VwK1Pxwllknm05RC4IcE4UF09296VmV5/KUmDsmc45k=;
	b=Lew0Bnll2GhHFcWrhU2ydPTnZ0g2qcfs1S5m/vajLVuTjd48PZ0vIjaL11J3Em1kUt7VNpMclPo45
	 R57yfj8Ag==
X-HalOne-ID: 2a0894ca-e9e5-11ed-9ffc-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2 (Halon) with ESMTPSA
	id 2a0894ca-e9e5-11ed-9ffc-13111ccb208d;
	Wed, 03 May 2023 19:03:19 +0000 (UTC)
Date: Wed, 3 May 2023 21:03:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	arnd@arndb.de, deller@gmx.de, chenhuacai@kernel.org,
	javierm@redhat.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com,
	linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
	linux-parisc@vger.kernel.org, vgupta@kernel.org,
	sparclinux@vger.kernel.org, kernel@xen0n.name,
	linux-snps-arc@lists.infradead.org, davem@davemloft.net,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/6] fbdev: Move framebuffer I/O helpers into
 <asm/fb.h>
Message-ID: <20230503190317.GA422961@ravnborg.org>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-6-tzimmermann@suse.de>
 <20230502200300.GB319489@ravnborg.org>
 <df767237-2bae-f299-9cbb-1543f76c9c3a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df767237-2bae-f299-9cbb-1543f76c9c3a@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_120327_998183_F45F2A7E 
X-CRM114-Status: GOOD (  13.98  )
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

Hi Thomas,

> > But I am missing something somewhere as I cannot see how this builds.
> > asm-generic now provide the fb_read/fb_write helpers.
> > But for example sparc has an architecture specifc fb.h so it will not
> > use the asm-generic variant. So I wonder how sparc get hold of the
> > asm-generic fb.h file?
> 
> All architecture's <asm/fb.h> files include <asm-generic/fb.h>, so that they
> all get the interfaces which they don't define themselves. For Sparc, this
> is at [1].
> 
> Best regards
> Thomas
> 
> 
> [1]
> https://cgit.freedesktop.org/drm/drm-tip/tree/arch/sparc/include/asm/fb.h#n19
> 
> > 
> > Maybe it is obvious, but I miss it.

OK, it was obvious and I missed it.
I looked at the mainline kernel, and not the drm-tip variant.
Sorry for the noise.

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
