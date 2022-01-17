Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9912C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Jan 2022 03:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bzg4NJ3HqmxyAWkoAIiw191q9IsPIPHQ58gHpBMLQdc=; b=RKt+73bMCIJYzTU8V4Pm+aVzDN
	BOButZSEGPwwFahhRXnQrYgXZ9a9E5o+aNAXdvJEQS5TojX0q+ETL7/lWkIhsQBFxN7T5lI3QrUkY
	IdrgVBjiMndPuWOK6SBRcBE7Sqe4qCZ2ymRyax0lanjYGTdxJhJscI6cyG5CcSGeRMDWGmTGEyar4
	7ZqAPVWLmI4ZPE4uX4r0gFYRnakHo8NvNpOTPVhI8gVK023XfL2svqaFScLQeh8hSHSi9EL5KZQM9
	hqgVDkkQ2JVSwWntbF1lMDSLlwXt72gwZn3EwD8HHxPt4qaF8zuvZdpgdMmAlAJy95sXoiKtjJGhW
	21X5f9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9IgG-00DJyf-Tq; Mon, 17 Jan 2022 03:27:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9IgE-00DJy4-MR
 for linux-snps-arc@lists.infradead.org; Mon, 17 Jan 2022 03:27:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DD8F60AAD;
 Mon, 17 Jan 2022 03:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80078C36AE3;
 Mon, 17 Jan 2022 03:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642390056;
 bh=GdLTfX9lUGWAaixcKHHob3vDx9b7y5jXsEHjYxzV4Ws=;
 h=To:Cc:From:Subject:Date:From;
 b=SQe87uyFqBEaRfoGnpU//aWF3OggeZy3arw9MO3NAiczN76qCJzlWSYcyxihSdNYR
 7r1l0Jz4i6TyQ8yjwwvo4cojSPOTUjAtfvuRS4mpdctkMH0mxn2IkGDcAIpEuA4f+A
 D3TEI3QnrRpGEnGRoGTrGQrixQv+8pUUVxef2jdzJhH35XSP3BudhOVfMFxjWk7gdE
 kSM0lFwQdrQA75VY3XAfJ+69a5Z3jCIuBmxmXklJYdGBw/h9FWtzBrI/P9mzVwaoTT
 WPX8j5Lgri0rUJh+vvp6imVVFCjMYNQATXqbsxAisNmuQiAkwWutceh0TeNIWHBwu0
 X2auQ+lO7fvZg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, abrodkin@synopsys.com,
 Yihao Han <hanyihao@vivo.com>, Kees Cook <keescook@chromium.org>,
 colin.i.king@googlemail.com, Colin Ian King <colin.i.king@gmail.com>,
 Vladimir Isaev <isaev@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>
From: Vineet Gupta <vgupta@kernel.org>
Subject: [GIT PULL] ARC updates for 5.17-rc1
Message-ID: <4af6c0e7-03a3-702c-f364-b0ebe0f8923a@kernel.org>
Date: Sun, 16 Jan 2022 19:27:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_192738_780966_C54973DD 
X-CRM114-Status: GOOD (  10.86  )
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

SGkgTGludXMsCgpBUkMgZml4ZXMgZm9yIDUuMTcuIE5vdGhpbmcgdG9vIGV4Y2l0aW5nIGZvciBu
b3cuCgpUaHgsCi1WaW5lZXQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLT4KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBmYzc0ZTBhNDBlNGY5ZmQw
NDY4ZTM0MDQ1YjBjNDViYmExMWRjYmIyOgoKIMKgIExpbnV4IDUuMTYtcmM3ICgyMDIxLTEyLTI2
IDEzOjE3OjE3IC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
CgogwqAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3ZndXB0
YS9hcmMuZ2l0LyAKdGFncy9hcmMtNS4xNy1yYzEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byA4ZjY3ZjY1ZDEyMWNjM2JiYjRmZmFhZTgwZTg4MGFlYjMwN2Q0OWY0OgoKIMKgIGFyYzog
dXNlIHN3YXAoKSB0byBtYWtlIGNvZGUgY2xlYW5lciAoMjAyMS0xMi0yOCAxOTo0OTo0NCAtMDgw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KRml4ZXMgZm9yIEFSQyBmb3IgNS4xNwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbGV4ZXkgQnJvZGtp
biAoMSk6CiDCoMKgwqDCoMKgIGFyYzogcGVyZjogTW92ZSBzdGF0aWMgc3RydWN0cyB0byB3aGVy
ZSB0aGV5J3JlIHJlYWxseSB1c2VkCgpDb2xpbiBJYW4gS2luZyAoMSk6CiDCoMKgwqDCoMKgIEFS
QzogcGVyZjogUmVtb3ZlIHJlZHVuZGFudCBpbml0aWFsaXphdGlvbiBvZiB2YXJpYWJsZSBpZHgK
CktlZXMgQ29vayAoMSk6CiDCoMKgwqDCoMKgIGFyYzogUmVwbGFjZSBsa21sLm9yZyBsaW5rcyB3
aXRoIGxvcmUKClJhbmR5IER1bmxhcCAoMSk6CiDCoMKgwqDCoMKgIEFSQzogdGhyZWFkX2luZm8u
aDogY29ycmVjdCB0d28gdHlwb3MgaW4gYSBjb21tZW50CgpWaW5lZXQgR3VwdGEgKDEpOgogwqDC
oMKgwqDCoCBBUkM6IHBlcmY6IGZpeCBtaXNsZWFkaW5nIGNvbW1lbnQgYWJvdXQgcG11IHZzIGNv
dW50ZXIgc3RvcAoKWWloYW8gSGFuICgxKToKIMKgwqDCoMKgwqAgYXJjOiB1c2Ugc3dhcCgpIHRv
IG1ha2UgY29kZSBjbGVhbmVyCgogwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9pcnFmbGFncy1jb21w
YWN0LmggfMKgwqAgOCArLQogwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9wZXJmX2V2ZW50LmjCoMKg
wqDCoMKgwqAgfCAxNjIgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIMKgYXJjaC9h
cmMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaMKgwqDCoMKgwqAgfMKgwqAgNCArLQogwqBhcmNo
L2FyYy9rZXJuZWwvcGVyZl9ldmVudC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE2NiAKKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIMKgYXJjaC9hcmMva2VybmVsL3Vud2luZC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMSArLS0KIMKgYXJjaC9hcmMvbW0v
ZG1hLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAy
ICstCiDCoGFyY2gvYXJjL3BsYXQtYXhzMTB4L2F4czEweC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMiArLQogwqBhcmNoL2FyYy9wbGF0LWhzZGsvcGxhdGZvcm0uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKy0KIMKgOCBmaWxlcyBjaGFuZ2VkLCAxNzggaW5zZXJ0aW9ucygrKSwg
MTc5IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1zbnBzLWFyYwo=
