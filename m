Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C57C433FE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 May 2022 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4J9RJAamGh+fFKZ9YQLOvs+ugL8aIGDh9j+I1FYpZGw=; b=t1ZYy9CcYH48HM
	t6G9RxMTHOfw2zahdipHcoeU43lhNsNqk2GlNKy2rUNkKd0Tw0MIkzbE78lzVnuLMTDwc9DNvhM/3
	9b55xqwLhCHrnXTinxSXYansW4PCOPKciwREJqpdUqfjY3jPDNkPr6Eewdyd0qb4mV6/kLyJwPEzv
	OjaQ269FxjOJZDuCZPQPxBVl9eoqss+DSxMHeEGjuwyu10AyENpy04Hjw+/PIjPiyAPMfghQZ2fuf
	Wp5wF0cXx5EkrmD8+R9zMeE/ioHOM9if8T1B3EnRWoplwIY1ZH+DBTFHQfxNaYP0DOYspgO+Q8VNM
	MFr4Q4aVttKitG54Pg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuYXE-00HXtz-8A; Fri, 27 May 2022 11:53:40 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuYXC-00HXsS-28
	for linux-snps-arc@lists.infradead.org; Fri, 27 May 2022 11:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653652418; x=1685188418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iXa9tysKL8dYSNPB5yR6GZnkuyZOW6oS/kYddLRiRMc=;
  b=STauIsVNXgCZyQ+r/COd1NHEdN7nTB99EPI3LmU4ciJkWxvTEq/Pq1nm
   1BH4gIiEoEKmK73E0TxWNPEgeq21aMT33f0PPB114mIyf3ZwsvufAMMsA
   0yDTYe3qud3NwBJOlomm8M9A/sTu5WMJrNqPJE1CF3M9v72qGpfkvZH+g
   N6OW4ZSJFFCCYmlWHPL9nIjZVJ6Uu7tAFZSRDGNYKd/2uo7apG6nElnaW
   JxW4w69z07VXPi99sNVQmjiPc8bk1KHRxI3YUHdAfxAjbzNniDVGKcrG0
   CuB9hgFrS7WAALhIQwgxSLaipSjoiL1syRzy8P+HO/KQ54lC0c2WteVAw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="360848048"
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="360848048"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 04:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="746889626"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2022 04:53:35 -0700
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
Subject: [PATCH v2 2/3] m68k: bitops: Change __fls to return and accept unsigned long
Date: Fri, 27 May 2022 13:53:44 +0200
Message-Id: <20220527115345.2588775-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com>
References: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_045338_132620_904B5D42 
X-CRM114-Status: GOOD (  10.00  )
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
ci4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlzIGV4cGVjdGVkIGFzIHJldHVybiB2YWx1ZSBzaG91
bGQgZml0IGluIHVuc2lnbmVkCmxvbmcuCgpSZXZpZXdlZC1ieTogQ2V6YXJ5IFJvamV3c2tpIDxj
ZXphcnkucm9qZXdza2lAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nF
hHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+Ci0tLQogYXJjaC9tNjhr
L2luY2x1ZGUvYXNtL2JpdG9wcy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2Jp
dG9wcy5oIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2JpdG9wcy5oCmluZGV4IDUxMjgzZGI1MzY2
Ny4uODdjMmNkNjZhOWNlIDEwMDY0NAotLS0gYS9hcmNoL202OGsvaW5jbHVkZS9hc20vYml0b3Bz
LmgKKysrIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2JpdG9wcy5oCkBAIC01MTAsNyArNTEwLDcg
QEAgc3RhdGljIGlubGluZSBpbnQgZmxzKHVuc2lnbmVkIGludCB4KQogCXJldHVybiAzMiAtIGNu
dDsKIH0KIAotc3RhdGljIGlubGluZSBpbnQgX19mbHMoaW50IHgpCitzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgX19mbHModW5zaWduZWQgbG9uZyB4KQogewogCXJldHVybiBmbHMoeCkgLSAx
OwogfQotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1zbnBzLWFyYwo=
