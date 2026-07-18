Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9A6C44521
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Jul 2026 23:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R/GAr9iBtTEXmX/JD4K/KtBuT61tBP8RNxKMA9geVns=; b=gbz477mh0yJhVRhSqlxrE3pmPr
	E/3+tYIeFgGI86dkIeeNEWPjqBX3a+TBR4kg7cc0fm0My9vlGMbwRfnPHK2FgBcGpvasRv8+t437Z
	7LMuAupK0cV3ztnJs0mgeZfOcB4Qhpms+oPMGU9YoYNmQsloHjoG0fEA4HpmBs/Ubb66v98+NWEyH
	i0iGBthgBUL05s8TIyyfrP01IHwmGMsr6g25nPe7cEpqaPvsz9r9S7zpHFvpklV5mnJZ57g6gmfAa
	OIbuVXRpcTv+7uVjMlou+1FjjZM4HOKgJzW120R6/20li2rUpwxPDJRQ3wj3KY3EVJGD9z+uO5w8Q
	8bZhIH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlENZ-00000004b8M-0nvw;
	Sat, 18 Jul 2026 23:23:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlENX-00000004b8G-0zpA
	for linux-snps-arc@lists.infradead.org;
	Sat, 18 Jul 2026 23:23:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F666409C1;
	Sat, 18 Jul 2026 23:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EFB1F000E9;
	Sat, 18 Jul 2026 23:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784417009;
	bh=ECn14Gd5wtUISkSnwPGxpal1zMH2YEFrH7VSvN+JsQ0=;
	h=Date:From:To:Cc:Subject;
	b=Yv3Yg9SgHFihzdyDpaFaYVL5lDKDCLZePPwmWNYokc5e+Jyp/wUlu48yjuWE3hU82
	 2zojVzQAtDnGQbckYeGyCAg09O2+i7zywRwlL0RfCg1w+ORJt7m1xY7oaRiRCtyrbZ
	 vOlISf4zY0NWhjc1KpJIavR2oTmbvaRkVaxkkZ3PyXWr+jkVB9ITnR6LQ6p3YhvHtP
	 QpT/2F4J3iT2MDWr1XegFIcswgCxC+C3j4gctdG60Vr7zJDyS/6V5VRtvOr1vWy1m/
	 A+o/pWUMTgRuxbL39HtrlcJeNG1QXKEFhefXhjWqvQ0KM9TTOor72mZBD5r6Vci6n4
	 hFxwsgalnEPPQ==
Message-ID: <c3c3fbba-a65d-4add-96cd-6ffa61b24dec@kernel.org>
Date: Sat, 18 Jul 2026 16:23:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [GIT PULL] ARC fixes for 7.2-rc4
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

SGkgTGludXMsCgpTb21lIGZpeGVzIGZvciBBUkMuCgpUaHgKLVZpbmVldAotLS0tLS0tLS0tLS0t
LT4KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4Y2RlYWE1MGVhZThkYWQzNDg4
NTUxNWY2MjU1OWVlODNlN2U4ZGRhOgoKIMKgIExpbnV4IDcuMi1yYzIgKDIwMjYtMDctMDUgMTQ6
NDQ6MDYgLTEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiDC
oCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdmd1cHRhL2Fy
Yy5naXQvIAp0YWdzL2FyYy03LjItZml4ZXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byA3NmYzOGFkMWIzOWNmMDMyMWY3ZWNiN2VhMzdiNDZmNjFhMGYzZDc1OgoKIMKgIEFSQzogY29u
ZmlnczogRHJvcCByZWR1bmRhbnQgSTJDX0RFU0lHTldBUkVfUExBVEZPUk0gKDIwMjYtMDctMTAg
CjE1OjI2OjExIC0wNzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBUkMgZml4ZXMgZm9yIDcuMgoKIMKgLSBNaXNjYyBm
aXhlcyBhbmQgY29uZmlnIHVwZGF0ZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KS3J6eXN6dG9mIEtvemxvd3NraSAoMSk6
CiDCoCDCoCDCoCBBUkM6IGNvbmZpZ3M6IERyb3AgcmVkdW5kYW50IEkyQ19ERVNJR05XQVJFX1BM
QVRGT1JNCgpQZW5ncGVuZyBIb3UgKDEpOgogwqAgwqAgwqAgYXJjOiB2YWxpZGF0ZSBEVCBDUFUg
bWFwIHN0cmluZ3MgYmVmb3JlIHBhcnNpbmcgdGhlbQoKIMKgYXJjaC9hcmMvY29uZmlncy9heHMx
MDFfZGVmY29uZmlnwqAgwqAgwqB8IDEgLQogwqBhcmNoL2FyYy9jb25maWdzL2F4czEwM19kZWZj
b25maWfCoCDCoCDCoHwgMSAtCiDCoGFyY2gvYXJjL2NvbmZpZ3MvYXhzMTAzX3NtcF9kZWZjb25m
aWcgfCAxIC0KIMKgYXJjaC9hcmMvY29uZmlncy90YjEweF9kZWZjb25maWfCoCDCoCDCoCB8IDEg
LQogwqBhcmNoL2FyYy9rZXJuZWwvc21wLmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgNiAr
KysrLS0KIMKgNSBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1z
bnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj
Cg==
