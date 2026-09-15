Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED5BC88E53
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51j8Ek5Ale2kRlpzShLL5N+wt+Z1uG4QjqNfeThPrhE=; b=4PCbgb0W5JpGhV
	bJU+5/OlKoHs2NI6mmKrjfMR2qMRuBJfPqCskf+1hvCWMlJmTKYVIeI9pMjfUANGELnbqZf7GHx1t
	nvKDskyDTFKpx3WVxxIInnunjUvESTlKIYywPSoelkW/bvgRII3FejzTlIezlYvyZEWLIqIYo7oa6
	AbtJYbqYEzMSSYmrl9K9ocTuVh51SXc7kvnzMXox5TH+tGIGFdEPIetYYki7TezMZ5WnVe/0aw3C3
	T/536CdYghninpjeh7CNfiL9r8HoXR2uQcyd3HdLTyOQ2QYEMbPRYd5/tHZYtYV5HLNNzB3H53Pjp
	eaRHTNWXCVLXlVF4a1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rju-00000006JqO-0TSi;
	Tue, 15 Sep 2026 11:54:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rjl-00000006JkT-2aVF;
	Tue, 15 Sep 2026 11:54:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4552C43CEC;
	Tue, 15 Sep 2026 11:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8371F000FF;
	Tue, 15 Sep 2026 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473249;
	bh=rEaooNHHSzMvHYDvwYrru6UOPRcxabqKjG95OLRLlN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dEjnjHjNvNIuSaPYTHfj4KVcRdWnf0KMr5ngwYgP13UVEN4ixsOjP/LGTY00a1F7i
	 SrECUFxW1WISw+Sb9e943yH6GxglJXZz6/98X328DvWbvebyYY0VweNP2I8cG1QByw
	 Gji9eMFm2AAVp7PkwCHxT4RdIR9rAmD6kZzVeYGbasnMh8yVep7bz3ac2gDe5wmKNa
	 E60wDWY0t8sIf7wr0+2mcu/fK44J9sYDVuZZ9raSVBw8fhzXy625/hIuVibz2cM1G1
	 heryhbL45TCscgniXJxfFQxgFi5MNZtk5vPFvLwJbiB9YO/wiDhzcHs+qEgelm4u1w
	 O3GQp5W8DIzZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 19/50] file: require the syscall exit hook from
 every architecture
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: linux-gpio@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, "Oleg
 Nesterov" <oleg@redhat.com>, linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, virtualization@lists.linux.dev, linux-um@lists.infradead.org, linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, "David
 Airlie" <airlied@redhat.com>, linux-arm-kernel@lists.infradead.org, "Peter
 Zijlstra" <peterz@infradead.org>, linux-csky@vger.kernel.org, linux-hyperv@vger.kernel.org, "Ingo
 Molnar" <mingo@redhat.com>, "Jan Kara" <jack@suse.cz>, linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, linux-hexagon@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>, linux-arm-msm@vger.kernel.org, =?utf-8?b?Q2hy?=
 =?utf-8?b?aXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, kexec@lists.infradead.org, linux-openrisc@vger.kernel.org, bpf@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "Eugenio
 Perez" <eperezma@redhat.com>, io-uring@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-19-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-19-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:54:06 +0000
Message-Id: <20260915115407.5E8371F000FF@smtp.kernel.org>
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

PiBFdmVyeSBhcmNoaXRlY3R1cmUgbm93IGVpdGhlciB1c2VzIHRoZSBnZW5lcmljIGVudHJ5IGNv
ZGUgb3IgcHJvdmlkZXMKPiBUSUZfRkRfU0xPVFMuIFRoZSBmYWxsYmFjayB0aGF0IGRlZmVycmVk
IHdpdGhvdXQgZXZlciBjb21taXR0aW5nCj4gY2FuIGdvLiBNYWtlIGl0IGEgYnVpbGQgZXJyb3Ig
aW5zdGVhZC4gQSBuZXcgYXJjaGl0ZWN0dXJlIGNhbid0IGdyb3cKPiBmZF9wcmVwYXJlKCkgY2Fs
bGVycyB3aXRob3V0IHRoZSBzeXNjYWxsIGV4aXQgaG9vay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gQnJhdW5lciAoQW11dGFibGUpIDxicmF1bmVyQGtlcm5lbC5vcmc+CgpTYXNoaWtv
IGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdy
ZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDkxNS13b3JrLWZkLXJlc2VydmUtdW5pZnktZm9sZGVkLXYxLTAtNGQ1MjE3ZDZi
MjQ2QGtlcm5lbC5vcmc/cGFydD0xOQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
