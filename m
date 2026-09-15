Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D032C88E7F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6XRrCxlCm3ZL62cbk6dgV894RiICe0xYgTV6yujnDg=; b=gaRYHzetM2fmZP
	3g0ZlLQY8wjDkfKf2yRc9+3dMhtg4BghC3LYqa0ny8UXh8Ou5MDnnvWmmwu6Dw0w3k3aI662ZSmkb
	oTZq5q4Q6ZCZpN/4sPAw+XWdT0w70XLuw+kplW1Wd6OirhDDBNJjMZCl1TZKhScnN76/q2fV7KuDh
	Z4VERsESoEF8L9B9sp4MvsQjKPlTEqT6yPusoOWNZVbU6bj60a4ItFEd0lrZ65wuUII94NBk/s47F
	d4fby2b+h8qK4EmS/RUF4kaPoz+Ks/So2vMf3+rqWJTz4aB+EPI1isS/g77TVPpPBV/+GvEcTvUj8
	JG8/Ca8bxUXyY9OZonkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rse-00000006N8V-0Q3N;
	Tue, 15 Sep 2026 12:03:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rsc-00000006N6V-0cFg;
	Tue, 15 Sep 2026 12:03:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84F70409F3;
	Tue, 15 Sep 2026 12:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53111F000FF;
	Tue, 15 Sep 2026 12:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473797;
	bh=+u7ApoOuOF8zgpGLaZZqOsYtXtnXCzj3vZ61f6s8LvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=THnhYqifnsYIWurKEUAhE5a21iMJPlZD91gXsYeEKbrZccsHcRXVqGfm5oAHxQqOd
	 e1wuKKqVeBYXyc2aFoavHWSkhBnSVerlDl5LdiePK1NOkSeaQW/idnPwhZZFr9qO2U
	 cg7uUETVS3OG1gBkYBAm+yUoWRGRSH3/1l1cbZ2tR32pl+WFSqQtvnmtWPmcEO4Q+L
	 BxuqA3mh6TGj2Aku0WcupA4zXl8/Qqfs3dDrK1fqU5kv2LzDSbBcXV0J8UBqa9cxEY
	 w/xfA2bcbpba0mU4z3odT8FBDfF8Id5jJPBmzjOTZnLPQ12i2X8SrT2BDKLxXvMAyA
	 ptXGYIc0ZxCJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 22/50] net: install SCM_RIGHTS descriptors when
 recvmsg() returns
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, "Jan Kara" <jack@suse.cz>, linux-arm-msm@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, linux-alpha@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, linux-um@lists.infradead.org, io-uring@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-mm@kvack.org, "Peter Zijlstra" <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, linux-fsdevel@vger.kernel.org, virtualization@lists.linux.dev, "Oleg
 Nesterov" <oleg@redhat.com>, linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, kexec@lists.infradead.org, "Michael
 S. Tsirkin" <mst@redhat.com>, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-snps-arc@lists.infradead.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-22-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-22-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 12:03:14 +0000
Message-Id: <20260915120314.E53111F000FF@smtp.kernel.org>
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

PiBzY21fcmVjdl9vbmVfZmQoKSBhbGxvY2F0ZXMgYSBkZXNjcmlwdG9yLCB3cml0ZXMgdGhlIG51
bWJlciBpbnRvIHRoZQo+IGNvbnRyb2wgbWVzc2FnZSBhbmQgaW5zdGFsbHMgdGhlIGZpbGUgcmln
aHQgdGhlcmUsIG9uZSBkZXNjcmlwdG9yIGF0IGEKPiB0aW1lLiBFdmVyeXRoaW5nIHRoYXQgcmVj
dm1zZygpIGRvZXMgYWZ0ZXIgc2NtX2RldGFjaF9mZHMoKSBjYW4gc3RpbGwKPiBmYWlsIHRob3Vn
aC4gV2hlbiBpdCBkb2VzIHRoZSBzeXNjYWxsIHJldHVybnMgLUVGQVVMVCB3aGlsZSB0aGUgcmVj
ZWl2ZWQKPiBkZXNjcmlwdG9ycyBhcmUgYWxyZWFkeSBpbiB0aGUgdGFibGUgYW5kIHRoZSBjYWxs
ZXIgaGFzIG5vIHdheSB0byB0ZWxsLgo+IAo+IFJlc2VydmUgdGhlIGRlc2NyaXB0b3Igd2l0aCBm
ZF9wcmVwYXJlKCkgYW5kIHN0YWdlIHRoZSBmaWxlIHdpdGgKPiBmZF9zdGFnZSgpLiBUaGUgbnVt
YmVyIGlzIHdyaXR0ZW4gdG8gdXNlcnNwYWNlIGFzIGJlZm9yZSwgYnV0IHRoZSBmaWxlCj4gaXMg
b25seSBpbnN0YWxsZWQgd2hlbiByZWN2bXNnKCkgcmV0dXJucyBzdWNjZXNzIGFuZCBkcm9wcGVk
IHRvZ2V0aGVyCj4gd2l0aCB0aGUgZGVzY3JpcHRvciB3aGVuIGl0IHJldHVybnMgYW4gZXJyb3Iu
Cj4gCj4gQSBjb250cm9sIG1lc3NhZ2UgdGhhdCBkb2Vzbid0IGZpdCBzdGlsbCBnZXRzIG9ubHkg
dGhlIGRlc2NyaXB0b3JzIGl0Cj4gY2FuIHJlcG9ydCBhbmQgTVNHX0NUUlVOQy4KPiAKPiBJT1JJ
TkdfT1BfUkVDVk1TRyByZWFjaGVzIHRoZSBzYW1lIGNvZGUgZnJvbSBpby13cSB3b3JrZXJzIGFu
ZCB0aGUKPiBTUVBPTEwgdGhyZWFkLiBpb191cmluZyByZXF1ZXN0cyBjb21taXQgdGhlaXIgcmVz
ZXJ2YXRpb25zIGJlZm9yZSB0aGUKPiBjb21wbGV0aW9uIGlzIHBvc3RlZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciAoQW11dGFibGUpIDxicmF1bmVyQGtlcm5lbC5vcmc+
CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0
IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDkxNS13b3JrLWZkLXJlc2VydmUtdW5pZnktZm9sZGVkLXYxLTAt
NGQ1MjE3ZDZiMjQ2QGtlcm5lbC5vcmc/cGFydD0yMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
