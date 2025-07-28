Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7878FC83F26
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Jul 2025 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JR86VWJUep4/ALsRz5zFOIzTSp17LGHILJXwxtXqct0=; b=ZcJWKiwQ7hiKeY
	ppvrRW2a1AWXNnzA4HGBMSTMd95g/t+23DuNKQZ0mMkvn2PoYHpxZIOxkMvvPRCMvYfVdo+mnUFEu
	BjP0vZVoZXiEHGqgwKgrAe+xR0hTGRtup1ppDxQRD6UZj4qnrXyHQan+u3SbS5pmZRkvbZUPU0b4b
	At3uIvyoX3qUo4iyjL4+xGA15nUCEgKGslL/xtl61g0FIarz37+WdHefDngjCfRSCtWC29rSvo5nB
	3aY4U3Lz57JK3po5JDSzeE87FvQzYbwe4pS4zpy7BNpjdcAoaBKVwHy0heNPTwsKJp5OlRTZ3+i5L
	ID4ZqAyChyVXyouNrexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugIvd-0000000Dwes-0pYF;
	Mon, 28 Jul 2025 08:09:49 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugIva-0000000DweU-2Hmg
	for linux-snps-arc@lists.infradead.org;
	Mon, 28 Jul 2025 08:09:47 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id 216B24D78C; Mon, 28 Jul 2025 10:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1753690089; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=sG2puAgTRIUOzJfGanEK+nPk5SHHBoqGXjWlYv0KhrSW8ObVzTH0os/PnRJR/2aT6
	 iz2R+N/S1QJjMen5f0YFY3kgoMfrujQCDQC5ZnrJyDn6GEbwxXcsaClN0+JejEd7Us
	 +tkhl1EbRDrWaN6gAtm7oiOlUVdK54tFqe7gdmRCuQV8KwS/zLYpwFT1K3xddpTMLb
	 3Gs1brdtooy3M30WpWZrpzcL7tNLUhLalnGt/gPVM23h43xUEDcSomqGvi7unRcCpz
	 TTv+OCWDX5mjN30xP5tcXRJLk9by1g1f+3QE36JQ/EYyewTpFgbM71OgZhhUPUswIH
	 CtAvuavgzc4lw==
Received: by mail.fintara.pl for <linux-snps-arc@lists.infradead.org>; Mon, 28 Jul 2025 08:05:43 GMT
Message-ID: <20250728084500-0.1.ax.2yznf.0.ecug96n3j7@fintara.pl>
Date: Mon, 28 Jul 2025 08:05:43 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_010946_834652_602875D7 
X-CRM114-Status: UNSURE (   0.07  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
