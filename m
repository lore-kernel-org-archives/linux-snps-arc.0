Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0308FC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 May 2022 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jh5Bmi1y76lk1AGm/d0AmgJ85graK2M3m8Trxn7Qia0=; b=3F5+dk/GYktwKD
	FixCzxuh6242X4oIVjZ/XPR/WdLeblVstc07eyJD3cyB2SqYjYXbmd37R1fjf4xSvNpq67vCPTBVQ
	wwYmrvVOrO0TwwmZ6bn8T/rYjDAgLzh60lUOl8DUN5C2on1bLqnoWN7hgT70ZvG2pJgHY9nVCR302
	uHEBpQONn4iKlIddTvfVszydv3tOEXx8VX4rtOILnEOgtygjFvr9PN7ZUh4KPetJy3c8hhBXUvp0W
	iokevVr3z6Pjkmvn/l2BjpWkzq7LtxtKtbxGiwGB2Cc+HC4jdtIpLA3uTT7HkSJgJ4EvXLuKJlcw0
	2gU+d2kEV/02MDBsin8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsJV-00BSd6-Rx; Wed, 25 May 2022 14:48:41 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsJS-00BSbx-Lr
	for linux-snps-arc@lists.infradead.org; Wed, 25 May 2022 14:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653490118; x=1685026118;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I1J/xn+4QP1J2xa1QkYks2VmwD45ljeamgIxezfJlWI=;
  b=AQyvs2BvgGEjhZW8FDrn1r6SEhhg4cimtSSPoMaPlrRuVzIpVaxasajH
   gevAbfi6CGpxz8y/mnF5IKyXW8LMVaKI7b9zg1F321nPtLimHLUG3BEaR
   HCb+2mKuwz3jyPyhTv/rIRuYm9RNbkWg0gqk7JpkBv9Lw5UHfvCPapR/N
   heErezgA7Ll/Qfelirk8VMM5HomkonQJ89s6Bu8eNmbZ0K1FyyE1n0X27
   DmnEoLRfyZaQv+MFgJtn4SGeqLvr+L7WjV2IQwwikWogdaj4x3U7pO4G5
   D4k3TTuQPS8J4FDC/yu6SjpWXx+Dbs/kPggiZFe3uPlmcA0qZq886mNMh
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="334475115"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="334475115"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 07:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="549050137"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 25 May 2022 07:48:33 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Vineet Gupta <vgupta@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 0/2] bitops: __fls adjustments
Date: Wed, 25 May 2022 16:48:42 +0200
Message-Id: <20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_074838_812732_7B3C0982 
X-CRM114-Status: UNSURE (   8.27  )
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

QXBwYXJlbnRseSBvbiBmZXcgYXJjaGl0ZWN0dXJlcyBfX2ZscyBpcyBkZWZpbmVkIGluY29ycmVj
dGx5LiBGaXggdGhpcwpieSBhZGp1c3RpbmcgZGVjbGFyYXRpb25zIHRvIGFzbS1nZW5lcmljIG9u
ZXMuCgpBcyBmYXIgYXMgSSBjYW4gdGVsbCB0aGVyZSBzaG91bGQgYmUgbm8gZnVuY3Rpb25hbCBj
aGFuZ2VzLCBidXQgSSBkb24ndApoYXZlIGRldmljZXMgdG8gdGVzdCBpdCwgc28gaXQgd2FzIG9u
bHkgY29tcGlsZSB0ZXN0ZWQuCgpBbWFkZXVzeiBTxYJhd2nFhHNraSAoMik6CiAgQVJDOiBiaXRv
cHM6IENoYW5nZSBfX2ZscyB0byByZXR1cm4gdW5zaWduZWQgbG9uZwogIG02OGs6IGJpdG9wczog
Q2hhbmdlIF9fZmxzIHRvIHJldHVybiBhbmQgYWNjZXB0IHVuc2lnbmVkIGxvbmcKCiBhcmNoL2Fy
Yy9pbmNsdWRlL2FzbS9iaXRvcHMuaCAgfCAyICstCiBhcmNoL202OGsvaW5jbHVkZS9hc20vYml0
b3BzLmggfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXNucHMtYXJjCg==
