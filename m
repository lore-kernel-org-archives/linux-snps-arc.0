Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CA0C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 May 2022 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jAaiLFRgAFCZX4UNsFJwlcdYs0LH+cVZ/vcqXIUpfQ=; b=tf0SjFM2HhBlch
	X1mgrpWu+BSlrZf2k8ESayRUdD0A0plqtXgUWtHEd7X/JS1B7cCpZoKN9IjY83M6XJq7Qa+hnJwJo
	xRlBZTsAehYHeN90cMFBccodC4mlLuCaftpyeYHOp+fN+8SltAZ15zEZZBXB8LNpOcprUfdyocH6s
	YdDR32EmTIwLOvdipTNo9nF25APO7sLK7mGqln9C9M6LS7mF1GnpfdGPsYZrKBm5XukYr1XNV2Jd1
	PXb9wEdpNyh8EpFVfd74E7spw20CMrMeHnyDDCj4v3dZyna7P8GTSwBxBIEewNYe+QyBZ82jBqhM2
	sGvrGG02pxZJpF0to1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuYXC-00HXtO-3Z; Fri, 27 May 2022 11:53:38 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuYX9-00HXsS-4P
	for linux-snps-arc@lists.infradead.org; Fri, 27 May 2022 11:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653652415; x=1685188415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZtvwdBswObarSG+JCXhEU2uLIuCFq0FhxZEUfuA19u0=;
  b=JkHtmSU14EYPemC5M4HQJJx9j/G/ZQU1yT9zaveePaTwWc4O0JWdDAfE
   pneG/5C1mO8ytIuuErHVG38kE/5YSAmTd1cyRxVOQnH1cGnP0SRaJcvy9
   4bmtMBYJh/TrOX2CZbwGEzsrdX6gJ3Rr9HK1E+0BRP0JuyEmD1Xfp3KC/
   SBS0wo2jKbrM01rHxFjjLnbGI1bWGnhT7jh9R8tQHmif8jGwpLlziZhn3
   ibq/JsMOPngsC7jiWfBdxat8is/o/NXi+7kI4hOIxE37mqZ13Snptdd42
   M/t0RMrK8v2Okg5GdBlWKz6+0yhtbi5BFhAHW0BmmezFgRzEptFL17fRE
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="360848042"
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="360848042"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 04:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="746889599"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2022 04:53:32 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Vineet Gupta <vgupta@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"David S . Miller" <davem@davemloft.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-snps-arc@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 1/3] ARC: bitops: Change __fls to return unsigned long
Date: Fri, 27 May 2022 13:53:43 +0200
Message-Id: <20220527115345.2588775-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com>
References: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_045335_205680_B882A4CB 
X-CRM114-Status: GOOD (  10.92  )
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

QXMgcGVyIGFzbS1nZW5lcmljIGRlZmluaXRpb24gYW5kIG90aGVyIGFyY2hpdGVjdHVyZXMgX19m
bHMgc2hvdWxkCnJldHVybiB1bnNpZ25lZCBsb25nLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaXMg
ZXhwZWN0ZWQgYXMgcmV0dXJuIHZhbHVlIHNob3VsZCBmaXQgaW4gdW5zaWduZWQKbG9uZy4KClJl
dmlld2VkLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxp
bnV4LmludGVsLmNvbT4KLS0tCiBhcmNoL2FyYy9pbmNsdWRlL2FzbS9iaXRvcHMuaCB8IDQgKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FyYy9pbmNsdWRlL2FzbS9iaXRvcHMuaCBiL2FyY2gvYXJjL2luY2x1ZGUv
YXNtL2JpdG9wcy5oCmluZGV4IGJkYjdlMTkwYTI5NC4uZjVhOTM2NDk2ZjA2IDEwMDY0NAotLS0g
YS9hcmNoL2FyYy9pbmNsdWRlL2FzbS9iaXRvcHMuaAorKysgYi9hcmNoL2FyYy9pbmNsdWRlL2Fz
bS9iaXRvcHMuaApAQCAtODIsNyArODIsNyBAQCBzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18g
KChjb25zdCkpIGludCBmbHModW5zaWduZWQgaW50IHgpCiAvKgogICogX19mbHM6IFNpbWlsYXIg
dG8gZmxzLCBidXQgemVybyBiYXNlZCAoMC0zMSkKICAqLwotc3RhdGljIGlubGluZSBfX2F0dHJp
YnV0ZV9fICgoY29uc3QpKSBpbnQgX19mbHModW5zaWduZWQgbG9uZyB4KQorc3RhdGljIGlubGlu
ZSBfX2F0dHJpYnV0ZV9fICgoY29uc3QpKSB1bnNpZ25lZCBsb25nIF9fZmxzKHVuc2lnbmVkIGxv
bmcgeCkKIHsKIAlpZiAoIXgpCiAJCXJldHVybiAwOwpAQCAtMTMxLDcgKzEzMSw3IEBAIHN0YXRp
YyBpbmxpbmUgX19hdHRyaWJ1dGVfXyAoKGNvbnN0KSkgaW50IGZscyh1bnNpZ25lZCBpbnQgeCkK
IC8qCiAgKiBfX2ZsczogU2ltaWxhciB0byBmbHMsIGJ1dCB6ZXJvIGJhc2VkICgwLTMxKS4gQWxz
byAwIGlmIG5vIGJpdCBzZXQKICAqLwotc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fICgoY29u
c3QpKSBpbnQgX19mbHModW5zaWduZWQgbG9uZyB4KQorc3RhdGljIGlubGluZSBfX2F0dHJpYnV0
ZV9fICgoY29uc3QpKSB1bnNpZ25lZCBsb25nIF9fZmxzKHVuc2lnbmVkIGxvbmcgeCkKIHsKIAkv
KiBGTFMgaW5zbiBoYXMgZXhhY3RseSBzYW1lIHNlbWFudGljcyBhcyB0aGUgQVBJICovCiAJcmV0
dXJuCV9fYnVpbHRpbl9hcmNfZmxzKHgpOwotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
