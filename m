Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC74C88E53
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4B0m/VrsY4F7WMxHxeen2y5ig8Mh/QhJjZ1ywx9/W44=; b=O4jphcqMW8u0W+
	IRQCG/d2xXqE78HQt02xB878Kq2/ZqlPRbhcEaiodU+5kcWIVVSLPt0cj8IjeygZT0Z3/IYzHhSW8
	KqjYZAxM1RDBEqFQSFejCaSDxldGutTn4lh/BwJ5FFgDBQ6VUBODnnfWTMvd022aMr5XS75aVWRcN
	Fnr2CQkAWpaXMP3edGo73HK8qkECWD3HTQCcetmsQaN+1lvaq2z8XXi+hSRPdqcxdMDoikSQ/cI3/
	GKu3ax8YfN86GnnVcuL24+f9EkT7rvjzCs4GFax14HRs0Sg4xLVwhhMv0ubrL9j+gNY5yk3k5e7mh
	MZqabBwfdHV/51rHnoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S0U-00000006PhB-10SD;
	Tue, 15 Sep 2026 12:11:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S0S-00000006Pg9-12Eh;
	Tue, 15 Sep 2026 12:11:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B5A9600D1;
	Tue, 15 Sep 2026 12:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DCB1F000FF;
	Tue, 15 Sep 2026 12:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789474283;
	bh=pymhjA3IHUvfc7ZhMmvcj6PWvzmH+JOQJc7von1cOC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JM7MUu1K3sK0BfbZuufGSUMTjcYng5dpse/wo3EWLf21O2gUgw322DSgVB01AFTtW
	 t52UvxD3bLuUqeuFrp1OK6t6wHAM7ouPbrca6pE9eJrANghgkKMIS9n0Gf/wy0wloB
	 LbU8P8uOHsEx8fNW9Woaznh5JHxhxpBoxXgSLs2p/Y+nXpZgm4aiuBP11/FKE+6Agh
	 dOG9FMxrGVQ/eMMAs/LGH2WwzJPb1jSL8PT90CSvhiLFlxbJWRZR7M9jUUHoxVSb0a
	 49DnQM0TYsO0aM6hSLHh3aoQiYMzGZw+8DgpMeFwYhEfOeLW9W3pCge4KeYSBScMZG
	 GXoCvsjJhnAaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 21/50] io_uring: commit fds per request
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: bpf@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, "Jens Axboe" <axboe@kernel.dk>, linux-m68k@lists.linux-m68k.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "Oleg
 Nesterov" <oleg@redhat.com>, =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRh?=
 =?utf-8?b?YmxlKQ==?= <brauner@kernel.org>, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, io-uring@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, linux-mm@kvack.org, "Alexander Viro" <viro@zeniv.linux.org.uk>, linux-sh@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, linux-snps-arc@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, linux-hyperv@vger.kernel.org, linux-hexagon@vger.kernel.org, "Ingo
 Molnar" <mingo@redhat.com>, linux-openrisc@vger.kernel.org, "Eugenio Perez" <eperezma@redhat.com>, kexec@lists.infradead.org, linux-csky@vger.kernel.org, virtualization@lists.linux.dev
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-21-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-21-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 12:11:20 +0000
Message-Id: <20260915121121.62DCB1F000FF@smtp.kernel.org>
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

PiBpb191cmluZyByZXF1ZXN0cyBkb24ndCBjb21wbGV0ZSBvbiBzeXNjYWxsIGV4aXQgb2YgdGhl
IHRhc2sgdGhhdAo+IHN1Ym1pdHRlZCB0aGVtLiBUaGV5IGNvbXBsZXRlOgo+IAo+IC0gaW5saW5l
IGZyb20gaW9fdXJpbmdfZW50ZXIoKQo+IC0gZnJvbSB0YXNrX3dvcmsgb24gYW55IHJldHVybiB0
byB1c2Vyc3BhY2UKPiAtIGZyb20gaW8td3Egd29ya2VycyBhbmQgZnJvbSB0aGUgU1FQT0xMIHRo
cmVhZAo+IAo+IFRoZSBDUUVzIGFyZSB2aXNpYmxlIHRvIG90aGVyIHRocmVhZHMgYmVmb3JlIGFu
eSBzeXNjYWxsIHJldHVybnMuIFNvCj4gY29tbWl0IHRoZSByZXNlcnZlZCBkZXNjcmlwdG9ycyBi
ZWZvcmUgdGhlIGNvbXBsZXRpb24gaXMgcG9zdGVkLiBDb21taXQKPiB0aGVtIGFmdGVyIC0+aXNz
dWUoKSBiYXNlZCBvbiB0aGUgcmVxdWVzdCdzIHJlc3VsdCBhbmQgYmVmb3JlIGV2ZXJ5IENRRQo+
IHRoZXkgcG9zdC4KPiAKPiBOb3RoaW5nIHJlYWNoYWJsZSBmcm9tIGlvX3VyaW5nIHJlc2VydmVz
IHlldC4gT25jZSBTQ01fUklHSFRTIGlzCj4gY29udmVydGVkIHRoaXMga2VlcHMgSU9SSU5HX09Q
X1JFQ1ZNU0cgd29ya2luZyBmcm9tIGlvLXdxIHdvcmtlcnMgYW5kCj4gdGhlIFNRUE9MTCB0aHJl
YWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKSA8YnJh
dW5lckBrZXJuZWwub3JnPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91
bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTUtd29yay1mZC1yZXNlcnZlLXVu
aWZ5LWZvbGRlZC12MS0wLTRkNTIxN2Q2YjI0NkBrZXJuZWwub3JnP3BhcnQ9MjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
