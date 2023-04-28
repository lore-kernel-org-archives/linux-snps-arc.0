Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08952C77B61
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXVauILrEF/IzBuYOiNex0b2pF1l2dKBoquMGZVQ9DI=; b=AZGHcBrZBeMRhk
	PhOdt/+9YTi2sRnVjwpaX3JAMJpgxEoXK8uqWWM1fO2tBiSQB30MqkZ0gGwBfT4TVr7nG/RYegRes
	GObKn5BKPU11LYbmC0MZp/vT2vDBj0o0/MKnMPsMA0EglNoY9Bkbi+0aPjybIa4MDLZ8UPlvt8TDx
	gBXW2YGveSE8Vxv66xni1FfLtVs2zntjS59BHrx3E8Lms5m2W0Gv+H/tAwNCUytB63Vkzx37mCtLh
	XI8Ui+csdksl5/yXAlNVDwEbUcfv9Y5y51qMyCyIk2S5jW5S/VnqGXxwG+D9wWhMyFnR6qwhnHG4S
	9Vj7r7ryKmsx0obX4CAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNtl-00AFjP-1m;
	Fri, 28 Apr 2023 13:12:29 +0000
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:401::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNti-00AFen-1Z
	for linux-snps-arc@lists.infradead.org;
	Fri, 28 Apr 2023 13:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=kmbigf8ZVmooEPRLcPWea0C5h/tG8tqKZ9j5z66PqBY=;
	b=eF1EsYiPJqXNskjn8lLNQ9+SL1ozu7DWmdUJ0wcEG54JzKFiSjRAPjbhy8H0+ZeYNmOBVGFyCGbxz
	 1DqXAIXpm/M1j1pEPlF21UxeOY9nSl8/Iap7s1D3yCRgky5Tf80L/WY954alIRbLpoRtvZVhxcohcH
	 gZD+6fQpR0DA7lwuphoh9i3Dd/maumGn+Tt03U+E+G1J826wfTSa+oaLhdKuvV7O3rOy6M3AH/bTVT
	 eeFuoeTpNjqcA1avBxePv+IBiCUAGPqV57NpcpjKAT9+Yl5+7MpsaighKpk8/33r2f8BLL2Qa32pZL
	 7l5szrsw+UlNB1/m+sTEJZXBaipCRvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=kmbigf8ZVmooEPRLcPWea0C5h/tG8tqKZ9j5z66PqBY=;
	b=4Jlvbtvr17/0MN2lAZB4KR0YNvraiUSF3TAKjdHVbDRCCaeKQbtDwZJbVZrTzY+ezyqRT4rd+YKPh
	 HNdg4s7Ag==
X-HalOne-ID: 4f01baa5-e5c6-11ed-95e5-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2 (Halon) with ESMTPSA
	id 4f01baa5-e5c6-11ed-95e5-13111ccb208d;
	Fri, 28 Apr 2023 13:12:23 +0000 (UTC)
Date: Fri, 28 Apr 2023 15:12:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com,
	daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, davem@davemloft.net,
	James.Bottomley@hansenpartnership.com, arnd@arndb.de,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
Message-ID: <20230428131221.GE3995435@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428092711.406-6-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_061226_744555_8EA75004 
X-CRM114-Status: GOOD (  22.99  )
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

On Fri, Apr 28, 2023 at 11:27:11AM +0200, Thomas Zimmermann wrote:
> Implement framebuffer I/O helpers, such as fb_read*() and fb_write*()
> with Linux' regular I/O functions. Remove all ifdef cases for the
> various architectures.
> 
> Most of the supported architectures use __raw_() I/O functions or treat
> framebuffer memory like regular memory. This is also implemented by the
> architectures' I/O function, so we can use them instead.
> 
> Sparc uses SBus to connect to framebuffer devices. It provides respective
> implementations of the framebuffer I/O helpers. The involved sbus_()
> I/O helpers map to the same code as Sparc's regular I/O functions. As
> with other platforms, we can use those instead.
> 
> We leave a TODO item to replace all fb_() functions with their regular
> I/O counterparts throughout the fbdev drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  include/linux/fb.h | 63 +++++++++++-----------------------------------
>  1 file changed, 15 insertions(+), 48 deletions(-)
> 
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 08cb47da71f8..4aa9e90edd17 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -15,7 +15,6 @@
>  #include <linux/list.h>
>  #include <linux/backlight.h>
>  #include <linux/slab.h>
> -#include <asm/io.h>
>  
>  struct vm_area_struct;
>  struct fb_info;
> @@ -511,58 +510,26 @@ struct fb_info {
>   */
>  #define STUPID_ACCELF_TEXT_SHIT
>  
> -// This will go away
> -#if defined(__sparc__)
> -
> -/* We map all of our framebuffers such that big-endian accesses
> - * are what we want, so the following is sufficient.
> +/*
> + * TODO: Update fbdev drivers to call the I/O helpers directly and
> + *       remove the fb_() tokens.
>   */
When the __raw_* variants are used, as Geert points out, then I think
the memcpy / memset can be replaced, but the rest seems fine to keep.

My personal opinion is that __raw_* is for macro use etc, and not
something to use everywhere. So I like the fb_read/fb_write macros.
But that is just my color of the bikeshed.

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
