Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F776C10F04
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Dec 2023 00:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ov4hRsRDCRm1LfRvuFrBv/u8hU4vZGN7EImSVt0QkpE=; b=hfw6gkp/ttlrl0
	tNekNPCcqtnbxhdtyCEUmhoIFA+F6h6ysreppYQXuVbhxO6mVxbTsauM0B047ay9/BSa2R4sIaugN
	YfqRrFx47K76EAJUoctQ/WmDa9d1iDSz3fY/vPRu9hIKNIk9elfdFOAkwv8PbnAjABac4Mz1niYta
	8dD5jCY8XKrtQpBf+hnVpsdR13/SB/OBnHvV/NnnwadF2eMLDAkunagAp7K/PPpjF0+ULMjIFM4qS
	AGDLw6IqDmyLpPJ6lCJAw8BRmdp8ioMk1ImMbo0nNb05q2XzrWXP7agrz8VQSN/JvNh/v8xTuPV35
	Y904GYFEHnXcCc6nNwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlI0-00Gpc3-0p;
	Sat, 09 Dec 2023 00:33:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHw-00GpbS-2r
	for linux-snps-arc@lists.infradead.org;
	Sat, 09 Dec 2023 00:33:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D275262638;
	Sat,  9 Dec 2023 00:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DFFC433C8;
	Sat,  9 Dec 2023 00:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702082026;
	bh=AfLb7lzkekGavRKpv+fk7GiWlvNDaLb3U1ZIzEmK8vc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s/AC66OH8JYebqlwn7OY8iCTM3N3Z5QjmwjeORQmgOQYNGEUxU9lFRuUytR5985NK
	 w5QAAdBIPHdBfee73BSoMsySU7ilCs76Ck6nvwyS7eZpX7wQPt1uLuXKDpxcfseJ7h
	 15UoWofUJQRlDqCiz8Z/dNBhkkqtrhyPL3sGTX9lxt8dsNVX4jdfKnFFIGEAPMGyv2
	 cunwV+v7cpv0F1m3S7yluXxE4l99rWVFIN7sFUyOBVM8Wf8f6IteZJl84BuJHfVQob
	 4EAF0rIMtyEc7TY7GUHoF4umQEeAoW6AWeCn7EsqJXV1bnFryCyrMzVggpjTh2vGnw
	 9Dz4oSRZJE/+w==
Message-ID: <b78607e5-6965-4e7f-b43a-c1ca58eecf89@kernel.org>
Date: Fri, 8 Dec 2023 16:33:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error:
 uninitialized symbol 'release'.
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Vineet Gupta <vgupta@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org
References: <c2148229-bea9-40ef-bbf3-6019555f3f1a@suswa.mountain>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <c2148229-bea9-40ef-bbf3-6019555f3f1a@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_163348_990879_0D9D885D 
X-CRM114-Status: UNSURE (   5.84  )
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

T24gMTEvMjcvMjMgMjI6MjIsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gdHJlZTogICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQgbWFzdGVyCj4gaGVhZDogICAyY2MxNGY1MmFlYjc4Y2UzZjI5Njc3YzJkZTFmMDZjMGU5MTQ3
MWFiCj4gY29tbWl0OiBmYWQ4NGUzOWYxMTYwMzVhZThkNTUwYzYwMjAxMDdiOGFjMTEzYjQ1IEFS
QzogYm9vdCBsb2c6IGVsaW1pbmF0ZSBzdHJ1Y3QgY3B1aW5mb19hcmMgIzQ6IGJvb3QgbG9nIHBl
ciBJU0EKPiBjb25maWc6IGFyYy1yYW5kY29uZmlnLXIwNzEtMjAyMzExMjggKGh0dHBzOi8vZG93
bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIzMTEyOC8yMDIzMTEyODA5MDYuVkFJd0VB
ZlQtbGtwQGludGVsLmNvbS9jb25maWcpCj4gY29tcGlsZXI6IGFyY2ViLWVsZi1nY2MgKEdDQykg
MTMuMi4wCj4gcmVwcm9kdWNlOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNo
aXZlLzIwMjMxMTI4LzIwMjMxMTI4MDkwNi5WQUl3RUFmVC1sa3BAaW50ZWwuY29tL3JlcHJvZHVj
ZSkKPgo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChp
LmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBr
aW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+Cj4gfCBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZXJyb3Iy
N0BnbWFpbC5jb20+Cj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzEx
MjgwOTA2LlZBSXdFQWZULWxrcEBpbnRlbC5jb20vCj4KPiBOZXcgc21hdGNoIHdhcm5pbmdzOgo+
IGFyY2gvYXJjL2tlcm5lbC9zZXR1cC5jOjIwMyBhcmN2Ml9tdW1ib2p1bWJvKCkgZXJyb3I6IHVu
aW5pdGlhbGl6ZWQgc3ltYm9sICdyZWxlYXNlJy4KClRoeCwgSSd2ZSBwb3N0ZWQgYSBmaXguCgo+
IE9sZCBzbWF0Y2ggd2FybmluZ3M6Cj4gYXJjaC9hcmMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8u
aDo2MiBjdXJyZW50X3RocmVhZF9pbmZvKCkgZXJyb3I6IHVuaW5pdGlhbGl6ZWQgc3ltYm9sICdz
cCcuCgpUaGlzIHNlZW1zIGxpa2UgYSBmYWxzZSB3YXJuaW5nLiBJdHMgYSByZWdpc3RlciB2YXJp
YWJsZSBhbmQgdGh1cyBjYW4ndApwb3NzaWJseSBiZSBpbml0aWFsaXplZC4KCnN0YXRpYyBpbmxp
bmUgX19hdHRyaWJ1dGVfY29uc3RfXyBzdHJ1Y3QgdGhyZWFkX2luZm8KKmN1cnJlbnRfdGhyZWFk
X2luZm8odm9pZCkKewrCoMKgIMKgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBzcCBhc20oInNwIik7
CsKgwqAgwqByZXR1cm4gKHN0cnVjdCB0aHJlYWRfaW5mbyAqKShzcCAmIH4oVEhSRUFEX1NJWkUg
LSAxKSk7Cn0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
