Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671E4C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 May 2022 03:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxfwWpyeWu/e4lVu6qu5dpdQDHKVia+aH/lhwjC45g8=; b=HiH5WvL0oiYRAX
	svmJme/kgwi2PuGJbVq3Ts5VgDiL9ND6VuuFEV9PpKKJtO/xGppSuyz88WKEO2RTHkBpWSbDVQKop
	uCiXSJOVBHlfEoHL6zie8PtrkCo+cy3Y99Ia7siUzcOp1bbWNVuY0gY8jSsHwSse2uyUUaeVG0d41
	EMK4Bk9trgvocm0EL5FVZ1zYNB+1eEZwNuk9D2OEkAZeon4PAqgruxnDWwcTP1YqwkDnKah2pg/K5
	irv5uHa2fa354Gfo3EWPx4zvO5ha3vtPMDIyGn2a6NPXwszG2nr/k5GV70ceAP4yL/FMcbVvoqn/Y
	vFcW3ZutoNAtG1xHsNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu4O6-00DOcT-D3; Thu, 26 May 2022 03:42:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu4O3-00DOaw-38
	for linux-snps-arc@lists.infradead.org; Thu, 26 May 2022 03:42:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E3040B81EC0;
	Thu, 26 May 2022 03:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEFEC385B8;
	Thu, 26 May 2022 03:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653536526;
	bh=RrhNZhtBDnr6UOm6hFKuTF/8JJ6tOZBvoXAfc/j3kSk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N9Gw56R1UpYOSlMvipw5r+Hsdx5wZ6RZCguKsEY1n0n7aLSbDAdXFACGT1cTQYuGa
	 QVZWGDotXuOzt1/bvzyWp8XMqYIXQr03/kQBHyvCBefy5bISLpLQHZVMLLNE7pUWza
	 YBSca12TJ4ZHXhrq/Cu9tfk3PmM5PsDhWm8gFIsY5fNnYOYhcIP9XpDbyVYt0rAIQE
	 7rJ+DvwED/qmHibALLme0+ioundJCJTT5qwQkBS5NWDZNpxzc9X3f5Ue+pqwSoNssK
	 oduWEbZoiJUzWGgzZmwOw5LZ/dIG9fqrFi5AY+PZWAQuL+8lSgegyQuD/8WXlgjzO8
	 O5hu7NYVLT12A==
Message-ID: <17bdbca6-8352-50a8-0a3e-49ffe09422a2@kernel.org>
Date: Wed, 25 May 2022 20:42:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] ARC: bitops: Change __fls to return unsigned long
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Vineet Gupta <vgupta@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-snps-arc@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com>
 <20220525144844.1571705-2-amadeuszx.slawinski@linux.intel.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20220525144844.1571705-2-amadeuszx.slawinski@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_204211_339112_3A6BA0AF 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGksCgpPbiA1LzI1LzIyIDA3OjQ4LCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3cm90ZToKPiBBcyBw
ZXIgYXNtLWdlbmVyaWMgZGVmaW5pdGlvbiBhbmQgb3RoZXIgYXJjaGl0ZWN0dXJlcyBfX2ZscyBz
aG91bGQKPiByZXR1cm4gdW5zaWduZWQgbG9uZy4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlz
IGV4cGVjdGVkIGFzIHJldHVybiB2YWx1ZSBzaG91bGQgZml0IGluIHVuc2lnbmVkCj4gbG9uZy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpPGFtYWRldXN6eC5zbGF3aW5z
a2lAbGludXguaW50ZWwuY29tPgoKQXBwbGllZCB0byBmb3ItY3Vyci4KClRoeCwKLVZpbmVldAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25w
cy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
