Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580F0CCD1BF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Oct 2025 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dpLctQ1PmXBxV4pr6Ni/MACAWkMiPU+/0j5nnUkGrGU=; b=ViKdYc9xRc8f/B
	9rAVyCyYTk5WTf1Yh4IMYhjUHN2gZXym+LCsprV2k4gAU4prIIL5V5uhoF45waYlJpZaUJzKZ/rJY
	1+veEMxEcYRtJmsKzbQsNEQN/J0K2Ma7f0D9J91orEgLpO4Zpp6QDLvU54U0iOjjwfO1KeAW63jxR
	iRGSYE/PXfPmP+PSGuRlkni56Ssr0UfLuJ5U1XDCPpzoRo8tC2Sg6gW03gY7AIGTrK83SirFd5uCB
	10dRuIOh2/ZFX2SBucnEe3fD12rqoJ44MOPMZfMsS+jwKEbkwkGioVybmgmbDrSxgB3oCe5c6Azoy
	Hy6cyOuHILymHG+c3ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfVv-0000000FaJf-3Ftu;
	Tue, 28 Oct 2025 08:57:11 +0000
Received: from mail.scalix.pl ([57.129.66.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfVt-0000000FaIl-38XH
	for linux-snps-arc@lists.infradead.org;
	Tue, 28 Oct 2025 08:57:11 +0000
Authentication-Results: scalix.pl; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=scalix.pl; s=default; a=rsa-sha256; cv=none; t=1761641813;
	b=D+dhE3oEbEiUUstx4hExpRSO3H3/VX/K9iPMtle/kAgLS1G8Y4apxd/AC/13lT4BT3Db
	 esBqj0D98XTdjAuT2mnNc6/nO+0QWYuHAawImy+/CbyBhS38kSCDA514WKhqzAEexlEXt
	 4+Yu6IEMsig5xKt8HjJrCOw9zvxCsMFwePim9Ck80XSe0EpKZeNmWQCb1FvU5lSerLjMR
	 oOplv6wGJnWpu5QRaNjTtCbnbQNo3Pk4x3dsTA/dZJLftmDaohIpS2DUUwF/UEcsaBk+Y
	 1lDz6jidD9JHeUqJMXzp86VIUA0swATquGd40VyZlh/al6e30DiDiwiTkLZxbY8Lnvg==
ARC-Message-Signature: i=1; d=scalix.pl; s=default; a=rsa-sha256;
	c=relaxed/simple; t=1761641813;
	h=Message-ID:Date:From:Subject:From;
	bh=MVQWP06yryCdDLSQw+rn/+YlUj3kTbyf8FTAApZyy7o=;
	b=ieSqZvEutJvbnhsR3g3LdOmSkpK4U2Vxjok2+6Vz0oeE91KtCCEOp2n7u1EA43JqlHbd
	 qfzpQPW7ygjVAO9otSnv+I5anPGrBtrI9YRQ6g/X4Jm+CYqqhP3dvxBolNzUlMNHnworU
	 2t4K1VG1+JAp48FWWA8rf9RbviQrk15TWxAMXziwLR6XDQ81+eXv8SOC57wcmUTJzHJT9
	 E90+eXMJ2gMkSE8Jjbmi8zj3sboC8vc++ZR9sUaGDf5cHPkKH1BPWdHEM3afEmTbsaxIZ
	 d+P4fDGu2iASOqhr8EOl4bGdZd4ZxeJmSYKYyTAU7LKrN0O8iFHyGff4DGioYEXe34Q==
ARC-Authentication-Results: i=1; scalix.pl; arc=none smtp.remote-ip=127.0.0.1
Received: by mail.scalix.pl (Postfix, from userid 1002)
	id 37FA4249A4; Tue, 28 Oct 2025 08:56:26 +0000 (UTC)
Received: by mail.scalix.pl for <linux-snps-arc@lists.infradead.org>; Tue, 28 Oct 2025 08:56:07 GMT
Message-ID: <20251028074501-0.1.3y.2jy0.0.qyi3doau5z@scalix.pl>
Date: Tue, 28 Oct 2025 08:56:07 GMT
From: =?UTF-8?Q?"Norbert_Paku=C5=82a"?= <norbert.pakula@scalix.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.scalix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_015709_941269_99BE5A10 
X-CRM114-Status: UNSURE (   0.61  )
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

RHppZcWEIGRvYnJ5LAoKZmlybXkgdGFraWUgamFrIFBhxYRzdHdhIGtvcnp5c3RhasSFIHogbm93
b2N6ZXNuZWdvIHJvendpxIV6YW5pYSBkbyBtb25pdG9yb3dhbmlhIHcgY3phc2llIHJ6ZWN6eXdp
c3R5bSBwb3p5Y2ppIGZpcm1vd3ljaCBzYW1vY2hvZMOzdyBvcmF6IGljaCB3c2thxbpuaWvDs3cg
ZWtzcGxvYXRhY3lqbnljaCwgbS5pbi4gcHJ6ZWJpZWcgaSBzcGFsYW5pZS4gCgpKdcW8IHcga3LD
s3RraW0gY3phc2llIG9kIHdkcm/FvGVuaWEgb2JzZXJ3dWrEhSBuYXdldCAyMCUgb3N6Y3rEmWRu
b8WbY2kgendpxIV6YW5lIHogdcW8eXRrb3dhbmllbSBhdXQgaSBzcHJhd25pZWpzesSFIHJlYWxp
emFjasSFIGRvc3Rhdy4KCk1vZ8SZIG9wb3dpZWR6aWXEhywgamFrIHRha2llIHJvendpxIV6YW5p
ZSBzcHJhd2R6aSBzacSZIHcgcHJ6eXBhZGt1IFBhxYRzdHdhIGR6aWHFgmFsbm/Fm2NpPwoKClBv
emRyYXdpYW0KTm9yYmVydCBQYWt1xYJhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
