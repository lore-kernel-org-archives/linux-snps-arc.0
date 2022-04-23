Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED9CC433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 23 Apr 2022 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bJgfcUGvLabWkfTQqFwRzv8r5vf84MGkRzL7v7rb8Ag=; b=gzLy2pJHX20aAgv/LDcPIhj+7V
	CkzHzWDPA5K6vzvOLyW8iDHqVu0tKAgYG5EBx1uLos1Fa6OFeWONddzwGC1STxOK343owVTEEVI1m
	fT6YS3IOb/6Db4W4JyOTQWD8c5s62IlzjTHYsnkvZczjnQfC47H+7gXZfo+0bGRJQADidGQJYP+rv
	qLNJILqnKZIoJkWJulZbl08IDAfh7FLgjIFTlcDWJ/5Yvbcx7QOE9qz9zHj+Ehz4tU1vBYqdj4UWh
	teBhjm0hEdo+IlWy14oEnDUzat8gvfZ6SfraOThMv1Ri/tAqwiICCIElvROQq+sJDzL4V4IqreU4E
	ULScwG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niOAS-005G9x-HA; Sat, 23 Apr 2022 22:23:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niOAP-005G9Z-Si
 for linux-snps-arc@lists.infradead.org; Sat, 23 Apr 2022 22:23:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDBD7B80DAE;
 Sat, 23 Apr 2022 22:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D63C385A5;
 Sat, 23 Apr 2022 22:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650752626;
 bh=fS+HvnXDamFAQHJoavpT0one5QtA3Lb2FV5c+s39oOI=;
 h=Date:To:Cc:From:Subject:From;
 b=rcny/I7Cil0gaLQUXh9sjfeDdUCcnUZUGC73mQHbOy4jP00BBK6BvLBk6Wys3u+0E
 UhOHimiMJH2NV9T7pNtFu6pm3bXQLAMBHcWS2UPXCNWn9Nb1RoSBOCpr1Tr4KgBtPj
 aeACzTcHHqe85B/xUXCHQY98Ef9CknVG4arry4cYZTtx2kOlb4S/1FEoLMe6ZESHHY
 Z2o1tZ5OPH0tffTzfF4nNOS6T7d2uXBWlfVjyOC/r2eScUkahqqKdAwCwfWO9SdxEE
 mEtKILMfQldtytz0OFMYTQqeHKtAvGEHburuzFg4OeluPswh35Arwq4ddeBVvBHOlG
 PQ9J0wcCtWpXg==
Message-ID: <7b513e98-0cc4-13b9-a26b-d281314c0f74@kernel.org>
Date: Sat, 23 Apr 2022 15:23:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Bang Li <libang.linuxer@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>,
 "geomatsi@gmail.com" <geomatsi@gmail.com>, Rolf Eike Beer <eb@emlix.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julia Lawall <Julia.Lawall@inria.fr>
From: Vineet Gupta <vgupta@kernel.org>
Subject: [GIT PULL] ARC fixes for 5.18-rc4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_152350_106082_7BF2E7A7 
X-CRM114-Status: UNSURE (   8.54  )
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

SGkgTGludXMsCgpQbGVhc2UgcHVsbC4KClRoeCwKLVZpbmVldAotLS0tLS0tLS0tLS0tLS0tLT4K
VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjZTUyMmJhOWVmN2UyZDlmYjIyYTM5
ZWIzMzcxYzBjNjRlMmE0MzNlOgoKIMKgIExpbnV4IDUuMTgtcmMyICgyMDIyLTA0LTEwIDE0OjIx
OjM2IC0xMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3ZndXB0YS9hcmMu
Z2l0LyAKdGFncy9hcmMtNS4xOC1yYzQKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBj
NmVkNGQ4NGEyYzQ5ZGU3ZDZmNDkwMTQ0Y2NhN2I0YTQ4MzFmYjZlOgoKIMKgIEFSQzogcmVtb3Zl
IHJlZHVuZGFudCBSRUFEX09OQ0UoKSBpbiBjbXB4Y2hnIGxvb3AgKDIwMjItMDQtMTggCjE0OjQ3
OjA1IC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpBUkMgZml4ZXMgZm9yIDUuMTgtcmM0CgogwqAtIEFzc29ydGVk
IGZpeGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkJhbmcgTGkgKDEpOgogwqDCoMKgwqDCoCBBUkM6IHJlbW92ZSByZWR1
bmRhbnQgUkVBRF9PTkNFKCkgaW4gY21weGNoZyBsb29wCgpDaHJpc3RvcGhlIEpBSUxMRVQgKDEp
OgogwqDCoMKgwqDCoCBBUkM6IFJlbW92ZSBhIHJlZHVuZGFudCBtZW1zZXQoKQoKSnVsaWEgTGF3
YWxsICgxKToKIMKgwqDCoMKgwqAgQVJDOiBmaXggdHlwb3MgaW4gY29tbWVudHMKCktyenlzenRv
ZiBLb3psb3dza2kgKDEpOgogwqDCoMKgwqDCoCBBUkM6IGR0czogYWxpZ24gU1BJIE5PUiBub2Rl
IG5hbWUgd2l0aCBkdHNjaGVtYQoKUm9sZiBFaWtlIEJlZXIgKDEpOgogwqDCoMKgwqDCoCBhcmM6
IGRyb3AgZGVmaW5pdGlvbnMgb2YgcGdkX2luZGV4KCkgYW5kIHBnZF9vZmZzZXR7LCBfa30oKSBl
bnRpcmVseQoKU2VyZ2V5IE1hdHl1a2V2aWNoICgyKToKIMKgwqDCoMKgwqAgQVJDOiBlbnRyeTog
Zml4IHN5c2NhbGxfdHJhY2VfZXhpdCBhcmd1bWVudAogwqDCoMKgwqDCoCBBUkM6IGF0b21pYzog
Y2xlYW51cCBhdG9taWMtbGxzYyBkZWZpbml0aW9ucwoKIMKgYXJjaC9hcmMvYm9vdC9kdHMvaHNk
ay5kdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCiDCoGFyY2gvYXJjL2luY2x1ZGUv
YXNtL2F0b21pYy1sbHNjLmjCoMKgwqAgfCAzMiAKKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0KIMKgYXJjaC9hcmMvaW5jbHVkZS9hc20vcGd0YWJsZS1sZXZlbHMuaCB8wqAgMyAtLS0K
IMKgYXJjaC9hcmMva2VybmVsL2Rpc2FzbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDMgKy0tCiDCoGFyY2gvYXJjL2tlcm5lbC9lbnRyeS5TwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMSArCiDCoGFyY2gvYXJjL2tlcm5lbC9zaWduYWwuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAyICstCiDCoGFyY2gvYXJjL2tlcm5lbC9zbXAuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KIMKgYXJjaC9hcmMva2VybmVsL3VuYWxpZ25l
ZC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KIMKgYXJjaC9hcmMvbW0vY2FjaGUuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQogwqA5IGZpbGVzIGNo
YW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
