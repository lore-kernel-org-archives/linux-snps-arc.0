Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1F6C88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhvB1KcoAbe1LkrS/l787tbZnxpk4CxahTDX+PzSPtA=; b=LthoDTTELB5sDZ
	6yMnxyRcZa6qP+YVKFpp2kRV8w7yQxSAs97sOmaECRQLOnTQ9EfW9QvkyQ3bjOG5a6324BiSpuJrR
	wDGOZKC8QDE50HUapbV6+0pa2b/UDn5qKDB81QegY7EFe2RJbdMspeRjMeayhGe0y2zI/DhbcOANk
	+WfWqg+GtRnJAf3ItCJOH99IHHy0+F1UBGs9QGjXfB0Ub0P8uLf3lTrXAJgjSQBv/mVvMqxvYOqKA
	sJN+cy47AAUdAEERefbeE3VgE+gLgjBomLYmVpK8FOozZQu17wfSN8DgpxrIcL5yvhaFf0adB97JF
	paU4Sf0I1P3vyTnIz+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S7V-00000006SWn-2wu0;
	Tue, 15 Sep 2026 12:18:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S7R-00000006SSl-1upG;
	Tue, 15 Sep 2026 12:18:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2BA5602C4;
	Tue, 15 Sep 2026 12:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6111F00898;
	Tue, 15 Sep 2026 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789474716;
	bh=vrVAobJMjM7S9OZZMwIDwvr8ty2bA0kqwagLpHQp40w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ea1sJwsBr/Nvel740b29/2lnm8kv13L85FditgVsIEu95cKYPQZU0Zm86Po1jnZNR
	 WHN070goKjNpVo1FRyPViEa8NGr0QNUX2ucQBNO5lGEpXDGQD7U7BclSRhluMnxtKP
	 ATnOY9YQY/9J5OJE6jroQgQS5sfBOnMZtK6e3d1b5IYszHnQqLJX4JE1tZ1dgWaKGz
	 MVf3djXQJIyElXt0yrKwDYp8btcu88OnDKD8ru7wqrjSAcI7zj25kTBGPYQCXOGFwa
	 RfYXn1Lwzeg0QAuqyZ/UnU7T5x+37hRI9c8kwg/0XtOV9Mo2i3dXkFawFgls2HqTB0
	 kguWCX48YbslQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 45/50] accel/habanalabs: stop putting the
 dma-buf descriptor back on failure
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-snps-arc@lists.infradead.org, "Oleg
 Nesterov" <oleg@redhat.com>, "Peter Zijlstra" <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, linux-alpha@vger.kernel.org, "Alexander Viro" <viro@zeniv.linux.org.uk>, virtualization@lists.linux.dev, linux-mips@vger.kernel.org, kexec@lists.infradead.org, bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "Jan
 Kara" <jack@suse.cz>, linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, linux-um@lists.infradead.org, linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>, =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxl?=
 =?utf-8?b?KQ==?= <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, linux-hexagon@vger.kernel.org, io-uring@vger.kernel.org, linux-m68k@lists.linux-m68k.org, "Eugenio
 Perez" <eperezma@redhat.com>, "Jann Horn" <jannh@google.com>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-45-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-45-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 12:18:34 +0000
Message-Id: <20260915121834.8E6111F00898@smtp.kernel.org>
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

PiBSZWx5IG9uIHRoZSBmZCBleGl0IHBhdGggbWFjaGluZXJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBCcmF1bmVyIChBbXV0YWJsZSkgPGJyYXVuZXJAa2VybmVsLm9yZz4KClNhc2hp
a28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3Mg
Z3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwOTE1LXdvcmstZmQtcmVzZXJ2ZS11bmlmeS1mb2xkZWQtdjEtMC00ZDUyMTdk
NmIyNDZAa2VybmVsLm9yZz9wYXJ0PTQ1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
