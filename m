Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84B6C433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 May 2022 03:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CHQvr645UzISKm5Y1ABQcNjiyiruSHv8bDNcaYi3og0=; b=GyLXo5OW8S+G/3ybHxvaPWTxvk
	5P4Wk1VlY4w5trgPCaJrmgGg4VBkMhoICL3zOyvj9WaOMLWceM4MvKJiNrxszSI7tSLoii6LW0mUg
	yWwXs+c7lAOrb/dgugdrLJUo5jdyL1jlbs8b9tcL3mqSq2ox7/IJofaJ1vCYYxqQjVsiooC3MLhom
	d1mswA8ahyuAgvNty9vzKSSINByPKua+F7SN94z6XtszgSw0fh373qJwxWKJiSCCf4WTja+kO/20i
	cyONJZC7+1stuxXsl7gqdvGK2UK3kEHrUvU5EyQSpOP03B6+oHFP9It5mq2K+pjtnb55WY+/ZEe1z
	xN02omgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu4Mg-00DOM7-D7; Thu, 26 May 2022 03:40:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu4Md-00DOLa-Kf
	for linux-snps-arc@lists.infradead.org; Thu, 26 May 2022 03:40:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A4266B81F11;
	Thu, 26 May 2022 03:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D65C385B8;
	Thu, 26 May 2022 03:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653536440;
	bh=MgP39NRgoy5EWYmX0BdpJsZYRi3iKh0TwgnObf2cek0=;
	h=Date:To:Cc:From:Subject:From;
	b=qqd/vKrpEw6A7UTDY5587KVdzBnBPJCG7wg9kH/v05N1VtN3+206pAHcVUQFs3VI1
	 ISvAYRMNeTApfp67pjLJh40DWZ07nWIonAoL8XQ3iYQJhk/Kd+RXCXQpnkCGoqO9yw
	 uCD5B3Dow4e9tAjGsCRCwsE1/gQ+QJqqZWWySrO+DuJqWiX/mYwMPNsUWLN5WpqyAE
	 oJ5/RYWBVaLnHcP1y6jgzD/J1coFGAgy2W+cxPZ2jxS+M6WbZFcS95qbbjAQakRW0+
	 kfwNjoOSK+jfT9le0/fDIIiLvAP5W4RDDA03enXU3z1ERff1+VukvxgVStGGNFZ9yc
	 pQ/mezIkwC5PA==
Message-ID: <a22af786-288f-92ad-79a0-0f40768cfdbc@kernel.org>
Date: Wed, 25 May 2022 20:40:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, abrodkin@synopsys.com,
 "geomatsi@gmail.com" <geomatsi@gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
Subject: [GIT PULL] ARC changes for 5.19-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_204043_865757_AE684608 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgpQbGVhc2UgcHVsbC4KClRoeCwKLVZpbmVldAotLS0tLS0tLS0tLS0tLS0+ClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYWYyZDg2MWQ0Y2QyYTRkYTUxMzdmNzk1
ZWUzNTA5ZTZmOTQ0YTI1YjoKCiDCoCBMaW51eCA1LjE4LXJjNCAoMjAyMi0wNC0yNCAxNDo1MToy
MiAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKIMKgIGdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92Z3VwdGEvYXJjLmdp
dC8gCnRhZ3MvYXJjLTUuMTktcmMxCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNmFh
OThmNjIxNzg2MTg4OTUyM2UzOGIwMTQxYzhjNzFiMmVmOGE4MzoKCiDCoCBBUkM6IGJwZjogZGVm
aW5lIHVhcGkgZm9yIEJQRl9QUk9HX1RZUEVfUEVSRl9FVkVOVCBwcm9ncmFtIHR5cGUgCigyMDIy
LTA0LTI2IDA5OjM1OjI4IC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBUkMgY2hhbmdlcyBmb3IgNS4xOS1yYzEK
CiDCoC0gQmFzaWMgZUJQRiBzdXBwb3J0wqAgKFNlcmdleSkKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU2VyZ2V5IE1hdHl1
a2V2aWNoICg0KToKIMKgwqDCoMKgwqAgQVJDOiBlbmFibGUgSEFWRV9SRUdTX0FORF9TVEFDS19B
Q0NFU1NfQVBJIGZlYXR1cmUKIMKgwqDCoMKgwqAgQVJDOiBpbXBsZW1lbnQgc3lzY2FsbCB0cmFj
ZXBvaW50cwogwqDCoMKgwqDCoCBBUkM6IGRpc2FzbTogaGFuZGxlIEFSQ3YyIGNhc2UgaW4ga3By
b2JlIGdldC9zZXQgZnVuY3Rpb25zCiDCoMKgwqDCoMKgIEFSQzogYnBmOiBkZWZpbmUgdWFwaSBm
b3IgQlBGX1BST0dfVFlQRV9QRVJGX0VWRU5UIHByb2dyYW0gdHlwZQoKIMKgYXJjaC9hcmMvS2Nv
bmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMiArCiDCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL3BlcmZfZXZlbnQuaMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCA0ICsKIMKgYXJjaC9hcmMvaW5jbHVkZS9hc20vcHRyYWNlLmjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjcgKysrKysrCiDCoGFyY2gvYXJjL2luY2x1ZGUvYXNt
L3N5c2NhbGwuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsKIMKgYXJjaC9hcmMv
aW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArLQogwqBh
cmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL2JwZl9wZXJmX2V2ZW50LmggfMKgwqAgOSArKwogwqBh
cmNoL2FyYy9rZXJuZWwvZGlzYXNtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDY0ICsrKysrKysrKysrKy0KIMKgYXJjaC9hcmMva2VybmVsL2VudHJ5LlPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTIgKy0tCiDCoGFyY2gvYXJjL2tl
cm5lbC9wdHJhY2UuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0MCAK
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIMKgOSBmaWxlcyBjaGFuZ2VkLCAyNTMgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
Yy9pbmNsdWRlL3VhcGkvYXNtL2JwZl9wZXJmX2V2ZW50LmgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
