Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3A8C5DF9C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2026 20:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ZR2BN8QCIc1lQFnQCqARps6VVd/nZ8RaDHyGCcbyKI=; b=WMt9s1CGsPjb3r
	Ii9QVWOcEFebW/NH8npiRjmwZVOcODOjdY4fs+jPqYN6uV2s+9sIqYPQLR5JzJN5fi4v9RsoFUChw
	uJXMaf7tpckWtRkhu9LePMT66KpGnTjJMjwILh2enXZN6DM5BV5nyVsMZCQRkqGLrbD5yb3o6180b
	vrso3C+A+iZEfgSg7zWNiwit/M58DhTdSNI/z9Y3Y6fsuscEY/tEzt0UP9Qtx0iYPeiLm10IT6i9n
	1pFalM534Yq1O4UUv7kXhvsyxjS5shrdMt/Fy5b6LHs2vhRbFm7/espvmIHHTaBqYHjHhFxneJDmZ
	FNonsoKt2HU9mlkpwteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybS0-0000000HNLc-19W1;
	Mon, 24 Aug 2026 20:39:24 +0000
Received: from oss.cyber.gouv.fr ([51.159.188.251])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybRx-0000000HNKg-15iR
	for linux-snps-arc@lists.infradead.org;
	Mon, 24 Aug 2026 20:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IrwYsB/cvJROppYg40sjAVcDPzEozjwDIQ9eN23y38M=; b=hgEpTsEEXwqTdASOSbcRyqt2PO
	I4FkdIhsXufUAEpcUGFdSQw/c2aREDTg5seTKAQHXuS2cjPnggg3fmnjvGQtpMltGMkMfyA47Igzd
	AgvqWGGIgh9dOfVRUbwYRSr+n/5O41JArJHl6u6LZjdN5MT/4UcGUEYdkgCNoN0+yQ5q9tcY2gRsk
	o7icrvVekz6ZlYhLIThL+WbZGx/TRtkotuxxRH8y8ZX9WtujVcHhTI1yFYTr9HjMur02T5Z4fKWyH
	9YGgw7wa4kDnqWO4PjkW2OEhaEhOIho5SvcJob9k91/XgOIjhcjp0qsJQ7cMcleRJLGFup2WzKgtz
	aXUEF2Hg==;
Received: from [151.115.150.205] (port=47050 helo=gepetto..)
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <Jeremy.Jean@oss.cyber.gouv.fr>)
	id 1wybRF-0000000DXTc-34iK;
	Mon, 24 Aug 2026 22:38:37 +0200
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Subject: [PATCH] ARC: check user addresses in unaligned access emulation
Date: Mon, 24 Aug 2026 20:37:41 +0000
Message-ID: <20260824203740.3689400-2-Jeremy.Jean@oss.cyber.gouv.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: jeremy.jean@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: jeremy.jean@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_133921_468617_238FE65F 
X-CRM114-Status: UNSURE (   7.78  )
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

QVJDNzAwIHJhaXNlcyBhbiBhbGlnbm1lbnQgZXhjZXB0aW9uIGJlZm9yZSBjaGVja2luZyBhY2Nl
c3MgcGVybWlzc2lvbnMuCkNvbnNlcXVlbnRseSwgYSB1c2Vyc3BhY2UgbG9hZCBvciBzdG9yZSB1
c2luZyBhIG1pc2FsaWduZWQga2VybmVsIGFkZHJlc3MKcmVhY2hlcyBtaXNhbGlnbmVkX2ZpeHVw
KCkgYmVmb3JlIHRoZSBwcm9jZXNzb3IgcmVqZWN0cyBpdC4KCm1pc2FsaWduZWRfZml4dXAoKSBk
ZWNvZGVzIHRoZSBpbnN0cnVjdGlvbiBhbmQgcmVwZWF0cyB0aGUgYWNjZXNzIHVzaW5nCmJ5dGUg
bG9hZHMgb3Igc3RvcmVzLiBUaGVzZSBhY2Nlc3NlcyBydW4gaW4ga2VybmVsIG1vZGUsIGFuZCBl
eGNlcHRpb24KdGFibGVzIG9ubHkgaGFuZGxlIGFjY2Vzc2VzIHRoYXQgZmF1bHQuIEEgbWFwcGVk
IGtlcm5lbCBhZGRyZXNzIGlzCnRoZXJlZm9yZSByZWFkIG9yIHdyaXR0ZW4gd2l0aCBzdXBlcnZp
c29yIHBlcm1pc3Npb25zLgoKVXNlIGFjY2Vzc19vaygpIHRvIHJlamVjdCBhZGRyZXNzZXMgb3V0
c2lkZSB0aGUgdXNlciByYW5nZSBiZWZvcmUgY2FsbGluZwp0aGUgaGVscGVycy4gQ2hlY2sgdGhl
IHdob2xlIDItIG9yIDQtYnl0ZSByYW5nZSBhbmQgdXNlIHRoZSBjaGVja2VkIGFkZHJlc3MKZm9y
IHRoZSBlbXVsYXRlZCBvcGVyYXRpb24uCgpGaXhlczogMmU2NTFlYTE1OTZiICgiQVJDOiBVbmFs
aWduZWQgYWNjZXNzIGVtdWxhdGlvbiIpCkFzc2lzdGVkLWJ5OiBDb2RleDpncHQtZGF5YnJlYWst
Ymx1ZQpTaWduZWQtb2ZmLWJ5OiBKw6lyw6lteSBKZWFuIDxKZXJlbXkuSmVhbkBvc3MuY3liZXIu
Z291di5mcj4KLS0tCiBhcmNoL2FyYy9rZXJuZWwvdW5hbGlnbmVkLmMgfCAyMyArKysrKysrKysr
KysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcmMva2VybmVsL3VuYWxpZ25lZC5jIGIvYXJjaC9h
cmMva2VybmVsL3VuYWxpZ25lZC5jCmluZGV4IDNiMmQ4YjFiZDI3MS4uZjYwNzlkYzg5YTZkIDEw
MDY0NAotLS0gYS9hcmNoL2FyYy9rZXJuZWwvdW5hbGlnbmVkLmMKKysrIGIvYXJjaC9hcmMva2Vy
bmVsL3VuYWxpZ25lZC5jCkBAIC0xMzMsNiArMTMzLDggQEAgaW50IG5vX3VuYWxpZ25lZF93YXJu
aW5nIF9fcmVhZF9tb3N0bHkgPSAxOwkvKiBPbmx5IDEgd2FybmluZyBieSBkZWZhdWx0ICovCiBz
dGF0aWMgdm9pZCBmaXh1cF9sb2FkKHN0cnVjdCBkaXNhc21fc3RhdGUgKnN0YXRlLCBzdHJ1Y3Qg
cHRfcmVncyAqcmVncywKIAkJCXN0cnVjdCBjYWxsZWVfcmVncyAqY3JlZ3MpCiB7CisJdW5zaWdu
ZWQgbG9uZyBhZGRyZXNzOworCXVuc2lnbmVkIGludCBzaXplOwogCWludCB2YWw7CiAKIAkvKiBy
ZWdpc3RlciB3cml0ZSBiYWNrICovCkBAIC0xNDMsMTAgKzE0NSwxNSBAQCBzdGF0aWMgdm9pZCBm
aXh1cF9sb2FkKHN0cnVjdCBkaXNhc21fc3RhdGUgKnN0YXRlLCBzdHJ1Y3QgcHRfcmVncyAqcmVn
cywKIAkJCXN0YXRlLT5zcmMyID0gMDsKIAl9CiAKKwlhZGRyZXNzID0gc3RhdGUtPnNyYzEgKyBz
dGF0ZS0+c3JjMjsKKwlzaXplID0gc3RhdGUtPnp6ID8gMiA6IDQ7CisJaWYgKCFhY2Nlc3Nfb2so
KHZvaWQgX191c2VyICopYWRkcmVzcywgc2l6ZSkpCisJCWdvdG8gZmF1bHQ7CisKIAlpZiAoc3Rh
dGUtPnp6ID09IDApIHsKLQkJZ2V0MzJfdW5hbGlnbmVkX2NoZWNrKHZhbCwgc3RhdGUtPnNyYzEg
KyBzdGF0ZS0+c3JjMik7CisJCWdldDMyX3VuYWxpZ25lZF9jaGVjayh2YWwsIGFkZHJlc3MpOwog
CX0gZWxzZSB7Ci0JCWdldDE2X3VuYWxpZ25lZF9jaGVjayh2YWwsIHN0YXRlLT5zcmMxICsgc3Rh
dGUtPnNyYzIpOworCQlnZXQxNl91bmFsaWduZWRfY2hlY2sodmFsLCBhZGRyZXNzKTsKIAogCQlp
ZiAoc3RhdGUtPngpCiAJCQl2YWwgPSAodmFsIDw8IDE2KSA+PiAxNjsKQEAgLTE2Myw2ICsxNzAs
OSBAQCBmYXVsdDoJc3RhdGUtPmZhdWx0ID0gMTsKIHN0YXRpYyB2b2lkIGZpeHVwX3N0b3JlKHN0
cnVjdCBkaXNhc21fc3RhdGUgKnN0YXRlLCBzdHJ1Y3QgcHRfcmVncyAqcmVncywKIAkJCXN0cnVj
dCBjYWxsZWVfcmVncyAqY3JlZ3MpCiB7CisJdW5zaWduZWQgbG9uZyBhZGRyZXNzOworCXVuc2ln
bmVkIGludCBzaXplOworCiAJLyogcmVnaXN0ZXIgd3JpdGUgYmFjayAqLwogCWlmICgoc3RhdGUt
PmFhID09IDEpIHx8IChzdGF0ZS0+YWEgPT0gMikpIHsKIAkJc2V0X3JlZyhzdGF0ZS0+d2JfcmVn
LCBzdGF0ZS0+c3JjMiArIHN0YXRlLT5zcmMzLCByZWdzLCBjcmVncyk7CkBAIC0xODEsMTEgKzE5
MSwxNiBAQCBzdGF0aWMgdm9pZCBmaXh1cF9zdG9yZShzdHJ1Y3QgZGlzYXNtX3N0YXRlICpzdGF0
ZSwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCiAJCX0KIAl9CiAKKwlhZGRyZXNzID0gc3RhdGUtPnNy
YzIgKyBzdGF0ZS0+c3JjMzsKKwlzaXplID0gc3RhdGUtPnp6ID8gMiA6IDQ7CisJaWYgKCFhY2Nl
c3Nfb2soKHZvaWQgX191c2VyICopYWRkcmVzcywgc2l6ZSkpCisJCWdvdG8gZmF1bHQ7CisKIAkv
KiB3cml0ZSBmaXgtdXAgKi8KIAlpZiAoIXN0YXRlLT56eikKLQkJcHV0MzJfdW5hbGlnbmVkX2No
ZWNrKHN0YXRlLT5zcmMxLCBzdGF0ZS0+c3JjMiArIHN0YXRlLT5zcmMzKTsKKwkJcHV0MzJfdW5h
bGlnbmVkX2NoZWNrKHN0YXRlLT5zcmMxLCBhZGRyZXNzKTsKIAllbHNlCi0JCXB1dDE2X3VuYWxp
Z25lZF9jaGVjayhzdGF0ZS0+c3JjMSwgc3RhdGUtPnNyYzIgKyBzdGF0ZS0+c3JjMyk7CisJCXB1
dDE2X3VuYWxpZ25lZF9jaGVjayhzdGF0ZS0+c3JjMSwgYWRkcmVzcyk7CiAKIAlyZXR1cm47CiAK
LS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
