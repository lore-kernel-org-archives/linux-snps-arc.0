Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D981CA5FF0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2026 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBRJLpiT4cwceP9yBtA5rd8+IumgHh37AYqmFf7euno=; b=lMKLcUt8GLjAp6
	KZ19/yI/Gx5s2rHaBl8wSBDKTIYLrLk3VwQz4kL3KwaR37HTxzHlz+Bt6g/w9p690jQ9BU1nefomf
	mwbquNxkByRv8WRYCW3PEOs9AczzSTzLwji3OSSdx6GGTq4EASErC1WH5fqeJtSfY1NYbY5617zxs
	zwWkKECphXYJYwlmKxzmrWhvVYd65rHJ5Us3cdwcFCaiS/smwdeXrYWob46X2PI6C+PjBpdERUZfP
	i1XPaLyKItbgblBv5JaaBmZQf+ZoVX6Bd0JjTenC/MIOOrncBPmHrG6XJXQ1E7llaaNX0IuwfC5bF
	EiTfZP+ueGgwydBR6/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDn0t-0000000Gy9c-291p;
	Mon, 05 Oct 2026 18:02:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDn0r-0000000Gy9C-2uCT
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Oct 2026 18:02:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so20215735e9.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 05 Oct 2026 11:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791223327; x=1791828127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnVgwZ0Ax9BPhjLqXni98Fj4ELNlpNrDohzywKqSoSM=;
        b=jhXhdwHnrUbZ95VsS/6oGZm/YWmpYOJT2jQYDvhcgaYx5Dtok/2tgjdd3FZRJ98vLV
         tQpbZ6tBLqpM8GXM63rKvy1rMt7R3oUyJdvNfsYiCkDLIk7b4IW56yf90OVNNJ15xINU
         VFIV7E3MTi0G+ogupsvyhhp+ywrbuIrGq8EKv1IHTjjvb0X8q/KFOkyPGkZEocrr6PPY
         QH88x7AkHKwtjsux3ExReFrPRBtGOqC7SROwF+3Ghjeeh9hkCscbwnDGvcU9BRTckf46
         3Vy3DYXWEahZh9Labl98HteWveZZqcEpmck2E01Zt2BpYrNK2Rps6FcB1ytgLL6sLOg9
         jzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791223327; x=1791828127;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnVgwZ0Ax9BPhjLqXni98Fj4ELNlpNrDohzywKqSoSM=;
        b=TSZx6rIlfkEHLLBkbyyFR1CIHinvZUAJnan3jPoS0/3KrVphmzzB2R9bkgWCcK+1br
         xFidbOI4OkNVYNH00cOnwxZCg9DhMBWud8d5Yr4U+Tevn+cXMyufELS/Fqe0TkvUgNNG
         M0NnOu55YO7GVT6D3Yq7OaLib77Exw0pqzU1TwAlxyZbCpQNU9+goFMmYHUTwdPFgXqP
         q6PcNHTeMN9ikUrav3GSXRa1lDWkmTTxc89BaI63l+A0itdmwtqsXRhzf4BHJQg3YrXp
         4zcU81c/D4A8W0Y3BBsh8c0cgdyVMNUCZ22C2ohIUIfIPHtTzo0z858oDm8NrS4nIJXS
         SuQQ==
X-Forwarded-Encrypted: i=1; AKwUvByZZCkB7l4Hm13v6uyT3VqHtUC+yq1yYoRWsB2E4TWZ5JCgHhSmnrgIcRcyBiWK9ZkdcKNb2yyFsxpFlfxJnA==@lists.infradead.org
X-Gm-Message-State: AFuF++m26/82+1jojzKq+POGFt2FH75lTplnzoQXQGkQiFPLNI11Nwye
	EbJ8tGNuRKid0O9l9vR+7HPVfqgSS0g8fstImcnBZ728JqMSoDhh8VBj
X-Gm-Gg: AYBFou10ooi2q3Tzcb4t906FJA/96E8Qly0zwLKEM+BoGgJ4XcezzxYOwr7x+J+52UF
	MYrxvtiCPKY022UTY5OyP1qP82XdEPJWjWeNJTv06DdYfcvrATsw8LcPJmTQchNUK1gM8PGkMe6
	LgqK/1hvA/PckO/0eFfr0auxP/teqcSdKkSzUfEEJ+cNYdbuzAewy8B4fs6vDukMqnloMHq3zVy
	3mZepr65d+iD0giwNE9RiJYSDl+itj1RGcRtY7+TPFFZSKBJzOrni2DFE4MbsExrRKFteYqsbeG
	QVnwavfykRN+tnMvizdXbX3Dn6uLQFZtgGgUt1diiTiz6dE4ujFBp3Vye1Bvx2nXjQ2/2V6X/Tz
	9C0qkIQvj02EwqMT4jw3zY4A1+PZ2jKq9Ml+EsP3h7xCcqTOjnyUsPntGr++2iCJvKR2bQyTmRO
	c+HGtQm0WB1eivpYdCcqVKNauldoKfswdUzmjbPFGtBYjsO/BCDsTCuSu+c5dkfhBoQkZoEqQA3
	T1jFzAgladMeh0SVgs0OWe2S+PYsr5cTGo=
X-Received: by 2002:a05:600c:b95:b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-4a168106239mr136305905e9.34.1791223326914;
        Mon, 05 Oct 2026 11:02:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c4008esm7441325e9.6.2026.10.05.11.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:02:06 -0700 (PDT)
Date: Mon, 5 Oct 2026 19:02:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com, arnd@arndb.de, paulmck@kernel.org,
 glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <20261005190205.26f17469@pumpkin>
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>
References: <20261005120700.383058-1-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_110209_758281_F4325467 
X-CRM114-Status: GOOD (  25.22  )
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

On Mon,  5 Oct 2026 12:06:57 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> This is v5 of the two-byte cmpxchg emulation series, reduced to the
> three architectures still missing after Paul McKenney queued the lib
> and sh patches, ARC, csky and xtensa.
> 
> The v4 attempt at these folded in a type checking idiom,
> (unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
> to compile. The kernel test robot and Vineet Gupta showed that idiom
> breaks real callers, fs/crypto/hooks.c passes a char * and an
> unsigned char * to cmpxchg_release(),

That ought to be a bug...

David

> and the conditional expression
> then has incompatible pointer types, which is a hard error on gcc 14
> and newer. So this version only adds the case 2 dispatch, the
> declarations the architectures already have are kept as is.
> 
> The ARC sizeof bug that v4 fixed along the way is in mainline
> separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
> to use size of pointed type not pointer"), so the ARC patch here is
> only the case 2 wiring on top of that.
> 
> On the why, RCU previously used single-byte cmpxchg(), which is what
> motivated cmpxchg_emu_u8() in the first place, and Paul has now
> queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
> it into the architectures that need it is the missing half, and
> there are existing workarounds for the missing two-byte cmpxchg() in
> the tree, _Q_PENDING_BITS for one, that can make use of it.
> 
> Per Paul's suggestion each patch is standalone and can go in
> independently, they only depend on the lib patch already queued.
> Each one was build tested with the real cross toolchain, ARC with
> arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
> builds Vineet pointed at, W=1, with the macro instantiated on
> u8, u16, u32 and pointer types, confirming the new dispatch is
> reached and no new warnings appear. The pointer instantiation
> covers the fs/crypto/hooks.c case that broke v4.
> 
> Bradley Morgan (3):
>   ARC: Emulate two-byte cmpxchg
>   csky: Emulate two-byte cmpxchg
>   xtensa: Emulate two-byte cmpxchg
> 
>  arch/arc/include/asm/cmpxchg.h    | 3 +++
>  arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
>  arch/xtensa/include/asm/cmpxchg.h | 1 +
>  3 files changed, 13 insertions(+)
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
