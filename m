Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68382CA0EC0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Aug 2025 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jo5iin0caJAv3vTQvqoy3LNvmUzjq/N37CtcqLh3s80=; b=KKTjJ59KGEkvMo
	Sj0TP45cbTP+kw2ck/j4Qwzj0u/yEYzQtHRIrHwTp/cIgSACEzmDTZ2c9TPjzGb7v+Su4BXQ48tI/
	nIVH2enmK70JyMme6OfdoPKO8qhSoRdVa9cChmwiF3d3eZdIFV+6BqCpWuoUNx4GsSqnRhI/04054
	Js2boi4LVkh5hoI4I/me7MCl6n0gVskgavzpkFpscHcEUA2YGZ7qd0QzWsLhVPg50npAPqbLZ1GKD
	Bwf+FhAw0utTobFgj74Xykv15HCdObKXq985FPqBeRZp9i2oA6f7jqxWJdkcz90htOZLk/NdMW591
	6q9yC67xGEwk81j7bB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulO78-00000006sxR-00Lt;
	Mon, 11 Aug 2025 08:42:42 +0000
Received: from mail.successa.pl ([162.19.205.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNZx-00000006oAy-2rWM
	for linux-snps-arc@lists.infradead.org;
	Mon, 11 Aug 2025 08:08:27 +0000
Received: by mail.successa.pl (Postfix, from userid 1002)
	id D9CE227621; Mon, 11 Aug 2025 10:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=successa.pl; s=mail;
	t=1754899581; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=WZN2gpvpnKhP47aYFoZhikggjz/l+9lP11VRUiIsxdeQgZ5Eg6V9LC11IsNCylroo
	 ZUq+/iKOuZ5NjLbXqCeDigySWh5HV4CJopnEDtSs7+0q0Bftc1NYEXwkETyCO0ZHIV
	 Wp07PpX7zPnCl08O6UyD2iUl457CzWd6x40q0YbeThrqjxU/pafasffn/5RYpg+hmk
	 M3v7JSXQoTP7S8w1gMGcszXzZrYVM7dP9r9lCGOC61Sk9NkkvHtTejDm32ZG/zMngU
	 9FWUqBwmu/yrG5lDfg9DR7n8DnbZU9mF2PeLNxhNf54x1dafqSb6TdCQSreW93wYiu
	 KCuxlnfQIATxA==
Received: by mail.successa.pl for <linux-snps-arc@lists.infradead.org>; Mon, 11 Aug 2025 08:05:41 GMT
Message-ID: <20250811084500-0.1.jw.2l1eo.0.5pvmfp8ka1@successa.pl>
Date: Mon, 11 Aug 2025 08:05:41 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@successa.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.successa.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_010826_813649_35E5A3C0 
X-CRM114-Status: UNSURE (   0.50  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
