Return-Path: <SRS0=5ghb=FH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EB8C63777
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 08:50:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77B22084C
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 08:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77B22084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=boldwhite24.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YTBHxTVMd6NOVap4z4DDkJZJj5uX4YkIByKffNjSyHk=; b=Iq7ihcH7UF+7Iwk4/SqzWAwDTD
	8B+WMCwAChOYIC04It6qxMxEwN3pHRlhekWtg2qTM0tx7vgZCkGIwYnPIreqMLavut+cXwKT58aa7
	1+LflHxJOlJMXk9sdvJb0lVKSfXuKFMjmRHu8eHYdqx2owKuZqLZtmYFnzRPLUFSV+9wWNDz1zsdC
	d8qw7ZcIfkF3YEBt3T/mqqEtw43oNO3BV0KYXbdmA+Yim70800mgn16H2+6gw1a4eGtiYv85WO586
	YOlSmpL/ZLcoVmgs3OQh9TgdKO1J6QubXXYaHqbUm/sHF0G0hYzOQ5D59CzCJMJooqV34sY2N1pZd
	ZpWcgdlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkkKG-0007IN-1p; Thu, 03 Dec 2020 08:50:56 +0000
Received: from mail.boldwhite24.com ([80.211.42.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkkKD-0007HA-Ax
 for linux-snps-arc@lists.infradead.org; Thu, 03 Dec 2020 08:50:54 +0000
Received: by mail.boldwhite24.com (Postfix, from userid 1001)
 id 186BCA31FE; Thu,  3 Dec 2020 08:50:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=boldwhite24.com;
 s=mail; t=1606985427;
 bh=hS3ibs4caZkahrzgcMN2TAJo2B2H5Muwb2NidDYlIzQ=;
 h=Date:From:To:Subject:From;
 b=HLpMQZf2cUPkBuR2RhLM6jBinsSVYPWMHQkbaHiqlI7NmwXcDwc1Fu3Lp6kfjJUrU
 s1EF2hMXrzgPNHCSwVcu8j0EzD/C3Hn3MJFyzIcJsisgyGO4cw9eh9gT5IDGQrLErz
 s7vpIxTb35xLdCaYJl7swqvg0g7yL9goTBGHRLT8ULNxdZ+wHF1McMbIVATMwt/jBW
 mNK67NNPO8hQQIaoVPvaoFdKBE+a4C7P856/P+DWBnzoq/BNXy1iUqvMpPLb56u+Sw
 QJHLRw7BArf1yl6RhxpTio1gtVyxNKfiejCYYbb2GTLF589btU0FC3mX86IPlV6+Fo
 M0Urxvz13Y0fA==
Received: by mail.boldwhite24.com for <linux-snps-arc@lists.infradead.org>;
 Thu,  3 Dec 2020 08:50:11 GMT
Message-ID: <20201203074501-0.1.2m.anb6.0.9mup619jq9@boldwhite24.com>
Date: Thu,  3 Dec 2020 08:50:11 GMT
From: =?UTF-8?Q?"Diego_S=C3=A1nchez"?= <diego.sanchez@boldwhite24.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: Disinfection
X-Mailer: mail.boldwhite24.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_035053_576709_B7E8B418 
X-CRM114-Status: UNSURE (   0.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
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

R29vZCBtb3JuaW5nLAoKbG9va2luZyBmb3IgY29tcGFuaWVzIGludGVyZXN0ZWQgaW4gcmFpc2lu
ZyBhZGRpdGlvbmFsIGNhcGl0YWwgYnkgZGl2ZXJzaWZ5aW5nIHRoZWlyIG9mZmVyIGluIHNvYXBz
LCBsaXF1aWRzIGFuZCBnZWxzIGZvciBoYW5kIGRpc2luZmVjdGlvbiBhbmQgY29zbWV0aWNzIGZv
ciBib2R5IGFuZCBoYWlyIGNhcmUuCgpUaGUgZGlzdHJpYnV0aW9uIG9mIGlubm92YXRpdmUgcHJv
ZHVjdHMgY29ycmVzcG9uZGluZyB0byB0aGUgY3VycmVudCBwcmVmZXJlbmNlcyBvZiBjdXN0b21l
cnMgaW4gdGhlIGZpZWxkIG9mIGh5Z2llbmUgYW5kIHByZXZlbnRpdmUgaGVhbHRoY2FyZSBhbGxv
d3Mgb3VyIHBhcnRuZXJzIHRvIGdhaW4gbmV3IG1hcmtldHMgYW5kIGFjaGlldmUgYmV0dGVyIGVj
b25vbWljIHJlc3VsdHMuCgpJbiBhZGRpdGlvbiB0byBwcm9kdWN0cyB3aXRoIGJhY3RlcmljaWRh
bCBhY3Rpb24sIG91ciByYW5nZSBpbmNsdWRlcyBzaG93ZXIgZ2Vscywgc2hhbXBvb3MgYW5kIGhh
aXIgY29uZGl0aW9uZXJzLCBhcyB3ZWxsIGFzIGVmZmljaWVudCwgY29uY2VudHJhdGVkIGRldGVy
Z2VudHMuCgpUaGUgdmVyc2F0aWxpdHkgKHN1aXRhYmxlIGZvciBhbGwgc2tpbiB0eXBlcykgY29t
YmluZWQgd2l0aCBhbiBhZmZvcmRhYmxlIHByaWNlIG1lYW5zIHRoYXQgY3VzdG9tZXJzIG1ha2Ug
YW4gaW5mb3JtZWQgY2hvaWNlIG9mIGEgcHJvZHVjdCBhbW9uZyBvdGhlcnMgYXZhaWxhYmxlIG9u
IHRoZSBtYXJrZXQuCgpBcmUgeW91IGludGVyZXN0ZWQgaW4gY29vcGVyYXRpb24/CgpEaWVnbyBT
w6FuY2hlegoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
