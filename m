Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33777C433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Oct 2022 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/+ZrECjGIBs0qsbscufG73Q3Gon5DkYc0LOYnNHq4o=; b=dTWUkFjfBbYI1v
	3A6fx2D/OVzOx6EJ+9IteUAW9ukOKS67MrqtfzGjjyF6lDLJatNV4zopkHpLDNLJ4tsbWS6/FVl1Y
	PaVCots/3Ky8zUOWC6mbSP4H3x9yRj7IynNuQd9AnlG4zSsTUrhvlEBV2yWcp0M3iUj74GW5eDW8L
	hAF1l/k5x3gYCTHpBhb2sINNK9hUEomQW7OhB7mgwrE4w4pHSucx2vIMc86D/ae5cdRgZlRqpl7q4
	xfNj+OfvlwAQTYhJq51c18P4dCTOHAqQOgk98r/OyoSaTTi2BwvgNuKWycIidstZerYmSKDN32x9A
	DJ9qyYggzftmTJqw7QFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol58d-00HFy2-2b; Wed, 19 Oct 2022 09:13:23 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol58Y-00HFuu-HO
	for linux-snps-arc@lists.infradead.org; Wed, 19 Oct 2022 09:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666170798; x=1697706798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xOgNWaYaiSGZT+djjVEy4FQy1WDnM3aevb7RyoGHh1o=;
  b=d+NMj9XYcKDlb5r6t8JJRx7mPLU7miQWOvPRCkXtBzz/Yb4mRJrhOZ/l
   lvwg+fCTfWurl8JgCeCeAJXQ056ytoCd4XJND3VpIPsp/Ab5fIA6bv4ib
   1v/Za5PYHqVpesmRaDt4r31r7XN+FITRygTWQcm4/hfi9ewB/Upjg6PuF
   ebebz1KSCRXrJ0EswrwOfM+Z9KqLhWaUOw8Q9OyGwbqcXI1/RkmqYEYuI
   mqczp5liKQnkbR8L5p0GSfVosMJ45Zevq0h/hde7GwDvEWp0mI/yj39MT
   kFKzrfDpJuJvuPlQFwYa1QZT9dNbdZcW4LHqPnumuZmXYh68uvafuFEI3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="392656082"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="392656082"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 02:12:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="734118628"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="734118628"
Received: from sponnura-mobl1.amr.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.214.35])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 02:12:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 10/44] serial: arc: Use uart_xmit_advance()
Date: Wed, 19 Oct 2022 12:11:17 +0300
Message-Id: <20221019091151.6692-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221019091151.6692-1-ilpo.jarvinen@linux.intel.com>
References: <20221019091151.6692-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_021318_616212_2AB2EAED 
X-CRM114-Status: GOOD (  10.16  )
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

VGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIG5ldyB1YXJ0X3htaXRfYWR2YW5jZSgpIGhlbHBlci4KClNp
Z25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvYXJjX3VhcnQuYyB8IDMgKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy90dHkvc2VyaWFsL2FyY191YXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvYXJjX3VhcnQuYwpp
bmRleCAyYTY1ZWEyNjYwZTEuLjc0OGU4YjFjZjRmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkv
c2VyaWFsL2FyY191YXJ0LmMKKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL2FyY191YXJ0LmMKQEAg
LTE2Niw4ICsxNjYsNyBAQCBzdGF0aWMgdm9pZCBhcmNfc2VyaWFsX3R4X2NoYXJzKHN0cnVjdCB1
YXJ0X3BvcnQgKnBvcnQpCiAJCXNlbnQgPSAxOwogCX0gZWxzZSBpZiAoIXVhcnRfY2lyY19lbXB0
eSh4bWl0KSkgewogCQljaCA9IHhtaXQtPmJ1Zlt4bWl0LT50YWlsXTsKLQkJeG1pdC0+dGFpbCA9
ICh4bWl0LT50YWlsICsgMSkgJiAoVUFSVF9YTUlUX1NJWkUgLSAxKTsKLQkJcG9ydC0+aWNvdW50
LnR4Kys7CisJCXVhcnRfeG1pdF9hZHZhbmNlKHBvcnQsIDEpOwogCQl3aGlsZSAoIShVQVJUX0dF
VF9TVEFUVVMocG9ydCkgJiBUWEVNUFRZKSkKIAkJCWNwdV9yZWxheCgpOwogCQlVQVJUX1NFVF9E
QVRBKHBvcnQsIGNoKTsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBz
LWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
