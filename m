Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A6C982C3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/ELFqaVWvP73H/EOoChfNfH1BY7UepHuPDVV84bif8=; b=tYb15jPe3ulNMn
	Hc3OLPnM2mSIOy182uk80IKTS+3UF+xi0HuhCiu4mYrmpZxgvM41bD6VEcs6glS0wW/bhku7paU8L
	1L5heMOMnJRnF5fm1kMR9oUWuoVtlfbIbFbaTeCy9m6yCGNHx7UO3PELfmgk3UFZ8Both43T3V+4r
	FLNgY/L90crV3h1sr9BF+7jaOR3fV7yibJI9W+NkRXMaVyHeUZvdXy6vHArHxUqfJvV6jfpkxjP+x
	BBskna7R3v5mlZ/DbWwLY9OWbqWMjbxPBvJFqNbG/y4i50HN2dFGzeuJa4TI9moq2F/JTfMjM1izl
	r8OpBL88ZUGHToMXZrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rdv-00000006HqG-3UQ2;
	Tue, 15 Sep 2026 11:48:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rdt-00000006Hob-3xvp;
	Tue, 15 Sep 2026 11:48:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 617DF6025F;
	Tue, 15 Sep 2026 11:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BC01F000FF;
	Tue, 15 Sep 2026 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789472885;
	bh=EYRIdKp/FfwNNqSNi/pBExuEJpqL4OpkJpzESq5stW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KEA46w/jL9NKEBXKdpDRVvgUVpdw6hOUBCW8wQyHI6NwDPC4Am8sCmr7j0WvoKK5v
	 Bi5VQmzbc0sNbBRMKVoi5XBwnkMmxH9tNMHqDw3ItnBUybU4feNnNWv7cT2bB8AjBd
	 dY6wMyYKrW4Ezf2ZF1yg1nT3JYwFHCkXSv5QxKi4ShZMZv5F2iT044OEtU+pEb+idW
	 Tog3ab9yFoO5+qKuA6KwBgJKAx/c448Pa5xlXvcd0f4KIxP8erzSA5JNQBA/bgLLZB
	 IGHhr6D+xE3ldAUlwnI0HynOJtRl8do+l5clEE47V/0XL01LM1u7vq8zJwzIFJqQrv
	 ilAIi+rTQ2iFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 10/50] microblaze: commit fds on syscall exit
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, kexec@lists.infradead.org, sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, bpf@vger.kernel.org, linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, "Michael
 S. Tsirkin" <mst@redhat.com>, linux-openrisc@vger.kernel.org, kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-arm-kernel@lists.infradead.org, "Jens
 Axboe" <axboe@kernel.dk>, "Jann Horn" <jannh@google.com>, "Ingo Molnar" <mingo@redhat.com>, "Jan
 Kara" <jack@suse.cz>, dri-devel@lists.freedesktop.org, linux-um@lists.infradead.org, virtualization@lists.linux.dev,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-gpio@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, linux-hyperv@vger.kernel.org, "Oleg Nesterov" <oleg@redhat.com>, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-10-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-10-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:48:02 +0000
Message-Id: <20260915114803.44BC01F000FF@smtp.kernel.org>
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

PiBBZGQgVElGX0ZEX1NMT1RTIHRvIHRoZSBzeXNjYWxsIHdvcmsgbWFzay4gVGhlIHJldHVybiBw
YXRoIHJlcmVhZHMKPiB0aGUgZmxhZ3MgYWZ0ZXIgdGhlIHN5c3RlbSBjYWxsIGFuZCBjYWxscyBk
b19zeXNjYWxsX3RyYWNlX2xlYXZlKCkKPiBmb3IgYW55IG9mIHRoZW0gd2hpY2ggY29tbWl0cyB0
aGUgcmVzZXJ2YXRpb25zIGJlZm9yZSBhdWRpdCBhbmQgdGhlCj4gcHRyYWNlIGV4aXQgc3RvcC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciAoQW11dGFibGUpIDxicmF1bmVy
QGtlcm5lbC5vcmc+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBu
byBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNS13b3JrLWZkLXJlc2VydmUtdW5pZnkt
Zm9sZGVkLXYxLTAtNGQ1MjE3ZDZiMjQ2QGtlcm5lbC5vcmc/cGFydD0xMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxp
bmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
