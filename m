Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E22C7EE39
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 03:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0J0Swx0eCezBZajROWLUmnrzP94gQz7RYLWCeOHsQVo=; b=tQ/w7vrXNQqp/7iNVSrrh8AMV3
	ev1MeSsGVa+dcc5w8olcPKSB0uY/ArQGWvq0F/TEhyvXhWTJRTcp2WN8Au3uco2n3ZAN9qUOFznUQ
	jU04ZM4nqknbaJVF9Ea0aXgMa3P8Rr7WbnVjaaPVX9MJwoAuXdIWWR3hyMI/0B3X0SJQfa/Pvng0H
	Hg/DmLgumSrUttXEicywa418LouGEGYqJ3SY1yILKUgxv7iUXMs6pIMftoXYJUVSwZQIV/uQFPN3a
	Q2YL6QpT7g2KB3g3NII6pSxylDPSQxHzmlOwV3gC8LcHE69mogpB9HVn/FQb5CHLjUDSbzlPEMfEa
	TYEQX4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZRg-000eDs-0y; Thu, 02 Mar 2023 03:17:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZRa-000e9U-V1
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 03:17:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so1422639pjg.4
        for <linux-snps-arc@lists.infradead.org>; Wed, 01 Mar 2023 19:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677727040;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=On9It+4zdvXePGpqvCCrKF4Zz8YWrxnIbxTBVMgkuCs=;
        b=It4hmxTEAyg7hPQnG8xuSpgz+jJKrlOhrcoQbLU4P/YxhalWRyom0ZRJ9msu/DO/86
         AiIsktubYrvwpRFNifmG+BrBU8v6Yala4vW9pwjX/bv47kqdaFRBl58uJ5bIBRTWVMBT
         NEWSeyJD4fgG+iWneC8bOvtxcO0rBYIjkLBer1PgLGvr/r+TBMTp8+ncLKFkUa5GBOHq
         LyRA8ug4TwsdvYR3u1GIAGW60jHpBModJwHYh1E3SbElOIomsRGv1pXdHkKrQoLtx60j
         B+LSax1q+0/Z9R4mu/KI8ChOEX0yXbPBPiNHSvaszPAfYNONdpL5L3WAXmTh1suUklGm
         5kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677727040;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=On9It+4zdvXePGpqvCCrKF4Zz8YWrxnIbxTBVMgkuCs=;
        b=4srRFcCca8igJfeZGXZBAnDdYjloy3DgNMZ1OXhc5PiMCEBQhkSS0wNK/LlihY2HLW
         1W+uE8Vz7mtfWcc4mU1bPt34UB1exFIqBZgVPHJZqMcyMQcXOViQi9Tumw/WNmxp/Oma
         sPV/i88LuoMahHOlDdomaX42DjwE7OFV6zX6ypa5n8XmuvvjL03OJOxD4k/VoThpUfpI
         N+OEL7yYIRelqeIFrNx+yzWdkg2/xHbWwXR2EcEt4RVohtBZHf+kJlNLjao8Ur/CdbMN
         wSYLSeovIiplWem/qyMlpZjTkGFykMTHzfqxcAU7QUqopf69NaHwjlbesdBnXtU+zBmo
         gx9A==
X-Gm-Message-State: AO0yUKV0GjPBBSA3g8JjKVkJ+DcOtkK+Zbz9HYXKLkWMbLb89tjqYVKr
	YgFqgP5p0csRqSXVvuRwKQP5Qw==
X-Google-Smtp-Source: AK7set9NlkpYiMNjk7pdCtbLbxqSj79/p1ppAGwB6F9HvsUOQ5DEbSCAxLqrZ/Sx9hwWvoGz24uxIQ==
X-Received: by 2002:a17:90b:1c8d:b0:236:76cb:99d2 with SMTP id oo13-20020a17090b1c8d00b0023676cb99d2mr10274539pjb.8.1677727039843;
        Wed, 01 Mar 2023 19:17:19 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090a498700b002340b2c62e7sm437605pjh.55.2023.03.01.19.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 19:17:18 -0800 (PST)
Date: Wed, 01 Mar 2023 19:17:18 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 19:04:58 PST (-0800)
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
In-Reply-To: <Y+tSBlSsQBQF/Ro2@osiris>
CC: geert@linux-m68k.org, alexghiti@rivosinc.com, corbet@lwn.net,
  Richard Henderson <richard.henderson@linaro.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  chenhuacai@kernel.org, kernel@xen0n.name, monstr@monstr.eu, tsbogend@alpha.franken.de,
  James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
  christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
  ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com,
  bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, chris@zankel.net,
  jcmvbkbc@gmail.com, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
  linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
  linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hca@linux.ibm.com
Message-ID: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_191723_031073_42B3AAB5 
X-CRM114-Status: GOOD (  36.48  )
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

On Tue, 14 Feb 2023 01:19:02 PST (-0800), hca@linux.ibm.com wrote:
> On Tue, Feb 14, 2023 at 09:58:17AM +0100, Geert Uytterhoeven wrote:
>> Hi Heiko,
>>
>> On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>> > On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
>> > > This all came up in the context of increasing COMMAND_LINE_SIZE in the
>> > > RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
>> > > maximum length of /proc/cmdline and userspace could staticly rely on
>> > > that to be correct.
>> > >
>> > > Usually I wouldn't mess around with changing this sort of thing, but
>> > > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
>> > > to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
>> > > increasing, but they're from before the UAPI split so I'm not quite sure
>> > > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
>> > > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
>> > > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
>> > > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
>> > > asm-generic/setup.h.").
>> > >
>> > > It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
>> > > part of the uapi to begin with, and userspace should be able to handle
>> > > /proc/cmdline of whatever length it turns out to be.  I don't see any
>> > > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
>> > > search, but that's not really enough to consider it unused on my end.
>> > >
>> > > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
>> > > shouldn't be part of uapi, so this now touches all the ports.  I've
>> > > tried to split this all out and leave it bisectable, but I haven't
>> > > tested it all that aggressively.
>> >
>> > Just to confirm this assumption a bit more: that's actually the same
>> > conclusion that we ended up with when commit 3da0243f906a ("s390: make
>> > command line configurable") went upstream.

Thanks, I guess I'd missed that one.  At some point I think there was 
some discussion of making this a Kconfig for everyone, which seems 
reasonable to me -- our use case for this being extended is syzkaller, 
but we're sort of just picking a value that's big enough for now and 
running with it.

Probably best to get it out of uapi first, though, as that way at least 
it's clear that it's not uABI.

>> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
>> I assume?
>
> Yes, sorry for that. I got distracted while writing and used the wrong
> branch to look this up.

Alex: Probably worth adding that to the list in the cover letter as it 
looks like you were planning on a v4 anyway (which I guess you now have 
to do, given that I just added the issue to RISC-V).

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
