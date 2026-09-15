Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBEEC88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNr/2eAI5Q5rxIbO/nqB4nJTWlvNh8Kwv/1zAbSzHQ4=; b=WfUG5U6jfjpOGT
	+ATlWJ19w4j206pJaNieeDC9M9xiaEjcS65KZaGdwXRANLGwuuFCAUSYbKe+jebWxRKZuWIRpPgxs
	RmEppdIAO6qqwntIq3meYkwcg4ZCyANfnwDWZvG+IMgTrKMAIlrc/2rLl1XxnyEJPd1NTlamTN48B
	yPdTdiQy2byX7m7vbsduUUSnvUgqIeDE2QytuVzIR1AjHcRu56swOjA5P6AM0Qy+SRzvOSafe3266
	jAdSQ8okPs2Ls6LvuQxCdvOveGMAabhBPgCIB7akTdm+Jn7OEHbYedzdkmo+a3ePpBedPn/sdBvbD
	4yY+6LmISgyNr0PWo/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ru7-00000006Nfn-2iPe;
	Tue, 15 Sep 2026 12:04:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ru6-00000006NeV-0STa;
	Tue, 15 Sep 2026 12:04:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D371E42D5E;
	Tue, 15 Sep 2026 12:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92CF1F00893;
	Tue, 15 Sep 2026 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473889;
	bh=JAT+dPINnJ0baLSnWeyqna2pT2L+zf+r0Hb38LXbJr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mh0aJRjvpgxlZiLKhSATPqRfUaES+f2XTT49Q88vDM46+M2joHhrL5IXTe47rLwKc
	 lQ8SWuZa+L36m8Iss1J2WPRz0FGDuI7oSB9RhNnd6Q/OBlecSo2ec3ESUds1YiK9AY
	 yE5zSTou8yCIYMwaO7fw3TkKtVt9q88AVkigmJ0j7/I1yD7epQKS1vU3wqqB1ahaXX
	 LNYP3gTZ6O2PbkoUguLy6zmGopGbgX6RXuAS1J3tZlp1M2JrhXEo7fKehrQrDDD3RI
	 cFHwW76z9ATTIL4qO2fc49BAVBC61Nonh5r1ZU9cD24BOO9dRalQfLo+8prJsERH0V
	 r769lDt95U/fA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC POC 27/50] drm/amdkfd: stop collecting CRIU dma-buf
 descriptors for a final install
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>
Cc: =?utf-8?b?Q2hyaXN0aWFuIEJyYXVuZXIgKEFtdXRhYmxlKQ==?= <brauner@kernel.org>, linux-parisc@vger.kernel.org, "Jann
 Horn" <jannh@google.com>, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, bpf@vger.kernel.org, linux-csky@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, io-uring@vger.kernel.org, linux-gpio@vger.kernel.org, sparclinux@vger.kernel.org, linux-mips@vger.kernel.org, "Eugenio
 Perez" <eperezma@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Oleg
 Nesterov" <oleg@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org, "Peter
 Zijlstra" <peterz@infradead.org>, "Jan Kara" <jack@suse.cz>, kexec@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-openrisc@vger.kernel.org, "David
 Airlie" <airlied@redhat.com>, "Ingo Molnar" <mingo@redhat.com>, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, "Alexander
 Viro" <viro@zeniv.linux.org.uk>, "Jens Axboe" <axboe@kernel.dk>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-27-4d5217d6b246@kernel.org>
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <20260915-work-fd-reserve-unify-folded-v1-27-4d5217d6b246@kernel.org>
Date: Tue, 15 Sep 2026 12:04:47 +0000
Message-Id: <20260915120447.D92CF1F00893@smtp.kernel.org>
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
NmIyNDZAa2VybmVsLm9yZz9wYXJ0PTI3CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
