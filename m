Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E9CC2FC04
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Aug 2023 03:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yImufkdK7z4cLwqH8TvBKhs6JydHCV3TDfzwNppW8Po=; b=cK3CpPj1FDBeGu
	+rcnmpgdaCqvzFD3hzw9bbs8Qz6wni7fVfRqHCgcip2t/BPiztUnucMPWiyK9YzguZG3MhsJ+16H+
	UOh6Qnh4uR1ShYjHRenYIAWcwu59jWurLd1fMaqJQRE5ihfCFYvc5Qk/c1Xh3mVc1rFfz5DVBvzgg
	vwGIp08pjHF9n8R0DrIAYxFDhiUgCrGoJkcMh/mLm6jfCDXY7EI/ajjWt2zVmczTrfCYVctYlH6Kp
	/jQammhFk/2LMzPDH8o3I5+5pMmXzd9DFm0I2Ivi3bF8+ffSC1/iTDba3aeixpYIc9pz+Op2v0br7
	lHjj5xgA4mW72hGQTigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWTTy-005R7d-0k;
	Thu, 17 Aug 2023 03:15:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWTTv-005R7I-1G;
	Thu, 17 Aug 2023 03:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=P/kFyzCr/eSDaJkbY0OlCILEe1j9xWTLXn/yJLAYIu4=; b=A9+ZOyBLxgvkefgcCG3G+GbFOc
	t3Q4LPTtkkpyh0LBpbAFdc+3lhG3pcvB3Tuy2cTe9/M//iW+Sx1QS7+tpwHS9HCucIDpD/RDGCGIr
	FphyIapebkE7eEjeEnFtOi+9dwumQAvsQRYGjE0GEiZ5WBo53AxtXkFjlluHJQQSFYe1ZQ0mwCfpK
	6X/okD9sKE4Z8iWegd56l1SCJXl6wUSJ5Uk04klLzVcTy3SNTh8mgr2aL00kPfkoj1Td2N2/Azxck
	21ORjXTS2+GmCUfbeyQtLCC4mizooGziW6L1eBdD4Ta+hfKURTJGkPtTMCT5Ht16ny8Gi1C8JbRXm
	mdreectQ==;
Received: from [2601:1c2:980:9ec0::1a0b]
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qWTTi-000tOI-Mm; Thu, 17 Aug 2023 03:15:18 +0000
Message-ID: <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org>
Date: Wed, 16 Aug 2023 20:15:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: 20230816055010.31534-1-rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <vgupta@kernel.org>, Brian Cain <bcain@quicinc.com>,
 linux-hexagon@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, linux-openrisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
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

SGkgSmVzc2UsCgpPbiA4LzE2LzIzIDE1OjQ1LCBKZXNzZSBUYXViZSB3cm90ZToKPiBIaSwgUmFu
ZHkKPiAKPj4gZGlmZiAtLSBhL2luaXQvS2NvbmZpZyBiL2luaXQvS2NvbmZpZwo+PiAtLS0gYS9p
bml0L0tjb25maWcKPj4gKysrIGIvaW5pdC9LY29uZmlnCj4+IEBAIC0xNzkwLDE0ICsxNzkwLDYg
QEAgY29uZmlnIERFQlVHX1JTRVEKPj4KPj7CoMKgwqDCoMKgwqDCoCBJZiB1bnN1cmUsIHNheSBO
Lgo+Pgo+PiAtY29uZmlnIEVNQkVEREVECj4+IC3CoMKgwqAgYm9vbCAiRW1iZWRkZWQgc3lzdGVt
Igo+PiAtwqDCoMKgIHNlbGVjdCBFWFBFUlQKPj4gLcKgwqDCoCBoZWxwCj4+IC3CoMKgwqDCoMKg
IFRoaXMgb3B0aW9uIHNob3VsZCBiZSBlbmFibGVkIGlmIGNvbXBpbGluZyB0aGUga2VybmVsIGZv
cgo+PiAtwqDCoMKgwqDCoCBhbiBlbWJlZGRlZCBzeXN0ZW0gc28gY2VydGFpbiBleHBlcnQgb3B0
aW9ucyBhcmUgYXZhaWxhYmxlCj4+IC3CoMKgwqDCoMKgIGZvciBjb25maWd1cmF0aW9uLgo+IAo+
IFdvdWxkbid0IHJlbW92aW5nIHRoaXMgYnJlYWsgbWFueSBvdXQgb2YgdHJlZSBjb25maWdzPwoK
SSdtIG5vdCBmYW1pbGlhciB3aXRoIG91dC1vZi10cmVlIGNvbmZpZ3MuCkRvIHlvdSBoYXZlIHNv
bWUgZXhhbXBsZXMgb2Ygc29tZSB0aGF0IHVzZSBDT05GSUdfRU1CRURERUQ/Cihub3QgZGlzdHJv
cykKCj4gU2hvdWxkIHRoZXJlIGJlIGEgd2FybmluZyBoZXJlIHRvIHVwZGF0ZSBjaGFuZ2UgaXQg
aW5zdGVhZCBvZiByZW1vdmFsPwoKa2NvbmZpZyBkb2Vzbid0IGhhdmUgYSB3YXJuaW5nIG1lY2hh
bmlzbSBBRkFJSy4KRG8geW91IGhhdmUgYW4gaWRlYSBvZiBob3cgdGhpcyB3b3VsZCB3b3JrPwoK
V2UgY291bGQgbWFrZSBhIHNtYWxsZXIgY2hhbmdlIHRvIGluaXQvS2NvbmZpZywgbGlrZSBzbzoK
CiBjb25maWcgRU1CRURERUQKLQlib29sICJFbWJlZGRlZCBzeXN0ZW0iCisJYm9vbCAiRW1iZWRk
ZWQgc3lzdGVtIChERVBSRUNBVEVEKSIKIAlzZWxlY3QgRVhQRVJUCiAJaGVscAotCSAgVGhpcyBv
cHRpb24gc2hvdWxkIGJlIGVuYWJsZWQgaWYgY29tcGlsaW5nIHRoZSBrZXJuZWwgZm9yCi0JICBh
biBlbWJlZGRlZCBzeXN0ZW0gc28gY2VydGFpbiBleHBlcnQgb3B0aW9ucyBhcmUgYXZhaWxhYmxl
Ci0JICBmb3IgY29uZmlndXJhdGlvbi4KKwkgIFRoaXMgb3B0aW9uIGlzIGJlaW5nIHJlbW92ZWQg
YWZ0ZXIgTGludXggNi42LgorCSAgVXNlIEVYUEVSVCBpbnN0ZWFkIG9mIEVNQkVEREVELgoKYnV0
IHRoZXJlIGlzIG5vIHdheSB0byBwcm9kdWNlIGEgd2FybmluZyBtZXNzYWdlLiBJLmUuLCBldmVu
IHdpdGggdGhpcwpjaGFuZ2UsIHRoZSBtZXNzYWdlIHdpbGwgcHJvYmFibHkgYmUgb3Zlcmxvb2tl
ZC4KCi0tLQp+UmFuZHkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
