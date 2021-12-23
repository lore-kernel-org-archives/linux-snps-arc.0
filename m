Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B40C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Dec 2021 08:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bkY8Z4mEzDCqBydaHVWDP8dRxexxl8gADjd7+n9Q+RQ=; b=fsFTrk/KpWKAe2
	0gun/8WWBXAhumT0eB+iRECtL5k2bGZrLauCdQCkaTenxHDntWR/ne6pB0NgNqALtw9H+wk6TsV9a
	dxQeVAosGP1xw3lOt48U3loagVhDFHwLSQkjMZtznytAbF0TyxEE+FRhScHuJz6eRgn7SJUZALfv5
	1opesbQSClgU7hGlGxFwhCKRRB58ypInamqF5QRGdKWu4MH63zXkPifNvojFzCxK3au5AdQCzES4G
	uH5l0Hz3llLvhYmkfcjgZxpUswmHlmRzK46RofF9sTOAMfuyH+TOENXCSqYedr7qKWv41RhUHCbzM
	1JOceN02m/jeXrSXJOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0JV0-00CG5Z-MJ; Thu, 23 Dec 2021 08:30:54 +0000
Received: from mail.betterbiz.pl ([45.86.209.138])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0IsA-00C1Xe-J2
 for linux-snps-arc@lists.infradead.org; Thu, 23 Dec 2021 07:50:47 +0000
Received: by mail.betterbiz.pl (Postfix, from userid 1001)
 id 43853832B5; Thu, 23 Dec 2021 02:45:44 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=betterbiz.pl; s=mail;
 t=1640245846; bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=NVHYvr/mG66suQT8E6WYmxasuMeZ/ui2+5ycjKOmaRgeNiFStJNtDIVW5uhijMTTI
 E8whaw4pYV+yptgxXrF4qCI8JWFM3AMXRHM7Heo8Y2o0Vd30SjWazn1hKlHf5o8P0F
 6GqlQJnNdY+Akitr7m5ZQCY5pDs5zB9M/PX+/oD3Pjzbxh939Wz4QNy8ACrxW65lE5
 n7v27Hd6VsVHkbivInC2TbqYmxLB0+PUynOJphqIhrmyHKF4J5zzokPGsEDdR0wpz/
 b0e6SNwMLjk7s+phY3UqrDEnua+3axp9Rx2K177REbAC13IBDneFMIm1coLPCKM8cP
 7Nf/ljevCGKzQ==
Received: by mail.betterbiz.pl for <linux-snps-arc@lists.infradead.org>;
 Thu, 23 Dec 2021 07:45:38 GMT
Message-ID: <20211223024500-0.1.f.zcc.0.h85dd493km@betterbiz.pl>
Date: Thu, 23 Dec 2021 07:45:38 GMT
From: "Jakub Daroch" <jakub.daroch@betterbiz.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.betterbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_235046_683034_149C4D10 
X-CRM114-Status: UNSURE (   0.37  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkpha3ViIERhcm9j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
