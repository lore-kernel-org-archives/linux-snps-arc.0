Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115FAC88E7B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxXltZuv9ghWZa9mKo4u2AXVjmhHL2u0pdeFAGx4Yhk=; b=EQo6v3rXNT315S
	wMAJbpQ9lRU9fX+m+ysY9pIHVsITdb9mzaM/VdxUbXzNd/ywl2p70V1mC9Aja4nL3K+fwoSmwd2od
	iEZPwpDJATxUDWsMVD6yc8utRQAYMiwUpBYNTOQuR71oMzndza4oxIZXTAwUZR/+pwgY3K64DHTkM
	D2FviPAi8oxEtmneUqrlHzaav1ASFwh+pn6LEpWd77J6XxoyUgeVTdfnMTdKyOlBDCQzsAUiqQRLZ
	mCvSZk0BfiTf+jdad0GCJge9vLp3E+0BccgDOidkWWI+lalIK4PnVDERh9WaZ1FkCWyGGq5qVdu65
	SCHdhMWxw05Nhh9/OfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rbq-00000006H8p-2tq2;
	Tue, 15 Sep 2026 11:45:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rbo-00000006H84-2Ogh;
	Tue, 15 Sep 2026 11:45:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13D1743ADB;
	Tue, 15 Sep 2026 11:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6688D1F00893;
	Tue, 15 Sep 2026 11:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789472756;
	bh=84qdWoL1LKc5gtdlqTMvnJT+oufAgjOVJobzRLdUed0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OvyMOoJ/eHXXAGCUuAHV9UPjednx+3v2kDsPpsRiMt2vJNRigBckYplzs+k1CunG2
	 VWZZat6CVLgoaSJTbzAssnUcFLqBHnWcBIQrLSfCF6yx/37jt+iOEtPkQuPGH8kPjd
	 AcdsSWp6kCGfJlkts3qZap21GHGOxCB9xpK4lKpyaxS4E3Gaqn2VwY0tbDq0dM8cvD
	 +S2ZTPvYUXYUWl8wkJIZFxNOYN02VLCEE6CbGr+QmxOcs6ih+Z8gfikh487gD4do1z
	 HtstDA3lVNKx0gLEevE1N9RvYOxqvCFfMI9vHNdE7EnXbFWmMIRc5NCWTLObCYGVL0
	 9PhkPHo1Z/4SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 11/50] MIPS: commit fds on syscall exit
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: io-uring@vger.kernel.org, linux-gpio@vger.kernel.org, "Jens Axboe" <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, linux-snps-arc@lists.infradead.org, "Michael
 S. Tsirkin" <mst@redhat.com>, linux-csky@vger.kernel.org, "Jan Kara" <jack@suse.cz>, linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, "Ingo
 Molnar" <mingo@redhat.com>, virtualization@lists.linux.dev, "Peter Zijlstra" <peterz@infradead.org>, linux-mips@vger.kernel.org, linux-hyperv@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, bpf@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-parisc@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, linux-mm@kvack.org, "Jann Horn" <jannh@google.com>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, "Oleg
 Nesterov" <oleg@redhat.com>, kvm@vger.kernel.org, =?utf-8?b?Q2hyaXN0aWFu?=
 =?utf-8?b?IEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-11-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-11-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:45:52 +0000
Message-Id: <20260915114553.6688D1F00893@smtp.kernel.org>
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

PiBBZGQgVElGX0ZEX1NMT1RTIHRvIHRoZSBzeXNjYWxsIGV4aXQgd29yay4gVGhlIHJldHVybiBw
YXRoIHJlcmVhZHMKPiB0aGUgZmxhZ3MgYWZ0ZXIgdGhlIHN5c3RlbSBjYWxsIGFuZCBjYWxscyBz
eXNjYWxsX3RyYWNlX2xlYXZlKCkgZm9yCj4gYW55IG9mIHRoZSBleGl0IHdvcmsgYml0cyB3aGlj
aCBjb21taXRzIHRoZSByZXNlcnZhdGlvbnMgYmVmb3JlIGF1ZGl0Cj4gYW5kIHRoZSBwdHJhY2Ug
ZXhpdCBzdG9wLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBCcmF1bmVyIChBbXV0YWJs
ZSkgPGJyYXVuZXJAa2VybmVsLm9yZz4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2gg
YW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE1LXdvcmstZmQtcmVz
ZXJ2ZS11bmlmeS1mb2xkZWQtdjEtMC00ZDUyMTdkNmIyNDZAa2VybmVsLm9yZz9wYXJ0PTExCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25w
cy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
