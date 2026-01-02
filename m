Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADADEEB57A
	for <linux-snps-arc@archiver.kernel.org>; Fri,  2 Jan 2026 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o9qibvH9JIaAIkX+5HTv3faDfTvBgnjex3iAl+SB0JQ=; b=sFAZUHdcQKkdDS
	u5x6k2rA1sONpTxzd/u5A/hdsbAUTPypyBHzIDbv8x9VtAmW90Ce28PcprftbUYNiaHrsPjmUTYiJ
	5ek7FotqKdAoG5q4w6bWzwIZWXhcasiYFUlnYT0oNMZk4vEfC1ujY6kiXwf3TOA9TqlZo5JZ/qqxU
	N+u7SkOMcyjPRKmeN6EIOvrkln8ToTp9uGO41IvWVNC2OL5pu/70T4OzgdeY6BBka7lNQIVTw4R6M
	hmZQyv6wj61CznCXSSbRhimei2n1hQoR/jSp/pvHO8JHHAiE5sRiZj6nu6Jr1MsDxlWQ8mmYrSp0N
	Z1LTaPJY9ob0oGeRj/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbHD-000000080va-0k4m;
	Fri, 02 Jan 2026 09:16:55 +0000
Received: from mail.fontri.pl ([51.195.90.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbH9-000000080vD-3caS
	for linux-snps-arc@lists.infradead.org;
	Fri, 02 Jan 2026 09:16:53 +0000
Received: by mail.fontri.pl (Postfix, from userid 1002)
	id 1F034ADE5F; Fri,  2 Jan 2026 10:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fontri.pl; s=mail;
	t=1767345332; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=;
	h=Date:From:To:Subject:From;
	b=jxk0PdYcxiLURIw/1Osd8GcNDqAWzAy4Kw9xa45BtX36NJmFzvAt+2wDZKLYoxPLm
	 ojDCFkX69m9se1dZrADgmtH+0EfPJAjQssRAIGB3I6x/OYKeQyYjWQjWKvO8zlX0SX
	 trd+BmWehMCZwaZrnckWoXo+leUMgZQpUGowoSDVCCs5CUaBz+DU5QqR660ZTO5tS+
	 pSAvDB4kMp6I6aeVB/OMYgsMH0dB+rO5Y2Qj4RenlGYWkr4oxWH8fyi+PBgRJWIuof
	 +7jojDvbKTlgo7OE9VnyQ4phVZBu02qzdmHpMg3P4AmyzXQetVIllTaNCWSZnZa8SI
	 5Fx/Zo2WCt09g==
Received: by mail.fontri.pl for <linux-snps-arc@lists.infradead.org>; Fri,  2 Jan 2026 09:15:21 GMT
Message-ID: <20260102084500-0.1.t9.6hvmf.0.p1irde72rl@fontri.pl>
Date: Fri,  2 Jan 2026 09:15:21 GMT
From: =?UTF-8?Q?"=C5=BBaneta_K=C4=99dzierska"?= <zaneta.kedzierska@fontri.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Odbi=C3=B3r_w_paczkomacie_?=
X-Mailer: mail.fontri.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_011652_400550_6CA9C969 
X-CRM114-Status: UNSURE (   1.76  )
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

RHppZcWEIGRvYnJ5LAoKamFrbyBsaWRlciB3IHVzxYJ1Z2FjaCBrdXJpZXJza2ljaCB3IFBvbHNj
ZSBwcnp5Z290b3dhbGnFm215IGVsYXN0eWN6bmUgcm96d2nEhXphbmllIGRsYSBwcnplZHNpxJli
aW9yY8Ozdy4KClN0d29yenlsacWbbXkgYWJvbmFtZW50IMWCxIVjesSFY3kgZG9zdGF3eSBkbyBQ
YWN6a29tYXQgMjQvNyBvcmF6IG9ic8WCdWfEmSBrdXJpZXJza8SFIC0gamVkZW4gZG9zdGF3Y2Es
IGplZG5hIGZha3R1cmEgaSBwcnpld2lkeXdhbG5lLCBzdGHFgmUga29zenR5LiAKCkN6eSBtb2fE
mSBwcnplZHN0YXdpxIcsIGNvIG1vxbxlbXkgemFwcm9wb25vd2HEhyB3emdsxJlkZW0gUGHFhHN0
d2EgcG90cnplYj8KCgpQb3pkcmF3aWFtCsW7YW5ldGEgS8SZZHppZXJza2EKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxp
bmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
