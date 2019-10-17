Return-Path: <SRS0=62Of=YK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DF6FA372A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Oct 2019 21:36:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6209521D7A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Oct 2019 21:36:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mRKEsJsV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6209521D7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sf-tec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wHNChIFcTDdOWgxHyR9PZooe3QGSXSYc7qQiAHMqroI=; b=mRKEsJsVz4lmp4w8MRBSjUHTf
	EExHsNWCCs6kjkqUZ5DkjJ1vWfMRDyElReWiL6cj5izX0uZ7D71Oc3IgOA9Rs0M6z5+HVflskH+QZ
	xansk2VzVrHrtrTmAe9PCjN5llb7gsMqtDypxMb6AiGvf328A2+/f4KxyOELNhX6nGbPeoNHobar5
	frxEBajlmdGU0ilLg49Vp7aZuupYWhke2FdkEWZsjxmWK/1dRHvCYx8Ue1w7ICiVqqg9j7EuLCh2H
	4zjKIgr13+3MKLzhb2UNU3qItHgOO08HPEIKxv/lNgmiGBdtJnfsQ9uFABD7KHPRSdnEZlLId+IZ9
	DEjCjTicQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLDRl-0005T7-T7; Thu, 17 Oct 2019 21:36:37 +0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLDRL-00054r-DP
 for linux-snps-arc@lists.infradead.org; Thu, 17 Oct 2019 21:36:14 +0000
Received: (qmail 27079 invoked from network); 17 Oct 2019 21:31:57 -0000
Received: from dslb-088-070-126-123.088.070.pools.vodafone-ip.de
 ([::ffff:88.70.126.123]:55060 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
 by mail.sf-mail.de (Qsmtpd 0.36dev) with (DHE-RSA-AES256-GCM-SHA384 encrypted)
 ESMTPSA for <hch@lst.de>; Thu, 17 Oct 2019 23:31:57 +0200
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/21] parisc: remove __ioremap
Date: Thu, 17 Oct 2019 23:35:42 +0200
Message-ID: <1650819.dOKmve5HLd@daneel.sf-tec.de>
In-Reply-To: <20191017174554.29840-8-hch@lst.de>
References: <20191017174554.29840-1-hch@lst.de>
 <20191017174554.29840-8-hch@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_143611_777937_04C46AEB 
X-CRM114-Status: UNSURE (   4.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: multipart/mixed; boundary="===============9184885587891592515=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============9184885587891592515==
Content-Type: multipart/signed; boundary="nextPart3002460.JnYtLPdinj"; micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart3002460.JnYtLPdinj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Christoph Hellwig wrote:
> __ioremap is always called with the _PAGE_NO_CACHE, so fold the whole
> thing and rename it to ioremap.  This allows allows to remove the
                                        ^^^^^^^^^^^^^
> special EISA quirk to force _PAGE_NO_CACHE.

Eike
--nextPart3002460.JnYtLPdinj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCXajergAKCRBcpIk+abn8
TkOlAJ46117xxLoFzZCiYYebEyVSrw/31gCeMRBoULeYp+iYijM534mn8tCGYHM=
=d3J8
-----END PGP SIGNATURE-----

--nextPart3002460.JnYtLPdinj--





--===============9184885587891592515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============9184885587891592515==--




