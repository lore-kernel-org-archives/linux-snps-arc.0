Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC93C83010
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Aug 2024 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diC6F06Gb4vLdSCvniL+Ot+OttxtviBnSm6C2GSLP4Y=; b=HH+vWS9U/30eMX
	pcaErk+xtu5jnxsvDgkPu6G/CmhuaX8g2HEG75CwALfpyfKC9bmCttRa27OV5qflrLgFjaCI1kYlU
	/oWbAvECSJLIVYLm7os/Yh4SKVBFNoXxbgcMloZiW4L3TFhhGf3nT3XqBiTWCiFlDZO5E2Q0Axl9L
	QDgh39H2hmHfNEhJ8Kfj9PUSyIC6sh5UQRXlM1+mIZO3NeOz6+vYpjUD0naB8Gq0IUjf9u7g37At0
	93X2pBdRIni3XtZ+1ynUYvf4chwpm++zgZjVALJ2LRaHXuy40nqOx+vELDEAxDgdW2bk0GQZ1mbVW
	leVR4+FmctjvSXBe9S/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjafF-00000001BC7-3wsw;
	Thu, 29 Aug 2024 08:37:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjaYW-000000019QB-0lAx
	for linux-snps-arc@lists.infradead.org;
	Thu, 29 Aug 2024 08:31:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42bb72a5e0bso2588605e9.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 29 Aug 2024 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724920258; x=1725525058; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mhnlNgvuSYKooCUA3K3P7Rvv1F/ipLIuFC4LArX03WU=;
        b=RU1uUO+yacjH/VOOqVt4XB7hRyDHnGIeRWaJZGTawY7bXcBWtgSxGGEhPodXdfr5Nx
         H6S7dmwYraXmcNYo0TGa3S4idh1iCWbWXuwu45XGDECs3nKUslbGLjfe3eWIL0YDsKES
         aDPEG+vGjDAB8QF2M60hE89C7uPIijNXErVIUFx3b/DAoT3v5IiECBqaZ5Yv+V1lLBIh
         107+ZhLMXDO+R7LOEsVR+NhRsVk5bczxSQJE17RJV2PyNFu1XA+q2eIoeQn+Ob/1243Z
         jzu2fg4oHxRRW/JS3uq9kmT/9Itpxqh8sSnUUSmzLjjvnT78lZ7PY4PnI/enFw7pn1KD
         S18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724920258; x=1725525058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhnlNgvuSYKooCUA3K3P7Rvv1F/ipLIuFC4LArX03WU=;
        b=NkTeY8yecAViWMn47cOYm5Qc9zCyjEEhZC4g2EXNeqZgMGP5nZREShAMmN45KkD41S
         xoxwEAzwZQaN6iFC1l58dFe/6hnnn7v6qV8Hq8WeP55ovLL5H8YT+xbzNi2ZBOM6UhWG
         GWoAoz3Do1jAC0V9p6fcTeL7XY7jj6EABrNIMXsfvuBXMAXcjsUUeRnUq2dj5lvxuRt9
         J6rG0PD+Ch/zjsdRGX8WopTExWxiSZjzdO7QjvVzQ6LP4UlqRAuEhWEUokrARKerfS2h
         boAIl8oyCjjgsnIIQmq5JqgIF/5ysWmXPM8kmLZ5Vj0Yavun7VwFKoRmsNOKCukKuE9i
         jiVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmiafJp8TKYA/0Uh872JQ2fE5vTquaJJE42ZJiJagV35OJDH0qYyZHvVcQavRewpCpKIcRswwxDmvKJPoKng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1siStHWSzMRBCXrGe+tC7oyOshiXSkvBFD4a0wrfsfkPXHx2B
	fWaQA+6Xxa0JfjyzAzmsDjEd3vlliaF+Jyy/s3bmIPIQEW9nGMNVjMX/X0gjQWA=
X-Google-Smtp-Source: AGHT+IH7DF9ylXdsuqLih7sACGDNUKmPe9OYfvQtJgi5uGMLK6sqxI9YIz1ijmJ7+1Xtw2Y0sxRMNg==
X-Received: by 2002:adf:ecd0:0:b0:371:8a49:f206 with SMTP id ffacd0b85a97d-3749b54ece3mr1331552f8f.30.1724920258302;
        Thu, 29 Aug 2024 01:30:58 -0700 (PDT)
Received: from localhost (109-81-82-19.rct.o2.cz. [109.81.82.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749eeabbc1sm802650f8f.63.2024.08.29.01.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:30:57 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:30:56 +0200
From: Michal Hocko <mhocko@suse.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
Message-ID: <ZtAxwJFH_hAh1BPG@tiehlicka>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_013100_320963_C0091262 
X-CRM114-Status: GOOD (  18.75  )
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

On Thu 29-08-24 00:15:57, Charlie Jenkins wrote:
> Some applications rely on placing data in free bits addresses allocated
> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> address returned by mmap to be less than the 48-bit address space,
> unless the hint address uses more than 47 bits (the 48th bit is reserved
> for the kernel address space).
> 
> The riscv architecture needs a way to similarly restrict the virtual
> address space. On the riscv port of OpenJDK an error is thrown if
> attempted to run on the 57-bit address space, called sv57 [1].  golang
> has a comment that sv57 support is not complete, but there are some
> workarounds to get it to mostly work [2].
> 
> These applications work on x86 because x86 does an implicit 47-bit
> restriction of mmap() address that contain a hint address that is less
> than 48 bits.
> 
> Instead of implicitly restricting the address space on riscv (or any
> current/future architecture), a flag would allow users to opt-in to this
> behavior rather than opt-out as is done on other architectures. This is
> desirable because it is a small class of applications that do pointer
> masking.

IIRC this has been discussed at length when 5-level page tables support
has been proposed for x86. Sorry I do not have a link handy but lore
should help you. Linus was not really convinced and in the end vetoed it
and prefer that those few applications that benefit from greater address
space would do that explicitly than other way around.

-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
