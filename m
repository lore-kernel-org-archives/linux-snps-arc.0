Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F3C88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXLX9VbPW7Hqxq4Z2nsvu12VWJBDRY38XfkaiXM54zI=; b=nXSfaHHamnxC8C
	+KhPaCGOkpVgKmO2lCXwG07zsgCfqEo6uR8v2d5NsnB0Xo1fv2FeNbCJW+6UWLWUGKQau0lg7Fwis
	XwSCjHSGPrFiM8zUS3r+Cu/Lq9t4iccS1XkzNnHiPdZJOiHOiC7cwOd1JegE6Enm2uI18ZaXI2z5+
	alEtPEgcWDNrqxu6cVMF4qTgpvyZ3BxYGlXbRefkM7lFVCxImoPpMmj4UFXF4lHnzUe8T/KgrD7jq
	LPdEX77hKdySMyIn4Pp3m2SxBk4B48Uzj7M9LLc8ppVx8XLsIfYXw+jnbIK55CRzLl23VTzjpM74B
	BBQlJ2CX3nm2pIlMHVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rft-00000006IiE-08l7;
	Tue, 15 Sep 2026 11:50:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rfs-00000006IhL-0lk5;
	Tue, 15 Sep 2026 11:50:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D088C414F1;
	Tue, 15 Sep 2026 11:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA52D1F00898;
	Tue, 15 Sep 2026 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473007;
	bh=Wvy04NbJid/rHT9Oo2y6und5H0C/2sS7C4rNvZsUJ+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FZyLQujgrSLTLItt0atdLygYtPLJy07BtTpqJEj8tK4rCFepTR6WTdgjVU1CUaviY
	 /2kxpiaHyjwEq8od5PpCP63amvdhTsJyZVoAXJVFzklNTY1gegcdWYDDoR+/XePScz
	 MHrJT4NoUt8HIfXHRaVC5PMjCIQJVPlEkfbh8gaQY1dgXLLaPf3I5PVcxiOdPbdNhp
	 egKHXLxlo+8hU8IJMPwEDm1igMoQNQ50LWjgaSmTwzy6Kkr1xxWZeZvflO3a23mVwB
	 kOkyNkCaEN1wr6HpAzVJp/5fzNLTwrIjdFvuyd/aBdf6hTcIxBdJ3Y3aTJX6C30ppL
	 nzwCXruPvLzow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 09/50] m68k: commit fds on syscall exit
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: kexec@lists.infradead.org, linux-openrisc@vger.kernel.org, io-uring@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-mm@kvack.org, linux-sh@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, bpf@vger.kernel.org, linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-hexagon@vger.kernel.org, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, "Ingo
 Molnar" <mingo@redhat.com>, linux-um@lists.infradead.org, "Michael S.
 Tsirkin" <mst@redhat.com>, linux-parisc@vger.kernel.org, "Peter Zijlstra" <peterz@infradead.org>, "Jan
 Kara" <jack@suse.cz>, dri-devel@lists.freedesktop.org, =?utf-8?b?Q2hy?=
 =?utf-8?b?aXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>, "Oleg Nesterov" <oleg@redhat.com>, linux-fsdevel@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-9-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-9-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:50:04 +0000
Message-Id: <20260915115004.CA52D1F00898@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG02OGs6IHNpbmdsZS1z
dGVwIFNJR1RSQVAgbG9zdCBvbiBmZC1hbGxvY2F0aW5nIHN5c2NhbGxzCi0tCgpjb21taXQgNzMx
YjEzODdmYzc2ZDkyZDE2NWVlMWYyOGRlNjk0ZTNkMjI4NjI3YgpBdXRob3I6IENocmlzdGlhbiBC
cmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+CgptNjhrOiBjb21taXQgZmRzIG9uIHN5c2NhbGwg
ZXhpdAoKQWRkIFRJRl9GRF9TTE9UUyBhbmQgdGVzdCBpdCBvbiB0aGUgdW50cmFjZWQgcmV0dXJu
IGZyb20gYSBzeXN0ZW0KY2FsbCBpbiBhbGwgdGhyZWUgZW50cnkgcGF0aHMuIEEgdGFzayB0aGF0
IHJlc2VydmVkIGRlc2NyaXB0b3JzIGNhbGxzCnN5c2NhbGxfdHJhY2VfbGVhdmUoKSwgd2hpY2gg
Y29tbWl0cyB0aGVtIGJlZm9yZSB0aGUgcHRyYWNlIGV4aXQgc3RvcC4KClsgLi4uIF0KCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvbTY4ay9rZXJuZWwvZW50cnkuUyBiL2FyY2gvbTY4ay9rZXJuZWwvZW50
cnkuUwo+IGluZGV4IDMzOGI0NzQ5MTBmNzQuLjllNDQ3MWY2ODE2NTIgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9tNjhrL2tlcm5lbC9lbnRyeS5TCj4gKysrIGIvYXJjaC9tNjhrL2tlcm5lbC9lbnRyeS5T
Cj4gQEAgLTIyOSw2ICsyMjksOCBAQCByZXRfZnJvbV9zeXNjYWxsOgo+ICBzeXNjYWxsX2V4aXRf
d29yazoKPiAgCWJ0c3QJIzUsJXNwQChQVF9PRkZfU1IpCXwgY2hlY2sgaWYgcmV0dXJuaW5nIHRv
IGtlcm5lbAo+ICAJYm5lcwkxYgkJCXwgaWYgc28sIHNraXAgcmVzY2hlZCwgc2lnbmFscwo+ICsJ
YnRzdAkjNCwlYTFAKFRJTkZPX0ZMQUdTKzIpCXwgVElGX0ZEX1NMT1RTOiBjb21taXQgZGVzY3Jp
cHRvcnMKPiArCWpuZQlkb190cmFjZV9leGl0CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBu
ZXcgYnJhbmNoIGNhdXNlIGRlbGF5ZWQgdHJhY2UgKHNpbmdsZS1zdGVwKSBTSUdUUkFQcyB0byBi
ZSBsb3N0PyAKCklmIGEgcHJvY2VzcyBpcyBiZWluZyBzaW5nbGUtc3RlcHBlZCAoVElGX0RFTEFZ
RURfVFJBQ0UgaXMgc2V0KSBhbmQgZXhlY3V0ZXMgYSAKc3lzY2FsbCB0aGF0IGFsbG9jYXRlcyBm
aWxlIGRlc2NyaXB0b3JzIChUSUZfRkRfU0xPVFMgaXMgc2V0KSwgdGhpcyAKdW5jb25kaXRpb25h
bGx5IGJyYW5jaGVzIHRvIGRvX3RyYWNlX2V4aXQuIAoKTG9va2luZyBhdCBkb190cmFjZV9leGl0
LCBpdCBleGVjdXRlcyBzeXNjYWxsX3RyYWNlX2xlYXZlKCkgYW5kIHRoZW4gZGlyZWN0bHkKanVt
cHMgdG8gdGhlIGV4Y2VwdGlvbiByZXR1cm4gcGF0aCwgYnlwYXNzaW5nIHRoZSBqbWkgZG9fZGVs
YXllZF90cmFjZSBsb2dpYyAKY29tcGxldGVseS4gCgpUaGlzIG1lYW5zIHNpbmdsZS1zdGVwcGlu
ZyBvdmVyIGEgc3lzdGVtIGNhbGwgbGlrZSBvcGVuKCkgY291bGQgZmFpbCB0byAKZGVsaXZlciB0
aGUgZXhwZWN0ZWQgU0lHVFJBUCwgd2hpY2ggbWlnaHQgYnJlYWsgZGVidWdnZXIgZnVuY3Rpb25h
bGl0eS4KCj4gIAlsc2x3CSMxLCVkMAo+ICAJamNzCWRvX3RyYWNlX2V4aXQKPiAgCWptaQlkb19k
ZWxheWVkX3RyYWNlCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYwOTE1LXdvcmstZmQtcmVzZXJ2ZS11bmlmeS1mb2xkZWQtdjEtMC00
ZDUyMTdkNmIyNDZAa2VybmVsLm9yZz9wYXJ0PTkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
