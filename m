Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FD3C61DB6
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2026 15:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJyMlVSBU1SGhalB4klt94aUidXxARyMVzAgOZwT0m4=; b=0KLHk4PQNQZCQj
	JxWtBzES5YmwWtTyFFnEjPSE4ciqKXXUTzrwLReVJ4PTCgmhp92try91F0e+I2fvl1LgewtfQZXPC
	9EBqZAIBew0WdOxAmcaEY1zVXOKppnqygudOEvVCY2w4PI9S5U1xM3YQtlKycYKdz7NbYNuu0BXvV
	L1frAgjEKhJwrOOBuJGD3JbBlY+vIwaH1B2nXSRpLaKU0Whm1/mRe/vMQNy2FwP9LQ9noDQtH73zR
	KGLBXZF7o/JGVyf/UKb8U1AhmMVJeFl6ensOBw4eFvc3AuketOx8oIlNKZwA4e+/hZRkLoVjnqtVc
	Ibve8sJw8el3jmcIIByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWrP-0000000GxO8-0Aw0;
	Mon, 24 Aug 2026 15:45:19 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWrL-0000000GxM5-0z29
	for linux-snps-arc@lists.infradead.org;
	Mon, 24 Aug 2026 15:45:17 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso4439100a91.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 24 Aug 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787586312; x=1788191112; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=UMsHA66iW1HnPDCtvUeYqYmuc8fVDVhbQNB033xweSVcKUfo5pbbSktqcGKaSyfH3P
         L0OA5F+T+QZd4h+30DdFkU2OkKh5k6e6k70UkcyZoNRJaiG2nZ35JZfrPAdETmIMnsKC
         yiQYZBkwHBSz2a+apv6naKoi4SMWkgZHzlspPBAxPphFKchjJWOtKhSjNEN/aEbVmkYe
         x1ITH4fHNpIyOA+t17ggDvK9WpTkBPIRdPsGdznJKrUDIGMppc3tzukIvUAdvjt9f0vd
         /jrSTupgHsVKBtGE/5Za6sMHEfokl0NPBgBxW8cOMoWkVlQTVhQ7rlhkZj9oSL/CeVWW
         o5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586312; x=1788191112;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEtJVtkW7q375yAi3A0GskrIJ2s9H0yJ3yupt0Y509Y=;
        b=k8cY7HK/HVWeBNWREzASI0PJlKIB17D4QsCMRBKs1QK7sUR9zZTTCFOxB1YtyjzPN8
         DTtX1kBKL9yBiOTnh2/oTbckQYhNuBMLlqiHyJ+u2u7JnKBJ6cdMHczNJqciaRHg3QmH
         ifPQZeus5LDCR7QHiMxpAQd9ETYyOuAEQbPoYOTFdRtHYCi2v+LuqQrB1wVzR1larK8G
         ApXl4jaE9tzWiOn9XwGaS9MaIHTgL6IQ4SARGvGoFCr1V0hSfuTP6QNrKfQPEFOO6bpw
         Vc2kU9mYQmbKuXfeVSjAORKnUxGss0rhQeoGPcim8BQjosTpA+XvylvlLj75PLJqWLU0
         aC/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoMpB6dHopKgz1aNmiDhfCvmG7j7/R7hDk/A1ai4JqokPFAuc9aBAtAPOgiXNzL00wUjBaHdovaD4WiJ+/ckg==@lists.infradead.org
X-Gm-Message-State: AFuF++lfhmLOpM9TGPGpspAv2DosYim6i9za/x0KgXPoaaxyHSTLzTAU
	H+SgSeCmwB3TF3u0rHB/pCyqcWfqJ7aBFPfmNLja3PDTNvkjcvA9Vulo4gOGXdOYb1A=
X-Gm-Gg: AR+sD10vrrJMvLkksf0phZ7elgdL03EGp6X+XtSD5ZjPgqlMfjuMkn0BMsEBH3BpPBK
	Y7Sbr8UDx5mUIHXBVg8lHqCCRJThNPJMgmyVgNdAQtRX0PIjCO+tPZiYAVT+/rc1UqDRpfbOy0t
	iZOWAjQbB7rLT8/9pJDH55CFLXSlcQZe5GzzoplYK/FQeI/UfzU2EeR3C0EfWgjDhN3c61/L0Da
	6KPiIVCFQPCB/7TWOYT5V6+9CxXV6iW/1mjNwLi9N86jQHiP1Tgg5ZBpKG4d0JR4V5YJ2hjqlVL
	Y8st1BEBro89DHvkpAVWJaJgvwOGmPNqfuZb7weUYJYyLSuatEybOySDsLY+QvIRrD/jwv5E/X5
	cN1dGl3vPFpm0CWN7R9XlzBOMuivdzXY0J2X2s4xqq0TjSNcG7sHvEajew/5LZaBDUnNj93IllW
	RR5rz5YxK8QxEtwvQ9wikcmZVZ7yLNxg/c2R4n5Ui5ogaQ+1m+FQBNa52Fnv/pXOlEfq0pQQ3J6
	gsn8AjgHLv2aRk=
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr39252435a91.15.1787586312489;
        Mon, 24 Aug 2026 08:45:12 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b7ff6dsm23611a91.10.2026.08.24.08.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:45:11 -0700 (PDT)
Message-ID: <029cfde8-74fc-4437-bc18-b1b53d44cab2@sifive.com>
Date: Mon, 24 Aug 2026 10:45:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V3 1/8] mm: Make ptrval_to_str() generally available
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org
References: <20260818040041.1891769-1-anshuman.khandual@arm.com>
 <20260818040041.1891769-2-anshuman.khandual@arm.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260818040041.1891769-2-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_084515_293054_A5708212 
X-CRM114-Status: GOOD (  11.51  )
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

On 2026-08-17 11:00 PM, Anshuman Khandual wrote:
> Move ptrval_to_str() inside a header thus making the helper more generally

Typo here and in subject: ptrval -> ptval

> available for new users which are being added later. While here, also move
> another related string size macro PTVAL_STR_MAX inside the header as well.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  include/linux/mm_types.h | 15 +++++++++++++++
>  mm/memory.c              | 16 ++--------------
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index b18c2b2e7d2c..a5b514e55dd7 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -2001,4 +2001,19 @@ static inline unsigned long mmf_init_legacy_flags(unsigned long flags)
>  	return flags & MMF_INIT_LEGACY_MASK;
>  }
>  
> +void ptval_bytes_to_hex_str(char *buf, size_t buf_size, const void *entry, size_t entry_size);
> +
> +#define ptval_to_str(buf, val)								\
>...

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
