Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6AC606A326
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Nov 2026 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LZ0hZFrK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dIJPBt/7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LFF26dGc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=ANnBK0aGb/cAaxWqpQRpQtUNXQpEiyUEarc6KNiI4jQ=; b=LZ0hZFrKdh05GDFw6FKy2pU9kx
	ymBv0DCY1DCF0Raz0pPTzAJxpZ0pZ49eGdJqA4qX8CUYG993F5XzcpGKsnfgyYYD4NW5be4orLlEl
	qI1+kJ/lNkZPdAano/JWN/sHoefvr+v9BHzhHr0PLXUufgkiQj33eoiSVwnzsY2fhvhFg/dONG4yw
	BsHeZDOLOSLmnFOryhZD/401x/90YHGD425bVTTrqkfV5Dk7G5brZygW8IRs0QusEsI8yg5movHA4
	owB12TJpPkD8bPZ3fHPZTcitTjXCQ81kPYU2BOOqEHflHmx7mcWLeUCuNRRj0XAXgwoHP2TmQ2tGS
	6csCU/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVc3-00000004a0d-3Ssw;
	Wed, 04 Nov 2026 07:40:51 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVc0-00000004Zzi-2wCp
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Nov 2026 07:40:50 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 60964140009A
	for <linux-snps-arc@lists.infradead.org>; Wed,  4 Nov 2026 02:40:44 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 04 Nov 2026 02:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793778043;
	 x=1793864443; bh=jdkx1jkWgH2UKTead65t6S1xgvf3aXx5Pam6zn2Qcds=; b=
	dIJPBt/7j8f74KC8/4cLcqbGWejqqTHbBvnq4/tkEuCt7o/Qiz6s+z1+4FDQGXod
	RAQjw0n8RjPS/fXdRcJMxEz6uEx6J/dM1z72i63dH0fYFOrp+EpK0b577yw1fdYn
	WTrYxyUsd6wdMPCmgco0vX/wl7lc2++MhsN2waVnJTEguvkLKr7rMh5gZCHk4Sec
	IqpqrKtjlR7N8a/h/4dTCXuk2mD+Ab5KZ4oZqAySgjqbmLsn4vB26KWa5Nj7pCJd
	keiBgm/eSubYAy/QfqRmC+eu3+Z/hWXolNzKjkBd7uMU0uWCU4OFn+0VzWIRRZol
	I9TtbEgcbEZnH7pvxirAxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793778043; x=
	1793864443; bh=jdkx1jkWgH2UKTead65t6S1xgvf3aXx5Pam6zn2Qcds=; b=L
	FF26dGcW7egzKPlx7Imrvif8PACTJ7VG8LM6Htb7/CXmTb6l/8UbNw6E6YiTILbM
	A16Z/BoUrsJkuxJw1XN6JWwS9obeqaU/gXgPqGmLlAeERPBbW1zaZJ/CMMXw2FXg
	HCLGaLSW+LK9nmfU7wua+w8YlPIGABIhYjePAlddkABDlmJ0RxCu9ViDVnigDuXz
	aP7Jpq7jhTUcOo3K+8DdJXbFePgu4nCVsjP0EeyDoKrvb6hNNkEttdHqPwvuRe3r
	G5dNiY1APBPYhLHUVGMGTJadQwi1QUPqcdBEjhb9WXlDM/aaujWLLYvEo0q/b5V5
	c+sws2ep7+2px6ws3Ak0g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793778043; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:f4hLuLfumX8m1m9ABXyCnRgdzecMiIR0LCyCTr2X/HyCUxz
	lAegDqEWIsLDsekFJD67FjhvPxr4bG97f8RegLxw5SAOGJuGGJPrY622i1L6Yudv
	wXBQAzE7FkHW3cTUx36BjK5oCVg2BX0t9vt4/RgK5vy5PXCfJkGEd8PM1qlhPtfo
	Z+P40uht97CBrahlQeixSuWHPycWDqGhZKDsZSQKRRMiFo2WF1nLxSmOONSjUcIE
	HOi0JgekQh9bdPptyaN6gIaeHmIpQ0VWU7m+yyx45HrD/vL8OcJn1A1+DJTW8PAB
	T0SXewi0RrBYtQJEx1qTl6hEKCcXFS4UfXDaq6w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:BHCyfsEGgeB6KE/p7k2Lzxtudau9dPthb4f5ddUkBqg=:sFKbGl7M+bmc6GP2/YZhSxV5JsfWAqh3vfY6lKIjxME=;
X-ME-Sender: <xms:eOHqaoXOGtAOJsvTMTzC0E2zfVwcGHJtDlWLsYuMTZjVvTWsJSYfrw>
    <xme:eOHqanZAIEUvVSAZA2oMzHxzcOTuzGT8IF4oMpnW-Ug4WpxTmkCmdxK7qe0xCVE4J
    0Oy3vKVbWG3kP3ngLT0nWFm6O82nY_2PAeqhIu2mg6gf6alIqAymMk>
X-ME-Proxy-Cause: dmFkZTGFdExFfau+0t646T9zM/MAKUgZ7uWeewKlQBMdWAx1tBWSsutEr3o9tFN5Kl3CNO
    UlE7joIk1WLEPl5HMSkQ920hqV6tDHkUDBC7dvxiEiDhmsmbrTNqEZduWj2CkAVTq1k3Tc
    DuNxyW0S9kP1QS/aZ6U4eP2KuABXH4A7bYYRl9+uitHMFNG/J/DQiOdSENb8fKMPCTLb05
    eXqeNOifiq+hfeTTa30HgAuoZ4Suzp0ycxaatMn9fg3kF/mo0P4YcE3s6cJ0D3Ewb1nwaE
    RBfLDsKw2hP0mL+mklIgUqcK3OMqbe5xag8EgEP/KpcxLaxmt3KDtmJQBown5o7idSPiZg
    RtSaYeJG1b4Rpc66VlXpDtfImOBPw8R/yIsixXrlr/P2sMjpAP0QguXePwi3W3izBF9GZF
    rfuT7XfiAYl6CsKMwvifVSnCUVdhmeCLuapSxhyu2/i3BnsOTya9b0W0Qw6m6EKo6HpBqe
    i5JZsUAP2y1L4Bl+43ZI6zJj8ibb4KZoVCBmWGR2MnB9h95WMFVK/33SZ4zxiktFqWes2I
    vhE9biwoYBiNGlgX8PS+BuHQpBbtFSjA7qa0PyXARAajStrvr0OkF2NfK5QJQ0mW5hUq5i
    dTnenav3so5asH6hxOsart5TDPRb5GSfhuXLymdWCGzn5FZSABZ4Y7D7Wzng
X-ME-Proxy: <xmx:eeHqan4s4IhfPOCVnLN58KwuRzj5P5pjVW8E8Z8vtRS3xty1vI_zCw>
    <xmx:eeHqatCmJQLDLY9SFWzdfaqoQaMBVDQbYtH1Qr4F_fvr27ALutwSaw>
    <xmx:eeHqambweVNtC9qydigArcvefnsFCv4JldmPRt3VvOgX0YAUCX6UGg>
    <xmx:eeHqagbAHY52aDMqID7Uzm51YUZu_uvx1tTkwWsvol90Gyk0LloNyA>
    <xmx:e-HqatsZOxPZzy8FZwTJvCxo2KlrFkK2upd0tyRkHcpI2lf0LNLIVDPS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C7BD732A0093; Wed,  4 Nov 2026 02:40:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0YankKnQQSw
Date: Wed, 04 Nov 2026 08:40:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Message-Id: <6534a171-9e74-4e69-bee2-3a499798cffa@app.fastmail.com>
In-Reply-To: <20261104043535.2039948-3-vgupta@kernel.org>
References: <20261104043535.2039948-1-vgupta@kernel.org>
 <20261104043535.2039948-3-vgupta@kernel.org>
Subject: Re: [PATCH 2/2] ARC: io: use asm-generic MMIO accessors
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_234049_232558_2E476D3D 
X-CRM114-Status: GOOD (  19.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026, at 05:35, Vineet Gupta wrote:
> ARC MMIO accessors use inline asm, which isn't really needed. It was
> introduced with the original port back in 2013.
>
> As the previous patch showed, inline asm can be error-prone. Letting the
> compiler emit the accesses also allows 16-bit encodings, scaled-index
> loads and folding constant offsets (s9) into the access.
>
> Without the asm, ARC's __raw_{read,write}{b,w,l}(), *_relaxed(),
> {read,write}{b,w,l}() and io{read,write}{16,32}be() are the same as the
> asm-generic/io.h versions, so drop them and use the generic ones.

Hi Vineet,

In my experience, the generic helpers are also fragile, they just lead
to different problems when the compiler optimizes them in ways it
should not.

I would recommend keeping the __raw helpers with the workaround from
the first patch, possibly both variants depending on the compiler
version.

Using the generic higher level interfaces is a very welcome change
though, I hope we can eventually get to the point where every
architecture just needs to provide the __raw_*() ones.

> Two things stay ARC-specific:
>
> - The barriers, now hooked into the generic accessors through
>   __io_ar()/__io_bw(). On ARCv2 they remain dmb (rmb()/wmb()).
>   On ARCompact they were empty, relying on the asm "memory" clobber
>   as a compiler barrier, so make them barrier() explicitly.
>   The generic defaults would be mb(), i.e. the heavyweight SYNC.
>   The *_relaxed() accessors only need ordering against other MMIO
>   accesses, which volatile guarantees.

Sounds good.

> - The {read,write}s{b,w,l}() string helpers, which, unlike the generic
>   ones, cope with an unaligned memory buffer. They are defined before
>   asm-generic/io.h is included, as it calls them (e.g. ioread8_rep()),
>   so they do the volatile access directly rather than via __raw_*().

I don't think we want a custom version here. Do you know the reason this
tries to handle unaligned buffers? If there are drivers that require it,
we can change the generic implementation to be more like the arc version,
otherwise this likely just causes larger object code for all users that
don't ever need unaligned access.

I see that the sparc version does the same thing, other ones without
unaligned access (in particular armv5 and riscv) assume that the
memory buffer is aligned. On alpha and parisc, there is an alignment
check for insl()/outsl() but not readsl()/writesl(). I suspect this
is not intentional.

If they do run into this problem, they will fix it up with a slow
fault handler on the unaligned memory access.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
