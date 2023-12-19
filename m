Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4728BC41535
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Dec 2023 05:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGl2rd2NCphPXSDB8wFGgEcTgGxU2Gnl4goZId9+caw=; b=UcAEV5Qw7X/7b7
	M9OqZpoyQekOaKM2G7bbk3bF+6zSnWfjn6rJoI3zJhIQ+AQQ2yH7B4xUqBkJjqRwWvpCo2lLHYUsg
	rPoERwFgl+jjL5fkITn533Dcxp3oBQTI7GytgJc5lGeHYAJgCRL/xdzckCDJek5wDiVEPlnZDhHZ6
	9b8/IGFz/1m0Rhf7ItR6UmiuXt9J5shScrLjiy/1DvSvyLnMfbRI5gZAIvMhDlonV50eSO5Jeoaxg
	jAO+xvYspr2Vr89xcF7lfrNNKrDx8STJOhj9H1kqi4rmPtc6sTwd5nPFeIXpEE9xAJ1vCkkeaOaWV
	PO+92OZul94Ac08pVk4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFSVZ-00CsPQ-0C;
	Tue, 19 Dec 2023 05:19:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFSVW-00CsOy-2m
	for linux-snps-arc@lists.infradead.org;
	Tue, 19 Dec 2023 05:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 985416118A;
	Tue, 19 Dec 2023 05:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17141C433C8;
	Tue, 19 Dec 2023 05:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702963145;
	bh=EegGAbquI0Kz77iG8EbA05ksIWJlcmWcA5xeDy8CDcQ=;
	h=Date:To:Cc:From:Subject:From;
	b=FLlQsIzXG7T1eSey28exVXvIm2EjuszTK7dqEwUj/hUOZ06It3BfYgqFBD6yF2xKT
	 JbYoyjnDk9ni4NIUcsTf7rIjMbpu9QcEbIxo3Ic2oXYbbLQp+hOjIshM3U7PSamwuL
	 zZy41Pgtb1Epk6ApcbdATcegYhsYFgDGVJ7DZ2Zv0btAvKZnCxxzyt3ihLD5OAPmmR
	 L7d2stUvN5wWkGMvT7wDtOeJyK3vDPcj78FjBAoC+7xO4mR2skXLY2ISLGjcibjaNd
	 VnDt/FYsaGEQFZ5567P8BTOEEvC2RtP53cjk2/lsNAjWUVrqCvkyCaeYwiEm+TH6f+
	 2cNnS3YV88bgg==
Message-ID: <889dc07d-f00f-4012-985d-314da7dda52d@kernel.org>
Date: Mon, 18 Dec 2023 21:19:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Pavel Kozlov
 <Pavel.Kozlov@synopsys.com>, Dan Carpenter <dan.carpenter@linaro.org>
From: Vineet Gupta <vgupta@kernel.org>
Subject: [GIT PULL] ARC fixes for 6.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_211906_956613_084DE894 
X-CRM114-Status: UNSURE (   6.28  )
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

SGkgTGludXMsCgpMYXRlIGluIHRoZSBjeWNsZSBidXQgd2UgaGF2ZSBhIGJ1bmNoIG9mIGZpeGVz
IGZvciBBUkMuIFBsZWFzZSBwdWxsLgoKVGh4LAotVmluZWV0CgotLS0tLS0tLS0tLS0tLS0+ClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMzNjYzkzOGU2NWE5OGYxZDI5ZDBhMTg0
MDNkYmJlZTA1MGRjYWQ5YToKCsKgIExpbnV4IDYuNy1yYzQgKDIwMjMtMTItMDMgMTg6NTI6NTYg
KzA5MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCsKgIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92Z3VwdGEvYXJjLmdpdC8K
dGFncy9hcmMtNi43LWZpeGVzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gOWE3MzNk
YzRmYmVlYzNmNmQ5OTY0NWI4NDU3MTJiMDM1ZTc0NDBjZjoKCsKgIEFSQzogYWRkIGh1Z2V0bGIg
ZGVmaW5pdGlvbnMgKDIwMjMtMTItMTMgMTk6MzM6MTAgLTA4MDApCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFSQyBmaXhl
cyBmb3IgNi43CgrCoC0gYnVpbGQgZXJyb3IgZm9yIGh1Z2V0bGIsIHNwYXJzZSBhbmQgc21hdGNo
IGZpeGVzCgrCoC0gUmVtb3ZhbCBvZiBWSVBUIGFsaWFzaW5nIGNhY2hlIGNvZGUKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
UGF2ZWwgS296bG92ICgxKToKwqDCoMKgwqDCoCBBUkM6IGFkZCBodWdldGxiIGRlZmluaXRpb25z
CgpWaW5lZXQgR3VwdGEgKDUpOgrCoMKgwqDCoMKgIEFSQzogZW50cnk6IFNBVkVfQUJJX0NBTExF
RV9SRUc6IElTQS9BQkkgc3BlY2lmaWMgaGVscGVyCsKgwqDCoMKgwqAgQVJDOiBlbnRyeTogbW92
ZSBBUkNvbXBhY3Qgc3BlY2lmaWMgYml0cyBvdXQgb2YgZW50cnkuaArCoMKgwqDCoMKgIEFSQzog
bW06IHJldGlyZSBzdXBwb3J0IGZvciBhbGlhc2luZyBWSVBUIEQkCsKgwqDCoMKgwqAgQVJDOiBm
aXggc3BhcmUgZXJyb3IKwqDCoMKgwqDCoCBBUkM6IGZpeCBzbWF0Y2ggd2FybmluZwoKwqBhcmNo
L2FyYy9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCA1IC0tCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5owqDCoMKgIHzCoCA0MyAt
LS0tLS0tLS0tLQrCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL2VudHJ5LWFyY3YyLmjCoMKgIHzCoCAz
MiArKysrKysrKysKwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9lbnRyeS1jb21wYWN0LmggfMKgIDg3
ICsrKysrKysrKysrKysrKysrKysrKy0KwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9lbnRyeS5owqDC
oMKgwqDCoMKgwqDCoCB8IDExMCArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCsKgYXJjaC9h
cmMvaW5jbHVkZS9hc20vaHVnZXBhZ2UuaMKgwqDCoMKgwqAgfMKgwqAgNyArKwrCoGFyY2gvYXJj
L2luY2x1ZGUvYXNtL3B0cmFjZS5owqDCoMKgwqDCoMKgwqAgfMKgIDE0ICsrLS0KwqBhcmNoL2Fy
Yy9rZXJuZWwvc2V0dXAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KwqBh
cmNoL2FyYy9rZXJuZWwvc2lnbmFsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNiAr
LQrCoGFyY2gvYXJjL21tL2NhY2hlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgMTM2CisrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCsKgYXJjaC9hcmMvbW0v
bW1hcC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyMSArLS0tLS0K
wqBhcmNoL2FyYy9tbS90bGIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxNiArKy0tLQrCoDEyIGZpbGVzIGNoYW5nZWQsIDE1NSBpbnNlcnRpb25zKCspLCAzMjYg
ZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
