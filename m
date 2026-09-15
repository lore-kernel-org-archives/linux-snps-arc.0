Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6A8C88E53
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K53IE6JFVtKC9WiaivHgBGlr73grxuCwnZOAwR5R0SQ=; b=x+NTGwq/DOUdmo
	VH5qujv+5OlnTEZ9LGzvUFV7zZc7fNPS+9K/pmLMJQDudUwHLER26iB0uwWcxHNAIMIgz27DK2Imi
	4ggQD/G+cR2/VeG0qTNd9+56BhsAobjYirJjfivQLvmYbcf07hU3eCsyoRUooWgFcPH0dC5Xj/8yd
	rLuiptrbi+1F5mWOHbzxGebxMQ7ooAVvcoNFpzI/v/zu7RWdqbEbaUmlEzWMs+78fSIuZqO+Dm6rU
	7juytRGg2Zfl6vCVcbVev0TTmrgcPPgcuc0PPVnVBAvMXsO7UcuuAbTuIYs8hFkRAXetNJxXBbleh
	4N+ZZFP874delga8XfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RpM-00000006LgA-0lxb;
	Tue, 15 Sep 2026 11:59:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RpK-00000006LfQ-3dFh;
	Tue, 15 Sep 2026 11:59:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30ED7600D1;
	Tue, 15 Sep 2026 11:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1604F1F000FF;
	Tue, 15 Sep 2026 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473593;
	bh=DQgIYhua5CTViS1X9ZXXGfaSPT/5dqgeOOlUNrKnxWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PNkc1SOOx+a0MtActP/scxfu+EOEc0okpYmMq9u2IvQ6wdxXtOCmaRwTaDfxAYQfu
	 KNpmxdQzkwQyaCWqsjPY6fMZbe5ub33vKaPoYJ07B7Q1LWFwdlgiCUvB0QQ8c2qsi1
	 FMsSTqEgiIP1sEOamGDSgZSCZ6TfAMEjISixK2R8eaJA2XnzylLgQ4fdlCaNZFxShP
	 J8hVTu3MQPl0lwmGSaxF9w8s3KltrNP5jpWzkNN2BlxuRXTG4UWjQZqj2E6RzHxSaN
	 2Rs03FwwuFJXXN68mTYzdZ8pV7LyInc7Ptt8ORor8BsaOlsL4d3xo27nPcBZv3oI95
	 0hW/vFstsi8gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 14/50] parisc: commit fds on syscall exit
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: "Peter Zijlstra" <peterz@infradead.org>, linux-sh@vger.kernel.org, virtualization@lists.linux.dev, "Eugenio
 Perez" <eperezma@redhat.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>, "Oleg
 Nesterov" <oleg@redhat.com>, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org, kexec@lists.infradead.org, "David
 Airlie" <airlied@redhat.com>, linux-um@lists.infradead.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-alpha@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, "Jan Kara" <jack@suse.cz>, "Jens Axboe" <axboe@kernel.dk>, linux-arm-msm@vger.kernel.org, linux-parisc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, "Ingo
 Molnar" <mingo@redhat.com>, linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-openrisc@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, "Jann
 Horn" <jannh@google.com>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-14-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-14-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:59:51 +0000
Message-Id: <20260915115952.1604F1F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHBhcmlzYzogc3lzY2Fs
bCBmYXN0IHBhdGggZXhwb3NlcyB1bmluaXRpYWxpemVkIHB0X3JlZ3MgdG8gcHRyYWNlCi0tCgpj
b21taXQgMzhhMTM5ZGY4YzdjNjFlMTFmYzkzMTRiNWY0M2UzNzFjNzFhODM1NgpBdXRob3I6IENo
cmlzdGlhbiBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+CgpwYXJpc2M6IGNvbW1pdCBmZHMg
b24gc3lzY2FsbCBleGl0CgpUaGlzIGNvbW1pdCBhZGRzIFRJRl9GRF9TTE9UUyBhbmQgdGVzdHMg
aXQgaW4gc3lzY2FsbF9leGl0IG9uY2UgdGhlIHJldHVybgp2YWx1ZSBoYXMgYmVlbiBzYXZlZC4g
QSB0YXNrIHRoYXQgcmVzZXJ2ZWQgZGVzY3JpcHRvcnMgY2FsbHMKZG9fc3lzY2FsbF90cmFjZV9l
eGl0KCkgdG8gY29tbWl0IGRlc2NyaXB0b3JzIGFuZCB0aGVuIGNvbnRpbnVlcyB3aXRoIHRoZQp1
c3VhbCBjaGVja3MuCgo+IGRpZmYgLS1naXQgYS9hcmNoL3BhcmlzYy9rZXJuZWwvZW50cnkuUyBi
L2FyY2gvcGFyaXNjL2tlcm5lbC9lbnRyeS5TCj4gaW5kZXggZTA0YzVkODA2YzEwNS4uYzU4MDdj
ZjZmYmQ4ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3BhcmlzYy9rZXJuZWwvZW50cnkuUwo+ICsrKyBi
L2FyY2gvcGFyaXNjL2tlcm5lbC9lbnRyeS5TCgpbIC4uLiBdCgo+IEBAIC0xNzY1LDYgKzE3Njcs
MTYgQEAgc3lzY2FsbF9kb19zaWduYWw6Cj4gIAo+ICAJYixuICAgICBzeXNjYWxsX2NoZWNrX3Np
Zwo+ICAKPiArc3lzY2FsbF9kb19mZF9zbG90czoKPiArCW1mY3RsCSVjcjMwLCVyMQo+ICsjaWZk
ZWYgQ09ORklHXzY0QklUCj4gKwlsZG8JLTE2KCVyMzApLCVyMjkJCQkvKiBSZWZlcmVuY2UgcGFy
YW0gc2F2ZSBhcmVhICovCj4gKyNlbmRpZgo+ICsJbGRvCVRBU0tfUkVHUyglcjEpLCVyMjYJCS8q
IHN0cnVjdCBwdF9yZWdzICpyZWdzICovCj4gKwlCTAlkb19zeXNjYWxsX3RyYWNlX2V4aXQsJXIy
CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBleHBvc2UgdW5pbml0aWFsaXplZCBrZXJuZWwg
c3RhY2sgbWVtb3J5IHRvIGEgdHJhY2VyPwoKV2hlbiBhIHByb2Nlc3MgZXhlY3V0ZXMgYSBzeXN0
ZW0gY2FsbCB0aGF0IHJlc2VydmVzIGEgZmlsZSBkZXNjcmlwdG9yIHNsb3QsCml0IGVudGVycyB2
aWEgdGhlIGZhc3QgcGF0aCB3aGljaCBvbmx5IHNhdmVzIGEgbWluaW1hbCBzZXQgb2YgcmVnaXN0
ZXJzIHRvClRBU0tfUkVHUy4gSWYgVElGX0ZEX1NMT1RTIGlzIHNldCwgdGhlIGZhc3QgcGF0aCBk
aXJlY3RseSBpbnZva2VzCmRvX3N5c2NhbGxfdHJhY2VfZXhpdCgpIGhlcmUgYmVmb3JlIGFsbCBy
ZWdpc3RlcnMgKGxpa2UgJXIzLSVyMTgpIGFyZSBzYXZlZC4KCj4gKwlub3AKPiArCWIsbglzeXNj
YWxsX2NoZWNrX3Jlc2NoZWQKPiArCj4gIHN5c2NhbGxfcmVzdG9yZToKPiAgCW1mY3RsCSVjcjMw
LCVyMQo+ICAKClsgLi4uIF0KCj4gZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2tlcm5lbC9wdHJh
Y2UuYyBiL2FyY2gvcGFyaXNjL2tlcm5lbC9wdHJhY2UuYwo+IGluZGV4IDFkOWUyMTA3MDJlMWYu
LmYxNDI3NjY3OTJhZmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9wYXJpc2Mva2VybmVsL3B0cmFjZS5j
Cj4gKysrIGIvYXJjaC9wYXJpc2Mva2VybmVsL3B0cmFjZS5jCgpbIC4uLiBdCgo+IEBAIC0zODEs
NiArMzgyLDkgQEAgdm9pZCBkb19zeXNjYWxsX3RyYWNlX2V4aXQoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4gIAlpbnQgc3RlcHBpbmcgPSB0ZXN0X3RocmVhZF9mbGFnKFRJRl9TSU5HTEVTVEVQKSB8
fAo+ICAJCXRlc3RfdGhyZWFkX2ZsYWcoVElGX0JMT0NLU1RFUCk7Cj4gIAo+ICsJaWYgKHRlc3Rf
dGhyZWFkX2ZsYWcoVElGX0ZEX1NMT1RTKSkKPiArCQlmZF9zbG90c19jb21taXQocmVncyk7Cj4g
Kwo+ICAJYXVkaXRfc3lzY2FsbF9leGl0KHJlZ3MpOwo+ICAKPiAgI2lmZGVmIENPTkZJR19IQVZF
X1NZU0NBTExfVFJBQ0VQT0lOVFMKClsgLi4uIF0KCj4gIAlpZiAoc3RlcHBpbmcgfHwgdGVzdF90
aHJlYWRfZmxhZyhUSUZfU1lTQ0FMTF9UUkFDRSkpCj4gIAkJcHRyYWNlX3JlcG9ydF9zeXNjYWxs
X2V4aXQocmVncywgc3RlcHBpbmcpOwo+ICB9CgpbU2V2ZXJpdHk6IEhpZ2hdCklmIGEgdHJhY2Vy
IGF0dGFjaGVzIGNvbmN1cnJlbnRseSB3aGlsZSB0aGUgcHJvY2VzcyBpcyBibG9ja2VkIGluIGEg
ZmlsZQpkZXNjcmlwdG9yIGFsbG9jYXRpb24gc3lzY2FsbCwgc2V0dGluZyBUSUZfU1lTQ0FMTF9U
UkFDRSwgd29uJ3QgdGhpcyBjYWxsIHBhc3MKdGhlIGluY29tcGxldGVseSBpbml0aWFsaXplZCBw
dF9yZWdzIGZyb20gdGhlIGZhc3QgcGF0aCB0byB0aGUgdHJhY2luZwpzdWJzeXN0ZW0/CgpUaGlz
IGNvdWxkIGFsbG93IGFuIHVucHJpdmlsZWdlZCB1c2VyIGF0dGFjaGluZyBhIHRyYWNlciB0byB0
aGVpciBvd24gcHJvY2Vzcwp0byByZWFkIHVuaW5pdGlhbGl6ZWQga2VybmVsIG1lbW9yeSB2aWEg
UFRSQUNFX0dFVFJFR1MuIEFsc28sIHRyYWNlcgptb2RpZmljYXRpb25zIHZpYSBQVFJBQ0VfU0VU
UkVHUyB0byB0aGVzZSB1bmluaXRpYWxpemVkIHJlZ2lzdGVycyB3b3VsZCBiZQppZ25vcmVkIGJl
Y2F1c2UgdGhlIGZhc3QgcGF0aCBkb2VzIG5vdCBwcm9wZXJseSByZXN0b3JlIHRoZW0gYmVmb3Jl
IHJldHVybmluZwp0byB1c2Vyc3BhY2UuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE1LXdvcmstZmQtcmVzZXJ2ZS11bmlmeS1m
b2xkZWQtdjEtMC00ZDUyMTdkNmIyNDZAa2VybmVsLm9yZz9wYXJ0PTE0CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
