Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9581EC6377D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:59:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63ABC6128C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63ABC6128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNSBgYDuMNd+hk19ruv4GwndzpudA+xBCcVMJgh+WSI=; b=hm+hIx0kr7S6s4
	ISBu7qT2kdP5V0q2lVpyubJvxs+aZQMw87Lxjlfohm5IRpkwOqVl//eLiYLIhncYVTVg/H4s9CDxB
	Hl94Zd9nn5x99TLROJFmg4gpOj3cDskD5j6R8YXm6MLMmDjzQhBs/X8d8EFzmSSR4MZYPBVx73lET
	4OHGTgATeDH1Rj0hqgbCkuduhiLPBYNJcEqm8xcC855lcj9y0cpVMMe2h3maw/CtsecT2IcxP9s9R
	Yj+5Et+zsOl44DpXmtmijiNjmd6/EbZwDLLF60p23u+KLgMIAS+O3Jfgzh90y9Myj9SpHhYARdLC2
	o1MDghWDJG0NU/Xl9rHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ZEO-001oCr-Ny; Thu, 22 Jul 2021 13:59:20 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ZEK-001o7Z-RX; Thu, 22 Jul 2021 13:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=NNcV9llPrdlEYkKe7+LBF3xFYLJpZdKYVGYe+A5Q+4I=; 
 t=1626962353; x=1628171953; b=CoBPtezUtaTFlo22o4l7RUyLTIHqX+MIUADVR8+u40lnCkz
 PO9prNtYtnrktF2ZVB1ClRsasl9ujLzGmM56nCWCS8T8kZbYXwuIIcLZE4AJ6cNiIL06DH8YCdaLn
 tLTppHT4g1MQyRma6j6D6xZnM2h/DzeCybC+23+GC7lJTV/dRnFOwM11KEQRD49HAXXV23x41JS3E
 omBMG0hjW8el4IeiDokBKcN/HGK2yZaEZwi7SdUou2MOaz3OtVAg+RN+mC4V8yf96ZfIa/gHMMyYs
 ZIsmfJ/ItFxf5BRhkPR/o/4d5/NC3NdbAVjGipgrHKw8YZJpeXpPj6C1tlLEsf7Q==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m6ZAW-0007sj-NN; Thu, 22 Jul 2021 15:57:59 +0200
Message-ID: <29adc1c164805e355b37d1d4668ebda9fb7fa872.camel@sipsolutions.net>
Subject: Re: [PATCH v3 9/9] asm-generic: reverse GENERIC_{STRNCPY_FROM,
 STRNLEN}_USER symbols
From: Johannes Berg <johannes@sipsolutions.net>
To: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Brian Cain
 <bcain@codeaurora.org>, Chris Zankel <chris@zankel.net>, Christian
 Borntraeger <borntraeger@de.ibm.com>,  Christoph Hellwig <hch@lst.de>, Guo
 Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,  Helge Deller
 <deller@gmx.de>, Jeff Dike <jdike@addtoit.com>, Linus Walleij
 <linus.walleij@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>, Michal Simek
 <monstr@monstr.eu>, Richard Weinberger <richard@nod.at>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Vasily Gorbik
 <gor@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>,  linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,  linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org,  linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,  linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org,  uclinux-h8-devel@lists.sourceforge.jp
Date: Thu, 22 Jul 2021 15:57:56 +0200
In-Reply-To: <20210722124814.778059-10-arnd@kernel.org>
References: <20210722124814.778059-1-arnd@kernel.org>
 <20210722124814.778059-10-arnd@kernel.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_065916_911942_B357A918 
X-CRM114-Status: GOOD (  10.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

> 
> The remaining architectures at the moment are: ia64, mips, parisc,
> s390, um and xtensa. We should probably convert these as well, but

I'm not sure it makes sense to convert um, the implementation uses
strncpy(), and that should use the libc implementation, which is tuned
for the actual hardware that the binary is running on, so performance
wise that might be better.

OTOH, maybe this is all in the noise given the huge syscall overhead in
um, so maybe unifying it would make more sense.

johannes


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
