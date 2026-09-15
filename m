Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1DCC88E7B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5q0WiJ3Us7uB4UwbtZXwSMvZBoKdT6bWCMl3V77jJg=; b=2B96UiAktWxSH/
	R8eyx6e9wK7Ums+yVAIJYfsmMlDJjOe53UVyaoDXWM/Mk1U8Lr2GEnizZInipAFk2TA+LgKpCQxx5
	AEfbaJ0B8mMtZ008UO9lLsxMCLKWcE5obqjT9zG9wVv0sj11RQQdKFipWq16eaTD+N9FQAAypYDy/
	8lI4t/T3nCdzsLi4M8qwJMIbgyITZJt3L8f7QXm9eZO+s/bLTzcUmT+1K++3MsE9COBqvPsL+QeEL
	WbfpeKAw4qRwy8AkbVG+ahTGrefXarVrzgUqemZQju2r1JMPtZDBbPx3W9mnO1g8mk5rT9Pv4kLyA
	0l9Rjnf9kq98ie+xxnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rph-00000006Ltf-0Xmm;
	Tue, 15 Sep 2026 12:00:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rpe-00000006Lrq-0NOg;
	Tue, 15 Sep 2026 12:00:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C51DE41B2F;
	Tue, 15 Sep 2026 12:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59F81F000FF;
	Tue, 15 Sep 2026 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473613;
	bh=lkRrGN3tHH0vPXJQpfXyuI1f/hj84726OJ+wXiSAjkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bdJ8EfCAcKRLCnZZLr9KUFRKwzOp9HwWHqD8dKOgs2QECDixoCiY7OitpfSWybTgc
	 GrKy8T3cB5cVyun9gMM4tiazPAmkuvnRoSJn20gDY30Pi6NZ2BlWie/yV3J02KVzmP
	 +FdO4hMG7v/dI5BZjC8kuRbGxnY1BMC++7JlKDVKVVz2TBx0SWNpwMbRNY+KWbqJrn
	 ewEE2svDPg32d5ej4oQppZf8rSJTrU4fXT0CFb4RwzIPHo6I6kwXfOXCr0tMaXJRUv
	 nQKJqvUmQYSXF6bRUemMO3EjVCVESrcELW0g+JEeeCOWgYbp17E7wf+3S6taJJ6xjy
	 asi0ByODbGixg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 18/50] xtensa: commit fds on syscall exit
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, linux-openrisc@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, linux-hyperv@vger.kernel.org, linux-fsdevel@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, virtualization@lists.linux.dev, "Oleg
 Nesterov" <oleg@redhat.com>, linux-alpha@vger.kernel.org, kexec@lists.infradead.org, "Ingo
 Molnar" <mingo@redhat.com>, dri-devel@lists.freedesktop.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, "Jan
 Kara" <jack@suse.cz>, linux-um@lists.infradead.org, "Eugenio Perez" <eperezma@redhat.com>, "Jann
 Horn" <jannh@google.com>, bpf@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-snps-arc@lists.infradead.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, sparclinux@vger.kernel.org, linux-mips@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-18-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-18-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 12:00:11 +0000
Message-Id: <20260915120011.D59F81F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0geHRlbnNhOiBpbmNv
bnNpc3RlbnQgbWlkLXN5c2NhbGwgcHRyYWNlIGV4aXQgdHJhY2luZyBkdWUgdG8gc3RhbGUgZmxh
Z3MKLS0KCmNvbW1pdCBmNjRjNjlmYmQ2ZmYxYTJlZThkZDI2NjQ1ZjlkNTZkMmQzNzE2NDdlCkF1
dGhvcjogQ2hyaXN0aWFuIEJyYXVuZXIgPGJyYXVuZXJAa2VybmVsLm9yZz4KCnh0ZW5zYTogY29t
bWl0IGZkcyBvbiBzeXNjYWxsIGV4aXQKCkFkZCBUSUZfRkRfU0xPVFMgYW5kIHRlc3QgaXQgb25j
ZSB0aGUgc3lzdGVtIGNhbGwgaGFzIHN0b3JlZCBpdHMKcmV0dXJuIHZhbHVlLiBBIHRhc2sgdGhh
dCByZXNlcnZlZCBkZXNjcmlwdG9ycyB1c2VzIHRoZSB0cmFjZWQgcGF0aC4KClsgLi4uIF0KCj4g
ZGlmZiAtLWdpdCBhL2FyY2gveHRlbnNhL2tlcm5lbC9lbnRyeS5TIGIvYXJjaC94dGVuc2Eva2Vy
bmVsL2VudHJ5LlMKPiBpbmRleCAyNzJmZmY1ODc5MDdmLi40Yjk1ZjQ4NzM2ZTZiIDEwMDY0NAo+
IC0tLSBhL2FyY2gveHRlbnNhL2tlcm5lbC9lbnRyeS5TCj4gKysrIGIvYXJjaC94dGVuc2Eva2Vy
bmVsL2VudHJ5LlMKPiBAQCAtMTk3Niw2ICsxOTc2LDExIEBAIEVOVFJZKHN5c3RlbV9jYWxsKQo+
ICAxOgkvKiByZWdzLT5hcmVnWzJdID0gcmV0dXJuX3ZhbHVlICovCj4gIAo+ICAJczMyaQlhYmlf
cnYsIGFiaV9zYXZlZDAsIFBUX0FSRUcyCj4gKwo+ICsJLyogZGVzY3JpcHRvcnMgcmVzZXJ2ZWQg
YnkgdGhlIHN5c2NhbGwgYXJlIGNvbW1pdHRlZCBpbiBkb19zeXNjYWxsX3RyYWNlX2xlYXZlICov
Cj4gKwlHRVRfVEhSRUFEX0lORk8oYTQsIGExKQo+ICsJbDMyaQlhNCwgYTQsIFRJX0ZMQUdTCj4g
KwliYnNpLmwJYTQsIFRJRl9GRF9TTE9UUywgMWYKPiAgCWJuZXoJYWJpX3NhdmVkMSwgMWYKCltT
ZXZlcml0eTogTWVkaXVtXQpEb2VzIHRoaXMgaW50cm9kdWNlIGEgcmVncmVzc2lvbiBsZWFkaW5n
IHRvIGluY29uc2lzdGVudCBwdHJhY2UKb2JzZXJ2YWJpbGl0eT8KClRoZSBleGl0IHBhdGggaW4g
c3lzdGVtX2NhbGwoKSBkeW5hbWljYWxseSBjaGVja3MgVElGX0ZEX1NMT1RTIGZyb20gZnJlc2gK
dGhyZWFkIGZsYWdzIChsb2FkZWQgaW50byBhNCksIGJ1dCBmYWxscyBiYWNrIHRvIGFiaV9zYXZl
ZDEgZm9yIHRyYWNlIHdvcmsuCgpFYXJsaWVyIGluIHN5c3RlbV9jYWxsKCksIGFiaV9zYXZlZDEg
aXMgY2FjaGVkIGJlZm9yZSBleGVjdXRpbmcgdGhlIHN5c2NhbGw6CgogICAgR0VUX1RIUkVBRF9J
TkZPKGE0LCBhMSkKICAgIGwzMmkgICAgYWJpX3NhdmVkMSwgYTQsIFRJX0ZMQUdTCiAgICBtb3Zp
ICAgIGE0LCBfVElGX1dPUktfTUFTSwogICAgYW5kICAgICBhYmlfc2F2ZWQxLCBhYmlfc2F2ZWQx
LCBhNAoKSWYgYSB0cmFjZXIgYXR0YWNoZXMgbWlkLXN5c2NhbGwgKGUuZy4gdXNpbmcgUFRSQUNF
X0FUVEFDSCBvbiBhbiBYdGVuc2EKcHJvY2VzcyBjdXJyZW50bHkgYmxvY2tlZCBpbnNpZGUgYSBz
eXN0ZW0gY2FsbCksIHdvdWxkbid0IHRoZSBleGl0IHRyYWNlCmV2ZW50cyBiZSBtaXNzZWQgZm9y
IG1vc3Qgc3lzY2FsbHMgYmVjYXVzZSBhYmlfc2F2ZWQxIGxhY2tzIHRoZSBuZXcgZmxhZ3MsCnll
dCBteXN0ZXJpb3VzbHkgYmUgY2F1Z2h0IGlmIHRoZSBzeXNjYWxsIGhhcHBlbnMgdG8gYWxsb2Nh
dGUgYSBmaWxlCmRlc2NyaXB0b3IgKGJlY2F1c2UgVElGX0ZEX1NMT1RTIGlzIGNoZWNrZWQgYWdh
aW5zdCB0aGUgZnJlc2ggVElfRkxBR1MpPwoKQ291bGQgd2UgcmVsb2FkIHRoZSBmcmVzaCBfVElG
X1dPUktfTUFTSyBmcm9tIHRocmVhZF9pbmZvIGhlcmUgaW5zdGVhZCBvZgpyZWx5aW5nIG9uIHRo
ZSBzdGFsZSBhYmlfc2F2ZWQxIGNhY2hlPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNS13b3JrLWZkLXJlc2VydmUtdW5pZnkt
Zm9sZGVkLXYxLTAtNGQ1MjE3ZDZiMjQ2QGtlcm5lbC5vcmc/cGFydD0xOAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGlu
ZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
