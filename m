Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B007BC88E53
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0dQR6H9Hy3M0OTYmxV5IVwE4MgrfxGNYlgACagnG70=; b=N0ikKMpc9tu0ZB
	wMW9A4MuJbNXShjGL3E8ZgDGNwr73VebVMwpwg8F0BP9eDAos+y9eo2LCxxLcHQhj58Jf8UMYF8eo
	01R1oE95AZziELRgQmMVYRhsdUB/gP+wnPzZwugiswApiZitr6aiGpe9Pf1eBrTj+qelIJ08z/6TN
	hqDRHMsOCM/HTUzz462tbp02NtdK3rVItSYo21wbCR9tAzhhsGK2pg3QdLbcTgkakJSYD9bexK6GZ
	iXKpfRRZ+6CC+uys8W56vmRcu7CZRXgDIZuVa3jEFuK+eEQBGzap3DiRqLCXiav2677wO77AH2rtV
	Yxdt4KTv2D4pxZqRf34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S7Q-00000006SRr-1bey;
	Tue, 15 Sep 2026 12:18:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S7O-00000006SQy-2KDG;
	Tue, 15 Sep 2026 12:18:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24A0A41B11;
	Tue, 15 Sep 2026 12:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6100B1F00893;
	Tue, 15 Sep 2026 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789474714;
	bh=3Nr8gcCwi6DEWSLP9EN8/l4h5yq3GfGsy2oDZDwQTVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=al7xG3QxpordB8FaZac1xk6QWAEGzphwDCGfy40ckeGGdeDP1tbwhbJklTqx5QQFT
	 ODvPZmGs3Rku3J2uQB3ChHYQAriES6YPKKW/TWgpaSESxWFOwioknFfQIhOZdlb/lh
	 RLkOhFE53P9jFChtaD6A2+vi4SogD6zm9+SM0eAaXOgGkYYLJJfSgO/RrU1jMf018L
	 IsZndXI06LzsoDnaEX00kNg9+CSe+xR/UDoSJpVb9b2SoGOi1j19PuVJIg9jG4HZNR
	 dl5cjIQ8g0S9+wNIlluWxOi9Rk+9A+i9qr4Dl8RqrHyi07ZG8WPpqBJZWgaHICrgtm
	 ZwEgDuMch+DXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 47/50] iio: buffer: install the buffer
 descriptor when the ioctl returns
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "David Airlie" <airlied@redhat.com>, virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-openrisc@vger.kernel.org, linux-arm-msm@vger.kernel.org, sparclinux@vger.kernel.org, linux-mips@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, linux-hexagon@vger.kernel.org, bpf@vger.kernel.org, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-hyperv@vger.kernel.org, kexec@lists.infradead.org, "Eugenio
 Perez" <eperezma@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, io-uring@vger.kernel.org, "Peter
 Zijlstra" <peterz@infradead.org>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, kvm@vger.kernel.org, "Ingo
 Molnar" <mingo@redhat.com>, linux-kernel@vger.kernel.org, "Jan Kara" <jack@suse.cz>, linux-csky@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, "Oleg
 Nesterov" <oleg@redhat.com>, "Jens Axboe" <axboe@kernel.dk>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-47-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-47-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 12:18:30 +0000
Message-Id: <20260915121831.6100B1F00893@smtp.kernel.org>
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
NmIyNDZAa2VybmVsLm9yZz9wYXJ0PTQ3CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
