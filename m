Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6D9C71135
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Jun 2025 03:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IZhMlw5uE7SXWc9BJRvecU1Ppz+0Q4sAXxJpVrMq0Ho=; b=DmBNnDaIupJaMy
	AtiePXTTQ9zOFE1ha3qGK84MA+zMg00L68rD1sJnJuQkeKwtWBZUU2MCSg51w9V9I2v2AEoK0BcAq
	lxhk3yMR/FF9JfqXGcyBzOJQiFlev2NOm7DkBRh53U39xywn8bP4AvrdDCPyN3Obsw8cvV4gvZUjp
	amGMeMOf+jM0CyoRBFXnqDd+8PODROT6zrGHP36Ka0abWO6zH6x5nTX3D2cE/9Wo5aQHoTtcugtqI
	4jxoaVFYppVHCjqkQ+CyQ8Nm9eWyZAqTEBNiE+kFAmUE4EiGmbtH7dmztKPbDlkf7+7wcCMqybSxS
	N0IWEhCvi0TfLCSp3m6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYel-0000000C4W7-3dkI;
	Thu, 12 Jun 2025 03:31:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYdQ-0000000C4O1-2Sy6
	for linux-snps-arc@lists.infradead.org;
	Thu, 12 Jun 2025 03:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9F13436E5;
	Thu, 12 Jun 2025 03:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726B4C4CEEB;
	Thu, 12 Jun 2025 03:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749698986;
	bh=KQgaKueJ8SmL0GquEvj6xboQpRgNJFsrZHkCTWpTp9k=;
	h=Date:From:To:Cc:Subject:From;
	b=ixxiEf70uRv01WItso+c7o/nLY9PQPuISDzE3o9AtzXysgAUOa99S4bzIDdMGLvx1
	 l9M5apUZ0gKN3U7+wmMg1MTDemHHa9qOAUSaQdnJTzfXMOh7OwvusgGIJD4kjcaaYn
	 Ck2hStZnba7MQ4f5EFUK22WVE45yYmmFDIL6Bf5aTWna5s3dPRj73o8vDYbfOfWXOV
	 UshP9osJA/npc1jJGrSXN6dd4J1ytF2QKHINViI/DRM77elJlkSD3k1SfPmvsCUh1n
	 t2yrota3Hio3BFL3bmotcxWnw48J/YtNdRaV+h801ZRxgOURdmjIE9ntCabtDIcjua
	 oWAjg0fePTwVg==
Message-ID: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
Date: Wed, 11 Jun 2025 20:29:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Subject: [GIT PULL] ARC updates for 6.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_202948_669099_88C591AF 
X-CRM114-Status: UNSURE (   4.99  )
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

SGkgTGludXMsCgpTb21lIGZpeGVzIGZvciBBUkMuClBsZWFzZSBQdWxsLgoKVGh4LAotVmluZWV0
Ci0tLS0tLS0tLS0tLS0tLS0tLT4KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAx
OTI3MmIzN2FhNGY4M2NhNTJiZGY5YzE2ZDVkODFiZGQxMzU0NDk0OgoKwqAgTGludXggNi4xNi1y
YzEgKDIwMjUtMDYtMDggMTM6NDQ6NDMgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKCsKgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC92Z3VwdGEvYXJjLmdpdC8gdGFncy9hcmMtNi4xNi1yYzEKCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0byAxNzllOTQ5NzE5ZmU4MTIxOWEzZTIzZjFlNzE2YWMyZDAyZWVhODQ1
OgoKwqAgQVJDOiBSZXBsYWNlIF9fQVNTRU1CTFlfXyB3aXRoIF9fQVNTRU1CTEVSX18gaW4gdGhl
IG5vbi11YXBpIGhlYWRlcnMKKDIwMjUtMDYtMDkgMDk6MTg6MTIgLTA3MDApCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFS
QyBmaXhlcyBmb3IgNi4xNgoKwqAtIGFyY2hfYXRvbWljNjRfY21weGNoZyByZWxheGVkIHZhcmlh
bnQgW0phc29uXQoKwqAtIHVzZSBvZiBpbmJ1aWx0IHN3YXAgaW4gc3RhY2sgdW53aW5kZXLCoCBb
WXUtQ2h1biBMaW5dCgrCoC0gdXNlIG9mIF9fQVNTRU1CTEVSX18gaW4ga2VybmVsIGhlYWRlcnMg
W1Rob21hcyBIdXRoXQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpKYXNvbiBHdW50aG9ycGUgKDEpOgrCoMKgwqDCoMKgIEFS
QzogYXRvbWljczogSW1wbGVtZW50IGFyY2hfYXRvbWljNjRfY21weGNoZyB1c2luZyBfcmVsYXhl
ZAoKVGhvbWFzIEh1dGggKDIpOgrCoMKgwqDCoMKgIEFSQzogUmVwbGFjZSBfX0FTU0VNQkxZX18g
d2l0aCBfX0FTU0VNQkxFUl9fIGluIHVhcGkgaGVhZGVycwrCoMKgwqDCoMKgIEFSQzogUmVwbGFj
ZSBfX0FTU0VNQkxZX18gd2l0aCBfX0FTU0VNQkxFUl9fIGluIHRoZSBub24tdWFwaSBoZWFkZXJz
CgpZdS1DaHVuIExpbiAoMSk6CsKgwqDCoMKgwqAgQVJDOiB1bndpbmQ6IFVzZSBidWlsdC1pbiBz
b3J0IHN3YXAgdG8gcmVkdWNlIGNvZGUgc2l6ZSBhbmQgaW1wcm92ZQpwZXJmb3JtYW5jZQoKwqBh
cmNoL2FyYy9pbmNsdWRlL2FzbS9hcmNyZWdzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vYXRvbWljLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDQgKystLQrCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL2F0b21pYzY0LWFyY3YyLmjCoMKg
wqDCoCB8IDE1ICsrKysrLS0tLS0tLS0tLQrCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL2JpdG9wcy5o
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KwqBhcmNoL2FyYy9pbmNsdWRlL2Fz
bS9idWcuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tCsKgYXJjaC9h
cmMvaW5jbHVkZS9hc20vY2FjaGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsr
LS0KwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9jdXJyZW50LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCA0ICsrLS0KwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9kc3AtaW1wbC5owqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDIgKy0KwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9kc3AuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vZHdh
cmYuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KwqBhcmNoL2FyYy9pbmNs
dWRlL2FzbS9lbnRyeS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKystLQrCoGFy
Y2gvYXJjL2luY2x1ZGUvYXNtL2lycWZsYWdzLWFyY3YyLmjCoMKgwqDCoCB8wqAgNCArKy0tCsKg
YXJjaC9hcmMvaW5jbHVkZS9hc20vaXJxZmxhZ3MtY29tcGFjdC5owqDCoCB8wqAgNCArKy0tCsKg
YXJjaC9hcmMvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5owqDCoMKgwqDCoMKgwqDCoCB8wqAgNCAr
Ky0tCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vbGlua2FnZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgNiArKystLS0KwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9tbXUtYXJjdjIuaMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgNCArKy0tCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vbW11LmjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9w
YWdlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KwqBhcmNoL2FyYy9p
bmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMtYXJjdjIuaCB8wqAgNCArKy0tCsKgYXJjaC9hcmMvaW5j
bHVkZS9hc20vcGd0YWJsZS1sZXZlbHMuaMKgwqDCoMKgIHzCoCA0ICsrLS0KwqBhcmNoL2FyYy9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KwqBh
cmNoL2FyYy9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCAr
Ky0tCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vcHRyYWNlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDQgKystLQrCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL3N3aXRjaF90by5owqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAyICstCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaMKg
wqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KwqBhcmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL3B0cmFj
ZS5owqDCoMKgwqDCoMKgwqAgfMKgIDQgKystLQrCoGFyY2gvYXJjL2tlcm5lbC91bndpbmQuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMSArLS0tLS0tLS0tLQrCoDI3IGZp
bGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFp
bGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
