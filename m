Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3218C88E53
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2/06q7J4QoTIkDPTx7bXyEK7ZZHpNKSQztPJdpqVxY=; b=ysa5DubYZ91Co+
	uOaOiUdhVuIQYWg19CCbtiIjDvZHEuk+acZNufu7x6BONXp7F4FlT7AvnTIaKhpOwsp7Pm2jj92fd
	ig07WgsHpxr4dgSXWffiNL/I3bmz6J2rVP+dxXNTKngIaBSNURpqnlO2d7gCzlMA6UgggGHJt9KvS
	Uf9eP4wRE4oDiO8UqeE8v19Ru14Upczlo56UJ4h3zTXWM6zFyCv2/CXc4SvM/HxB6edIVEYutATvV
	B3GlXy9G1rEB6l6tB1KnASbCEXg2YwdHo7gRlWm5TxWdMPUZ0rTn+Kju1CoMJYKPDE30m2W17LBJk
	Lnwg52d7R1TltGeyVUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S8Y-00000006Sqe-1CxD;
	Tue, 15 Sep 2026 12:19:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S8W-00000006Sps-2MSF;
	Tue, 15 Sep 2026 12:19:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5176C4069F;
	Tue, 15 Sep 2026 12:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B431F00893;
	Tue, 15 Sep 2026 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789474784;
	bh=s+9PDH0CZ1Vr08YyoCof+UTThGpQ93yPbrI7mSCf5jg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m0z6lytA0Lb7PeCTJJ9wan77NmP+WaqiiLFqlwKeXKPuaHqeXDGZgjSEE5Nqy5ZTD
	 uXplubyhODu8Q/NNq14/kXJbT/9AFQwToWT9BIY9E7L4zCHdhq4qOYWiAgbLHBLAxF
	 XtT+b1kvKyB39r1HyAihRAZd/uoRrMfxf0YZCrLmFzS7pKcK/CRl1fiGl+0H5LKWhV
	 PlUaIzcMF+cm9TI4V6HSienMOrDlPf4JHELixv0sjOAXsqO+TJlLMDqNaOXk1sfBNv
	 cjEFW+zAMBlSevojGz84ZSkbXhlbmUkgsft9l8Pqsgamb08/hqshJfCjYTrtd+Gp+Z
	 XZIjfnkZC6SUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 50/50] Drivers: hv: mshv: stop putting
 descriptors back on failure
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: "Alexander Viro" <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, virtualization@lists.linux.dev, "Peter Zijlstra" <peterz@infradead.org>, kexec@lists.infradead.org, linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-fsdevel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, "Oleg Nesterov" <oleg@redhat.com>, linux-csky@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, "Ingo
 Molnar" <mingo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, linux-m68k@lists.linux-m68k.org, "Jens
 Axboe" <axboe@kernel.dk>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-um@lists.infradead.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-mm@kvack.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-50-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-50-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 12:19:41 +0000
Message-Id: <20260915121942.11B431F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

PiBSZWx5IG9uIHRoZSBmZCBleGl0IHBhdGggbWFjaGluZXJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBCcmF1bmVyIChBbXV0YWJsZSkgPGJyYXVuZXJAa2VybmVsLm9yZz4KClNhc2hp
a28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3Mg
Z3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwOTE1LXdvcmstZmQtcmVzZXJ2ZS11bmlmeS1mb2xkZWQtdjEtMC00ZDUyMTdk
NmIyNDZAa2VybmVsLm9yZz9wYXJ0PTUwCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
