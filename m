Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74A9E7717F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 01:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWqpRea5hZ0cA1u6y2u3h+pSU9XuulwMZ/OFxUUMGUs=; b=bGPRmQCzJXLrCZ
	O1CYiVOZXd7ZKXYzhMO/sNb3VUfiQCFAMDBsYT8doiLhe+bx9Te/G+V5MLs8U4bCied7QHodviEH0
	NBWkoX7NX+BZWULiqasvV9tcfwoYdSXNDzf8KoxENRQ5o8g1UITJBMOOJXzhQ6GkG0WyfeE2kiy7Y
	8VEgQ1DhzQY8gjqJcZPsqvTt7ggaI5BEaqMbvQPiwRA2yDTO6ATQHOaJfgynqkPz2HRxY2Ac4QzW/
	3KRBLjtcAwRN1f9qZNAQKZOJ0jcI9HIGioYZu6NYs2TdOSKAHWOhu3ojzRkmOchJ2iwBT2m0rHQoL
	mEZANgHxqmgg7DqLC6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLueS-00000002QQW-2gE1;
	Fri, 13 Dec 2024 01:39:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLueP-00000002QPi-2qAm
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 01:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F690A4181C;
	Fri, 13 Dec 2024 01:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F0DC4CECE;
	Fri, 13 Dec 2024 01:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734053968;
	bh=Ra1VxdQ/8TTZ3X+c+TRhwdx4G2iTjHWTA1/OfqsPyjo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z3JwfwRX6jNTUf4Z3ox6fIBTKaOeclJYu3kuES5HJjZPz3ZAX7YCEpjZho+EJzP7a
	 GPxsAA3tcIJ+wVvR9aZuYZu4h2w+4PaEQ54qu6c8LeEuwsVv514Tdkqju7swD0LaWR
	 oRcWt5KPiztBdbDMhOAqU/DzHyuqdfx85eRfvamUPNXL4O0L+/0p//RORhrw7tLyEj
	 R+pFLxoFowDOG7exMMbL20biJuuu1WtqzfOKqqrBthe+Ync8h9XaN4aeR7kKrw/pQR
	 FuMtouxSbaQCSEjdc0KvZR7ryp96zgpwfige+3S02GPzITFRpl0mVR+ELSJlBuZa6t
	 258hnWHe7/zSg==
Message-ID: <61367642-43a6-46e9-a231-dbb178fd304e@kernel.org>
Date: Thu, 12 Dec 2024 17:39:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: build: Try to guess GCC variant of cross compiler
To: Leon Romanovsky <leon@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <00d3173fe207ab9ba85dc974777a6ccb4656b03c.1733229205.git.leonro@nvidia.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <00d3173fe207ab9ba85dc974777a6ccb4656b03c.1733229205.git.leonro@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_173929_774957_D3890808 
X-CRM114-Status: GOOD (  11.61  )
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

T24gMTIvMy8yNCAwNDozNywgTGVvbiBSb21hbm92c2t5IHdyb3RlOgo+IEZyb206IExlb24gUm9t
YW5vdnNreSA8bGVvbnJvQG52aWRpYS5jb20+Cj4KPiBBUkMgR0NDIGNvbXBpbGVyIGlzIHBhY2th
Z2VkIHN0YXJ0aW5nIGZyb20gRmVkb3JhIDM5aSBhbmQgdGhlIEdDQwo+IHZhcmlhbnQgb2YgY3Jv
c3MgY29tcGlsZSB0b29scyBoYXMgYXJjLWxpbnV4LWdudS0gcHJlZml4IGFuZCBub3QKPiBhcmMt
bGludXgtLiBUaGlzIGlzIGNhdXNpbmcgdGhhdCBDUk9TU19DT01QSUxFIHZhcmlhYmxlIGlzIGxl
ZnQgdW5zZXQuCj4KPiBUaGlzIGNoYW5nZSBhbGxvd3MgYnVpbGRzIHdpdGhvdXQgbmVlZCB0byBz
dXBwbHkgQ1JPU1NfQ09NUElMRSBhcmd1bWVudAo+IGlmIGRpc3RybyBwYWNrYWdlIGlzIHVzZWQu
Cj4KPiBCZWZvcmUgdGhpcyBjaGFuZ2U6Cj4gJCBtYWtlIC1qIDEyOCBBUkNIPWFyYyBXPTEgZHJp
dmVycy9pbmZpbmliYW5kL2h3L21seDQvCj4gICBnY2M6IHdhcm5pbmc6IOKAmC1tY3B1PeKAmSBp
cyBkZXByZWNhdGVkOyB1c2Ug4oCYLW10dW5lPeKAmSBvciDigJgtbWFyY2g94oCZIGluc3RlYWQK
PiAgIGdjYzogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIOKAmC1tbWVk
aXVtLWNhbGxz4oCZCj4gICBnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9w
dGlvbiDigJgtbWxvY2vigJkKPiAgIGdjYzogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kLWxp
bmUgb3B0aW9uIOKAmC1tdW5hbGlnbmVkLWFjY2Vzc+KAmQo+Cj4gWzFdIGh0dHBzOi8vcGFja2Fn
ZXMuZmVkb3JhcHJvamVjdC5vcmcvcGtncy9jcm9zcy1nY2MvZ2NjLWFyYy1saW51eC1nbnUvaW5k
ZXguaHRtbAo+IFNpZ25lZC1vZmYtYnk6IExlb24gUm9tYW5vdnNreSA8bGVvbnJvQG52aWRpYS5j
b20+CgpBZGRlZCB0byBmb3ItY3Vyci4KClRoeCwKLVZpbmVldAoKPiAtLS0KPiAgYXJjaC9hcmMv
TWFrZWZpbGUgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjL01ha2VmaWxlIGIvYXJjaC9hcmMvTWFr
ZWZpbGUKPiBpbmRleCAyMzkwZGQwNDJlMzYuLmZiOTg0NzhlZDFhYiAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FyYy9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvYXJjL01ha2VmaWxlCj4gQEAgLTYsNyArNiw3
IEBACj4gIEtCVUlMRF9ERUZDT05GSUcgOj0gaGFwc19oc19zbXBfZGVmY29uZmlnCj4gIAo+ICBp
ZmVxICgkKENST1NTX0NPTVBJTEUpLCkKPiAtQ1JPU1NfQ09NUElMRSA6PSAkKGNhbGwgY2MtY3Jv
c3MtcHJlZml4LCBhcmMtbGludXgtIGFyY2ViLWxpbnV4LSkKPiArQ1JPU1NfQ09NUElMRSA6PSAk
KGNhbGwgY2MtY3Jvc3MtcHJlZml4LCBhcmMtbGludXgtIGFyY2ViLWxpbnV4LSBhcmMtbGludXgt
Z251LSkKPiAgZW5kaWYKPiAgCj4gIGNmbGFncy15CSs9IC1mbm8tY29tbW9uIC1waXBlIC1mbm8t
YnVpbHRpbiAtbW1lZGl1bS1jYWxscyAtRF9fbGludXhfXwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
