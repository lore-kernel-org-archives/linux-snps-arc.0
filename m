Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E91BC982C3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZQzmRoiIZcBqPV7kzfcpSDkQKl3PaDiuFA5RtCBUP8=; b=lPef++G6Crla4F
	Yb8mVzv9+qvO5q1a57Zif/oLuXkv2W1ax9ULT+TWTqE44XPNaiR3VietsajbWTeUh5u2U0dbBKwyL
	TFgEA8hpVtCA9C6U6HzmJF20wjbspUG03UX73qTDnjJSEFKgunx/m7LkAtvDQIEbiK4Et/U8hoMun
	1W489zBuj9gYFrWTUVT76hro/SwSgUx6PBeKaXj19aHlg+hnCC+g+xv0StRb0yz3VD0b2qJ4rAm2Z
	kMaUy3Yfvn2dYefLcbEbhTFQfvY3cfziTg8/Rxuz2+TJosMFLXxTZir44ab6C5x819t2MHxIuBJpE
	/9xCB2p5kgaYJvkver8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rko-00000006KCB-1D3p;
	Tue, 15 Sep 2026 11:55:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rki-00000006K6v-2Q5s;
	Tue, 15 Sep 2026 11:55:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5203943E12;
	Tue, 15 Sep 2026 11:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE761F000FF;
	Tue, 15 Sep 2026 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473308;
	bh=HMMRMhob7IkIe9e9mAPaP9M7mjfa9q2jKMemMrIPs6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PsQySeqWE8JCmadPFY/hnc/12dyVnuAieOOYame4n2RSKPpHPzZEwa9aNXFW6Bh0w
	 jCKKPfvbQGd4w+kjCdDB1cDWPrLj1jH+ib+NTLKYU1wTD4r5SSCiyK6Bkhm0GPcOD/
	 n8VVrYov9a2DUD0P51p6sbyyDt7TrPEsZSbloBTRZV4lFnVfvS/4uwmg4s0o9mGPwE
	 J86aQbIHSTHc2gNUMi95Os/taOUoLSS+QNmmmSrckOC7X/ql9/XqZQkG5NLta2glDR
	 Mp2J42KjxHOY8m6wiQeHzVa1+u/idZU1hpvfr6kocKyTTL+rDtt1yEldFXNOgmmj2l
	 +dfiOWdDv0iJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 17/50] um: commit fds on syscall exit
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: io-uring@vger.kernel.org, linux-mm@kvack.org, "Ingo Molnar" <mingo@redhat.com>, linux-hexagon@vger.kernel.org, virtualization@lists.linux.dev, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, linux-fsdevel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org, linux-m68k@lists.linux-m68k.org, "Jens
 Axboe" <axboe@kernel.dk>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-um@lists.infradead.org, linux-hyperv@vger.kernel.org, kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, "Michael
 S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, "Eugenio Perez" <eperezma@redhat.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Oleg
 Nesterov" <oleg@redhat.com>, linux-csky@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, kvm@vger.kernel.org, bpf@vger.kernel.org, sparclinux@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, "David Airlie" <airlied@redhat.com>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-17-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-17-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:55:06 +0000
Message-Id: <20260915115506.6CE761F000FF@smtp.kernel.org>
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

PiBBZGQgVElGX0ZEX1NMT1RTLiBoYW5kbGVfc3lzY2FsbCgpIGNhbGxzIHN5c2NhbGxfdHJhY2Vf
bGVhdmUoKSBhZnRlcgo+IGV2ZXJ5IHN5c3RlbSBjYWxsLCBzbyB0ZXN0IHRoZSBmbGFnIHRoZXJl
IGFuZCBjb21taXQgdGhlIHJlc2VydmF0aW9ucwo+IGJlZm9yZSBhdWRpdCBhbmQgdGhlIHB0cmFj
ZSBleGl0IHN0b3AuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRh
YmxlKSA8YnJhdW5lckBrZXJuZWwub3JnPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRj
aCBhbmQgZm91bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJl
dmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MTUtd29yay1mZC1y
ZXNlcnZlLXVuaWZ5LWZvbGRlZC12MS0wLTRkNTIxN2Q2YjI0NkBrZXJuZWwub3JnP3BhcnQ9MTcK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1z
bnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj
Cg==
