Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3413C38A2D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Oct 2022 04:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xlrt1MP/EPa2omUJLk1qWRBl44vSEoJ0OTmkP9Vaxa8=; b=q3JLtRj0z7AkSq5QEOjRKmqVTS
	vcxDwLHXbZtP286Gus5OX7XrOeyLokrwmFsoOTAmRyiRS0Xl963GeO0//vOVWEdt66lUBf9BjBGpq
	tncw2KhwFb7242KozYlchSEfwZmZPApE+bPwhRiufEdMFN6T41J22UtEJVFz12hPHUxw4nz5EPZtA
	cv8lf6x23Umrd6DJ6ECHmXML18+MDAm49iODMW8J1Dt/oZx1tcmTWyZIdtQodEUYnXIvItO7uzKmh
	GZemEoHshISwo6rq33UvQmdI/IUoKMvNq8fuQX4ukt9+P2nXuZmq0tMLu4PNbHZGcEE9ess06u42C
	jUIkSoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onXfT-007wp9-4C; Wed, 26 Oct 2022 04:05:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onXfP-007woX-Sf
	for linux-snps-arc@lists.infradead.org; Wed, 26 Oct 2022 04:05:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1607B82028;
	Wed, 26 Oct 2022 04:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B453C433D7;
	Wed, 26 Oct 2022 04:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666757119;
	bh=11nFNElIFGRiw9yFBvy6kGo6koioymhUxNfO9aouqbo=;
	h=Date:To:Cc:From:Subject:From;
	b=qLTteNtj7JQSchC8DRns7OZwARkqJDqp95CecqoliFNuYeo9iOe5Sv/o3JLADHdTf
	 u99a+E2mGyqkTp7zrQzpcL/jZydYJoEo5QHo0cG3RIGK+6w6JLNkwHDkj9qFz3uUDq
	 g5OZeKk7Ohxx7pQwzJvX+OgL5kV9zr1Xt7UMvFAbzmTIORXncJJ9tTeigI2ckuf+LJ
	 UFlSEe4JJZt811gAAYv1EIdt+mUlzX0DQSESSeRQUfE5OTH3ezssvi6ezYS1X8hvS6
	 JHHKr77QAekU1KWOh765wuf9+xw/golijyBtG3O/LyUjtStAtX1snkjjaPpDa6o7VW
	 y51qVOl6wzPXQ==
Message-ID: <9ad919b3-b450-8e22-c422-371957c41391@kernel.org>
Date: Tue, 25 Oct 2022 21:05:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Pavel.Kozlov@synopsys.com, Randy Dunlap <rdunlap@infradead.org>,
 Serge Semin <fancer.lancer@gmail.com>, Zhang Jiaming <jiaming@nfschina.com>
From: Vineet Gupta <vgupta@kernel.org>
Subject: [GIT PULL] ARC updates for 6.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_210524_242689_3073E450 
X-CRM114-Status: GOOD (  11.23  )
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

SGkgTGludXMsCgpQbGVhc2UgcHVsbCBzb21lIGZpeGVzIGZvciBBUkMuCgpUaHgsCi1WaW5lZXQK
LS0tLS0tLS0tLS0tLS0tLS0+ClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgOWFi
ZjIzMTNhZGMxY2ExYjYxODBjNTA4YzI1ZjIyZjkzOTVjYzc4MDoKCiDCoCBMaW51eCA2LjEtcmMx
ICgyMDIyLTEwLTE2IDE1OjM2OjI0IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6CgogwqAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3ZndXB0YS9hcmMuZ2l0LyAKdGFncy9hcmMtNi4xLWZpeGVzCgpmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gNGZkOWRmMTBjYjdhOTI4OWZiZDIyZDY2OWY5Zjk4MTY0ZDk1YTFj
ZToKCiDCoCBBUkM6IG1tOiBmaXggbGVha2FnZSBvZiBtZW1vcnkgYWxsb2NhdGVkIGZvciBQVEUg
KDIwMjItMTAtMTcgMTY6MzI6MTIgCi0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBUkMgdXBkYXRlcyBmb3IgNi4x
CgogwqAtIEZpeCBmb3IgUGFnZSBUYWJsZSBtZW0gbGVhawoKIMKgLSBkZWZjb25maWcgdXBkYXRl
cwoKIMKgLSBNaXNjbGwgb3RoZXIgdXBkYXRlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbWFkZXVzeiBTxYJhd2nFhHNr
aSAoMSk6CiDCoMKgwqDCoMKgIEFSQzogYml0b3BzOiBDaGFuZ2UgX19mbHMgdG8gcmV0dXJuIHVu
c2lnbmVkIGxvbmcKCkppbGluIFl1YW4gKDEpOgogwqDCoMKgwqDCoCBBUkM6IEZpeCBjb21tZW50
IHR5cG8KCkx1a2FzIEJ1bHdhaG4gKDEpOgogwqDCoMKgwqDCoCBhcmM6IHVwZGF0ZSBjb25maWcg
ZmlsZXMKClBhdmVsIEtvemxvdiAoMSk6CiDCoMKgwqDCoMKgIEFSQzogbW06IGZpeCBsZWFrYWdl
IG9mIG1lbW9yeSBhbGxvY2F0ZWQgZm9yIFBURQoKUmFuZHkgRHVubGFwICgxKToKIMKgwqDCoMKg
wqAgYXJjOiBpb3VubWFwKCkgYXJnIGlzIHZvbGF0aWxlCgpTZXJnZSBTZW1pbiAoMSk6CiDCoMKg
wqDCoMKgIGFyYzogZHRzOiBIYXJtb25pemUgRUhDSS9PSENJIERUIG5vZGVzIG5hbWUKClpoYW5n
IEppYW1pbmcgKDEpOgogwqDCoMKgwqDCoCBBUkM6IEZpeCBjb21tZW50IHR5cG8KCiDCoGFyY2gv
YXJjL2Jvb3QvZHRzL2F4YzAwMy5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICsr
LS0KIMKgYXJjaC9hcmMvYm9vdC9kdHMvYXhjMDAzX2lkdS5kdHNpwqDCoMKgwqDCoMKgwqDCoMKg
IHwgNCArKy0tCiDCoGFyY2gvYXJjL2Jvb3QvZHRzL2F4czEweF9tYi5kdHNpwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCA0ICsrLS0KIMKgYXJjaC9hcmMvYm9vdC9kdHMvaHNkay5kdHPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQgKystLQogwqBhcmNoL2FyYy9ib290L2R0cy92ZGtf
YXhzMTB4X21iLmR0c2nCoMKgwqDCoMKgwqAgfCAyICstCiDCoGFyY2gvYXJjL2NvbmZpZ3MvYXhz
MTAxX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoCB8IDQgLS0tLQogwqBhcmNoL2FyYy9jb25m
aWdzL2F4czEwM19kZWZjb25maWfCoMKgwqDCoMKgwqDCoMKgwqAgfCA0IC0tLS0KIMKgYXJjaC9h
cmMvY29uZmlncy9heHMxMDNfc21wX2RlZmNvbmZpZ8KgwqDCoMKgwqAgfCA0IC0tLS0KIMKgYXJj
aC9hcmMvY29uZmlncy9oYXBzX2hzX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqAgfCAxIC0KIMKg
YXJjaC9hcmMvY29uZmlncy9oYXBzX2hzX3NtcF9kZWZjb25maWfCoMKgwqDCoCB8IDEgLQogwqBh
cmNoL2FyYy9jb25maWdzL2hzZGtfZGVmY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEg
LQogwqBhcmNoL2FyYy9jb25maWdzL25zaW1fNzAwX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgIHwg
MSAtCiDCoGFyY2gvYXJjL2NvbmZpZ3MvbnNpbW9zY2lfZGVmY29uZmlnwqDCoMKgwqDCoMKgwqAg
fCAxIC0KIMKgYXJjaC9hcmMvY29uZmlncy9uc2ltb3NjaV9oc19kZWZjb25maWfCoMKgwqDCoCB8
IDEgLQogwqBhcmNoL2FyYy9jb25maWdzL25zaW1vc2NpX2hzX3NtcF9kZWZjb25maWcgfCA2ICst
LS0tLQogwqBhcmNoL2FyYy9jb25maWdzL3RiMTB4X2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgNyArLS0tLS0tCiDCoGFyY2gvYXJjL2NvbmZpZ3MvdmRrX2hzMzhfZGVmY29uZmlnwqDC
oMKgwqDCoMKgwqAgfCAzIC0tLQogwqBhcmNoL2FyYy9jb25maWdzL3Zka19oczM4X3NtcF9kZWZj
b25maWfCoMKgwqAgfCAxIC0KIMKgYXJjaC9hcmMvaW5jbHVkZS9hc20vYml0b3BzLmjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQgKystLQogwqBhcmNoL2FyYy9pbmNsdWRlL2FzbS9lbnRy
eS1jb21wYWN0LmjCoMKgwqDCoMKgwqAgfCAyICstCiDCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL2lv
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQogwqBhcmNoL2FyYy9p
bmNsdWRlL2FzbS9wZ3RhYmxlLWxldmVscy5owqDCoMKgwqDCoCB8IDIgKy0KIMKgYXJjaC9hcmMv
a2VybmVsL3NtcC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MiArLQogwqBhcmNoL2FyYy9tbS9jYWNoZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDQgKystLQogwqBhcmNoL2FyYy9tbS9pb3JlbWFwLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICstCiDCoDI1IGZpbGVzIGNo
YW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
