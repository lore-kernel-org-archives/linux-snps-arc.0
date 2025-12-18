Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60456D68BF6
	for <linux-snps-arc@archiver.kernel.org>; Thu, 18 Dec 2025 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSzzn1jfmIpMrFqv6izmOPGw2F9vHSMJFjVgXv88b+Y=; b=yAGodQjvhKvqGM
	27d1Il6kG3/0QR+ScUSZEg1q2qmUrVBmT+B0ZbnX2vTNBUhDBf4o3blsE2gtjTbr5SinVBkPD3lXW
	0JSn8FADXsU4vG7Sgiz4Ase/uqE4AjhcvMxSvUKS5njRlU1LF9BrK/uZpHXgAA+nmUgmVetnBSF/O
	SK4MuqqDlgHy9otXPgd2sf/wC9ekWCazyN25403onqi1MA1PsVrjZX/qmElvWV8pDJH+Zse2onXS3
	bTZ0uVPBPKrcYijOK7r5y8a8JPSGeq2gufLBXDq5Qr9RwxnmkRpIwpGKoNOPZ+Z2yjuFlRfLr8f1L
	62coy6dSm3XfLgap3Bww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWA9R-00000008818-3hjV;
	Thu, 18 Dec 2025 09:18:25 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWA9O-0000000880V-44xR
	for linux-snps-arc@lists.infradead.org;
	Thu, 18 Dec 2025 09:18:24 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-88a3b9ddd40so2560986d6.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 18 Dec 2025 01:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766049501; x=1766654301; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrxnNnWxI4nS0YOrpBWcQANh5SNRLcQSO0aWER1QbrU=;
        b=BOKHcSs5dSmFqDB/CAw/pGhwN4vp36EPVADtJQxVFN4/n5RDTSTwiufuLRWlV7nrkJ
         vTpeofk/oEZE3Cz1fwK5QVo68WW0H/f5oSN8OxAI3DFxPpW+rvVEgW03aitdsdLcP4Bp
         uVsdv+jHxQgAcsOJFUd0mVHhJaa5tqtBrPEF4Ye8aXgx4sQVpRcAGn+d/psE7aBTisFA
         w27y+BUnt6YDesc8CuQrd0JGkQxvgLmVbc9tiEwH2OH1yUMqbxZsj4fXCrbMw/vxmMub
         i7bAoEfELVjioCj2m6yfsuO8W808r5nH9gW/WpTWFRRCFeqvywg2F63pCc5txSt0AMqh
         e64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766049501; x=1766654301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrxnNnWxI4nS0YOrpBWcQANh5SNRLcQSO0aWER1QbrU=;
        b=u438tqbowZLYqFCdpFuzy/f8yawkWL3dr0EUKXt1pN+JUMhFBbCy0grBbY30xAX3L2
         02dd+rcjUdB/jN3CC28GADl5S4M0VSzL7CMNPOOGt4g7mAvsd5cI3J5KZuwceWhm2s4j
         t1nq5UlTP4bkirOKy5mrJjXx9K+eBYjpKais3WMNSFJId2y/Z15RD8aa42LAehdI7y7j
         jZ6zc3GF/9kGQD5lyyj1Yz+lOcdFk3LRlRA/7bLNxN4spVkVfP+zkD2pG18ONoj5DkTt
         jbf5IfxoynSgqugDo3Tr0Z/n5A2j5VAQ7oBAKHK4IEH1eobD/PZ9tx++PyE0iYJeupKn
         pvIw==
X-Forwarded-Encrypted: i=1; AJvYcCUHuuji4eMF7wzy0j53wP3rTPqCnaCRLXlwwKM3AyY8qtS+qRcpqHO9BCn662WhuYLyNFXdmyB0xx/AgSb1eg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2C5X0E5TMJYgrqhP7P5NZIvQ7usElh5VWudYZ5L+KEr0JUnjS
	Obab1SNoyCpIJuYlhiP2ilxnDAbGTzoo+aIFjUs/MK6CfGcLgaMuLU5G
X-Gm-Gg: AY/fxX5cA0UzGDEzcraL+ODweUxe8lex979QkWzryqCd3rKbevEbDL3N9YLGx2fDZeq
	x3Q/MgAFN0yGZnF8jC5UaznSuBatBrXeML/HoEengUvunwNDSL9M4dRySgZdgFpRmmoUmtxvGpg
	QgNTgf1JXmOSx9lx4XnxOy0usezOpoqWzbeAZcbOOMAvrOR1tD74UM6qkjHODEz01vwdGefZArY
	ZRWQwDlYuAvId/dMsxyZ0Nu2vQk3IK8i0nArCL+ZWebddEyULJzc6yEtx6TSCRXCGmwJJxT22/q
	rLotUzpnvu3E1DxOgTvU8u6MdKf6xuXni69J09OiTzWZroH2tDFmCMHUsCxWpe3Qm/3gE7TjgKf
	sBy2lNV4qXJY2cQfGY3QEF4fyL8WS3HfQ3w+sSkv0WlggbQpFJTXHvGRX0MyqOC5mZJjQCEa6WP
	RROXT4ATa1GTgFvAgvQNSB3IyFdCwR0hTNjDKtT4m1/Kp8pVoFn37ZgWVAT0Mp69QmzK/Ixms9A
	b1+azAMsNyWLc0=
X-Google-Smtp-Source: AGHT+IGcCSZ2GTde4aBCYX1t8a7toNqTh87um5AM7sqyimiK1IjG5xXwzjeXHFVeUXoPi5AeBf7daw==
X-Received: by 2002:a05:6214:3f88:b0:888:f03f:3d60 with SMTP id 6a1803df08f44-888f03f3fd4mr298428876d6.23.1766049500611;
        Thu, 18 Dec 2025 01:18:20 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88c6089a7c3sm13752156d6.27.2025.12.18.01.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:18:20 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 93062F4007D;
	Thu, 18 Dec 2025 04:18:19 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 18 Dec 2025 04:18:19 -0500
X-ME-Sender: <xms:28ZDaYZEfJvWf-SbMYzrwGR3XiBc9nchrwXFhKQR8GJSSPC5Ar8EDQ>
    <xme:28ZDaQ3X24tbFZCKSuy5BC9I-mJ6F97xHygLeYsX0Q24WXatFCtqulZ7k7xDXldMD
    w8thToUOyrSqYEOYVh9FeLhsV3yHiaH4wNjMKNGLA9kWLxJNQIW5A>
X-ME-Received: <xmr:28ZDaS76HLTNf9hsmzSKKCFzqme6tSv1wQBubRlahd7SzJkjvySDN_JZ4AwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeghedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhopegr
    rdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhi
    hhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:28ZDaURyyKmDQ4rzO87pKe_8fgOq1CvxIA38rZW58_FyV787JuMOoA>
    <xmx:28ZDaToXdtq1vvHJfqWGgCi5IrxlFpN9arJc7JnP0gCVwOlnuJ_8BA>
    <xmx:28ZDaW8x_MNLpH_gvIPSydRn1Oxq4VIuot4c-gyvDK1ojt2oOdljwQ>
    <xmx:28ZDaYMv8CQExp0AUKVWhGPIMDC66fwr1u9bQ-Paapulqomq_rU8JQ>
    <xmx:28ZDaQlMxy_vd7Y9jFbADfvmvXTPmU_Nc3DIq04M5dpRvhc5Lkr_GE4M>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 04:18:18 -0500 (EST)
Date: Thu, 18 Dec 2025 18:18:17 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	acourbot@nvidia.com, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org, Brian Cain <bcain@kernel.org>,
	linux-hexagon@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 0/4] rust: Add i8/i16 atomic xchg helpers
Message-ID: <aUPG2Q_sSPDnlQ0G@tardis-2.local>
References: <20251217213742.639812-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251217213742.639812-1-fujita.tomonori@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_011823_035235_27BB9D32 
X-CRM114-Status: GOOD (  13.99  )
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

[Cc parisc, sparc32, arc and hexagon]

On Thu, Dec 18, 2025 at 06:37:38AM +0900, FUJITA Tomonori wrote:
> This adds atomic xchg helpers with full, acquire, release, and relaxed
> orderings in preparation for i8/i16 atomic xchg support.
> 
> The architectures supporting Rust, implement atomic xchg families
> using architecture-specific instructions. So the helpers just call
> them.
> 
> Note that the architectures that support Rust handle xchg differently:
> 
> - arm64 and riscv support xchg with all the orderings.
> 
> - x86_64 and loongarch support only full-ordering xchg. They calls the
>   full-ordering xchg for any orderings.
> 
> - arm v7 supports only relaxed-odering xchg. It uses __atomic_op_
>  macros to add barriers properly.
> 

Thanks for the work! And please do Cc linux-arch next time when doing
architecture-related changes. We would get more experts to take a look.

I think the current implementation expects that xchg() work with normal
store/load, and that requires ARCH_SUPPORTS_ATOMIC_RMW. So could you add
a comment saying the current implementation only support
ARCH_SUPPORTS_ATOMIC_RMW architectures? And when you wire up the rust
helpers, I think using #[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)] is a good
idea. This will at least let the !ARCH_SUPPORTS_ATOMIC_RMW archs know
that something is missing here.

Regards,
Boqun

> FUJITA Tomonori (4):
>   rust: helpers: Add i8/i16 atomic xchg helpers
>   rust: helpers: Add i8/i16 atomic xchg_acquire helpers
>   rust: helpers: Add i8/i16 atomic xchg_release helpers
>   rust: helpers: Add i8/i16 atomic xchg_relaxed helpers
> 
>  rust/helpers/atomic_ext.c | 41 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> 
> base-commit: 02c5c8c11bbd34cdd9c566dd4ecca48995c09621
> -- 
> 2.43.0
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
