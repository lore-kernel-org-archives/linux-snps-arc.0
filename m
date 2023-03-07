Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54EEC678D5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Mar 2023 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Lc31zXg4f6bBcS8S6YIpnTk/Evm59NYZOUVTPcdoWLw=; b=Fi1Ikd+dAEjW70n1KWdfxHN44s
	zvJJhvVp9IgLqQ81UKsLmvKmawY8DYbergk+UKrt+C6cdDKRZFExf6Az+s/M6RkFpgSo6zi7AzVY9
	Yi+WzYHD+xeBsOVdvH3hDK/jQuSQsLOpqW2n43C+nHR8X9rqMccMCj9PtvfPOa14j7Do0015RaJO5
	8CEgevshi3BSyIPdN6KR9FN/jMdCFPo9NwCIqKYq84YFJDB7CPq4btgXoVKbAfjaJ4z29kC1y3v0m
	CPDZekIFaQPiSYeqh37AM6mtEP2aPAyef+Yyk+ldUMtIk51XD+VrK8FWV5ipw+IpIwnbDtV3AiClq
	LsfO/Awg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZf4X-002WZj-06; Tue, 07 Mar 2023 21:42:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZf4S-002WWm-Sz
	for linux-snps-arc@lists.infradead.org; Tue, 07 Mar 2023 21:42:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id a9so15590795plh.11
        for <linux-snps-arc@lists.infradead.org>; Tue, 07 Mar 2023 13:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678225318;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0UBWEzua7mI1E3a/+R1pzklpJ+RGJpYFy9mijom/UM=;
        b=3d0i9L9fgsM6wfDV6SgEVPe2doCmA84h8dgaHpMbejZeZuQRklJuURRf6PhkCN7ukc
         w/n+8nbuC+OW0mQWtjtERbzb9wBvkWnsuB3UcR0sH2Ba3g7FDMT+jDol43sV0ZSapUuU
         afFVzDtGs7qaCnWpNgGUvXPCI9VeRCtjLQt1T3AcBXMLT19wGawFny88dkq7b+SM519J
         izcWM0iUW0/Sac/AVhLneLvdpP7x0olNKc4YqRIWvevDICe0+qs1ypmIQEYjXt6H2n6Q
         PGyqmNUpfeGmcTALJ+qCkHjqjpTn7tbuCsOrFtOo3YqXRw3n/PRxx6fcIN5oBf8fOwBc
         hPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678225318;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0UBWEzua7mI1E3a/+R1pzklpJ+RGJpYFy9mijom/UM=;
        b=Cga2X8P8MbRwsTr4I7+tdz3dSZpBGuoexASyXmPMaWmgropsD/X7+PWZsZSytUZ2oa
         xhvZ9NKFT2HotKjov784NGLJKDiZ8S5IO5kx1ox0vWngPvzQg64pNag46bkon1M8hRyY
         qugui+IvDb8dX4XS8sRt/I3KDdf0pjqv5MFgzh1/WxxFc9XM6CJHKN59RSKkLdj3GCKX
         fEPwI1JouR1NzJ8YJ56czAg0RzR5DwHb+nKd+x7P3ohE6w/YW9eORWPhLI62Rmd7CA+V
         XZWjpNnb3RdvGcnEdfvpX8T5QXKxsQkDOGb1vGZ2Nnd04rfEd1d89zxJmrALS/JBsYUM
         hDvQ==
X-Gm-Message-State: AO0yUKULNv3DMKNwtnVz/vEvQVS3otKcuoqZxHLJOwX8mJzeBA3+WxmO
	UIApwVF/+yWp3Isqo28WeyDHmg==
X-Google-Smtp-Source: AK7set/K6eJAQf/eSbaq269PoSBswE0gsDc5h7lzSW9lr2zauw1plinMmCGHpVyR/4qKnDR1/eXDIg==
X-Received: by 2002:a17:902:ce90:b0:19a:9434:af30 with SMTP id f16-20020a170902ce9000b0019a9434af30mr18505363plg.18.1678225318377;
        Tue, 07 Mar 2023 13:41:58 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id km12-20020a17090327cc00b0019e30e3068bsm8866509plb.168.2023.03.07.13.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 13:41:57 -0800 (PST)
Date: Tue, 07 Mar 2023 13:41:57 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 13:40:59 PST (-0800)
Subject: Re: [PATCH v5 12/26] riscv: Remove COMMAND_LINE_SIZE from uapi
In-Reply-To: <20230306100508.1171812-13-alexghiti@rivosinc.com>
CC: Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net,
  Richard Henderson <richard.henderson@linaro.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org, monstr@monstr.eu,
  tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
  npiggin@gmail.com, christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
  borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
  davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
  dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
  Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
  linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
  sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org,
  alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-d4be5bb5-f0ad-4e76-9b11-83732d233a45@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_134209_000245_38F5F1C5 
X-CRM114-Status: GOOD (  19.86  )
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

On Mon, 06 Mar 2023 02:04:54 PST (-0800), alexghiti@rivosinc.com wrote:
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/setup.h      | 7 +++++++
>  arch/riscv/include/uapi/asm/setup.h | 2 --
>  2 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/include/asm/setup.h
>
> diff --git a/arch/riscv/include/asm/setup.h b/arch/riscv/include/asm/setup.h
> new file mode 100644
> index 000000000000..f165a14344e2
> --- /dev/null
> +++ b/arch/riscv/include/asm/setup.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_RISCV_SETUP_H
> +#define _ASM_RISCV_SETUP_H
> +
> +#define COMMAND_LINE_SIZE       1024
> +
> +#endif /* _ASM_RISCV_SETUP_H */
> diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
> index 66b13a522880..17fcecd4a2f8 100644
> --- a/arch/riscv/include/uapi/asm/setup.h
> +++ b/arch/riscv/include/uapi/asm/setup.h
> @@ -3,6 +3,4 @@
>  #ifndef _UAPI_ASM_RISCV_SETUP_H
>  #define _UAPI_ASM_RISCV_SETUP_H
>
> -#define COMMAND_LINE_SIZE	1024
> -
>  #endif /* _UAPI_ASM_RISCV_SETUP_H */

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
