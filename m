Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8020C77B77
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsOijCKa/q52ZG/FtLNPg7mYqRS0rH2JSlQKmPhIxm8=; b=xpb2bewnk/GFFS
	dwP3bi6z7vc9FLzeBOGwCzNZg/apKbtTG9EX8w6oEHgXOtjnDvE/bUJvr4I2vXs3kqdgxwHGs4M1c
	vUs2RBSBt5TOF9B8YpQMLg6wmQZpYLFKrSgSFgNnPoQ8lESBp8Ypq85vj6HuRjlgJ2Qzdm/EpjHkc
	Qz9gCpcBUEn3f3Y3/37K6WOGKcrXegqB6k5KRSOGoKljALdYNiXdz3i8SBW10l72K/ulE0gKDEZDh
	3dUMrb5tfWAC4FntT7pohhqVuBmzPNR1Mj+AYPEUwGXjXNPEXl4sZcG0W45RDwhB3A2nez7x+BVYX
	aw/9xjnTirZjcilqlHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPBZ-00GSLy-1D;
	Mon, 17 Apr 2023 13:46:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPBY-00GSLe-2E;
	Mon, 17 Apr 2023 13:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tYckX7iE2DZQWjb4C4RjN1ggljERFqmorKQV6fcmZLY=; b=R23ezUjjfqFbzxFHLdzwsq01Lq
	/OZBeLL5hlBSAropOpV5rKOe+bTT1vAPiflAN8zxEpP0jlGubBnOududWDojLEp2wva8XPVL47Vdv
	9OCgSl3C6cdiCbZxpmr753HgIZXGXTtLmlUE6MSxuxKvOpoxeTnh8I1WDn0v3qky5EoOuqSecqBGB
	dExtHwMAPKWGT+SXr+HRWUY/pQX2g9L+LdcCz1QlVYbqCjrdsTt4mtnITMaeoJSr2ga2z9Whu4Pzl
	UPN0f2nT5P6Y1xTyXGCGN5qsZRg4ckS/jFsUnN6EBUaJhxLUZEOC7C4+r4O7AvJodIYDJYsK144aa
	wLRydN2A==;
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOaG-00HKDM-2r;
	Mon, 17 Apr 2023 13:07:55 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1poOUm-001XyT-HU; Mon, 17 Apr 2023 15:02:12 +0200
Received: from p5b13a017.dip0.t-ipconnect.de ([91.19.160.23] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1poOUm-003hGd-9V; Mon, 17 Apr 2023 15:02:12 +0200
Message-ID: <3c188e948506dc97112dcc070cf16e36209c6cc5.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 16/19] arch/sh: Implement <asm/fb.h> with generic
 helpers
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, 
	daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com, 
	gregkh@linuxfoundation.org
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Date: Mon, 17 Apr 2023 15:02:11 +0200
In-Reply-To: <20230417125651.25126-17-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
	 <20230417125651.25126-17-tzimmermann@suse.de>
User-Agent: Evolution 3.48.0 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.160.23
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_140753_057570_9AE8DE78 
X-CRM114-Status: GOOD (  14.09  )
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

Hi Thomas!

On Mon, 2023-04-17 at 14:56 +0200, Thomas Zimmermann wrote:
> Replace the architecture's fbdev helpers with the generic
> ones from <asm-generic/fb.h>. No functional changes.
> 
> v2:
> 	* use default implementation for fb_pgprotect() (Arnd)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> ---
>  arch/sh/include/asm/fb.h | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/arch/sh/include/asm/fb.h b/arch/sh/include/asm/fb.h
> index 9a0bca2686fd..19df13ee9ca7 100644
> --- a/arch/sh/include/asm/fb.h
> +++ b/arch/sh/include/asm/fb.h
> @@ -2,19 +2,6 @@
>  #ifndef _ASM_FB_H_
>  #define _ASM_FB_H_
>  
> -#include <linux/fb.h>
> -#include <linux/fs.h>
> -#include <asm/page.h>
> -
> -static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
> -				unsigned long off)
> -{
> -	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> -}

Looking at the macro in asm-generic/fb.h, fb_pgprotect() is being replaced with
a no-op function. Is that intentional? Can you briefly explain the background
for this change?

> -static inline int fb_is_primary_device(struct fb_info *info)
> -{
> -	return 0;
> -}
> +#include <asm-generic/fb.h>
>  
>  #endif /* _ASM_FB_H_ */

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
