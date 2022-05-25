Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29706C433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 May 2022 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL/t6HHado3QrKL5OlwNAcYfMqbKgsYvikW+VMz+UO8=; b=yXmL/2aGwbSSiF
	Fi1neSfS+V6xjbJe2dExmuEJ2GIOtZu1PJOAVw4+//6rlS+FXu/00HaYFf8hMgT88pG7pDlipUphf
	+eAI7mWpoQ19+dy8njCi1yRTRMkIm3KpAoitiIMRjaQCs0eWsvQI46w8p+bHGFoIUN+LLnbxizzM1
	ipibu1w3VF+3tn0qSPRL8xJ97KgBrmX8ThJYvXLCYsRJQKVZGtnLgiZY+m4JRpH+SMB1JVvEP+Tk9
	y59uR81J1Zfb7g6glaT2PDtY0+Wx0Zo5UmYPw8rqgSZfGnfaVpSnbcJ/AIDXEKhbC22W2rfkQeexV
	wC6u3TcPSpG+KmISm1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsJV-00BScz-LG; Wed, 25 May 2022 14:48:41 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsJS-00BSc6-LC
	for linux-snps-arc@lists.infradead.org; Wed, 25 May 2022 14:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653490118; x=1685026118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+zf9BLb1YsbTyRecGKN57FpFRihXjMy/F9uE9o3MsKg=;
  b=etV9nnO3air4BNVBLHXuW550kAszXcHj8aDDS7Ukg4I8sERTZx4sJdYN
   KXCMbdlF4HkSacnEc3uF8aW3U7VR3wXoatfvWZgeeBuetAM1s5NlGbbY8
   jNlnm+gBIYAEJM3++kaLanTaAz8vWPDHfMcBcvUXZZAYJ65V1d3KK/OYr
   lICJf3Id9vmbZAr+RMNKJy80Yrjb0qow/kbILjW11JsdpjAKUb/AwOSZo
   S2jyrN7LFqSkzPKrMxkeqe8mbh8aCzz7tTcZYk21BMXOOC1BTWsgB9IJf
   yjUZFL2UZ1d/4gHHRJDDpbSfpxmE0oe0kRqbgWtZmGJhW6cMkDXGON6tR
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="334475120"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="334475120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 07:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="549050144"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 25 May 2022 07:48:36 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Vineet Gupta <vgupta@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 1/2] ARC: bitops: Change __fls to return unsigned long
Date: Wed, 25 May 2022 16:48:43 +0200
Message-Id: <20220525144844.1571705-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com>
References: <20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_074838_807017_E1119534 
X-CRM114-Status: GOOD (  11.23  )
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
ZXhwZWN0ZWQgYXMgcmV0dXJuIHZhbHVlIHNob3VsZCBmaXQgaW4gdW5zaWduZWQKbG9uZy4KClNp
Z25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxp
bnV4LmludGVsLmNvbT4KLS0tCiBhcmNoL2FyYy9pbmNsdWRlL2FzbS9iaXRvcHMuaCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJjL2luY2x1ZGUvYXNtL2JpdG9wcy5oIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20v
Yml0b3BzLmgKaW5kZXggYmRiN2UxOTBhMjk0Li40MDc2NjA3ZTcxNjggMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJjL2luY2x1ZGUvYXNtL2JpdG9wcy5oCisrKyBiL2FyY2gvYXJjL2luY2x1ZGUvYXNtL2Jp
dG9wcy5oCkBAIC04Miw3ICs4Miw3IEBAIHN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfXyAoKGNv
bnN0KSkgaW50IGZscyh1bnNpZ25lZCBpbnQgeCkKIC8qCiAgKiBfX2ZsczogU2ltaWxhciB0byBm
bHMsIGJ1dCB6ZXJvIGJhc2VkICgwLTMxKQogICovCi1zdGF0aWMgaW5saW5lIF9fYXR0cmlidXRl
X18gKChjb25zdCkpIGludCBfX2Zscyh1bnNpZ25lZCBsb25nIHgpCitzdGF0aWMgaW5saW5lIF9f
YXR0cmlidXRlX18gKChjb25zdCkpIHVuc2lnbmVkIGxvbmcgX19mbHModW5zaWduZWQgbG9uZyB4
KQogewogCWlmICgheCkKIAkJcmV0dXJuIDA7Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
