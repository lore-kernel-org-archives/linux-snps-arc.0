Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11A1C46467
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Jan 2023 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLg9nttS1RWq3nxoSBysYLXpj+8dt2OlNGwq6uc6oY8=; b=ppsEhen1xknaml
	saNJDW1fxflV15Ope7oxiIDnynKIuNmtDIRdqpgJrJsAVNC5PGTN29De5Pc8lEKLgeh6XotmBICtu
	8jZzMYhHU8M3hYSdnAtRt68jnE0x6bDfuTAQNewZ5QgKIWxDSuWtJnPiYD08ZrEkjgzbuvIYrKcTU
	p0rnSO02YSwh/kdldVzZSLITN8MRWREVYtzJ3h/C13n4VmFCeukF5Ji1dxAf/SB7FPmqzHgaC7jfu
	zioO+H6Il1p/tv4N4lh5HfSycxWFwkHiQbKFb3ZZwYmp4Yi3WpVBodHMZe0G+I8pUAfbzlpKBTegr
	YsLwLgwLgLQxk8mYlmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFJ3M-0086uL-An; Tue, 10 Jan 2023 18:08:52 +0000
Received: from smtp-20.smtpout.orange.fr ([80.12.242.20] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFJ3H-0086s0-AM
	for linux-snps-arc@lists.infradead.org; Tue, 10 Jan 2023 18:08:50 +0000
Received: from [192.168.1.18] ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id FJ34pw6UszUTHFJ34pLghR; Tue, 10 Jan 2023 19:08:38 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 10 Jan 2023 19:08:38 +0100
X-ME-IP: 86.243.100.34
Message-ID: <f4aa7f0d-50a9-b5e0-e980-1e8e779b48bc@wanadoo.fr>
Date: Tue, 10 Jan 2023 19:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] bit_spinlock: Include <asm/processor.h>
To: Vineet Gupta <vgupta@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
 <b5e0bd90-ff29-d301-30ca-2f12028109ce@kernel.org>
Content-Language: fr, en-GB
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <b5e0bd90-ff29-d301-30ca-2f12028109ce@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_100847_533992_3B53F363 
X-CRM114-Status: GOOD (  15.52  )
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

TGUgMTAvMDEvMjAyMyDDoCAwODoxOSwgVmluZWV0IEd1cHRhIGEgw6ljcml0wqA6Cj4gCj4gT24g
MS84LzIzIDExOjA0LCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4+IEluIGFuIGF0dGVtcHQg
dG8gc2ltcGxpZnkgc29tZSBpbmNsdWRlcyBpbiA8aW5jbHVkZS9kY2FjaGUuaD4sIGl0Cj4+IGFw
cGVhcmVkLCB3aGVuIGNvbXBpbGluZyBmcy9lY3J5cHRmcy9kZW50cnkuYywgdGhhdCAKPj4gPGxp
bnV4L2JpdF9zcGlubG9jay5oPgo+PiB3YXMgcmVseWluZyBvbiBvdGhlciBpbmNsdWRlcyB0byBn
ZXQgdGhlIGRlZmluaXRpb24gb2YgY3B1X3JlbGF4KCkuCj4+IChzZWUgWzFdKQo+Pgo+PiBJdCBi
cm9rZSBvbiBhcmMuCj4gCj4gSXQgaXRzIGp1c3QgQVJDIHRoYXQgYnJva2UsIG1heWJlIHdlIGNh
biBkbyBzb21ldGhpbmcgdGhlcmUgPwoKSGksCgpJdCBpcyBhbGwgd2hhdCBidWlsZC1ib3RzIGhh
dmUgc3BvdHRlZCBzbyBmYXIgOikKCkkgZG9uJ3QgdGhpbmsgdGhhdCAiZml4aW5nIiBpdCBpbiBB
UkMgaXMgdGhlIHJpZ2h0IGFwcHJvYWNoLCB1bmxlc3MgSSAKbWlzc2VkIHNvbWV0aGluZy4KCjxs
aW51eC9iaXRfc3BpbmxvY2suaD4gZG9lcyB1c2UgY3B1X3JlbGF4KCksIHNvIGl0IHNob3VsZCBp
bmNsdWRlIHdoYXQgCmlzIG5lZWQgZm9yIHRoYXQsIGFuZCBub3QgcmVseSBvbiBvdGhlciBibGFj
ayBtYWdpYy4KCkNKCgo+IAo+PiBJbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+IGluIDxsaW51eC9i
aXRfc3BpbmxvY2suaD4gdG8gZml4IHRoZSBpc3N1ZS4KPj4gVGhpcyB3aWxsIGhlbHAgcmVtb3Zl
IHNvbWUgdW4tbmVlZGVkIGluY2x1ZGVzIGZyb20gPGluY2x1ZGUvZGNhY2hlLmg+Lgo+Pgo+PiBb
MV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDEwODIxMzAuTFhNajVxa0QtbGtw
QGludGVsLmNvbS8KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJp
c3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4KPj4gLS0tCj4+IE5vdCBzdXJlIHdobyB0byBzZW5k
IHRoaXMgdG8uCj4+IGdldF9tYWludGFpbmVyLnBsIGlzIG9mIG5vIGhlbHAsIGFuZCB0aGUgZmls
ZSBpcyB1bnRvdWNoZWQgZnJvbSBhIHRvbyAKPj4gbG9uZwo+PiB0aW1lLgo+Pgo+PiBHcmVnPyBE
YW4/IEFueSBwb2ludGVyPwo+PiAtLS0KPj4gwqAgaW5jbHVkZS9saW51eC9iaXRfc3BpbmxvY2su
aCB8IDEgKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvYml0X3NwaW5sb2NrLmggYi9pbmNsdWRlL2xpbnV4L2JpdF9z
cGlubG9jay5oCj4+IGluZGV4IGJiYzQ3MzBhNjUwNS4uZDBmZDJhN2FmY2EyIDEwMDY0NAo+PiAt
LS0gYS9pbmNsdWRlL2xpbnV4L2JpdF9zcGlubG9jay5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgv
Yml0X3NwaW5sb2NrLmgKPj4gQEAgLTIsNiArMiw3IEBACj4+IMKgICNpZm5kZWYgX19MSU5VWF9C
SVRfU1BJTkxPQ0tfSAo+PiDCoCAjZGVmaW5lIF9fTElOVVhfQklUX1NQSU5MT0NLX0gKPj4gKyNp
bmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4K
Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3ByZWVtcHQuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2F0
b21pYy5oPgo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
