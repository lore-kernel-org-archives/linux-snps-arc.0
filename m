Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A404CCD342F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Sep 2024 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DFqAt1s0o6FWWJQoC9q+Expf3+P7EOthfIomjBZstlQ=; b=b6aiaRmQQ03nac
	iUGXcamFmXqKROoY+FBQJoDs0y2hiI/ilPmfywFFKwNbydojE40yAQddb2d9R23LFylWLcy3XQvQ3
	NYXiDShxpmVY7fWVRoxo41IXfRxdVksHFZ5IyYX3DXRb7e62nIszRS/DGuP7oDHCE6mF+M39b+y4q
	v+Wn9XRMK3o3RXQ5PmzfMRyRoQZsDlqKuhU7unI12JW4U1Zre2OJ3GVCr8t82fmrD4lpEYofEEo2I
	42w78sqGsVOKfBsL1jpcrDm0u080v6AZJH0hcOlhPvIornwlUflaAIMX4tTkl/otRJPkt6DS69gmA
	uDrpavTdPxvqVXFMHyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOVF-0000000GorF-19a7;
	Tue, 03 Sep 2024 08:03:05 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOVA-0000000GooP-3hIh
	for linux-snps-arc@lists.infradead.org;
	Tue, 03 Sep 2024 08:03:02 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 4FA9225528; Tue,  3 Sep 2024 10:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1725350470;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=1phy2E60p8ocp9SBBECtvi/t+d6AymgAALcKIitI5xxqxnqIFQ7wTLQCaSV2worSh
	 98afatnaCq8LSoz8UX3176M5f73T/jSTEgka5v5W5UydLNHGrwBfxKrsM4mmrKt88S
	 u4RVc8XBWjg0ASocZnzbJzfs9QGfxxsYnEIHoZ+85VvPkscSVa9ojrfBDLurFy/NiW
	 7q+GPz6+KZwQvj4rOuWmqJ/+YYrDIDu9Edel9TjDn3a6YaPqrcv8NYbVnZL8IfoDoT
	 e0estgmvNwF+pj+bPHPz8r9GSukCMQvZ4xla5T6AeJCZkQbgwjowybmcEIfkxJXcg3
	 mHnrv/ReCQNhA==
Received: by mail.synergyflux.pl for <linux-snps-arc@lists.infradead.org>; Tue,  3 Sep 2024 08:00:42 GMT
Message-ID: <20240903084500-0.1.dp.3gd32.0.5rkspblb05@synergyflux.pl>
Date: Tue,  3 Sep 2024 08:00:42 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_010301_152951_F76C215B 
X-CRM114-Status: UNSURE (   0.67  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KCgpQb3pkcmF3aWFtCktvbnJh
ZCBaaWVsacWEc2tpIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zbnBzLWFyYwo=
