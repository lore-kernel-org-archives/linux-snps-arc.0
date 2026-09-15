Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FBAC88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEIvhs+wexEbodVXOwyus2SuBSOHEGVQuh2XC0secxU=; b=kcjRu0CRCukX/y
	Gx6Db20fhyRjndO9mmlWXXdZHBjuVy6XWP2N00pqGOKamnWfx0UVb9lFP6MrczgEromlmivpINM6Z
	B6hvRt1+kyPfVWQl3stVL3Vhu+Td/x/xCMx5Uy5w0r7bblFLXVS0TRn3Kzz1nibRdUp0Wb4rvazQF
	/41dMWbnT0tkxFQfUh9GVLP5JnNF0wcboWKdw9gSq0vwKLvgUfW5SFtANVRKOdZ7l7Z3Aw6ov8oHn
	9Hw2DIrKGhoSJee7m7CUlMbfz1TrRme25ut0JRis35L/BFUyRFISyw0LnLXXM3RZ8e/oXJ2J0BMM0
	5F6i0XY6CzEuZHhE27Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rrl-00000006Mg2-4BvG;
	Tue, 15 Sep 2026 12:02:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rri-00000006Mdi-1P7e;
	Tue, 15 Sep 2026 12:02:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 196F94141B;
	Tue, 15 Sep 2026 12:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2CE1F000FF;
	Tue, 15 Sep 2026 12:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473742;
	bh=qcYOVYEeSBwNAHSV3oGOxIoOYP16KGnVjnu+hbqVsEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f/BEG6N0RGxUq5W/HXCadDNiWy6mZwl9CV9CowG89trZuBhbvX/vWsAwHcKt0jPgW
	 SJ2ml9rORw02KpW+BBtA/RAwgHeaOMkDEM/bw2FOM3cvOGpK4o5aTZomhO8RUcQ5S/
	 HUGzy85d+v2Rl885i1mtVPRNCYfGq7VMLkzir6Qo74z8OfaWUxRKM2kqLaxvoO35hD
	 g2OjURXxrNOf5LxE5EULxkvtM4dwb4/ru0HDhvJo0tuYkl76FUzGi2h5pCD/fdlSaR
	 IpwMuTLI+Jg1YfgtVCyH+xGpSt50Q2kgFNlZVyEcwXh9ZMIlgJii4H6dAqtEZuqtWP
	 6++8DIfAg5DTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 20/50] file: warn when the descriptor table is
 unshared with slots
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-csky@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, dri-devel@lists.freedesktop.org, "Jan Kara" <jack@suse.cz>, "Jens
 Axboe" <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>, "Jann Horn" <jannh@google.com>, kexec@lists.infradead.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-mm@kvack.org, linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-hexagon@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, virtualization@lists.linux.dev, linux-snps-arc@lists.infradead.org, sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, io-uring@vger.kernel.org, "Oleg
 Nesterov" <oleg@redhat.com>, linux-parisc@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, linux-openrisc@vger.kernel.org, linux-um@lists.infradead.org, "David
 Airlie" <airlied@redhat.com>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-20-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-20-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 12:02:19 +0000
Message-Id: <20260915120220.2B2CE1F000FF@smtp.kernel.org>
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

PiBJZiB0aGUgZmR0YWJsZSBpcyB1bnNoYXJlZCBvciB0aGUgdGFzayBleGl0cyB3ZSBjYW4ndCBp
bnN0YWxsCj4gcmVzZXJ2YXRpb25zLiBUaGUgcmVzZXJ2ZWQgZmQgaXNuJ3QgcmVzZXJ2ZWQgYW55
bW9yZS4gZXhlY3ZlKCkgd291bGQKPiBsZWFrIHRoZSByZXNlcnZhdGlvbiBpbnRvIHRoZSBjaGls
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciAoQW11dGFibGUpIDxicmF1
bmVyQGtlcm5lbC5vcmc+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3Vu
ZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNS13b3JrLWZkLXJlc2VydmUtdW5p
ZnktZm9sZGVkLXYxLTAtNGQ1MjE3ZDZiMjQ2QGtlcm5lbC5vcmc/cGFydD0yMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
