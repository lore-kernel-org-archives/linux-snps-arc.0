Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEF4C88E53
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6ThRmjv0GKCIglRg8AfJJmrCHt6INtmkiXMlaTIKRI=; b=ie7Y6qvpIuDzOJ
	HfPlp7Za7VzU1F+bjQUrdvVpuEdw1w7q7zB/+4+p1bVJ/Q/wnobmaiVp25Jhr5XObuEO+uY0mJoAg
	r+UXUN0gmBRFVJL7sYDjVRvOhqb7wgZKFeZ7g5fu2T52daE3cD+TksiftG2Fgx3Ys+bEREE29awkm
	qbBe8iaXPN6U24di0bw5FoVtndRw8E5BCiPJJDR0JH/oR66apF49MQNjpyAXVpkpafH1ATfj5BFf+
	7ApIgE0FMZCuhi8F4UhWzOmi+PK6E9t3zVqvVb4rRJAmIK3tHEW1zkR3/5raFGlgBVOuqqlzKX8AT
	xOZcnxfYJap9xZlHxYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rkf-00000006K3z-38ps;
	Tue, 15 Sep 2026 11:55:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rkd-00000006K35-3ioS;
	Tue, 15 Sep 2026 11:55:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A243943B4D;
	Tue, 15 Sep 2026 11:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D521F000FF;
	Tue, 15 Sep 2026 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473303;
	bh=D7g9xDZ0omvORxToAZd7wz5+AlCcHiBcOzmxibNhlVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZyJu22BUp/krcHqRNTq7jKcZ/omh/8BK0J0GGcmbyy5eXF7HLUhGysm81swJVRcRo
	 fJATPHtnqwBnOk6PWVqaIPLWcfH7MWcD4yqz6G7e3EGCMvuO13BOVBnpv9ez1pkoHo
	 h5dypooXJxYBa1oPbCPR5mUV6AbHtDqPpwLdNjZnOwcsbqEhQDByZ9Y6IWPAHL+aCB
	 IGdiRVZ8zo4AG0M9gKDQBs0eP2aITK9r+bHOxAfCyl+sA6VP5e3n+m73i2wu6dE27u
	 SdD2cWl466lslpt4/j2EFsvQA0Pnw2GlUhysF9C6CVND6+HZdKJG2WejdsdT6gvwdV
	 rDjhEE9s7krJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 15/50] sh: commit fds on syscall exit
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: linux-gpio@vger.kernel.org, "Eugenio Perez" <eperezma@redhat.com>, "Jan
 Kara" <jack@suse.cz>, "Ingo Molnar" <mingo@redhat.com>, linux-hexagon@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Jann
 Horn" <jannh@google.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>, bpf@vger.kernel.org, linux-mips@vger.kernel.org, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-csky@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, io-uring@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, virtualization@lists.linux.dev, kexec@lists.infradead.org, linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, "Michael
 S. Tsirkin" <mst@redhat.com>, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, "Oleg
 Nesterov" <oleg@redhat.com>, linux-snps-arc@lists.infradead.org, "Jens
 Axboe" <axboe@kernel.dk>, linux-hyperv@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-15-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-15-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:55:00 +0000
Message-Id: <20260915115500.C1D521F000FF@smtp.kernel.org>
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

PiBBZGQgVElGX0ZEX1NMT1RTIHRvIHRoZSBzeXNjYWxsIHdvcmsgbWFzay4gc3lzY2FsbF9leGl0
IHJlcmVhZHMgdGhlCj4gZmxhZ3MgYWZ0ZXIgdGhlIHN5c3RlbSBjYWxsIGFuZCBnb2VzIHRvIHN5
c2NhbGxfZXhpdF93b3JrIGZvciBhbnkgYml0Cj4gaW4gdGhlIGFsbC13b3JrIG1hc2ssIGJ1dCBo
YW5kcyBvdmVyIGEgY29weSBzaGlmdGVkIHJpZ2h0IGJ5IGVpZ2h0Cj4gd2hlbiB0aGUgYml0IHdh
cyBpbiB0aGUgdXBwZXIgYnl0ZS4gUmVsb2FkIHRoZSBmbGFncyB0aGVyZSBhbmQgdGVzdAo+IHRo
ZSBmdWxsIG1hc2ssIHNvIHRoYXQgdGhlIGJpdCByZWFjaGVzIGRvX3N5c2NhbGxfdHJhY2VfbGVh
dmUoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciAoQW11dGFibGUpIDxi
cmF1bmVyQGtlcm5lbC5vcmc+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBm
b3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkxNS13b3JrLWZkLXJlc2VydmUt
dW5pZnktZm9sZGVkLXYxLTAtNGQ1MjE3ZDZiMjQ2QGtlcm5lbC5vcmc/cGFydD0xNQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJj
IG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
