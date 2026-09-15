Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BD8C88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzgD5nD7mqfqN4NDtQxASsRG7YAgK6mT3O1ESluJYws=; b=3Et3A7cCVuTJoc
	/fejnSSI4dHJCpa3F4tays1gV2FZm111Hm2ttLoHsph2LJj8/cuVqizkzGx700heghnNaersVh9V8
	QuzmdA/8Ji1rP5VYlh5mGfDfKZbTslD+dlRIseQRm9pk7ZokIrlntuJyt+bnmP1aM0Jsa40+vndMi
	SP86BRbNAIrjJYKn15lFJ5aTWMzmLf5gVzsGZap2dmVn7GK/MzmkbtENJilphATATUr3+SodDbeTh
	9gcXha1YOK8zBAgk+2ci2s71ViciXtxvk9B3dFSSs+Ayp/eVglsqyclLhzND9/L/b/WuNLCunMHQU
	Aj7zMYORgXZ7xQFbValQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rkn-00000006KAz-1yPl;
	Tue, 15 Sep 2026 11:55:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rkg-00000006K4h-14v3;
	Tue, 15 Sep 2026 11:55:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05F6A44503;
	Tue, 15 Sep 2026 11:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148F91F00893;
	Tue, 15 Sep 2026 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473305;
	bh=z5q8YTazTS0g58MAO23KPqH00t77+r0Qm1szy+uSGx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZuWOcXAxSUf8U369yMDLM5CrTH3NJo6vFF48Zf7qsB7e9dLLAU7rmbvFKGtSwEN54
	 mrXyu8/sUo7qSyMhvbEGo+56h3zo92SZrUdXQDVHKmZsSL1yip9FieQwDFx3xFr6W4
	 tBOqKBhe78D3RbDLNy/MZGAQn79PhMCfv5ZbZLoxyQiJCVFGpeYe2T3W8SPiGli1OE
	 NJ9s1R/i1hoZ9yPqcd3D1GgTWMiPLPMS4hdNI6X7OCZH/p2PAhMdHWisK0u0w1/QXC
	 YOxwO8oP0q6Czx2WnOyHnYHMCetkSnm/+kFJHxdJpz1jYA9qFglwCwZ6hc4JzfujT3
	 h2LUQd6qFe6SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 01/50] file: install files on syscall exit
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, kvm@vger.kernel.org, bpf@vger.kernel.org, io-uring@vger.kernel.org, linux-alpha@vger.kernel.org, kexec@lists.infradead.org, "Jens
 Axboe" <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>, dri-devel@lists.freedesktop.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-openrisc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-hexagon@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, "Ingo Molnar" <mingo@redhat.com>, "Oleg Nesterov" <oleg@redhat.com>, "David
 Airlie" <airlied@redhat.com>, "Eugenio Perez" <eperezma@redhat.com>, linux-csky@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-mips@vger.kernel.org, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, "Peter
 Zijlstra" <peterz@infradead.org>, virtualization@lists.linux.dev, "Jan Kara" <jack@suse.cz>, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-1-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-1-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:55:03 +0000
Message-Id: <20260915115504.148F91F00893@smtp.kernel.org>
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

PiBTbyB3ZSd2ZSBzcG9rZW4gYWJvdXQgdGhpcyBpZGVhIHF1aXRlIGEgZmV3IHRpbWVzIG92ZXIg
dGhlIHllYXJzIHRoYXQKPiB3ZSBjb3VsZCByZXNlcnZlIGZkcyBhbmQgZmlsZXMgb24gYSB0YXNr
IGFuZCB0aGVuIGluc3RhbGwgb3IgYSBjbGVhbgo+IHRoZW0gdXAgb24gc3lzY2FsbCBzdWNjZXNz
IG9yIGVycm9yIGFuZCBnZXQgcmlkIG9mIG1vc3Qgb2YgdGhlCj4gY29tcGxpY2F0ZWQgY2xlYW51
cCBkYW5jZSB0aGF0IHdlIGhhdmUuCj4gCj4gTXkgb3JpZ2luYWwgYXBwcm9hY2ggdG8gdGhpcyBo
YWQgYmVlbiB0byBpbXBsZW1lbnQgRkRfUFJFUEFSRSgpIGJhc2VkIG9uCj4gY2xlYW51cCBndWFy
ZHMgYW5kIHVzZSBzY29wZXMgdG8gbWFrZSB0aGlzIGhhcHBlbi4gVGhlIG90aGVyIGlkZWEgd2Fz
Cj4gd2hhdCBJJ20gaWxsdXN0cmF0aW5nIGhlcmUuIEl0IGlzIG92ZXJhbGwgZXF1YWxseSByb2J1
c3QgYW5kIG1ha2VzIHRoZQo+IGluc3RhbGwgZmQgYW5kIGZpbGUgcGF0dGVybiB3b3JrIGV2ZW4g
aWYgaXQgdGhlcmUncyBhIHRvbiBvZiBjbGVhbnVwIG9yCj4gc2V0dXAgd29yayBoYXBwZW5pbmcg
aW4gdGhlIG1pZGRsZS4gVGhpcyBpcyBwYXJ0aWN1bGFyIGV2aWRlbnQgaW4gdGhlCj4gY29udmVy
c2lvbnMgb2YgdmFyaW91cyBkbWEvZHJtIGNvZGUgbGF0ZXIgaW4gdGhlIHNlcmllcy4KPiAKPiBT
byB0aGlzIGxldHMgdGhlIHN5c2NhbGwgcGF0aCBkbyB0aGUgaW5zdGFsbC4gZmRfcHJlcGFyZSgp
IGFsbG9jYXRlcyBhCj4gZGVzY3JpcHRvciBsaWtlIGdldF91bnVzZWRfZmRfZmxhZ3MoKSBkb2Vz
IGFuZCByZWNvcmRzIGl0IGluIGEgc2xvdCBvbgo+IHRoZSB0YXNrLiBmZF9zdGFnZSgpIGF0dGFj
aGVzIHRoZSBmaWxlIHRvIHRoYXQgc2xvdCBhbmQgcmV0dXJucyB0aGUKPiBbIC4uLiBdCj4gZmR0
YWdibGUgd2l0aCBvdXRzdGFuZGluZyByZXNlcnZhdGlvbnMuIEtlcm5lbCB0aHJlYWRzIG5ldmVy
IHJldHVybiB0bwo+IHVzZXJzcGFjZSBzbyBub3RoaW5nIHdvdWxkIGNvbW1pdC4gQW55dGhpbmcg
bGVmdCBhdCBleGl0IGlzIGEgYnVnIGFuZAo+IGdldHMgd2FybmVkIGFib3V0IGFuZCBkcm9wcGVk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBCcmF1bmVyIChBbXV0YWJsZSkgPGJyYXVu
ZXJAa2VybmVsLm9yZz4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5k
IG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE1LXdvcmstZmQtcmVzZXJ2ZS11bmlm
eS1mb2xkZWQtdjEtMC00ZDUyMTdkNmIyNDZAa2VybmVsLm9yZz9wYXJ0PTEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
