Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DC9CAC5A5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Sep 2025 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SwbNqVRrovvtUlxKRQYkulyMSd8PeixKBxXp/oI0siI=; b=rkkIo9KYkuOLX2
	ddVYnYub6AkameEdu2raTFjivy1RdgIMv3inAy3HcUdvwhuFFiK1zL7YOfAIwv+b4r24ax38NgOe9
	xdsIbH9ToibzlJ9pxWBNrwheBFhacPtao3dh4cWJt1HKXTAAYyqlp7C9CHiPN+/Al2mMBst1Putok
	JVL/6SNplvB6tItxkaWDuA5bYb8Z0mOvtEqNPStOKTcPU3kZVTW5i7fpyUHUUaGbU44Ivfn3yoFyT
	9Lio9T3zy8g6nY8dAka9o7tiPjGno/eoVheKvonqoONu3M6CpfAf2sBPe9Qqmd6x7QpKrZn91rcXC
	mb4ybvI9QVCx6eNRICbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xgA-0000000CiVm-3ItE;
	Tue, 23 Sep 2025 07:43:14 +0000
Received: from mail.proventix.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xg7-0000000CiUG-38gX
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 Sep 2025 07:43:13 +0000
Received: by mail.proventix.pl (Postfix, from userid 1002)
	id EE788A436C; Tue, 23 Sep 2025 09:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=proventix.pl; s=mail;
	t=1758613387; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=PbKgWXeglzhEgdJxqx519hgNNhKAmHiHOerkjPRLX04ZPJie2cTFdT9WqD/id1irx
	 iTUm4Ex6lS9l2WtWLDUkXLHi/tsk2GKHLPr6LUiJlgGZOHfRYFvuJ3Dzn1KONS0GI7
	 BEyaCETqVazaShtlMLo/jm9vggVgwE7VwLUZpOdtiVH6zT8dyn2nFMaKpYfp/z1mcP
	 rjIREmybQlHPRmktUSvm3HntX849wI8621f7AcDctGF0BQUR8o6zovViWVnhjJcowY
	 KS0NXXyMjhqRSry995ZHaJrDrLzEzHgD2Fs0M9kf0oJeDmIb1U5sjv3kL69F+fvCYz
	 ELvES5ouKZcRg==
Received: by mail.proventix.pl for <linux-snps-arc@lists.infradead.org>; Tue, 23 Sep 2025 07:40:42 GMT
Message-ID: <20250923084500-0.1.o2.37pak.0.fpeg19ifcm@proventix.pl>
Date: Tue, 23 Sep 2025 07:40:42 GMT
From: "Adrian Liszka" <adrian.liszka@proventix.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.proventix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_004312_051710_CA0DC9DB 
X-CRM114-Status: UNSURE (   0.42  )
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
