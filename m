Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC3CD2069E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2024 05:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yh/N/J3L0RQoGbnpfAr9dXtMoMqvCrFd3zxbkk5KEv8=; b=FbyObxqcYfRkYT
	pawg+iBdUIeuErfTpZHmDHbAJu7qzRBmZWPP0RM58FvSlleEeg9/5oYqGiy0YUzIPT8T0IYND3df8
	THuBvEPPYaYvFXrE45aK0/y28soDGguhKiILg4XWH8afFSUFzBMaktCH+wCOp6aEhBwee0aUyGLwh
	1XUd4PJUJ517uzQeSiVgptvfKpa3s5C3Ct9pEPxZ/sDDq4kMxpbeckt6dJDO3v5DhdqDO38RItaXf
	3L9UZSJueEhbbKrlbJYBRbXerf+HFyApVN5x/LxXRFZ6/qywb1RHFmHi5EKVylNot4pt0qqLssitp
	lbDxxPLqasHlPE+eITVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wZk-0000000AZNe-3TQx;
	Wed, 16 Oct 2024 05:28:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wZg-0000000AZLV-3LSi
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Oct 2024 05:27:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1755CA429C2;
	Wed, 16 Oct 2024 05:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804F2C4CEC7;
	Wed, 16 Oct 2024 05:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729056475;
	bh=68woyE75ZIGwOaOLLsh1imaUUCQWdiGYr0Y+KyS1j1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fbywkrjj7Vlf6V20QnRMYPLTR0QlaLScl4vqg2Znzpnw+CdwPLcXYhTr2tmpbOqgF
	 mY/NnKTSR8lvq28GytdIHkQyln8LRLZc27IvwMUkelbMT1di7x2qGeNL9Qhi6YCrhB
	 YEBoO77IpasMYCWpA5GA7FTy4xKQtnLlm0V16n5ssMU2vTn/6j+BoyaHjuA5EshqmE
	 lte1VO8CN/yrhPrcP0T6F2tTCVocmcSFo/rXWj9F4NaRLU3nnuGXEFJ2sTLNrFnMYd
	 X8YwlYkD6zh0oHEPiyRht5mlhmsq8d4VRFf7ZC3QonAe723Ud+xhHBrNjGha83QflL
	 fYTh5B1XhxK5A==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 1/3] arc: rename aux.h to arc_aux.h
Date: Tue, 15 Oct 2024 22:27:47 -0700
Message-ID: <20241016052749.1640081-2-vgupta@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016052749.1640081-1-vgupta@kernel.org>
References: <20241016052749.1640081-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_222757_217799_CF2A083B 
X-CRM114-Status: GOOD (  10.43  )
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

RnJvbTogQmVuamFtaW4gU3rFkWtlIDxlZ3lzemVyZWd5QGZyZWVtYWlsLmh1PgoKVGhlIGdvYWwg
aXMgdG8gY2xlYW4tdXAgTGludXggcmVwb3NpdG9yeSBmcm9tIEFVWCBmaWxlIG5hbWVzLCBiZWNh
dXNlCnRoZSB1c2Ugb2Ygc3VjaCBmaWxlIG5hbWVzIGlzIHByb2hpYml0ZWQgb24gb3RoZXIgb3Bl
cmF0aW5nIHN5c3RlbXMKc3VjaCBhcyBXaW5kb3dzLCBzbyB0aGUgTGludXggcmVwb3NpdG9yeSBj
YW5ub3QgYmUgY2xvbmVkIGFuZAplZGl0ZWQgb24gdGhlbS4KClJldmlld2VkLWJ5OiBTaGFoYWIg
VmFoZWRpIDxsaXN0K2JwZkB2YWhlZGkub3JnPgpTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBTesWR
a2UgPGVneXN6ZXJlZ3lAZnJlZW1haWwuaHU+ClNpZ25lZC1vZmYtYnk6IFZpbmVldCBHdXB0YSA8
dmd1cHRhQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9hcmMvaW5jbHVkZS9hc20vYXJjcmVncy5oICAg
ICAgIHwgMiArLQogYXJjaC9hcmMvaW5jbHVkZS9hc20vbW11LWFyY3YyLmggICAgIHwgMiArLQog
aW5jbHVkZS9zb2MvYXJjL3thdXguaCA9PiBhcmNfYXV4Lmh9IHwgMAogaW5jbHVkZS9zb2MvYXJj
L21jaXAuaCAgICAgICAgICAgICAgIHwgMiArLQogaW5jbHVkZS9zb2MvYXJjL3RpbWVycy5oICAg
ICAgICAgICAgIHwgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCiByZW5hbWUgaW5jbHVkZS9zb2MvYXJjL3thdXguaCA9PiBhcmNfYXV4Lmh9ICgx
MDAlKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJjL2luY2x1ZGUvYXNtL2FyY3JlZ3MuaCBiL2FyY2gv
YXJjL2luY2x1ZGUvYXNtL2FyY3JlZ3MuaAppbmRleCA0YjEzZjYwZmU3Y2EuLjAwNWQ5ZTRkMTg3
YSAxMDA2NDQKLS0tIGEvYXJjaC9hcmMvaW5jbHVkZS9hc20vYXJjcmVncy5oCisrKyBiL2FyY2gv
YXJjL2luY2x1ZGUvYXNtL2FyY3JlZ3MuaApAQCAtMTQ2LDcgKzE0Niw3IEBACiAKICNpZm5kZWYg
X19BU1NFTUJMWV9fCiAKLSNpbmNsdWRlIDxzb2MvYXJjL2F1eC5oPgorI2luY2x1ZGUgPHNvYy9h
cmMvYXJjX2F1eC5oPgogCiAvKiBIZWxwZXJzICovCiAjZGVmaW5lIFRPX0tCKGJ5dGVzKQkJKChi
eXRlcykgPj4gMTApCmRpZmYgLS1naXQgYS9hcmNoL2FyYy9pbmNsdWRlL2FzbS9tbXUtYXJjdjIu
aCBiL2FyY2gvYXJjL2luY2x1ZGUvYXNtL21tdS1hcmN2Mi5oCmluZGV4IGQ4NWRjMDcyMTkwNy4u
NDE0MTI2NDJmMjc5IDEwMDY0NAotLS0gYS9hcmNoL2FyYy9pbmNsdWRlL2FzbS9tbXUtYXJjdjIu
aAorKysgYi9hcmNoL2FyYy9pbmNsdWRlL2FzbS9tbXUtYXJjdjIuaApAQCAtOSw3ICs5LDcgQEAK
ICNpZm5kZWYgX0FTTV9BUkNfTU1VX0FSQ1YyX0gKICNkZWZpbmUgX0FTTV9BUkNfTU1VX0FSQ1Yy
X0gKIAotI2luY2x1ZGUgPHNvYy9hcmMvYXV4Lmg+CisjaW5jbHVkZSA8c29jL2FyYy9hcmNfYXV4
Lmg+CiAKIC8qCiAgKiBUTEIgTWFuYWdlbWVudCByZWdzCmRpZmYgLS1naXQgYS9pbmNsdWRlL3Nv
Yy9hcmMvYXV4LmggYi9pbmNsdWRlL3NvYy9hcmMvYXJjX2F1eC5oCnNpbWlsYXJpdHkgaW5kZXgg
MTAwJQpyZW5hbWUgZnJvbSBpbmNsdWRlL3NvYy9hcmMvYXV4LmgKcmVuYW1lIHRvIGluY2x1ZGUv
c29jL2FyYy9hcmNfYXV4LmgKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc29jL2FyYy9tY2lwLmggYi9p
bmNsdWRlL3NvYy9hcmMvbWNpcC5oCmluZGV4IGQxYTkzYzczZjAwNi4uYTc4ZGFjZDE0OWYxIDEw
MDY0NAotLS0gYS9pbmNsdWRlL3NvYy9hcmMvbWNpcC5oCisrKyBiL2luY2x1ZGUvc29jL2FyYy9t
Y2lwLmgKQEAgLTgsNyArOCw3IEBACiAjaWZuZGVmIF9fU09DX0FSQ19NQ0lQX0gKICNkZWZpbmUg
X19TT0NfQVJDX01DSVBfSAogCi0jaW5jbHVkZSA8c29jL2FyYy9hdXguaD4KKyNpbmNsdWRlIDxz
b2MvYXJjL2FyY19hdXguaD4KIAogI2RlZmluZSBBUkNfUkVHX01DSVBfQkNSCTB4MGQwCiAjZGVm
aW5lIEFSQ19SRUdfTUNJUF9JRFVfQkNSCTB4MEQ1CmRpZmYgLS1naXQgYS9pbmNsdWRlL3NvYy9h
cmMvdGltZXJzLmggYi9pbmNsdWRlL3NvYy9hcmMvdGltZXJzLmgKaW5kZXggYWU5OWQzZTg1NWYx
Li41MWE3NDE2NjI5NmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc29jL2FyYy90aW1lcnMuaAorKysg
Yi9pbmNsdWRlL3NvYy9hcmMvdGltZXJzLmgKQEAgLTYsNyArNiw3IEBACiAjaWZuZGVmIF9fU09D
X0FSQ19USU1FUlNfSAogI2RlZmluZSBfX1NPQ19BUkNfVElNRVJTX0gKIAotI2luY2x1ZGUgPHNv
Yy9hcmMvYXV4Lmg+CisjaW5jbHVkZSA8c29jL2FyYy9hcmNfYXV4Lmg+CiAKIC8qIFRpbWVyIHJl
bGF0ZWQgQXV4IHJlZ2lzdGVycyAqLwogI2RlZmluZSBBUkNfUkVHX1RJTUVSMF9MSU1JVAkweDIz
CS8qIHRpbWVyIDAgbGltaXQgKi8KLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
