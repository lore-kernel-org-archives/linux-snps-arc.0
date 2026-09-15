Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49152C88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Jz9GIEsz6+QpJM/+5pOzohmD5FvWidqWBkSifgZPz4=; b=uGr/hW0H5LL4q+
	sAoVi0eM26gKZXsvu7+HwLDn17PK6TpADtb6d44A0l2hq3pyTeNZKxlYjJr3ByQ9hpT0yCZ/ZNODc
	z4x9KEQyEE1QOOVJmpIZmLAxqa7NMmHikagtWSrmNDrOVN83mEn14IHxvj6Y/QdWQ0Mscq3w/FFsh
	ijTZ2ZeRnZ05LUWjOfpWB6S+Op8DR1o5zEMpn94Gu+b8Z74r/X+kDwZ7j0ox/9E426Pm8gA/42uP9
	sF+QDYJAMptJixTJqrFZ3usq8Q+L9NvjY7+PrXqGL9lo3r8mpoG81AcniGJdG8paVApSDcT19ZiUY
	rGkxR31yUOXih2/RnZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rjl-00000006Jk0-019E;
	Tue, 15 Sep 2026 11:54:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rjj-00000006Jj7-16P3;
	Tue, 15 Sep 2026 11:54:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E345643BD2;
	Tue, 15 Sep 2026 11:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0B31F00893;
	Tue, 15 Sep 2026 11:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473246;
	bh=AG30xjDiMKCtDyqoUWBdTqe2A6YC7BdfmCSY6YO8TME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jxGdVbxmN8Kp7YM+vv1k+Lwtl83KHaJbgpKLbkY5B9ndglNTkZCcuaHvygk/C/p23
	 gtc5IvLgRXflsaT/JbeYSUg8MT7dnkGaEESjkiYYG1vk2eMg5A4bJo85Hl9wv/nzeS
	 eGLkK/gZnGZt5sYUblxipqPSDfZOU6WkQWeqEOXj7sSr5LV4NAo/AueirSWL/XnsKl
	 hRst8P2ASZag12PNEDM5uHg4yR4m5hctoI8grNV4iMcvJNyl1ZXEvQ3SkS6D43rgW5
	 SD5U4o/63gzEV7FOsh2ZQJJdmW/ba916cBMFpTju6k1xEUWXrbdXF1KZviyBg5srWx
	 +dlhemDHcpIKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 12/50] nios2: commit fds on syscall exit
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-um@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, virtualization@lists.linux.dev, "Jens
 Axboe" <axboe@kernel.dk>, linux-hyperv@vger.kernel.org, io-uring@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, linux-arm-kernel@lists.infradead.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-gpio@vger.kernel.org, "Ingo
 Molnar" <mingo@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, "David
 Airlie" <airlied@redhat.com>, dri-devel@lists.freedesktop.org, "Eugenio
 Perez" <eperezma@redhat.com>, bpf@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, "Peter Zijlstra" <peterz@infradead.org>, kexec@lists.infradead.org, "Jann
 Horn" <jannh@google.com>, linux-openrisc@vger.kernel.org, "Oleg Nesterov" <oleg@redhat.com>, kvm@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-12-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-12-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:54:04 +0000
Message-Id: <20260915115405.0F0B31F00893@smtp.kernel.org>
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

PiBBZGQgVElGX0ZEX1NMT1RTIGFuZCB0ZXN0IGl0IG9uY2UgdGhlIHVudHJhY2VkIHN5c3RlbSBj
YWxsIGhhcyBoYWQKPiBpdHMgcmV0dXJuIGNvZGUgdHJhbnNsYXRlZCBpbnRvIHRoZSByMiBhbmQg
cjcgcGFpciB1c2Vyc3BhY2Ugc2Vlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJh
dW5lciAoQW11dGFibGUpIDxicmF1bmVyQGtlcm5lbC5vcmc+CgpTYXNoaWtvIGhhcyByZXZpZXdl
ZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkx
NS13b3JrLWZkLXJlc2VydmUtdW5pZnktZm9sZGVkLXYxLTAtNGQ1MjE3ZDZiMjQ2QGtlcm5lbC5v
cmc/cGFydD0xMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
