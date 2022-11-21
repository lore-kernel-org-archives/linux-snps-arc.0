Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB1BC43219
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Nov 2022 14:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bKhJkUwWxAuCVNJuC0kQ8GFZIqY/AtSd115tO3PK9A=; b=WrHlIEW9IX3Deq
	RPnaX2biVerEzv7KMRoYayU4mzbEA+x8PFq8cZiEPNbEBX35G+ufvVK36G66rAZ2mGVm1yaLxLSdO
	bStzZEFWEyvHM0hboRTZrmWryYwliwh8o6EXjLdJDPKKdI0hbxpBr5tnZMEkW9b8zdY0RlBO9Ce7u
	QQCmv2bQTOT25LD/ykz50sby+NNchpw6KUI3NIm6tkv6yOkGFqo7fylQB7/Ru/WDLhEs9kNke5jg8
	0AV6QWGROIYv8DHbwgIigVq5+14NkfWkZIzJjbgUKUv37ixlyeIsqLO5W4pjI0sQWj3Gv+TqQjFEl
	4Jegm1N4wXcTL/Nj1Cew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7pG-00EWtl-Ny; Mon, 21 Nov 2022 14:31:10 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7p8-00EWbD-Vb
	for linux-snps-arc@lists.infradead.org; Mon, 21 Nov 2022 14:31:09 +0000
Received: by mail-oi1-x235.google.com with SMTP id c129so12731233oia.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 21 Nov 2022 06:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lCWcgxwdvR1Cotob56YOafGyk5iMixhwetbWGBm+UfE=;
        b=pE7SKyzTzfBzyOzpC9B7cN9O+GArodWZk74QJVFHU5bRDSk8tdKw3M97wMnwGMVSja
         a/dK/nkVIukzgCsJXQeqXPNHf/bp6aug1C6zvbFlu3nebiU5RpveteDT1Kx0eW9VJPKV
         GTcj3GwR7036BjDJ2Pl1Dt8aXFuJKhF0LAYdorBI9WgXLb3i0BxkhAGUWjEC/ngaNt4U
         9p5mkHkCemaUJoMre6kU/NVjSwLqI1gjAgO0txuWRypUAvCEV2pgWMXdMhkh2o41h3vP
         Ypj42rH2n8kPo7DyAf5ymyocJPXk951JbirhYjT0Q19DJIx/sGQdKCiz1QGx4T5r098U
         D51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCWcgxwdvR1Cotob56YOafGyk5iMixhwetbWGBm+UfE=;
        b=2lBWdwwlsoq7xxgfVKLqCEqvEG6Q3vNQldg4mXGmVlVyAN6HNhfH3gg2/85iKczP9R
         T6UC/NmKfHEdBahzHy/Sdor7zs6iHWyH3iSwTT+XyYD+r0fjf2Aj8NcT5MqH2EoTOoNY
         HKZDneVG1wa7JnoUIyu+oLwLgf0oYPvjj6XhRnADKToO5zGrnqdH+Gm+FPS9Libt37bt
         PBgb4rNbvH1edxdIMHXbJgqP/jRzxhYQwTz1+/plfN2N3hbQNeRXY5NOJIO68Yi6TKN6
         YhrQ7QInx4Vu0ZEtlxbqP/hKtAnYOsBxOFbl8CUrr+nzamkXTn2rYKYj7lY7BnKhfzIq
         3bRA==
X-Gm-Message-State: ANoB5pnlIABFNWogkwU9PVgcTu5aoMp62s2IAX3GPGwRxedIs7MW+8zx
	qp53tUoLF01+9EscZApePpGmdQ==
X-Google-Smtp-Source: AA0mqf5MrclCNrK9CerqN5prheAazICUBTVrmXzz6dGmhAnNDAq9tlwSU+kRhIVLwbaLhqZsSLRAVw==
X-Received: by 2002:a54:4611:0:b0:35a:1d79:181b with SMTP id p17-20020a544611000000b0035a1d79181bmr457780oip.8.1669041058869;
        Mon, 21 Nov 2022 06:30:58 -0800 (PST)
Received: from ?IPV6:2804:1b3:a7c1:84f3:c440:85d2:c5f8:93e7? ([2804:1b3:a7c1:84f3:c440:85d2:c5f8:93e7])
        by smtp.gmail.com with ESMTPSA id z19-20020a056830129300b0066ca61230casm4880515otp.8.2022.11.21.06.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 06:30:58 -0800 (PST)
Message-ID: <facdfda0-cb2b-da24-1239-0b990a0328a9@linaro.org>
Date: Mon, 21 Nov 2022 11:30:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2] ARC: update definitions in elf/elf.h
Content-Language: en-US
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>, libc-alpha@sourceware.org
Cc: Vineet Gupta <vineet.gupta@linux.dev>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>
References: <20221118131542.23188-1-shahab@synopsys.com>
 <20221121130624.9628-1-shahab@synopsys.com>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <20221121130624.9628-1-shahab@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_063103_106546_71D356E6 
X-CRM114-Status: GOOD (  23.10  )
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



On 21/11/22 10:06, Shahab Vahedi via Libc-alpha wrote:
> While porting ARCv2 to elfutils [1], it was brought up that the
> necessary changes to the project's libelf/elf.h must come from
> glibc, because they sync it from glibc [2].  Therefore, this patch
> is to update ARC entries in elf/elf.h.
> 
> The majority of the update is about adding new definitions,
> specially for the relocations.  However, there is one rename, one
> deletion, and one change:
> 
> - R_ARC_JUMP_SLOT renamed to R_ARC_JMP_SLOT to match binutils.
> - R_ARC_B26 removed because it is unused and deprecated.
> - R_ARC_TLS_DTPOFF_S9 changed from 0x4a to the correct value 0x49.
> 
> [1]
> https://sourceware.org/pipermail/elfutils-devel/2022q4/005530.html
> 
> [2]
> https://sourceware.org/pipermail/elfutils-devel/2022q4/005548.html
> 
> Signed-off-by: Shahab Vahedi <shahab@synopsys.com>

We discussed this briefly on glibc patchwork review meeting [1],
and if does not trigger any regression it ok to arch maintainers
to handle such changes.

[1] https://sourceware.org/glibc/wiki/PatchworkReviewMeetings

> ---
> Chagelog:
> v2:
>   - Rename instances of R_ARC_JUMP_SLOT to R_ARC_JMP_SLOT.
>   - Remove an unnecessary extra empty line introduced in elf/elf.h.
> 
>  elf/elf.h                | 29 ++++++++++++++++++++++++-----
>  sysdeps/arc/dl-machine.h |  8 ++++----
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/elf/elf.h b/elf/elf.h
> index 920e6891e6..da41bad34b 100644
> --- a/elf/elf.h
> +++ b/elf/elf.h
> @@ -4159,6 +4159,15 @@ enum
>  #define R_LARCH_GNU_VTINHERIT  57
>  #define R_LARCH_GNU_VTENTRY  58
>  
> +/* ARC specific declarations.  */
> +
> +/* Processor specific flags for the Ehdr e_flags field.  */
> +#define EF_ARC_MACH_MSK	    0x000000ff
> +#define EF_ARC_OSABI_MSK    0x00000f00
> +#define EF_ARC_ALL_MSK	    (EF_ARC_MACH_MSK | EF_ARC_OSABI_MSK)
> +
> +/* Processor specific values for the Shdr sh_type field.  */
> +#define SHT_ARC_ATTRIBUTES	(SHT_LOPROC + 1) /* ARC attributes section.  */
>  
>  /* ARCompact/ARCv2 specific relocs.  */
>  #define R_ARC_NONE		0x0
> @@ -4166,7 +4175,7 @@ enum
>  #define R_ARC_16		0x2
>  #define R_ARC_24		0x3
>  #define R_ARC_32		0x4
> -#define R_ARC_B26		0x5
> +
>  #define R_ARC_B22_PCREL		0x6
>  #define R_ARC_H30		0x7
>  #define R_ARC_N8		0x8
> @@ -4206,16 +4215,23 @@ enum
>  #define R_ARC_SECTOFF_ME_2	0x2A
>  #define R_ARC_SECTOFF_1		0x2B
>  #define R_ARC_SECTOFF_2		0x2C
> +#define R_ARC_SDA_12		0x2D
> +#define R_ARC_SDA16_ST2		0x30
> +#define R_ARC_32_PCREL		0x31
>  #define R_ARC_PC32		0x32
>  #define R_ARC_GOTPC32		0x33
>  #define R_ARC_PLT32		0x34
>  #define R_ARC_COPY		0x35
>  #define R_ARC_GLOB_DAT		0x36
> -#define R_ARC_JUMP_SLOT		0x37
> +#define R_ARC_JMP_SLOT		0x37
>  #define R_ARC_RELATIVE		0x38
>  #define R_ARC_GOTOFF		0x39
>  #define R_ARC_GOTPC		0x3A
>  #define R_ARC_GOT32		0x3B
> +#define R_ARC_S21W_PCREL_PLT	0x3C
> +#define R_ARC_S25H_PCREL_PLT	0x3D
> +
> +#define R_ARC_JLI_SECTOFF	0x3F
>  
>  #define R_ARC_TLS_DTPMOD	0x42
>  #define R_ARC_TLS_DTPOFF	0x43
> @@ -4224,9 +4240,12 @@ enum
>  #define R_ARC_TLS_GD_LD	        0x46
>  #define R_ARC_TLS_GD_CALL	0x47
>  #define R_ARC_TLS_IE_GOT	0x48
> -#define R_ARC_TLS_DTPOFF_S9	0x4a
> -#define R_ARC_TLS_LE_S9		0x4a
> -#define R_ARC_TLS_LE_32		0x4b
> +#define R_ARC_TLS_DTPOFF_S9	0x49
> +#define R_ARC_TLS_LE_S9		0x4A
> +#define R_ARC_TLS_LE_32		0x4B
> +#define R_ARC_S25W_PCREL_PLT	0x4C
> +#define R_ARC_S21H_PCREL_PLT	0x4D
> +#define R_ARC_NPS_CMEM16	0x4E
>  
>  /* OpenRISC 1000 specific relocs.  */
>  #define R_OR1K_NONE		0
> diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
> index c6ad232384..8420cd0006 100644
> --- a/sysdeps/arc/dl-machine.h
> +++ b/sysdeps/arc/dl-machine.h
> @@ -183,14 +183,14 @@ __start:								\n\
>     ELF_RTYPE_CLASS_NOCOPY iff TYPE should not be allowed to resolve to one
>     of the main executable's symbols, as for a COPY reloc.  */
>  #define elf_machine_type_class(type)				\
> -  ((((type) == R_ARC_JUMP_SLOT					\
> +  ((((type) == R_ARC_JMP_SLOT					\
>       || (type) == R_ARC_TLS_DTPMOD				\
>       || (type) == R_ARC_TLS_DTPOFF				\
>       || (type) == R_ARC_TLS_TPOFF) * ELF_RTYPE_CLASS_PLT)	\
>     | (((type) == R_ARC_COPY) * ELF_RTYPE_CLASS_COPY))
>  
>  /* A reloc type used for ld.so cmdline arg lookups to reject PLT entries.  */
> -#define ELF_MACHINE_JMP_SLOT  R_ARC_JUMP_SLOT
> +#define ELF_MACHINE_JMP_SLOT  R_ARC_JMP_SLOT
>  
>  /* Fixup a PLT entry to bounce directly to the function at VALUE.  */
>  
> @@ -261,7 +261,7 @@ elf_machine_rela (struct link_map *map, struct r_scope_elem *scope[],
>            break;
>  
>          case R_ARC_GLOB_DAT:
> -        case R_ARC_JUMP_SLOT:
> +        case R_ARC_JMP_SLOT:
>              *reloc_addr = value;
>            break;
>  
> @@ -321,7 +321,7 @@ elf_machine_lazy_rel (struct link_map *map, struct r_scope_elem *scope[],
>    ElfW(Addr) *const reloc_addr = (void *) (l_addr + reloc->r_offset);
>    const unsigned int r_type = ELFW (R_TYPE) (reloc->r_info);
>  
> -  if (r_type == R_ARC_JUMP_SLOT)
> +  if (r_type == R_ARC_JMP_SLOT)
>      *reloc_addr += l_addr;
>    else
>      _dl_reloc_bad_type (map, r_type, 1);

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
