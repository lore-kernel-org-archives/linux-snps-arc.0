Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F964C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 May 2022 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcEBgbhbDNtiUo49VNaWRwLS/Cb3QMRtqEOniOeRE/M=; b=n3qL1UU3JNgzvv
	CT9G7dcF50DTO9+XkAie1JTGVzrk/jM2Kv3MUrLnREDUdPtbBIe49zLX6/SrO3h2xMphs4EznBg2G
	8AYn3keQpg6xVNngZw6pVWghHqd4WkEm3CiemavUmn4K2IHbc/wZlK0PS3bcnIYWocodPIgbkFXIL
	5ExBrpp/M1rVm6W2LSqjwhcXaZXjzJwTMQzEsVAvpmK34d1GCP8tvcDD+KuV89rqszWZBua9gg7w6
	OfTxFyPl2y0rKs9NSjP+Ye+lT2EFhASsJvK3qTwxYl3ArATY/0ezmeRVZnuuqWOclpxHGM9FJ5POT
	52cUJMeDciUu7EQ0/jwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsJX-00BSdU-0j; Wed, 25 May 2022 14:48:43 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsJU-00BSc6-JD
	for linux-snps-arc@lists.infradead.org; Wed, 25 May 2022 14:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653490120; x=1685026120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3tpP5OcS3DtXXabkYSPMX7+If5Ij31PZoojd2jKhDdY=;
  b=QIJXgonqw2Gat882ytA3jvTvvcBFJtyVehF2GGTV9jmtY7R3b/cm4Xu+
   Q8OOjDt14nLs1trRWdCASI0DyRu16Hp6XSj7YkAB6Nk7z+WUlU/soi567
   hWwJ0gUNORerWvpFAE26THAXVJkMWNwlD3oGWbSazTDo7lxgRIX7QHDGS
   6pi6Hxbt4LH9dQrCk7qdyR1na34KtXD2yAlBqjVIp0huR4sTU9jZhOW9J
   iKqkFxKCNylNsWZSa5PjGIGE60hwuM1cqAmUTLe1IgxSqmBwZGaIqBy0K
   94e706yqoTWDmxJdCTUrNZU7uubkXyAicV6EGFUCRYWcIKHLy8mZOjN8A
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="334475123"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="334475123"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 07:48:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="549050157"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 25 May 2022 07:48:38 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Vineet Gupta <vgupta@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 2/2] m68k: bitops: Change __fls to return and accept unsigned long
Date: Wed, 25 May 2022 16:48:44 +0200
Message-Id: <20220525144844.1571705-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com>
References: <20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_074840_692051_8AFA481D 
X-CRM114-Status: GOOD (  10.17  )
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
bHMgc2hvdWxkCnJldHVybiBhbmQgYWNjZXB0IHVuc2lnbmVkIGxvbmcgYXMgaXRzIHBhcmFtZXRl
ci4KClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2lu
c2tpQGxpbnV4LmludGVsLmNvbT4KLS0tCiBhcmNoL202OGsvaW5jbHVkZS9hc20vYml0b3BzLmgg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL202OGsvaW5jbHVkZS9hc20vYml0b3BzLmggYi9hcmNoL202OGsvaW5j
bHVkZS9hc20vYml0b3BzLmgKaW5kZXggNTEyODNkYjUzNjY3Li44N2MyY2Q2NmE5Y2UgMTAwNjQ0
Ci0tLSBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9iaXRvcHMuaAorKysgYi9hcmNoL202OGsvaW5j
bHVkZS9hc20vYml0b3BzLmgKQEAgLTUxMCw3ICs1MTAsNyBAQCBzdGF0aWMgaW5saW5lIGludCBm
bHModW5zaWduZWQgaW50IHgpCiAJcmV0dXJuIDMyIC0gY250OwogfQogCi1zdGF0aWMgaW5saW5l
IGludCBfX2ZscyhpbnQgeCkKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX2Zscyh1bnNp
Z25lZCBsb25nIHgpCiB7CiAJcmV0dXJuIGZscyh4KSAtIDE7CiB9Ci0tIAoyLjI1LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFy
YyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
