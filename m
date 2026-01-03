Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2571FC6175
	for <linux-snps-arc@archiver.kernel.org>; Sat,  3 Jan 2026 05:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCpYukEuKCVOVKVhFn55/aSmF7FcTz2c5kweCEKjCzM=; b=lpxLwT0PAC1x2a
	2oAcLj/dP0k1M78QPRt2g7J2EYL5HAPrb9+REOD0BscDV4Zkm9SbSc1/KYzZtxBacHZihxVwOKjOT
	nhNH9zV7lrBA++D1NJPBl+8KgUX779YbKBCC9reMAh9UYu71PjwHTFUZqz4MwOYv3Dp/8POdD7Gbw
	Ld6vBljzEkQCPLQf1LBngdSKf9yWN/aDFcLnbHyUZncjtRVm4hyexwKH4B7YLPYYUhR/uGY3cSmc6
	neFGVANvvfC1CaCmI1iSxVtIDKpmIi6JdSWSh1WD4tftuuolUGRt3MaaqgAaNf8xwhbqFo4bS2rxn
	VvK9r1Oh2326h1KK7UoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbuJY-0000000908D-0chf;
	Sat, 03 Jan 2026 05:36:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbuJV-0000000906z-49yj
	for linux-snps-arc@lists.infradead.org;
	Sat, 03 Jan 2026 05:36:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fb5810d39so8128687f8f.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 02 Jan 2026 21:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767418591; x=1768023391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=10gk4kIzv5viXrYP6wsblohOaaYzL8Wh9uCfOfLAyTE=;
        b=kFKwiFyfwIzgCTWImL6CEHj7kl+MF16YmJcChFDmY2ZJtVwD+M6/MMszL5Q5yWSS1A
         ditRaRoMss92ESpfl9fWsLa8XkA0+yy/QC+l4hUSX2DIuPfSfgAM+QsDzPBFffciTXfU
         aemswB5r8hB7CBGzumhzc+qvoCWln77ic5Kk/AEyTujZca/I6cuArTIY/vSXZpW3hX5b
         U7+dhfp5vIYeTC17bpYnf91WmwIQ8QP9ckJfhfWSgQEHLiBq2p34XdPMFqL2vK8I8d0V
         NU+yr/DmReH3m9cDasQPWAmApwU9w/qZtSgogPIJJCMAbMzKJTNe0fZw2dUSyIAqphTl
         ts2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767418591; x=1768023391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10gk4kIzv5viXrYP6wsblohOaaYzL8Wh9uCfOfLAyTE=;
        b=lViH1xNRZiwBAcHqW1h8+0LLwr07kkTQpkOxBcG96crXFmiHUa5C+pqNOVLdYM1xLh
         wybykBMo71AaLkNUHwyc+FDA9GAcVb9D1o4Q2PtWfkXHl7wjMMilADaSzDvQ1h0A++kR
         dT9ei02MJR7lJpypVw3pud3vLaQME2JWxRatemm2KSxNkfKxAVFghdE3L+ZVdscorOwN
         SCC45irozH+T9IMBMudHapfXSmuM7yptaM0KuMYZkMxR6URfVuNpNAWokBNw7rXRnq7m
         sIN0ljTlDGLAdfcG4KKYm71NDZLWPevfGE227C+tKomt+RERpu1/uIcRLfzgpf4Tvk1c
         eEBw==
X-Forwarded-Encrypted: i=1; AJvYcCVit0snYXQ4/LgVygdsnyCmpXt2R6XyWEOCLYNhXH4n6SNpl7VJG6AYmicl7KehX1UImEDwBheWOjOHQ1nZzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yza2oqwAohZYvMguHSX31z233kpe9P0PKoRDlrNijZrZ3KC1tuO
	PUnAgZUSgcr41Gf8KuZ4WeWKejsnUrONtuIK1LNMm0Gfz10OJFwc+dVp
X-Gm-Gg: AY/fxX5ejrp19fhwvhZFbUBeYXqAGDijxdrgquT5iShI73JWmv9jLXWmfJtOo3s1SCw
	kH6GCowOZhEhc5n7nZKqaz9CfMz1Uz1Pz5E9NCOuWRpHYITTndl8UHR8I0cqPy2mTB8HwYG6igp
	ppaJV1kL/gmoi/FG58fkI40HHrLZG3OGqVacSx5CqyV6HwefX+duf1xkJsefLyWdjkhpiKuNUOA
	P7c0j+q1QrP/n85zEe+CviWdM4mryptrHiMdkF4yQ2MdEepm5eDBzO2Ep0m9UT0pQR+kHMFvbQa
	NEfKXiu5XT0kYsX7iGJCcmQplXZTQs6SOuyCrkFqlQPo1tTRhGddyAnRdhxCfW0+TLn/mX33Swb
	2c6m/LVgq9w9UwwBoBJNIyEALqqpnT/3gVCY3SZ0dQ1VlwUJQQcZN7dqIT6yAs0oY+PRflT7HnR
	qdZCvt7YZldoOzQ9jLKLxcEN7pVztS0a0auYUsYZd387DG7Vmsq+dABOwv7HbpvVwD
X-Google-Smtp-Source: AGHT+IGVfFhDmvRzquITceR9a5MtoKyW2aPxvUx0HbCgVxiLGpVVcSZGOqzt3JsoKLBzXfIUaXLywg==
X-Received: by 2002:a05:6000:178f:b0:430:fd84:317a with SMTP id ffacd0b85a97d-4324e4fb825mr53362620f8f.38.1767418590643;
        Fri, 02 Jan 2026 21:36:30 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm89007161f8f.37.2026.01.02.21.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:36:28 -0800 (PST)
Date: Sat, 3 Jan 2026 05:36:26 +0000
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 12/28] openrisc: introduce arch_zone_limits_init()
Message-ID: <aViq2vsMk5tltK0f@antec>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-13-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260102070005.65328-13-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_213634_102784_3F428CC0 
X-CRM114-Status: GOOD (  20.45  )
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

On Fri, Jan 02, 2026 at 08:59:48AM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
> 
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/openrisc/mm/init.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
> index 9382d9a0ec78..67de93e7a685 100644
> --- a/arch/openrisc/mm/init.c
> +++ b/arch/openrisc/mm/init.c
> @@ -39,15 +39,19 @@
>  
>  int mem_init_done;
>  
> -static void __init zone_sizes_init(void)
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>  {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
>  	/*
>  	 * We use only ZONE_NORMAL
>  	 */
> -	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
> +	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> +}
> +
> +static void __init zone_sizes_init(void)
> +{
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  
> +	arch_zone_limits_init(max_zone_pfn);
>  	free_area_init(max_zone_pfn);
>  }

Thanks, this looks like a good cleanup.


Acked-by: Stafford Horne <shorne@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
