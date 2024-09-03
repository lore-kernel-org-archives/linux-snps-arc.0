Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7CCC54FC6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Sep 2024 00:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYjDK9UDYJPYg8rux+2maQUp7NBBk/rxVKkasiIiMfw=; b=Sd+3h5ixyzgm9e
	xyh9W53Z4aix7/offg3uVTQ6ZQk8BwwJE+prybUHhR2Z92iMRXHS3MKJHu8AbLEUKXaWc5Ng7B/fi
	xSK6bQm8qW8Z16MOonFseoy7RXhY+VZGnnO1BEBWFuUQw8nT1czQQuztKppqFLvVQB7unYU8y3YAb
	bDqZZwB2yC19bT5hWts75sFuMVwKy4zi3fXLZFG0VBhxoS9i9/aZnkMXEIp6Ks2e9b+++YhngZVev
	dBzJLKEj9GqNi/yPJs68ceZhCAB8vaQ1ZTnrCP81HAulQ2ikZt4Ow+uOyNcLzNJ83DXfDomkoLGqr
	uyH0X02iK+7GBfFpgs7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slHZf-0000000FsH1-2f6v;
	Tue, 03 Sep 2024 00:39:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slHZd-0000000FsGU-1egL
	for linux-snps-arc@lists.infradead.org;
	Tue, 03 Sep 2024 00:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6C3C5C5940
	for <linux-snps-arc@lists.infradead.org>; Tue,  3 Sep 2024 00:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB947C4CEC2;
	Tue,  3 Sep 2024 00:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725323947;
	bh=L0a0nrjGAFgoQWttgMG49s3T6rw3a9pOaJoC5sfVnOU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kB30RQpjJJ19yruyvnmWtT/O2VXXBi3Nng1XCVtgXGz+lJRvTD1O87NM3qRqgjPHr
	 hPLrBbdTTQrvV9tikCjUca4sGKbXdg7s14tKm4Qldr1nQ4fs87NOmBsob4L+KiH/j2
	 /X3IfcN/vkITL+IJGFVzN4ZdAjG/UjBJOJYJv0pHkk7bHgq8EN2VhO7f/Upu4OzBTf
	 w6Yj92PWRN+6FYNdesM/craW4Ubp89dV6WzN55LqsLKSgxKwzyF2XI7L7bBeyspRzk
	 /plHTGjTM2/ynDghMCmqElcI3oVLzgzJN06ThVyTJqFNbVA+A/nMLNaj4RFQDzY5lD
	 TiNZ63kkRZVCQ==
Message-ID: <e72b55f5-2e12-43b1-8f9e-ddd7c9db8246@kernel.org>
Date: Mon, 2 Sep 2024 17:39:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: update the help message for
 CONFIG_ARC_BUILTIN_DTB_NAME
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240831101045.1381258-1-masahiroy@kernel.org>
 <CAK7LNATtOzj175_Y0qQz338FRG1GYCrsorA=jWG+Go1Wjn9rnw@mail.gmail.com>
 <8795e8da-981a-4876-99fe-8a4edb2185bf@linux.dev>
 <CAK7LNAQfpge7Hg8+yq3uyWD26D=kMcB3pKuoN+BGLfrOFFNgLA@mail.gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <CAK7LNAQfpge7Hg8+yq3uyWD26D=kMcB3pKuoN+BGLfrOFFNgLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_173909_495734_C8B7F675 
X-CRM114-Status: UNSURE (   9.29  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiA4LzMxLzI0IDIzOjUwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4gT24gU3VuLCBTZXAg
MSwgMjAyNCBhdCA4OjAy4oCvQU0gVmluZWV0IEd1cHRhIDx2aW5lZXQuZ3VwdGFAbGludXguZGV2
PiB3cm90ZToKPj4KPj4KPj4gT24gOC8zMS8yNCAwMzoxMywgTWFzYWhpcm8gWWFtYWRhIHdyb3Rl
Ogo+Pj4gT24gU2F0LCBBdWcgMzEsIDIwMjQgYXQgNzoxMOKAr1BNIE1hc2FoaXJvIFlhbWFkYSA8
bWFzYWhpcm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+IENvbW1pdCBhYmUxMWRkZWExZDcgKCJB
UkM6IFtwbGF0LWFyY2ZwZ2FdOiBFbmFibGluZyBEZXZpY2VUcmVlIGZvcgo+Pj4+IEFuZ2VsNCBi
b2FyZCIpIGNoYW5nZWQgdGhlIGRlZmF1bHQgYnVpbHQtaW4gRFRCIGZyb20gInNrZWxldG9uIiB0
bwo+Pj4+ICJhbmdlbDQiLgo+Pj4+Cj4+Pj4gQ29tbWl0IGZkMTU1NzkyM2IyZSAoIkFSQzogW3Bs
YXRfYXJjZnBnYV0tPltwbGF0X3NpbV0iKSBjaGFuZ2VkIGl0Cj4+Pj4gZnJvbSAiYW5nZWw0IiB0
byAibnNpbV83MCIuCj4+PiBBIHR5cG8uCj4+Pgo+Pj4gIC4uLiB0byAibnNpbV83MDAiLgo+Pj4K
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVs
Lm9yZz4KPj4gQWNrZWQtYnk6IFZpbmVldCBHdXB0YSA8dmd1cHRhQGtlcm5lbC5vcmc+Cj4KPiBX
aWxsIHlvdSBwaWNrIGl0IHVwLCBvciBzaGFsbCBJIGRvIGl0PwoKSSBkb24ndCBoYXZlIGFueXRo
aW5nIG1ham9yIGluIG15IHF1ZXVlLCBzbyBwbGVhc2UgdGFrZSBpdC4KClRoeCwKLVZpbmVldAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25w
cy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
