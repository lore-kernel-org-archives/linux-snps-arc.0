Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8550EC88E53
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4Hq8AxhpZFf1iuvAHEIFlXLxlX2fVGk1IdBLqk2NwU=; b=JSZ3lalc7XIWdi
	wYg2hAE9k+kzDUdsGCNsUfi3ytdiCpPZONEBrCvhIUwzE1wBIMheVkLVZr77s9dhu50mdVtoAVGyt
	A0CPNVh8ly/HkIhHCg1tkdlDax3bxWKjagryPuGAvoafDrZkVZNEKNboi6K7E7dJM99SR7y6P8ZH3
	Ccpk+984KnW1ktDJWUvgg2qFPu+bRawcASczLJrvj3bT0XWn8Sst3GR+8nFpc+PVJsHVzsYcrwAQl
	57nALvSWwioEAF74csMUIwq31HCIGzBu+7TpWuxjVFDI2h75bjYfSxbHRBRpkOAVoYa9m6yovWBQW
	I+/J9Zo1StsHR1Rd1Qng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Re2-00000006Hw1-0rSc;
	Tue, 15 Sep 2026 11:48:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Re0-00000006HuS-33xv;
	Tue, 15 Sep 2026 11:48:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7623741342;
	Tue, 15 Sep 2026 11:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973821F000FF;
	Tue, 15 Sep 2026 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789472892;
	bh=+hCyRfdYxaDHjUjrbC2f1l+hk2nsMICX165AMlBJOFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XT+DfR2fI9lSDVHTRxc8fxOJ84VdAucgEp1D7Rsg22J1SRRtMEiE19TvXZrbO4lIZ
	 TxJ/l2gehvn5l2kdO5dHi1/HiNiTrodHb341ROtDKEQB4TK5qE077C+sr6m2ZRGq1A
	 YhT5vOmSLIZn+aB2D2xVS3UmQD+O73OuHKWdb/9Q6SJtudR7Vr4EWHcVJIUSGq4wWb
	 EwguAAzu7/EG5DnE1SXHjXkeQUDSQ1mouWrUTfOdgFhzkd3ZU0wbFF/c3Yr6mjzm+T
	 iHVYaDYddqfXs43IVkcTAt+29bmm0zSxlyvXzfaYtnXgwc/VcrMwi/snt2mFoFeFgS
	 xEBfPHquaOhWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 06/50] arm64: commit fds on syscall exit
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: "David Airlie" <airlied@redhat.com>, linux-parisc@vger.kernel.org, virtualization@lists.linux.dev, linux-mips@vger.kernel.org, "Oleg
 Nesterov" <oleg@redhat.com>, dri-devel@lists.freedesktop.org, "Jens Axboe" <axboe@kernel.dk>, linux-um@lists.infradead.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Eugenio
 Perez" <eperezma@redhat.com>, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org, linux-csky@vger.kernel.org, linux-sh@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, linux-snps-arc@lists.infradead.org, kexec@lists.infradead.org, "Ingo
 Molnar" <mingo@redhat.com>, io-uring@vger.kernel.org, kvm@vger.kernel.org, linux-hexagon@vger.kernel.org, bpf@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, linux-mm@kvack.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-openrisc@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, "Jan Kara" <jack@suse.cz>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-6-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-6-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:48:10 +0000
Message-Id: <20260915114810.973821F000FF@smtp.kernel.org>
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

PiBBZGQgVElGX0ZEX1NMT1RTIHRvIHRoZSBzeXNjYWxsIHdvcmsgYml0cy4gZWwwX3N2Y19jb21t
b24oKSByZXJlYWRzCj4gdGhlIGZsYWdzIGFmdGVyIHRoZSBzeXN0ZW0gY2FsbCBhbmQgdGFrZXMg
dGhlIHRyYWNlIGV4aXQgZm9yIGFueSBvZgo+IHRoZW0uIFNvIGEgdGFzayB0aGF0IHJlc2VydmVk
IGRlc2NyaXB0b3JzIGVuZHMgdXAgaW4KPiBzeXNjYWxsX3RyYWNlX2V4aXQoKSB3aGljaCBjb21t
aXRzIHRoZW0gYmVmb3JlIGF1ZGl0IGFuZCB0aGUgcHRyYWNlIGV4aXQKPiBzdG9wLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBCcmF1bmVyIChBbXV0YWJsZSkgPGJyYXVuZXJAa2VybmVs
Lm9yZz4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vl
cy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE1LXdvcmstZmQtcmVzZXJ2ZS11bmlmeS1mb2xkZWQt
djEtMC00ZDUyMTdkNmIyNDZAa2VybmVsLm9yZz9wYXJ0PTYKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QK
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
