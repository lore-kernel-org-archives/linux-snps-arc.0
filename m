Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C142BC27C77
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Jun 2024 08:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=airlPYMiW2YTTjA6iamchaIIjwbbSnKerEq//70bIvg=; b=QL8FssAg+Mlcgg
	EtkLOlThak/ZSPVycly5skfF230a51tvqrwh0+IOV5djIe1kDKO0pNwtEa4uF0eFJdGPUZ/CvcNDH
	pAS8BaRLXPu21FSUe2PJtXKwpnS+mkkb8GIbEBjMnPdSqBacHxDmTsybmiZ5jqwHp22TAzpZlBySy
	RtOUF5pyOcT9l0/5pVJZ60Sc3r5hS+Y8OrzTwv6QwrrYFKcUS73Tr9YD+T7KlHleIKZnurqxu3VZQ
	QpY+TqGHtSten6bMdGoJWTCVflUSzn3FymP37WnA9yHulOIo8Vn7OtOGCaNmCGDVsSjCDrmK3odkQ
	cF5Jh8P0kaHaG4ugWwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7Sc-00000009o6Q-3ZY0;
	Mon, 17 Jun 2024 08:11:31 +0000
Received: from mail.salesoptimize.pl ([162.19.245.89])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7SZ-00000009o3W-2Eig
	for linux-snps-arc@lists.infradead.org;
	Mon, 17 Jun 2024 08:11:29 +0000
Received: by mail.salesoptimize.pl (Postfix, from userid 1002)
	id EFAC146E5F; Mon, 17 Jun 2024 10:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=salesoptimize.pl;
	s=mail; t=1718611885;
	bh=u+y/L6S5UL+8vZAxwL74vV1B6m8M84m9zI1fQPT/Bfs=;
	h=Date:From:To:Subject:From;
	b=mSHuy7xM/1D1rtD+oZUFAiJVqS8XlfDi9WMQ0y0ym3L85IClM222nvfzJJ+pw5SiT
	 YAevZDvW4dd16HSD39nIBR42OFdLP150CFuc/QHHoYsEodXzDQnJ53HEZZMNEmc8jS
	 hJu9NGkvoNPcGIupEpSDlAeYIV4DgdElqsoQg8KzwB9QDyOBTfZZ2DkZBiwUmFYPNO
	 QU6WELqxHF30EcXONWJvVnt392v3gmpDI3OvHflaGkaB75QG9tgbMZJvO13dPcFpkB
	 CkrOYtN+6wMhDYd+hrO+N7+OyUKavO+iqWOVAVDT7BXOtMunaY/GQwjZIunWvkKzWE
	 e6BxOWmviqMLQ==
Received: by mail.salesoptimize.pl for <linux-snps-arc@lists.infradead.org>; Mon, 17 Jun 2024 08:10:47 GMT
Message-ID: <20240617084500-0.1.31.oey6.0.91bhu50kkb@salesoptimize.pl>
Date: Mon, 17 Jun 2024 08:10:47 GMT
From: "Tomasz Wawrzyniak" <tomasz.wawrzyniak@salesoptimize.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Odroczenie_zap=C5=82aty?=
X-Mailer: mail.salesoptimize.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_011127_744862_57C60358 
X-CRM114-Status: UNSURE (  -0.03  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjaGNpYcWCYnltIHphcHJvcG9ub3dhxIcgbW/FvGxpd2/Fm8SH
IHd5ZMWCdcW8ZW5pYSBva3Jlc3Ugc3DFgmF0eSB6YSB6YWt1cGlvbmUgcHJvZHVrdHkuCgpNb2ds
aWJ5xZtjaWUgesWCb8W8ecSHIHphbcOzd2llbmllIHUgc3dvamVnbyBkb3N0YXdjeSwgYSBteSBk
b2tvbmFteSBwxYJhdG5vxZtjaSB3IHd5em5hY3pvbnltIHByemV6IG5pZWdvIHRlcm1pbmllLiBQ
byBvdHJ6eW1hbml1IHDFgmF0bm/Fm2NpIHd5c3Rhd2lteSBQYcWEc3R3dSBmYWt0dXLEmSBzcHJ6
ZWRhxbx5IHogb2Ryb2N6b255bSB0ZXJtaW5lbSBwxYJhdG5vxZtjaSAoMzAtOTAgZG5pKS4KClPE
hSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB0YWtpbSByb3p3acSFemFuaWVtPwoKClBvemRyYXdp
YW0KVG9tYXN6IFdhd3J6eW5pYWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtc25wcy1hcmMK
