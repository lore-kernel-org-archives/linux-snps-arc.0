Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E25C433FE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 May 2022 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCDumfE/IMFRw1bF5lFQtcdqPwu+v5Pciried4BQajg=; b=VtKQRkPM5CDIlt
	SMFYiWRYU5om4z8xFcfuRPLgpYrapOGsK3kYzKNncshZaW6g5B3ET+RDrg3f9EdbeQzYjdgB8QXm+
	Fmtld+A7D6SN5a39WVyCqPCsZtwzcF4t1mPgixb1XlOjg4/roNInx/dLSnmNEIsnyCBSd+yIu+AD0
	mnsurQlLuM+SXZRYdl6tYDaMr0pTqmmA1zsAgGW9mapaxSSb5xnU2IyCGjsd0Ct32aOOPoEl89Sgg
	UC2ZeDSE5yu0LmzLqm2550ISatUncjvRUrrOCea9gYcdh7rWYXXhgel8F2CWGbXijMRayWgAEfJZT
	GoVTjYLCqjP54y7RvwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuYXG-00HXuu-UX; Fri, 27 May 2022 11:53:42 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuYXE-00HXsS-J2
	for linux-snps-arc@lists.infradead.org; Fri, 27 May 2022 11:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653652420; x=1685188420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vuMs6VJt08rsTnYrQbFKCLWhZ1eIAOf5fKrz74zRkw0=;
  b=bkPxNI9RMPjF243yqx64n7hGe3o1zbhmam6Q7T1qyyzxjBNOFX8lWNfg
   dot/BQ94Zqm81fAZDBaH4pOwZIE8u8tvmhZ3qndsphXo9MBgxQ0TU7W0k
   7nzUAp0XhYocvZorU11YbtVxxMzxYEk6GjHJleObRv6In4hbjBnlgVVLj
   uRX+iDKGOZiA24toUMy98APepXn4YU/euI2g6NQNKwKdPyYlrww+iQPkt
   PifgNhOYiNCG/GbvY6g1rRTqszHzRSiCD0Neiht24KAavtr+XFBtMlQ9E
   RbwEzEWPCdj8VpodQTiREcAiG2Ma2S1aOvD5dv4iKIEtZFiTEZ9Njrd58
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="360848069"
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="360848069"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 04:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="746889640"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2022 04:53:37 -0700
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
Subject: [PATCH v2 3/3] sparc64: bitops: Change __fls to return unsigned long
Date: Fri, 27 May 2022 13:53:45 +0200
Message-Id: <20220527115345.2588775-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com>
References: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_045340_703723_ACF0B0B7 
X-CRM114-Status: UNSURE (   9.53  )
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

QXMgcGVyIGFzbS1nZW5lcmljIGRlZmluaXRpb24gYW5kIG90aGVyIGFyY2hpdGVjdHVyZXMgX19m
bHMgc2hvdWxkCnJldHVybiB1bnNpZ25lZCBsb25nLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaXMg
ZXhwZWN0ZWQgYXMgcmV0dXJuIHZhbHVlIHNob3VsZCBmaXQgaW4gdW5zaWduZWQKbG9uZy4KClJl
dmlld2VkLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxp
bnV4LmludGVsLmNvbT4KLS0tCiBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL2JpdG9wc182NC5oIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9iaXRvcHNfNjQuaCBiL2FyY2gvc3BhcmMv
aW5jbHVkZS9hc20vYml0b3BzXzY0LmgKaW5kZXggMDA1YThhZTg1OGYxLi5jZGFjMzliZDdiMzIg
MTAwNjQ0Ci0tLSBhL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vYml0b3BzXzY0LmgKKysrIGIvYXJj
aC9zcGFyYy9pbmNsdWRlL2FzbS9iaXRvcHNfNjQuaApAQCAtMjQsNyArMjQsNyBAQCB2b2lkIGNs
ZWFyX2JpdCh1bnNpZ25lZCBsb25nIG5yLCB2b2xhdGlsZSB1bnNpZ25lZCBsb25nICphZGRyKTsK
IHZvaWQgY2hhbmdlX2JpdCh1bnNpZ25lZCBsb25nIG5yLCB2b2xhdGlsZSB1bnNpZ25lZCBsb25n
ICphZGRyKTsKIAogaW50IGZscyh1bnNpZ25lZCBpbnQgd29yZCk7Ci1pbnQgX19mbHModW5zaWdu
ZWQgbG9uZyB3b3JkKTsKK3Vuc2lnbmVkIGxvbmcgX19mbHModW5zaWduZWQgbG9uZyB3b3JkKTsK
IAogI2luY2x1ZGUgPGFzbS1nZW5lcmljL2JpdG9wcy9ub24tYXRvbWljLmg+CiAKLS0gCjIuMjUu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
