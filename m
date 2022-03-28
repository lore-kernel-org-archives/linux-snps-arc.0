Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683D4C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Mar 2022 08:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r+LklZWzxpGuL1gaaI7RuR7gowXHLHMq7TQ6aE38zJA=; b=1wEIR5ChJmxhJJ
	FgdnfU/tjY1oVhcdLP14x4DOVR/2pS+cT1pn2S2ptZXH6wQg21/bVNXnZ0Q/k7RY8n3taqLe/xhfn
	lHevSqT5doKBNs+m0avWE0RmqmIFEnaHDNQUIhn3IIQ8f+Zg8U5OTfnm7gqMEQimgTlLbW606CHLc
	MEYM2M1iw8LLookxsXgBfRSp+Tp62E0WTE45JKYdMx2FO+vQwv+JegqVqseBXHCAl7tvp5z72Ro/f
	SU1VxvVhjxvIiigmRnA28BkwtHKVaj5d1NKjEFRMSQ0nwR14pEH8hv6gH0OO9pJFzHV+aYgVhvCOT
	tGNojDPbYE1V6pmn2vAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYkXq-007moR-Nm; Mon, 28 Mar 2022 08:16:10 +0000
Received: from mx1.emlix.com ([136.243.223.33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYkXk-007mkR-5C
 for linux-snps-arc@lists.infradead.org; Mon, 28 Mar 2022 08:16:08 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 0289A5F8ED;
 Mon, 28 Mar 2022 10:16:00 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arc: drop definitions of pgd_index() and pgd_offset{,
 _k}() entirely
Date: Mon, 28 Mar 2022 10:15:58 +0200
Message-ID: <3749315.OSCKaROI16@mobilepool36.emlix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_011604_432214_AD2C8EB1 
X-CRM114-Status: UNSURE (   6.22  )
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

VGhleSB3ZXJlIGluIDxhc20vcGd0YWJsZXMuaD4gYW5kIGhhdmUgYmVlbiByZW1vdmVkIGZyb20g
dGhlcmUgaW4KOTc0YjliMmM2OGYgKCJtbTogY29uc29saWRhdGUgcHRlX2luZGV4KCkgYW5kIHB0
ZV9vZmZzZXRfKigpIGRlZmluaXRpb25zIikKaW4gZmF2b3Igb2YgdGhlIGdlbmVyaWMgdmVyc2lv
bi4gQnV0IHRoYXQgbWlzc2VkIHRoYXQgdGhlIHNhbWUgZGVmaW5pdG9ucwphbHNvIGV4aXN0ZWQg
aW4gPGFzbS9wZ3RhYmxlLWxldmVscy5oPiwgd2hlcmUgdGhleSB3ZXJlIChpbmFkdmVydGVudGx5
PykKaW50cm9kdWNlZCBpbiBmZTZjYjdiMDQzYjYgKCJBUkM6IG1tOiBkaXNpbnRlZ3JhdGUgcGd0
YWJsZS5oIGludG8gbGV2ZWxzCmFuZCBmbGFncyIpLgoKRml4ZXM6IDk3NGI5YjJjNjhmICgibW06
IGNvbnNvbGlkYXRlIHB0ZV9pbmRleCgpIGFuZCBwdGVfb2Zmc2V0XyooKSBkZWZpbml0aW9ucyIp
CkZpeGVzOiBmZTZjYjdiMDQzYjYgKCJBUkM6IG1tOiBkaXNpbnRlZ3JhdGUgcGd0YWJsZS5oIGlu
dG8gbGV2ZWxzIGFuZCBmbGFncyIpClNpZ25lZC1vZmYtYnk6IFJvbGYgRWlrZSBCZWVyIDxlYkBl
bWxpeC5jb20+Ci0tLQogYXJjaC9hcmMvaW5jbHVkZS9hc20vcGd0YWJsZS1sZXZlbHMuaCB8IDMg
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
Yy9pbmNsdWRlL2FzbS9wZ3RhYmxlLWxldmVscy5oIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vcGd0
YWJsZS1sZXZlbHMuaAppbmRleCA3ODQ4MzQ4NzE5YjIuLjY0Y2EyNWQxOTliZSAxMDA2NDQKLS0t
IGEvYXJjaC9hcmMvaW5jbHVkZS9hc20vcGd0YWJsZS1sZXZlbHMuaAorKysgYi9hcmNoL2FyYy9p
bmNsdWRlL2FzbS9wZ3RhYmxlLWxldmVscy5oCkBAIC05OCw5ICs5OCw2IEBACiAvKgogICogMXN0
IGxldmVsIHBhZ2luZzogcGdkCiAgKi8KLSNkZWZpbmUgcGdkX2luZGV4KGFkZHIpCQkoKGFkZHIp
ID4+IFBHRElSX1NISUZUKQotI2RlZmluZSBwZ2Rfb2Zmc2V0KG1tLCBhZGRyKQkoKChtbSktPnBn
ZCkgKyBwZ2RfaW5kZXgoYWRkcikpCi0jZGVmaW5lIHBnZF9vZmZzZXRfayhhZGRyKQlwZ2Rfb2Zm
c2V0KCZpbml0X21tLCBhZGRyKQogI2RlZmluZSBwZ2RfRVJST1IoZSkgXAogCXByX2NyaXQoIiVz
OiVkOiBiYWQgcGdkICUwOGx4LlxuIiwgX19GSUxFX18sIF9fTElORV9fLCBwZ2RfdmFsKGUpKQog
Ci0tIAoyLjM1LjEKCgotLSAKUm9sZiBFaWtlIEJlZXIsIGVtbGl4IEdtYkgsIGh0dHBzOi8vd3d3
LmVtbGl4LmNvbQpGb24gKzQ5IDU1MSAzMDY2NC0wLCBGYXggKzQ5IDU1MSAzMDY2NC0xMQpHb3Ro
YWVyIFBsYXR6IDMsIDM3MDgzIEfDtnR0aW5nZW4sIEdlcm1hbnkKU2l0eiBkZXIgR2VzZWxsc2No
YWZ0OiBHw7Z0dGluZ2VuLCBBbXRzZ2VyaWNodCBHw7Z0dGluZ2VuIEhSIEIgMzE2MApHZXNjaMOk
ZnRzZsO8aHJ1bmc6IEhlaWtlIEpvcmRhbiwgRHIuIFV3ZSBLcmFja2Ug4oCTIFVzdC1JZE5yLjog
REUgMjA1IDE5OCAwNTUKCmVtbGl4IC0gc21hcnQgZW1iZWRkZWQgb3BlbiBzb3VyY2UKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1h
cmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
