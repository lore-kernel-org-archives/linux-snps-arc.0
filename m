Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DCFC77B7A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Apr 2023 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNuYDDh+n9Al4nobXffsueipAf5EIW8QxnRvopYfOhs=; b=GCOnUbGX3p8g5s
	m6sF20WDns7MrUbT0wtsKDscXiLtB54X74zMRa88InySddUEFbMcSpCErLo6TMj/MqQSxEw0Xk7fC
	nPyP9H0fUJfLzTMhweLMiJey4fChtzZkXkVMySnis/Z1kTMm7J/R1ESLzheVlByEVa4F/hW71MqdW
	7QjIWjjCfnjpuhZTcYy08QGJmG4op4NBGd0w58PwotlRkkrdDbOOgjzhk68v4CFhqsYHemKWQ1SUR
	evIPNqr8D/AUlzmCGRFlZL5GM9maBwsRP6QCiLi+mWM5jPgmSLBrjwj2JFz8xSDuzadefOBbQV8cf
	tFxSxCu5RHv+EIuYeX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTo7-001vLo-2K;
	Wed, 12 Apr 2023 06:18:15 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTo4-001vJa-0W;
	Wed, 12 Apr 2023 06:18:13 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PxCF401xjz4xFj;
	Wed, 12 Apr 2023 16:17:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681280282;
	bh=mVus6VBYhH8GmWv60JhlJfNhVtxbImSRmEm6BDRrW3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lTZEAUAJ2QZsc9UPHGoexeIDhivQg0OZP2tQ8N178oguDiIOjU/GS5yjDEkHA0ZQY
	 UoSdL/mLxTXV/wa3HPEVjblwcxsdx2c+OnuyDK5Tv1Pbg7hiKGkpXXQYiHyY9ZXKUK
	 6CSwY02DKtu+cGQJMahEUbmjJakfBQLvnLNWdj1LScutIwzO/9mPiHZFRCutiHgFFy
	 LDNwBaVtxl/OmcZoIc9q0YGGvsTAR4vPp6o9KxvHWYHacDs55AZq5ZD42D7HmgmLSM
	 12TeMwxecBFtXBTtmtuIhlm5OkckoQGJYZdQPchk2E7CbMKkKzVuJ/odBCPWTELN7l
	 5ijFDMn/S4fVA==
From: Michael Ellerman <mpe@ellerman.id.au>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 15/19] arch/powerpc: Implement <asm/fb.h> with
 generic helpers
In-Reply-To: <20230406143019.6709-16-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-16-tzimmermann@suse.de>
Date: Wed, 12 Apr 2023 16:17:59 +1000
Message-ID: <87r0spipyg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_231812_362188_62E85EE0 
X-CRM114-Status: GOOD (  12.11  )
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

Thomas Zimmermann <tzimmermann@suse.de> writes:
> Replace the architecture's fb_is_primary_device() with the generic
> one from <asm-generic/fb.h>. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/fb.h | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Looks fine.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/include/asm/fb.h b/arch/powerpc/include/asm/fb.h
> index 6541ab77c5b9..5f1a2e5f7654 100644
> --- a/arch/powerpc/include/asm/fb.h
> +++ b/arch/powerpc/include/asm/fb.h
> @@ -2,8 +2,8 @@
>  #ifndef _ASM_FB_H_
>  #define _ASM_FB_H_
>  
> -#include <linux/fb.h>
>  #include <linux/fs.h>
> +
>  #include <asm/page.h>
>  
>  static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
> @@ -13,10 +13,8 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
>  						 vma->vm_end - vma->vm_start,
>  						 vma->vm_page_prot);
>  }
> +#define fb_pgprotect fb_pgprotect
>  
> -static inline int fb_is_primary_device(struct fb_info *info)
> -{
> -	return 0;
> -}
> +#include <asm-generic/fb.h>
>  
>  #endif /* _ASM_FB_H_ */
> -- 
> 2.40.0

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
