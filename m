Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348F1C369B1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Apr 2025 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SwbNqVRrovvtUlxKRQYkulyMSd8PeixKBxXp/oI0siI=; b=i1/TjddLlFLCuT
	PHJJ++Iwvwn/MV+Lejaq0TdiA2ONmBvEpM4NGVVLCDWJ2ZwinQrX6D4D71VU0D1Np69uSOH1n9U5C
	ydI3Ce+eSofrir9n14g6ebtQ9QAvoMa7GaOWU6wBeXx74r6WqZlhKoXoLfxg6kR2ttQXR3c9YAVm0
	p49CyzUProCy21FQWmI0WStJw65VPK1JMY0cGk3TMxd8JTUBDQhtm0sdCtms062DokdsCnCxE3HeU
	ye3hB5fgy8S0Mqp588l0+9364ZNKNcvspPW7Hv4aUqbGkEGSXGQQKI6vfJONdYz+qApm0BdF5nwXG
	5cxX9jzv0DWTGLrysC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xnP-00000008kCE-3U1R;
	Wed, 16 Apr 2025 08:06:59 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xhi-00000008jKZ-0h78
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Apr 2025 08:01:07 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id CE182A3E27; Wed, 16 Apr 2025 10:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1744790464; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=zz8mZWRCVWFFD/DNbww9lp9PP1N6+n1rvfFG3BftaTqMPwJwDZhwDuOkjir71Nhlr
	 fuSvO1nvhwQ52Vdp9fg8an4h7LxKyE74Cq9g//zoJFmaadVCEFAzPOndPuEwWgzCN5
	 C1kbAvDfWBWgyhfhoYJi0bba4CxE2x7NQ1dsrdNysneKx8bQtwMlq561wwTIBrSu/q
	 PvroHi1O3DlpzBTqWRjP1pH7EJnN01haR5022hzML+eG07RnihlNY2NMQ0NHFoXsL2
	 z6+cNTW7KGpguzEFyvyPPjZBCTsJ1FPLYzxnmvSnMDIhyKrOOFH2nWG2AGZPpuKadV
	 9hwUcPeB2NowA==
Received: by mail.novaplan.pl for <linux-snps-arc@lists.infradead.org>; Wed, 16 Apr 2025 08:00:57 GMT
Message-ID: <20250416084500-0.1.l2.1pnj8.0.73mshi7j81@novaplan.pl>
Date: Wed, 16 Apr 2025 08:00:57 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_010106_353672_509B4437 
X-CRM114-Status: UNSURE (  -0.11  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
