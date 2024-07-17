Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0104BC3DA42
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jul 2024 05:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1ASvH2jNmnGQl8aCaHMJW1eO/Mie6YJsJwCBBoond0=; b=NbrFDs3o3JMTin
	JXCz9bchOhHu3fNWJONBBCJTPsfLYGY0AHKGrnO8EA1fe2bBpsXqE2eiY+EQsB1BGySPJ+I7iCzCE
	uLQVkFSs0mrTxTospQEkfX9cmLWqWAJI6jTbKaCxLdtvvpSYid2X0a6SKtWPrLyHB5jxlSuVqa0X/
	xzd98kw5CLAdxtH80SMccK/q20vSt/xWAuVxYP+T+BG2/o3NEXxIdrMpCZYXvQ4amnqL6D5vs9pi3
	+qQv8kG7mfKjjiWHSAyBxidaysbzIc9uX4NZ2kqw5dVGM15RakVmgJAsW91Nr6R9DQnO4r2gFmENF
	ivwrOgwkwKu7qSlwWpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTwu8-0000000CfQH-12GG;
	Wed, 17 Jul 2024 05:08:40 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTwu4-0000000CfPP-41V2
	for linux-snps-arc@lists.infradead.org;
	Wed, 17 Jul 2024 05:08:38 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so89449971fa.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 16 Jul 2024 22:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721192915; x=1721797715; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ylupikJo36krvlGvfFYUWfmmy7QZTRdDT6qxa+A7N0M=;
        b=ZvElFZga7OkoqWeEfW2uOvQztwRBBFoFwknyg3i1O94VzMEkhK7aTr6bFJkzTVaoCD
         2tydjrp8hc9YLFZIQ9cZJb2c3xk0+lzFLLuAsEGf/NUjDoe9ohM56y3KpxFmbkkbRmP2
         xhb90mx5NaRK4peRAdWBrUr3ZGmgWafg7zLko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721192915; x=1721797715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylupikJo36krvlGvfFYUWfmmy7QZTRdDT6qxa+A7N0M=;
        b=RexF/qNuNeMSSaAVSunoNL1E/o5s5Hw9f2YlpcvVrZ9ZRXRh+7U2JqhZgMwlqqThXG
         6FxMQyyyUgRxOt8in4aVmHNGmf8kNKw5ob8hYEQvR8damZc8QL3xCZVfSXuggIpotP81
         Z6r5IsNVuYzd8ZZAproctBfPGA5w0+tctPx8a4kAI0zp0/Co8Dpfzx3rUaQdkMWwguih
         GC5KX242DHOkw7nb2VmE9EFUMZKYz3OQtrKS3nDHOTrYyjbZvtKkdKXzFqO4eT79YuHY
         W+cUtU6uOJUAjzaj3U/m2QOX3Sg2jwcZvo627oox56Uvw/7m81VFeDFV+SGVcmiGaEAw
         XmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWogzNAcmfCeScc3nYboPuVDTleYbaT7NogFCt2gcMOPtKftjJ8dvumxzhOG1Vx++ViHi0W1NTlrmeG3CBgXz3frBY8jKRpsLdX1EG3fVLiQXB1
X-Gm-Message-State: AOJu0Yxx42TpfmJZhfcta0IOzn5/KhCPQ/+pHysT49IRrKGTR9Hsvh0D
	XXgZQkX0uCI/HxmkHrkVxrYIHl3JlT83ogpi+LCEOKulazcCJs3MXpJBrlcLFTU+bIpywX5fJeT
	GKEbWoA==
X-Google-Smtp-Source: AGHT+IGhHs4j3lNPDeDvsvjc7MVhrXh9U4gMKBV5ejCd2imKfP/iyg3EbL20jQnTsD9+St6vJ+KyEQ==
X-Received: by 2002:a2e:a48b:0:b0:2ee:4d91:3d88 with SMTP id 38308e7fff4ca-2eefd0f72a1mr3078141fa.16.1721192914683;
        Tue, 16 Jul 2024 22:08:34 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee1939bfcsm13590431fa.117.2024.07.16.22.08.33
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 22:08:33 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eee298bd2eso43159081fa.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 16 Jul 2024 22:08:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqlvVrHSk6Mq3f1AhNcEECOQWYotw31vkYxG3We1WDTeQ0HpxKJf4KN24YmGUX7p577A1RgTjXncRTukXc0m+NUqNe+A+/jEkuAopK1FuyyOH1
X-Received: by 2002:a2e:3a1a:0:b0:2ec:5f6e:65ea with SMTP id
 38308e7fff4ca-2eefd1bf195mr3375661fa.38.1721192913022; Tue, 16 Jul 2024
 22:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
 <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com> <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
In-Reply-To: <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2024 22:08:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
Message-ID: <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
Subject: Re: [GIT PULL] asm-generic updates for 6.11
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_220837_405399_A79E268F 
X-CRM114-Status: GOOD (  12.09  )
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

On Tue, 16 Jul 2024 at 21:57, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Note, it really might be just 'allmodconfig'. We've had things that
> depend on config entries in the past, eg the whole
> CONFIG_HEADERS_INSTALL etc could affect things.

Oh, and my "find" line was bogus, because it turns out ".config"
itself is only updated if it changed, which explains my confusion
about some of the other header files.

So it turns out that to get the real list of rewritten headers, you
need to do something like

    make allmodconfig
    touch .config
    make

and then to make it faster, you just  ^C after five seconds, and do that

    find . -newer .config -name '*.h'

and _now_ it's meaningful, and on arm64 I see

  ./arch/arm64/include/generated/uapi/asm/unistd_64.h
  ./arch/arm64/include/generated/asm/syscall_table_32.h
  ./arch/arm64/include/generated/asm/syscall_table_64.h
  ./arch/arm64/include/generated/asm/unistd_32.h
  ./arch/arm64/include/generated/asm/unistd_compat_32.h
  ./include/generated/autoconf.h
  ./usr/include/asm/unistd_64.h

while on x86, the only header that changes as part of the build is

    ./include/generated/autoconf.h

and all the other files I listed were just because I hadn't noticed
that "make allmodconfig" itself avoids the write of ".config".

So that "touch .config" is needed.

Or just use another file entirely to flag the "this is the state
before I actually started the build". Which I probably should have
done instead of thinking that "hey, I have this .config file that I
can just use as a marker".

            Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
