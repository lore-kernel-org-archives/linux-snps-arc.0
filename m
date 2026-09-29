Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9018CA5FAC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 29 Sep 2026 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UxRDUXY7KTmEuSyQX8BcHuW9MgQ0jlH8ocW5gTIGTGw=; b=tL5jaPjkaLtNO+LvGt/7RDhhFi
	LLJjwHOe53lbUZzQBanfyC/qj5F56XC5NVzFnhOjSdB6rV6SzIj1haFep3hyiNUt7ug81q3u7Uyim
	q0LKVJBxCHMLxDBueFHNAC/uGzr9fx3jKfmsw/CbR/x8C19G8uKGJYsXVpnpaKwX9QSbvgIMrOpMB
	AJrQCvqEAByejn97gcelaxKEWyxVMkJQr6+8Xim2FAdWPvq2G7h3K56jcs3qr5haOtTpHQK7IgoX8
	Ps37HvEwG3Z2nT0dwYcRKViYRXo1a5M47KUJNJbt7mjTXNvLkuPGCm1WXbIv4tsPNG6vnxVyLwjf9
	CvZ5VBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBc6U-00000004F5I-05gB;
	Tue, 29 Sep 2026 17:58:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBc6R-00000004F4z-44Hi
	for linux-snps-arc@lists.infradead.org;
	Tue, 29 Sep 2026 17:58:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 12BEF6022B;
	Tue, 29 Sep 2026 17:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827061F000FF;
	Tue, 29 Sep 2026 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790704734;
	bh=vk3nxwp/7lZZyp5CGxF5TgatcwDjt9KZTeaXzgNAE2I=;
	h=Date:From:To:Cc:Subject;
	b=UKUtNz0OGYJcm4trvq+cBEKFIwHEtOln0ej9SvH+RCOz2VdQujJo3RG7egLWGrg2A
	 vEpZs5la1aIlchPjzCaQnrCcXaNOehTe+G10L7ZRgm7Qq4861S030WUyTPTNf99RKz
	 LhWd4rB4pXWqhZZ1jEaSkHdXHukdi06NZbpt88khVRibSrHsr6qCnhWz2Yq6OR1UWj
	 se1U9BiKXOMYZXZcTDvevYhjlsEIEzYdofSy+10MV6jttA2QxtDJ8cCqpTE4FR5AK5
	 x7ubb6c7xKx+328SVZDx9BpL/wXODJlAT43syyakIp4W52ggoz7EHDylAJoQ2Q06KJ
	 q9ZCRjpn+uluA==
Message-ID: <edb955af-9153-4db1-8a9e-3d729cb99753@kernel.org>
Date: Tue, 29 Sep 2026 10:58:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Bradley Morgan <brads@mainlining.org>, blaze <1466528493@qq.com>,
 Anthony Iliopoulos <ailiop@suse.com>, "Paul E. McKenney" <paulmck@kernel.org>
Subject: [GIT PULL] ARC updates for 7.3
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

SGkgTGludXMsCgpBIGJ1bmNoIG9mIGZpeGVzIGZvciBBUkMuIFBsZWFzZSBwdWxsLgoKVGh4Ci1W
aW5lZXQKLS0tLS0tPgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGRmMjkwODA5
MGNkYTM2OGIwMWZmNDM3MDlmNTE4OTAwNzZjNTYxNTc6CgogwqAgTGludXggNy4zLXJjMiAoMjAy
Ni0wOS0wNiAxNTowNzoyMCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0OgoKIMKgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC92Z3VwdGEvYXJjLmdpdC8gCnRhZ3MvYXJjLWZpeGVzLTcuMwoKZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIGYwNTBjM2U2MWQyYTFhYWVjZTMxNzBkNDU5ZTRjZTVmYTI0ODZjMTI6Cgog
wqAgQVJDOiBhcmNoX2NtcHhjaGdfcmVsYXhlZCB0byB1c2Ugc2l6ZSBvZiBwb2ludGVkIHR5cGUg
bm90IHBvaW50ZXIgCigyMDI2LTA5LTI0IDIxOjE3OjA5IC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBUkMgZml4
ZXMgZm9yIDcuMwoKIMKgLSBjbXB4Y2hnIHNuYWZ1IFtCcmFkbGV5XSBhbmQgb3RoZXIgbWlzY2xs
IGZpeGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkFudGhvbnkgSWxpb3BvdWxvcyAoMSk6CiDCoCDCoCDCoCBhcmM6IHJl
bW92ZSB1bnVzZWQgcHJvZmlsZS5oIGluY2x1ZGVzCgpKdWxpYW4gQnJhaGEgKDEpOgogwqAgwqAg
wqAgQVJDOiBjbGVhbnVwIGRlYWQgQVJDX0NBTlRfTExTQyBvcHRpb24gaW4gS2NvbmZpZwoKVmlu
ZWV0IEd1cHRhICgxKToKIMKgIMKgIMKgIEFSQzogYXJjaF9jbXB4Y2hnX3JlbGF4ZWQgdG8gdXNl
IHNpemUgb2YgcG9pbnRlZCB0eXBlIG5vdCBwb2ludGVyCgpibGF6ZSAoMSk6CiDCoCDCoCDCoCBh
cmM6IGtlcm5lbDogRml4IGNsayByZWZlcmVuY2UgbGVhayBpbiBzaG93X2NwdWluZm8oKQoKIMKg
YXJjaC9hcmMvS2NvbmZpZ8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgNCAtLS0t
CiDCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL2F0b21pYzY0LWFyY3YyLmggfCA2ICsrKysrKwogwqBh
cmNoL2FyYy9pbmNsdWRlL2FzbS9jbXB4Y2hnLmjCoCDCoCDCoCDCoCB8IDQgKystLQogwqBhcmNo
L2FyYy9rZXJuZWwvc2V0dXAuY8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCAxICsKIMKgYXJjaC9h
cmMva2VybmVsL3NtcC5jwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDEgLQogwqA1IGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
