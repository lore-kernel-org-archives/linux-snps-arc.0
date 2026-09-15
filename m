Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66DEC88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BZsvsLg5S6D2E3loNsQv4iVxFLLFsEi9rjkrLuqWzE=; b=1HXZEQDl4RNVAx
	8w7fs5jq90FNb8SYvfZUv40+1lc7H3TeUBSZk48b2zUynPWj0uaedDr78DK7u9DxV2xEwxieLyefC
	BqosQgTMAvmPbP9M7bqZ+XUh7AuXfnTbtWsRbX22eYXVJxPBO7M0Mqpgt41KBjkwvagL6J13KOtn2
	412S8wZ82arZlCiaki9w15u+UIfAKRb7O3jk+y8aT05+9SuiMJBYYGvSgqVki7mj4E5odlU1kiGMV
	4hFJFBpkLduqxlnvFX1Iv6z+ocGZ+AL4oJzzJaJIkhmLov0I/vfo0nwx0or3W1wwn6veEXtN83shW
	9kWBs1E/EYGx55vxHXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ri1-00000006JOj-249o;
	Tue, 15 Sep 2026 11:52:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ri0-00000006JOA-1iDc;
	Tue, 15 Sep 2026 11:52:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DCC2140C2B;
	Tue, 15 Sep 2026 11:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F289F1F000FF;
	Tue, 15 Sep 2026 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473139;
	bh=ekDoF5aUkaIqLM1AvgKs+prcUXxdZryD2GdHfQi8iAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gD24zazrk8TigMiCd5ASn+dm6txgjVpHa5zvxMTtUFRuPgLF3PTUXkAm0k3tzbTVQ
	 kW4KsfY0HBGQif9CYx1pshd5pTSxWeoqAtmTVWdPBVqC5Vn35qXuEvnFfVWf0GTUKh
	 RUU6SoJAkl5L0Kq8QF9Rmz6Bec1Ua+EO9EvYsJxPA1pHKVceE0vbNalGCUnepaasCe
	 DK9cR0VwmXUnDDchOmLvDyG+u5nXi3gO659qnVPIeiexcntK9tyLliM401L/8g63N3
	 plW5ukJMt7+DcxaIYWdMgQ+GjvsoPq80PE5u4Yrt6L+3cW6+83I52c5iJrh0Haefuc
	 0OjHhKSvx0zPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 02/50] entry: commit fds on syscall exit
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-csky@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Alexander Viro" <viro@zeniv.linux.org.uk>, "Michael
 S. Tsirkin" <mst@redhat.com>, linux-hyperv@vger.kernel.org, "Oleg Nesterov" <oleg@redhat.com>, "Eugenio
 Perez" <eperezma@redhat.com>, linux-mm@kvack.org, linux-gpio@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org, "Jan
 Kara" <jack@suse.cz>, io-uring@vger.kernel.org, sparclinux@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, kvm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-snps-arc@lists.infradead.org, "Jens
 Axboe" <axboe@kernel.dk>, "Ingo Molnar" <mingo@redhat.com>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-2-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-2-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:52:17 +0000
Message-Id: <20260915115217.F289F1F000FF@smtp.kernel.org>
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

PiBSZXNlcnZpbmcgYSBkZXNjcmlwdG9yIHdpdGggZmRfcHJlcGFyZSgpIG1hcmtzIHRoZSB0YXNr
IHdpdGgKPiBTWVNDQUxMX1dPUktfRkRfU0xPVFMuIFRoZSBzeXNjYWxsIGV4aXQgcGF0aCBhbHJl
YWR5IHRlc3RzIHRoZQo+IHN5c2NhbGwgd29yayBiaXRzIHNvIGEgc3lzY2FsbCB0aGF0IGRlZmVy
cmVkIG5vdGhpbmcgcGF5cyBub3RoaW5nIG5ldwo+IGFuZCBvbmUgdGhhdCBkaWQgdGFrZXMgdGhl
IHNsb3cgcGF0aC4gc3lzY2FsbF9leGl0X3dvcmsoKSBjb21taXRzIHRoZQo+IHJlc2VydmF0aW9u
cyBiZWZvcmUgYXVkaXQgYW5kIHB0cmFjZS4KPiAKPiBBcmNoaXRlY3R1cmVzIHdpdGhvdXQgdGhl
IGdlbmVyaWMgZW50cnkgY29kZSBncm93IFRJRl9GRF9TTE9UUyBiaXQgaW4KPiB0aGVpciBzeXNj
YWxsIGV4aXQgd29yayBpbiB0aGUgZm9sbG93aW5nIHBhdGNoZXMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKSA8YnJhdW5lckBrZXJuZWwub3JnPgoKU2Fz
aGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29r
cyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjA5MTUtd29yay1mZC1yZXNlcnZlLXVuaWZ5LWZvbGRlZC12MS0wLTRkNTIx
N2Q2YjI0NkBrZXJuZWwub3JnP3BhcnQ9MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBz
LWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
