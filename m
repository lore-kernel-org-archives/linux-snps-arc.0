Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33785C77B76
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3n+YrcUxzsA09uRLtOptpqDJNMyYMg/H8XWqfq7ln0=; b=kNi3G4uiNZvhr7
	n+HnhMo8oHqt+6KnTxzpMdef4ZAZocVeB8nuRT/AkKH3XeposMKArsxoVWL3nTnGUcfbZIIBzSK/s
	dQXoBH2lC3y4ybNGXepV+kUr2cNQymrEWnCLDc0xh3ygYJjxZKhQ94hxTDpp/llecukGbnC2i+Wqu
	hk1SQOK0TftbmZMQbwsBGfGVn8DMD+hC9qZCmOMp6UsmkGyBC6/B/iJSkWo3etzh5p2Ul375UAFso
	BqJK0qx1KAp6/nPlR8oGaFq+QJNNlpPH1D5+42tjUIhyQp/YZyshkHUM1MCN5QjaoX7MMZ3huHmyq
	MgHSbbJf6Y0Buv0/rukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPjm-00GbGd-2q;
	Mon, 17 Apr 2023 14:21:46 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPjk-00GbF6-0Q;
	Mon, 17 Apr 2023 14:21:45 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1poPjb-002Mbf-Vt; Mon, 17 Apr 2023 16:21:36 +0200
Received: from p5b13a017.dip0.t-ipconnect.de ([91.19.160.23] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1poPjb-0046Ky-Nw; Mon, 17 Apr 2023 16:21:35 +0200
Message-ID: <3522e1a2957f20a01bd5bc61b0f78d4d38e43b68.camel@physik.fu-berlin.de>
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
Date: Mon, 17 Apr 2023 16:21:34 +0200
In-Reply-To: <20230417125651.25126-17-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
	 <20230417125651.25126-17-tzimmermann@suse.de>
User-Agent: Evolution 3.48.0 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.160.23
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_072144_310646_F14F5B85 
X-CRM114-Status: GOOD (  12.13  )
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
> -
> -static inline int fb_is_primary_device(struct fb_info *info)
> -{
> -	return 0;
> -}
> +#include <asm-generic/fb.h>
>  
>  #endif /* _ASM_FB_H_ */

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
