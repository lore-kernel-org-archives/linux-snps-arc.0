Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AF2EB64D7
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Jun 2023 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bW/7c280TsJu/uSGfCPsncwn7bEa9wks7o16HWm3yIE=; b=oVSCdcRzNm05n3
	YGsN2va4H2r+AshZMdBoDWCM250oaWGdCN/3poMmdjdnpCKhpTdLLzkKJtWaMYrNQYTxqfx2YggOi
	gYry7V8w2bMnAmY9XRAkhErglINveaURDDJL6F5Kl5WHFR5bjvaggsrOY5QWH1kbjbx3GrYQnaYYm
	Gw7/JvP6j/9BHyl7g+EvGe8kdfqO96fIvmjQj8AnNtugCtZFykkL+TZUyufcY00RgBwTU6ibmE+0g
	20p1MQARcHZFTp8JWZvxoDd/e4BWaQvmQFotdKKsZ1P8j/6Kz4f2nd9WnrbyXXqmV1CpHDHZi+H85
	PYicPayUY+lmpebcFRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qESNZ-00FLmM-25;
	Wed, 28 Jun 2023 10:26:29 +0000
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qESNV-00FLke-2H;
	Wed, 28 Jun 2023 10:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1687947969; bh=CywiEZ2ioeoVRwvb3VhckHlwPQWISEuRuyDIMUh/SlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sO40R4CELoyZP15+xzNfqv8fc7MUdkASAJSkqWSLOF+ywVO11MV3l+vbMWMg1dqiL
	 S3XqzYIfgs3lH9JEuQ4NBON04QSxnL2skzqa8NCotSC1yJtWdJ9eUJkPUFbXxZTmd4
	 Zxi4HVbihTOgYh7ZLnJNy6YsG4+r5nIfmYW+cbyA=
Received: from [100.100.34.13] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 05B73600A6;
	Wed, 28 Jun 2023 18:26:08 +0800 (CST)
Message-ID: <dd7bd914-634a-115f-ab5c-80349493b1f6@xen0n.name>
Date: Wed, 28 Jun 2023 18:26:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 06/19] arch/loongarch: Implement <asm/fb.h> with
 generic helpers
Content-Language: en-US
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
 Huacai Chen <chenhuacai@kernel.org>
References: <20230417125651.25126-1-tzimmermann@suse.de>
 <20230417125651.25126-7-tzimmermann@suse.de>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230417125651.25126-7-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_032625_943704_4BB39C1F 
X-CRM114-Status: GOOD (  14.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

On 2023/4/17 20:56, Thomas Zimmermann wrote:
> Replace the architecture's fbdev helpers with the generic
> ones from <asm-generic/fb.h>. No functional changes.
> 
> v2:
> 	* use default implementation for fb_pgprotect() (Arnd)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> ---
>   arch/loongarch/include/asm/fb.h | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/fb.h b/arch/loongarch/include/asm/fb.h
> index 3116bde8772d..ff82f20685c8 100644
> --- a/arch/loongarch/include/asm/fb.h
> +++ b/arch/loongarch/include/asm/fb.h
> @@ -5,19 +5,6 @@
>   #ifndef _ASM_FB_H_
>   #define _ASM_FB_H_
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
>   #endif /* _ASM_FB_H_ */

Sorry for the late review. The change is fairly trivial, so:

Reviewed-by: WANG Xuerui <git@xen0n.name>

Thanks!

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
