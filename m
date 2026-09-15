Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83875C88E53
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OSeeII98MOeHxdOQOLVxd5wCdqKzWo5U0yPj/3QZUA=; b=1fmVk66vVU0J4I
	ZefkjeewA0sMcB6pcJzq6/INyRT31BuM7pUV8gTCSTMTXR+AvLfNsTZivoooSJnLKxDRqqsZTsB0+
	WXghdWyQ0EStE5iE6C/41BTjW5dddmoKTjEd9KBkuwSP8jylCE373GqirXY4bDY2qUJu2hrL+71nK
	LDcIUi0jpQUCxgOZ9K2JKh0OQD6zGb2pzyBCbhdyvCMzEKcVlJphpnYSb5Ux7oX3KA664ozr4pSwV
	tS5oOvbF9bWBt/nzTkOqRS9bC1OoEA4nzaiQYvaSJW3ANcf+RDJ6IJE0oWK+8GmvsOHshMxKynZVF
	3n8dh+XKjsbAClwEg6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S5C-00000006Rv0-0wWV;
	Tue, 15 Sep 2026 12:16:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S5B-00000006RuP-1qg8;
	Tue, 15 Sep 2026 12:16:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C1B07602A8;
	Tue, 15 Sep 2026 12:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99711F00893;
	Tue, 15 Sep 2026 12:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789474576;
	bh=NXoYVTwqvD2Mc3uJ8C8rBTgBxVVEvgW7tv7MPPRhfTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CNterPT/ZD51jedu2KNQ9rOU/4D4o9j+Aviy118d7ID4ZpJ7DN5B0QTVxpbOLDEcp
	 WjkOW+IygybTEM7hIhEUp9B9F8q2tKZJbdjojW7c1kYBcsALaPVXdNvNpseaoF6sxz
	 d08hoYd15gcHpNwA06y/3FcZ6xOwqFvsocjr/EGRM5cC9tuus0kDJdaqEQg3Qm4M18
	 ZeSXiq47TwxgervFWeMWsQkRc5DykbFskWfeoeMxtxMfVCAG1jD+nF5Voy10SVLA4z
	 9vITY1nHgUqKUhmEPiCFbTS/22e9+k7WoslJgfuFNfW4pirOY8jtykHYXqI9jsapd+
	 +JW1ZdYPtifnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 41/50] KVM: guest_memfd: stop putting the
 descriptor back on failure
To: "Christian Brauner" <brauner@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, "Jan
 Kara" <jack@suse.cz>, "Jens Axboe" <axboe@kernel.dk>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, "Jann
 Horn" <jannh@google.com>, linux-sh@vger.kernel.org, "David Airlie" <airlied@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org, bpf@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-hexagon@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, "Ingo Molnar" <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, dri-devel@lists.freedesktop.org, kvm@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org, linux-mm@kvack.org, virtualization@lists.linux.dev, kexec@lists.infradead.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, linux-hyperv@vger.kernel.org, "Oleg
 Nesterov" <oleg@redhat.com>, linux-openrisc@vger.kernel.org, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-41-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-41-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 12:16:14 +0000
Message-Id: <20260915121614.A99711F00893@smtp.kernel.org>
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
NmIyNDZAa2VybmVsLm9yZz9wYXJ0PTQxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
