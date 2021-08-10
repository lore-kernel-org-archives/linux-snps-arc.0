Return-Path: <SRS0=cyTA=NB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12359C4338F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Aug 2021 23:21:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF9660240
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Aug 2021 23:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBF9660240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=InGZRNxQRjfkFOm1tCjpUaCkdK5kR0EYQ/+/dIFQMQg=; b=Zz786cUgHZda4VWJNAvLK/sRSF
	BMx5FLJSSuplG9JSFony4NDPwP8W+JMnrj4h5/k0mrG23JN2wrmeN4csdB7702z1P4lOH3iQqeHJe
	ugshakNPkLDUS7AwBdw+Zpplw51dgShu/5EkMv80KQxlyyNDzQYGamcfxQ+QJVN24GT2hYT6FIgzJ
	oX/p3jmeoFEu8+sTuHkIZsd1U/PdQO8TDOC5PrrzHl/LSH5V82DoDYFuGnPC+pI7l3iZAmklVd1Ru
	OiuJ9tmms3TpAWNNMBZ5QeyiPdkkzmQzbwZvSXbf165dsWBHbxGP8DNU2XFRmS3eAQrrVs/3zVCQj
	T4uRNmNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDb3x-0051Fk-7o; Tue, 10 Aug 2021 23:21:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDb3s-0051EM-Il
 for linux-snps-arc@lists.infradead.org; Tue, 10 Aug 2021 23:21:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E258460EE9;
 Tue, 10 Aug 2021 23:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628637691;
 bh=n8nRteX6xTvqDie1E7IAtuwWc0AX6awBcGo5w8xx/B0=;
 h=To:Cc:From:Subject:Date:From;
 b=K1djQ8vapHsMr7nIbo7PDEAt+O0ILzdESkqw+VG3LxJWm/jep3SXTHj90QikewbYT
 nzYBmNPtNwN3IpuXcl2DOry/XWUxqJGTCIlZZo0zaf7GaDJJDEJwLtW+7rrnZLjmxH
 Gc1KFz85ZeMIIEFEkFQGajM3ZBx46aPq1R5DIWxw62vD6VVxktBsXVNvBnLgv7gd9X
 Firb75zmzkObir47MREwLk5Pw1dMXKJL+855b13AvbVCYGywQl42Uo/+d0lIUySi8+
 8+qNBiOJzEtpe0O6r/sKdo7Zs8Y30//kZmvoSH2lygfOZ6Y22qyog32NSqKJS7980W
 VoEKwDZC9z48A==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Colin King <colin.king@canonical.com>,
 Guenter Roeck <linux@roeck-us.net>, Jinchao Wang <wjc@cdjrlc.com>
From: Vineet Gupta <vgupta@kernel.org>
Subject: [GIT PULL] ARC updates for 5.14-rc6
Message-ID: <931efd74-4b45-fd24-8c88-97f57f97e01c@kernel.org>
Date: Tue, 10 Aug 2021 16:21:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_162132_676286_FA0B1BFD 
X-CRM114-Status: UNSURE (   9.00  )
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

SGkgTGludXMsCgpBUkMgZml4ZXMgZm9yIDUuMTQtcmM2LiBQbGVhc2UgcHVsbC4KClRoeCwKLVZp
bmVldAoKLS0tLS0tLS0tLS0tPgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGM1
MDBiZWUxYzViMmYxZDU5YjEwODFhYzg3OWQ3MzI2OGFiMGZmMTc6CgogwqAgTGludXggNS4xNC1y
YzQgKDIwMjEtMDgtMDEgMTc6MDQ6MTcgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKCiDCoCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdmd1cHRhL2FyYy5naXQvIAp0YWdzL2FyYy01LjE0LXJjNgoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIDY2OWQ5NDIxOWQ5MWEyYmE5NTBiYjEyZWNlNjljZjBhZGE1M2Fk
NGY6CgogwqAgTUFJTlRBSU5FUlM6IHVwZGF0ZSBWaW5lZXQncyBlbWFpbCBhZGRyZXNzICgyMDIx
LTA4LTA5IDE1OjE3OjE0IC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBUkMgdXBkYXRlcyBmb3IgNS4xNC1yYzYK
CiDCoC0gRml4IEZQVV9TVEFUVVMgdXBkYXRlCgogwqAtIFVwZGF0ZSBteSBlbWFpbCBhZGRyZXNz
CgogwqAtIE90aGVyIHNwZWxsb3MgYW5kIGZpeGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNvbGluIElhbiBLaW5nICgx
KToKIMKgwqDCoMKgwqAgYXJjOiBGaXggc3BlbGxpbmcgbWlzdGFrZSBhbmQgZ3JhbW1hciBpbiBL
Y29uZmlnCgpHdWVudGVyIFJvZWNrICgxKToKIMKgwqDCoMKgwqAgQVJDOiBGaXggQ09ORklHX1NU
QUNLREVQT1QKCkppbmNoYW8gV2FuZyAoMSk6CiDCoMKgwqDCoMKgIGFyYzogUHJlZmVyIHVuc2ln
bmVkIGludCB0byBiYXJlIHVzZSBvZiB1bnNpZ25lZAoKVmluZWV0IEd1cHRhICgyKToKIMKgwqDC
oMKgwqAgQVJDOiBmcDogc2V0IEZQVV9TVEFUVVMuRldFIHRvIGVuYWJsZSBGUFVfU1RBVFVTIHVw
ZGF0ZSBvbiAKY29udGV4dCBzd2l0Y2gKIMKgwqDCoMKgwqAgTUFJTlRBSU5FUlM6IHVwZGF0ZSBW
aW5lZXQncyBlbWFpbCBhZGRyZXNzCgogwqBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCiDCoGFyY2gvYXJjL0tjb25maWfCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCiDCoGFyY2gvYXJjL2luY2x1
ZGUvYXNtL2NoZWNrc3VtLmjCoMKgIHzCoCAyICstCiDCoGFyY2gvYXJjL2luY2x1ZGUvYXNtL3Bl
cmZfZXZlbnQuaCB8wqAgMiArLQogwqBhcmNoL2FyYy9rZXJuZWwvZnB1LmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDkgKysrKysrLS0tCiDCoGFyY2gvYXJjL2tlcm5lbC91bndpbmQuY8Kg
wqDCoMKgwqDCoMKgwqDCoCB8IDEwICsrKysrLS0tLS0KIMKgYXJjaC9hcmMva2VybmVsL3ZtbGlu
dXgubGRzLlPCoMKgwqDCoCB8wqAgMiArKwogwqA3IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDEyIGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zbnBzLWFyYwo=
