Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC94C4345F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Apr 2024 19:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YjMO0e8CcILDvhG7O89TQbtPNEujZ0h1qQKv2xLqh8I=; b=k7SdZgc8MO4v3M
	PbKME1Yu2AJZmzC0EWpRIdUDmEXAh1SrBuLzM2FTnQJDSHftA0J8FHwDN5zEd/Q9RXUWl5eZRy2tl
	Iu1pgGTMgrvpnKyCDnxPwX54iMMpiBECcMZI7UluM7A1Shgwc1GgK32YBDr0k1Wb6bFsrh2jztmsY
	pfgaFRD5caSFrZSb1kMGe5crOR54t4sMJoBBeOaZ+Ei13dpMOgTf5XwUnA3CGYwsV7ah1cwSnUFXr
	BdO9qjjlS/1yRdGMtXwdbP62po0KVnML+ip3Gea5SBlfQRZe13X4ptPPpZ4mmwTZnsy37bKS7M325
	+wnmvf+gvux4mGDU930g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Qva-0000000DlLK-3Njl;
	Fri, 26 Apr 2024 19:08:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0QvX-0000000DlIz-2mZm
	for linux-snps-arc@lists.infradead.org;
	Fri, 26 Apr 2024 19:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B89ECE1B30;
	Fri, 26 Apr 2024 19:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610F2C113CD;
	Fri, 26 Apr 2024 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714158484;
	bh=dpY8OiyiXN06eVO+/tKwn8ABB6M/597kWqbEZbQ1yxk=;
	h=Date:To:Cc:From:Subject:From;
	b=lYzwGi5G07CpiImAEAdt5yVn6OntP6B0IisKUrZuik7Y84U3OTiCWfyxhAfkFpxEN
	 zuBMYTqEc5gKXgAm4LXFYa/XXWPFzi6DxxVa1u51eHQ19oxjzwUhMXtvy1pZIVxs0d
	 VnucSDMpIQ0Q+idiQg7oDjQBy44VfMkq0b9GDPsPYsXLl4H25oROAh3eseGW+IFrc/
	 tP4j9/y1H53v8aItTLXZQ22rmpxiLTroiQjvSs8+Tp6Om4ng9a7EibuQRVIleApotK
	 c3WrCf1GaxCF++0cog2H0Tm9TVci+O/gJoHAdW2klAi/aVz+1vGa/jVxF/w3Ct2HH/
	 vB2FEaTazuf8Q==
Message-ID: <80a2b41e-74da-43cb-8532-fc3b17879201@kernel.org>
Date: Fri, 26 Apr 2024 12:08:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Bjorn Helgaas <bhelgaas@google.com>
From: Vineet Gupta <vgupta@kernel.org>
Subject: [GIT PULL] ARX fixes for 6.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_120808_109883_2F8D191D 
X-CRM114-Status: UNSURE (   7.00  )
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

SGkgTGludXMsCgpBIGZldyBmaXhlcyBmb3IgQVJDLCBwbGVhc2UgcHVsbCAhCgpUaHgsCi1WaW5l
ZXQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tPgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IDM5Y2Q4N2M0ZWIyYjg5MzM1NGYzYjg1MGY5MTYzNTNmMjY1OGFlNmY6CgrCoCBMaW51eCA2
LjktcmMyICgyMDI0LTAzLTMxIDE0OjMyOjM5IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUg
R2l0IHJlcG9zaXRvcnkgYXQ6CgrCoCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdmd1cHRhL2FyYy5naXQvCnRhZ3MvYXJjLTYuOS1maXhlcwoKZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDYxMjMxZWI4MTEzY2U0Nzk5MWYzNTAyNGY5YzIwODEwYjM3
OTk2YmY6CgrCoCBBUkM6IFtwbGF0LWhzZGtdOiBSZW1vdmUgbWlzcGxhY2VkIGludGVycnVwdC1j
ZWxscyBwcm9wZXJ0eQooMjAyNC0wNC0xNiAxMDo0NTo1NyAtMDcwMCkKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQVJDIGZp
eGVzIGZvciA2LjkKCsKgLSBJbmNvcnJlY3QgVklQVCBhbGlhc2luZyBhc3N1bXB0aW9uCgrCoC0g
TWlzY2xsIGJ1aWxkIHdhcm5pbmcgZml4ZXMgYW5kIHNvbWUgdHlwb3MKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxleGV5
IEJyb2RraW4gKDEpOgrCoMKgwqDCoMKgIEFSQzogW3BsYXQtaHNka106IFJlbW92ZSBtaXNwbGFj
ZWQgaW50ZXJydXB0LWNlbGxzIHByb3BlcnR5CgpCam9ybiBIZWxnYWFzICgxKToKwqDCoMKgwqDC
oCBBUkM6IEZpeCB0eXBvcwoKVmluZWV0IEd1cHRhICgyKToKwqDCoMKgwqDCoCBBUkM6IEZpeCAt
V21pc3NpbmctcHJvdG90eXBlcyB3YXJuaW5ncwrCoMKgwqDCoMKgIEFSQzogbW06IGZpeCBuZXcg
Y29kZSBhYm91dCBjYWNoZSBhbGlhc2luZwoKwqBhcmNoL2FyYy9LY29uZmlnwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgLQrCoGFyY2gvYXJj
L2Jvb3QvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
NCArKy0tCsKgYXJjaC9hcmMvYm9vdC9kdHMvYXhjMDAzLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDQgKystLQrCoGFyY2gvYXJjL2Jvb3QvZHRzL2hzZGsuZHRzwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxIC0KwqBhcmNoL2FyYy9ib290L2R0cy92ZGtfYXhzMTB4
X21iLmR0c2nCoMKgwqDCoMKgIHzCoCAyICstCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vY2FjaGV0
eXBlLmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgLS0tLS0tLS0tCsKgYXJjaC9hcmMvaW5jbHVk
ZS9hc20vZHNwLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KwqBhcmNo
L2FyYy9pbmNsdWRlL2FzbS9lbnRyeS1jb21wYWN0LmjCoMKgwqDCoMKgIHwgMTAgKysrKystLS0t
LQrCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL2VudHJ5LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgNCArKy0tCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vaXJxLmjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9pcnFmbGFncy1j
b21wYWN0LmjCoMKgIHzCoCAyICstCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vbW11X2NvbnRleHQu
aMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vcGd0YWJsZS1i
aXRzLWFyY3YyLmggfMKgIDIgKy0KwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9wdHJhY2UuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQrCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL3NobXBh
cmFtLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQrCoGFyY2gvYXJjL2luY2x1ZGUvYXNt
L3NtcC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KwqBhcmNoL2Fy
Yy9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5owqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KwqBhcmNo
L2FyYy9pbmNsdWRlL3VhcGkvYXNtL3N3YWIuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQrC
oGFyY2gvYXJjL2tlcm5lbC9lbnRyeS1hcmN2Mi5TwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCA4ICsrKystLS0tCsKgYXJjaC9hcmMva2VybmVsL2VudHJ5LlPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKystLQrCoGFyY2gvYXJjL2tlcm5lbC9oZWFkLlPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQrCoGFyY2gvYXJjL2tl
cm5lbC9pbnRjLWFyY3YyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQrCoGFy
Y2gvYXJjL2tlcm5lbC9rcHJvYmVzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgNyArKysrLS0tCsKgYXJjaC9hcmMva2VybmVsL3BlcmZfZXZlbnQuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyICstCsKgYXJjaC9hcmMva2VybmVsL3NldHVwLmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KwqBhcmNoL2FyYy9rZXJuZWwvc2ln
bmFsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3ICsrKystLS0KwqBh
cmNoL2FyYy9rZXJuZWwvdHJhcHMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMiArLQrCoGFyY2gvYXJjL2tlcm5lbC92bWxpbnV4Lmxkcy5TwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA0ICsrLS0KwqBhcmNoL2FyYy9tbS90bGIuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tCsKgYXJjaC9hcmMvbW0v
dGxiZXguU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4
ICsrKystLS0tCsKgMzAgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRp
b25zKC0pCsKgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJjL2luY2x1ZGUvYXNtL2NhY2hldHlw
ZS5oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
