Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C93FC433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 May 2022 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JwNWvOR8S2xfTgCphJT7pGWAKL4FIcLhH57y/SAFDqw=; b=afVKV2G92F04C1
	Qqulnh1IGVguJjPGyQSx/dPL2COk4Xfa6JZuTeeG2+qi/0UcKiTkoMjnYUiIqNWu/XPl9xfuT34ov
	9CDiglISwHd7nBJVOEGDmb+pI8DvItbd4kcwHRXsw1ywoABkpXL6pbvjgCxfNFT5VOzDMEiIA8Oml
	RcLSBeHEU71/Lo+xA9+XDCJcNFGO0aJlMeAqcBUvPl9YM5d00Y27Ohggb9GpGjafNm0sw5YEA5gxm
	Pjn1xelPE8XNO++4NRX6K+moyXl6VsY8gfdGsqQEXaulhLIKghlzTtiyrem4GVKat+MqnRG4JMiv3
	nvGxurV/zFjynGcpcJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuYXA-00HXt8-VY; Fri, 27 May 2022 11:53:37 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuYX7-00HXsS-NF
	for linux-snps-arc@lists.infradead.org; Fri, 27 May 2022 11:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653652413; x=1685188413;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PLSGSElS+sb7LwGXdt/dcalTmumgey26T1nkiNfjmgo=;
  b=HXZl34fb35ca7l+fR027e1dv6/baoKuyQUkYbsD/LHXFLV4tyXMwnYjS
   tVX88kfQqsv6gYj9MLSCPCXnPvVInva2d6lMiA+zB1HremBJ7Yc6XttCP
   CzCwy6uNtlkCFu3QlPYymdDd9kFioxbyMKoxoCQXErpgsTw6h8u11Dvz1
   FHYGluYJ50R8OMlXRehuzjPkI8hI00EQDtWg3A502FMkYZbflIYsjCWkz
   lBv0VnzHSmldHo2hL8W3dKiKaIOPND2JfoWA2bzWkn2QmP3hWhURaZRaq
   hECPH8zcfP8d3gSjdlrHG5Upw1LjDDlLVNF6hv2Ns5z5kRuU+kRwz3L9J
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="360848036"
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="360848036"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 04:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="746889566"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2022 04:53:30 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Vineet Gupta <vgupta@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"David S . Miller" <davem@davemloft.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-snps-arc@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 0/3] bitops: __fls adjustments
Date: Fri, 27 May 2022 13:53:42 +0200
Message-Id: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_045333_806152_D8B7450E 
X-CRM114-Status: UNSURE (   7.97  )
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
bHkgY29tcGlsZSB0ZXN0ZWQuCgpDaGFuZ2VzIGluIHYyOgogIC0gY2hhbmdlIGJvdGggZGVjbGFy
YXRpb25zIGluIEFSQyBoZWFkZXIgKHBvaW50ZWQgYnkgR3VlbnRlciBSb2VjaykKICAtIGFsc28g
Y2hhbmdlIHNwYXJjNjQgZGVjbGFyYXRpb24gKHBvaW50ZWQgYnkgR3VlbnRlciBSb2VjaykKCkFt
YWRldXN6IFPFgmF3acWEc2tpICgzKToKICBBUkM6IGJpdG9wczogQ2hhbmdlIF9fZmxzIHRvIHJl
dHVybiB1bnNpZ25lZCBsb25nCiAgbTY4azogYml0b3BzOiBDaGFuZ2UgX19mbHMgdG8gcmV0dXJu
IGFuZCBhY2NlcHQgdW5zaWduZWQgbG9uZwogIHNwYXJjNjQ6IGJpdG9wczogQ2hhbmdlIF9fZmxz
IHRvIHJldHVybiB1bnNpZ25lZCBsb25nCgogYXJjaC9hcmMvaW5jbHVkZS9hc20vYml0b3BzLmgg
ICAgICB8IDQgKystLQogYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2JpdG9wcy5oICAgICB8IDIgKy0K
IGFyY2gvc3BhcmMvaW5jbHVkZS9hc20vYml0b3BzXzY0LmggfCAyICstCiAzIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
