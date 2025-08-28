Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F07CA0EED
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Aug 2025 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ALV28Cug6fiC5HkjvWZ3XU83uPlTyY7wM0OkZd8jKuw=; b=LfmDAHqv4qQI8A
	azAc/6/lV9je5jThjYLfwIROIVBVKrErJOJEglhIBMJxfvXdeCBovRhRPGInw94jM0YGJODQcQxdw
	1enijZy7Lg6gFBmUcj9wFTPk83J6BAGxyT6KQ9Yf67BDRqH8mdxmQVgbC2175M4LaAJFTYzmG7vEX
	hkq+YhtEEgYDtoYDeAyrsy9ZXdig0g1LHfq7pb1HrPxXYeZStSuyChAzXaxP6v5Wk4ivqfLxVyqXd
	MSxTa/tbHn43I6Py9eZjJJTJf0ycEvYAGlX1e0yQXP/QMjDq3iHdRXDqQgQ9J8J7Znud1tR4yXyo0
	2fpZTpHCmW1m2CZp3kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYzM-00000000yhB-2Mk4;
	Thu, 28 Aug 2025 09:32:12 +0000
Received: from mail.dealista.pl ([94.177.238.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXqB-00000000lid-3cEM
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Aug 2025 08:18:41 +0000
Received: by mail.dealista.pl (Postfix, from userid 1002)
	id 868F087D42; Thu, 28 Aug 2025 10:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dealista.pl; s=mail;
	t=1756368796; bh=qcP5dcos5mZ8jV4yTLFLEHzXO5jTY/q0Nu8iMRmEEWE=;
	h=Date:From:To:Subject:From;
	b=SNGy4ttJ03PrZrDnZ0OZdEAHuqi1+dL6FS8vpDyT4rtHUC/rPT/h9gwxkxX1cjgyK
	 s4Vl9xWD5DsLd9DRQDrd0nVBbeCoD7/3rRtm4nbftIY7AmYSo2JTPJQqXa12RuvcfK
	 iotwLOao38LPucHTxK2GPq8CyWNitcySznT+HasQp/QPsarI+tOeQXhpo0cGjzIGw/
	 QY+7ow5jt7KO2VHWw2ooqHfj5+zzvsw4rO6E0W03PaeJs6UYKySsmHvMT8zCYmWDT+
	 Pde1qJqDxeChAGczJWcui6B0UGRUZ72dNzzJlTA70t3WNPcuqu4RYS5AUOflQ4kuV/
	 /mTtEY1037ZLA==
Received: by mail.dealista.pl for <linux-snps-arc@lists.infradead.org>; Thu, 28 Aug 2025 08:10:27 GMT
Message-ID: <20250828084501-0.1.bi.1bna0.0.ebjon53sfm@dealista.pl>
Date: Thu, 28 Aug 2025 08:10:27 GMT
From: "Robert Kozielski" <robert.kozielski@dealista.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Pozycjonowanie - informacja
X-Mailer: mail.dealista.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_011840_030038_19F0158D 
X-CRM114-Status: UNSURE (  -0.07  )
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

RHppZcWEIGRvYnJ5LCAKCmpha2nFmyBjemFzIHRlbXUgemfFgm9zacWCYSBzacSZIGRvIG5hcyBm
aXJtYSwga3TDs3JlaiBzdHJvbmEgaW50ZXJuZXRvd2EgbmllIHBvenljam9ub3dhxYJhIHNpxJkg
d3lzb2tvIHcgd3lzenVraXdhcmNlIEdvb2dsZS4gCgpOYSBwb2RzdGF3aWUgd3lrb25hbmVnbyBw
cnpleiBuYXMgYXVkeXR1IFNFTyB6b3B0eW1hbGl6b3dhbGnFm215IHRyZcWbY2kgbmEgc3Ryb25p
ZSBwb2Qga8SFdGVtIHdjemXFm25pZWogb3ByYWNvd2FueWNoIHPFgsOzdyBrbHVjem93eWNoLiBO
YXN6IHdld27EmXRyem55IHN5c3RlbSBjb2R6aWVubmllIGFuYWxpenVqZSBwcmF3aWTFgm93ZSBk
emlhxYJhbmllIHdpdHJ5bnkuICBEemnEmWtpIGluZHl3aWR1YWxuZWogc3RyYXRlZ2lpLCBmaXJt
YSB6ZG9ieXdhIGNvcmF6IHdpxJljZWogS2xpZW50w7N3LiAgCgpDenkgY2hjaWVsaWJ5IFBhxYRz
dHdvIHp3acSZa3N6ecSHIGxpY3pixJkgb3PDs2Igb2R3aWVkemFqxIVjeWNoIHN0cm9uxJkgaW50
ZXJuZXRvd8SFIGZpcm15PyAKCk3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgb2ZlcnTEmT8gCgoKUG96
ZHJhd2lhbQpSb2JlcnQgS296aWVsc2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
