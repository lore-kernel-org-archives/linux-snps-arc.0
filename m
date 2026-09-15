Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F157C982C3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/H0+PIMV7ykKlaBTJNx0YGDdLCNhS3Bry4ERrPRhGEo=; b=OLUAgToJsk3XYt
	MruyzP+GIJNVyV6I3dAM6SUfsJXpHd1qOnfqQsrn7Tczkop8oiVPBxCofnqA7cnepJ/X/wd3au9d8
	/+uuD3Q+fuaqkqokrF6iyv/Ccld/k1F273QEirFL1IRHovXRcjoWf8PnP2fXwFDT8mA7bbBosXGZv
	w0NtFk3QLADD6hBgbJYCkBwH5J8Ipvyx4Np9r6+AHkxzPyKwY49Qrq1Ssx53PQWzya5Kprr+ft4jN
	NPg7VAr6zAV9U3ipJmeT+qTQWXsG/oeoyiENDUwFgDfYthksbOuRGTrz2WGbsJQFGcWlOvcldL8VU
	TNOHvS+64LrO8bU36zow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RpR-00000006LlQ-3AVb;
	Tue, 15 Sep 2026 12:00:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RpN-00000006Lgs-1PMB;
	Tue, 15 Sep 2026 11:59:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A98B602BE;
	Tue, 15 Sep 2026 11:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B93C1F00893;
	Tue, 15 Sep 2026 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473596;
	bh=XROzleDAWNHKip4xHBVteIb0cCuN7FAQoMQU9zewp/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LuDfDBIpgc+rUudqugD7YWLMIYTyPSh1djqeFTSZvIqwl+MCFr2F9Jod5sQ3BdeBH
	 Fs4P2kaC4Rq/e2WctPCUaANEEugIP/+ZEAefkQjg3r930Bx3+wPmgnd43osNu5U8C9
	 EyuNiUbu78gNfTdrTeVFFD2nhC1r5SHLm94AIfGff4/9p19OhtUCSOkAUYL8ijEd9H
	 l9DN/Fa9wQdaggqiklG21wysLrbu7J9tNRHYcAgnuhIFYUQdGWbvPhv23a8BBnteix
	 dj3Dz8036WkGhtwkv8ziLkCVxCa1RZBk5Y1nQhcVea1ZYeF0cF/u11/S008mj3HeiR
	 /EId/I6+w1CIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 05/50] ARM: commit fds on syscall exit
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-um@lists.infradead.org, linux-openrisc@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, "Peter Zijlstra" <peterz@infradead.org>, bpf@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-gpio@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, virtualization@lists.linux.dev, "Jan Kara" <jack@suse.cz>, "Oleg
 Nesterov" <oleg@redhat.com>, linux-hyperv@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-alpha@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org, io-uring@vger.kernel.org, "Ingo
 Molnar" <mingo@redhat.com>, kvm@vger.kernel.org, "Jens Axboe" <axboe@kernel.dk>, "David
 Airlie" <airlied@redhat.com>, linuxppc-dev@lists.ozlabs.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, "Jann Horn" <jannh@google.com>, linux-sh@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org, linux-mips@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, kexec@lists.infradead.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-5-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-5-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:59:54 +0000
Message-Id: <20260915115954.7B93C1F00893@smtp.kernel.org>
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gYXJtOiByZWR1bmRhbnQg
VElGX0ZEX1NMT1RTIGNoZWNrIGR1ZSB0byBiaXQtc2hpZnQgb3ZlcmxhcAotLQoKY29tbWl0IGJk
ZjUyNjM1MTc3ZjU3NWMxYjU4Y2RiN2U5MDIzODY1NTFhMzY2NDcKQXV0aG9yOiBDaHJpc3RpYW4g
QnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgoKQVJNOiBjb21taXQgZmRzIG9uIHN5c2NhbGwg
ZXhpdAoKQWRkIFRJRl9GRF9TTE9UUyBhbmQgdGVzdCBpdCB3aGVyZSB0aGUgc3lzY2FsbCByZXR1
cm4gcGF0aCBkZWNpZGVzCmJldHdlZW4gdGhlIHN5c2NhbGwgd29yayBhbmQgdGhlIHBsYWluIHdv
cmsgcGVuZGluZyBzbG93IHBhdGguIEEgdGFzawp0aGF0IHJlc2VydmVkIGRlc2NyaXB0b3JzIGdv
ZXMgdGhyb3VnaCBfX3N5c190cmFjZV9yZXR1cm5fbm9zYXZlCndoZXJlIHN5c2NhbGxfdHJhY2Vf
ZXhpdCgpIGNvbW1pdHMgdGhlbSBiZWZvcmUgYXVkaXQgYW5kIHRoZSBwdHJhY2UKZXhpdCBzdG9w
LgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0va2VybmVsL2VudHJ5LWNvbW1vbi5TIGIvYXJjaC9h
cm0va2VybmVsL2VudHJ5LWNvbW1vbi5TCj4gaW5kZXggODgzMzZhMTI5MmJiNy4uNTlhNzBkOTBi
MGI2MSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9rZXJuZWwvZW50cnktY29tbW9uLlMKPiArKysg
Yi9hcmNoL2FybS9rZXJuZWwvZW50cnktY29tbW9uLlMKClsgLi4uIF0KCj4gQEAgLTgzLDYgKzgz
LDggQEAgRU5EUFJPQyhyZXRfZmFzdF9zeXNjYWxsKQo+ICAKPiAgCXRzdAlyMSwgI19USUZfU1lT
Q0FMTF9XT1JLCj4gIAlibmUJX19zeXNfdHJhY2VfcmV0dXJuX25vc2F2ZQo+ICsJdHN0CXIxLCAj
KF9USUZfRkRfU0xPVFMgPDwgMTYpCUAgcjEgaG9sZHMgVElfRkxBR1MgPDwgMTYKPiArCWJuZQlf
X3N5c190cmFjZV9yZXR1cm5fbm9zYXZlCgpbU2V2ZXJpdHk6IExvd10KSXMgdGhpcyBuZXdseSBh
ZGRlZCBjaGVjayByZWFjaGFibGU/CgpUaGUgcHJlY2VkaW5nIHRzdCByMSwgI19USUZfU1lTQ0FM
TF9XT1JLIGluc3RydWN0aW9uIGFwcGVhcnMgdG8gaW50ZXJjZXB0CnRoZSBicmFuY2ggYmVjYXVz
ZSBpdCBpbmFkdmVydGVudGx5IGNhdGNoZXMgdGhpcyBjb25kaXRpb24uCgpJbiByZXRfZmFzdF9z
eXNjYWxsLCByMSBpcyBsb2FkZWQgd2l0aCBUSV9GTEFHUyA8PCAxNi4gVElGX0ZEX1NMT1RTIGlz
CmJpdCA1LCBzbyBzaGlmdGluZyBpdCBieSAxNiBwbGFjZXMgaXQgYXQgYml0IDIxIGluIHIxLgoK
X1RJRl9TWVNDQUxMX1dPUksgbmF0dXJhbGx5IGluY2x1ZGVzIGJpdCAyMSAoX1RJRl9TWVNDQUxM
X0FVRElUKS4gQmVjYXVzZSBvZgp0aGlzIGJpdC1zaGlmdCBvdmVybGFwLCB0aGUgZmlyc3QgdGVz
dCBhZ2FpbnN0IF9USUZfU1lTQ0FMTF9XT1JLIHdpbGwKZXZhbHVhdGUgdG8gbm9uLXplcm8gd2hl
bmV2ZXIgVElGX0ZEX1NMT1RTIGlzIHNldC4gVGhpcyBtZWFucyB0aGUgYnJhbmNoIHRvCl9fc3lz
X3RyYWNlX3JldHVybl9ub3NhdmUgaXMgdGFrZW4gZWFybHksIG1ha2luZyB0aGUgbmV3IHRzdCBp
bnN0cnVjdGlvbgp1bnJlYWNoYWJsZSBkZWFkIGNvZGUuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE1LXdvcmstZmQtcmVzZXJ2
ZS11bmlmeS1mb2xkZWQtdjEtMC00ZDUyMTdkNmIyNDZAa2VybmVsLm9yZz9wYXJ0PTUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJj
IG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
