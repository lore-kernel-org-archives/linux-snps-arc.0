Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DF1C88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 11:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFr0xMC/DUDcjdeEJFCVcMx2zJcWAkE0eN7pfTxMrn0=; b=Tf0Ds4WPYZl8YU
	erRzxZccDdrItNJ8JZnljPDS6URaYDZJIfmioz70H5XcykRNVfJhq6GAgoKmzxNu1X5O3+R7KcYli
	9/di94sOk1fV95N9zuUOlT83B+fhMo4HMOSd1/oRmNckP5z5IbkVDyMictUwU//6Cyjrd9LoZTv9e
	zAQRlg/li5gP8PAaX3XLKSJhVZdATw94AI0ZD2Grf1jXv5sPche78GWJGy/yUlgsX7ev1cKPNAhiN
	NtZcSzzG7E+6yNIXXbxTNh1chFTImh3aPj7i7TRrUEjr4us54AkgCtjCN6EHvIGk/4VoeSW4l2rCS
	uPA1u9L4Eh0VwiAkhwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ReH-00000006I7X-2lnp;
	Tue, 15 Sep 2026 11:48:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ReD-00000006I5I-390H;
	Tue, 15 Sep 2026 11:48:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF34F6025F;
	Tue, 15 Sep 2026 11:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB181F000FF;
	Tue, 15 Sep 2026 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789472904;
	bh=snQOL0WONF4IRsaF3EIs3wlmLSFM44jqM+liurayMLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=or6y3CySlL1bdxzm9++3Y5GlWLcEPN0LrDGjXv4IhxYT8SwPi7kInte+CrlQcFfkp
	 1XQmoKBf113PXHQChs2avy8UGIIquFVuSvMCoCSNMtA9/3wH0G1HosQnaeUEIWka2B
	 wWhLR1WkDA4HzYixhD6H1F5tbulUxFG0FnA5+hj8l5IA14GNeQQ0O/Dk84ZVAgSj+v
	 HbNF4/Hpt5pQyZeE6+47+X/P7J02CVGZbdLDaKVKYgjpAgC0Jr6q5hx+PjdmH8SQ8K
	 ZwTjgJT8b9Hr2cJYcHzxNGopiariE1M/El0VM6I8g6qSqO3peUD5vDy8v1Fyu9cVcC
	 cthdt2i/NUkkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 04/50] ARC: commit fds on syscall exit
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-msm@vger.kernel.org, "Michael
 S. Tsirkin" <mst@redhat.com>, "Jann Horn" <jannh@google.com>, "Oleg
 Nesterov" <oleg@redhat.com>, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-sh@vger.kernel.org, virtualization@lists.linux.dev, "Peter
 Zijlstra" <peterz@infradead.org>, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, kvm@vger.kernel.org, linux-csky@vger.kernel.org, "Jens
 Axboe" <axboe@kernel.dk>, linux-gpio@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-um@lists.infradead.org, "Jan
 Kara" <jack@suse.cz>, linux-alpha@vger.kernel.org, "Eugenio Perez" <eperezma@redhat.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, dri-devel@lists.freedesktop.org, "David
 Airlie" <airlied@redhat.com>, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org, io-uring@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, "Ingo Molnar" <mingo@redhat.com>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-4-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-4-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 11:48:22 +0000
Message-Id: <20260915114822.DCB181F000FF@smtp.kernel.org>
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

PiBBZGQgVElGX0ZEX1NMT1RTIGFuZCB0ZXN0IGl0IG9uIHRoZSB1bnRyYWNlZCByZXR1cm4gZnJv
bSBhIHN5c3RlbQo+IGNhbGwuIEEgdGFzayB0aGF0IHJlc2VydmVkIGRlc2NyaXB0b3JzIHRha2Vz
IHRoZSB0cmFjZXN5c19leGl0IHBhdGgsCj4gd2hlcmUgc3lzY2FsbF90cmFjZV9leGl0KCkgY29t
bWl0cyB0aGVtIGJlZm9yZSB0aGUgcHRyYWNlIGV4aXQgc3RvcC4KPiBUaGUgdHJhY2VkIHBhdGgg
YWxyZWFkeSBlbmRzIHVwIHRoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBCcmF1
bmVyIChBbXV0YWJsZSkgPGJyYXVuZXJAa2VybmVsLm9yZz4KClNhc2hpa28gaGFzIHJldmlld2Vk
IHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE1
LXdvcmstZmQtcmVzZXJ2ZS11bmlmeS1mb2xkZWQtdjEtMC00ZDUyMTdkNmIyNDZAa2VybmVsLm9y
Zz9wYXJ0PTQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
