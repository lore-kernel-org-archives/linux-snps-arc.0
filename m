Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDD3C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Apr 2022 07:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11G8glZwLAD601KpWJWBdaTmkf8B/BOvuTw3KB/rpVY=; b=HWlQ4cr00gbAML
	fsp+IClZn+jZNsZH/N1qQGWkxrbXPxFLpWkoacEAhztQyRkotertEZ63Gl9s9Cno7Sd+BBpABdqh8
	FQONgC0jXEBLJm3RXlrmSYbleYh2gl90/DFqST22l3luOQxrOfTYhUo75Fx/ts9qVfOMM/0TtE3k4
	BR5OnEKrwbKflsghJknCvW2Sn/U3zQUzP3bQ+MU6kQxXFckh7khHQP7r1FM166IACRb097kw+umJZ
	/6sq6TL1IcNL8N6p/ppCquKkUQEHGKTfSP4jHP57Clct+2+J5lRWLKiFNoRlJ7nfMFgDU79fFoJIg
	+blzKGuBnr+P/AVwlrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh4zC-007qC1-5a; Wed, 20 Apr 2022 07:42:50 +0000
Received: from mail.fixingbiz.pl ([217.61.22.139])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4z9-007q9S-Qu
 for linux-snps-arc@lists.infradead.org; Wed, 20 Apr 2022 07:42:49 +0000
Received: by mail.fixingbiz.pl (Postfix, from userid 1001)
 id 75BE5A277B; Wed, 20 Apr 2022 08:41:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fixingbiz.pl; s=mail;
 t=1650440509; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=yxh4Aa8LcUbfpZNnqJNh6B4lgrMr57EMPJPUhx/fZsQXwq4gpVjHGWUa7+08OFpZG
 guUWYcGXaAM5Cn5FqTkgPPj7k5/4Xvsi61V8W9DvnnLPGl+YNJmePekEp1XJJynQwB
 c7fxeaEKetQReQ88ppqBE/gT0yQ3MBRL/N6SgHU4QiV8F/VgBj+xNZbmiip3NYD/gE
 JmJJDrz+wd8nJXIMNNBYxl155xQIVrEkb2GNEv2GtLTx1Lh3YJrKfE8/hSD+fyBKIA
 b6zyg0ZidfJ8pMtbF9AFUt0/SfKl+Umod9MDqa4QIqK/4n5ANiCmDNDfGVqVBJz7zD
 X7X202te3rPiQ==
Received: by mail.fixingbiz.pl for <linux-snps-arc@lists.infradead.org>;
 Wed, 20 Apr 2022 07:40:53 GMT
Message-ID: <20220420074501-0.1.1x.6t4d.0.meeaa4uij4@fixingbiz.pl>
Date: Wed, 20 Apr 2022 07:40:53 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@fixingbiz.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.fixingbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_004248_125479_C4F56075 
X-CRM114-Status: UNSURE (   1.64  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sClByemVteXPFgmF3
IFdyw7NibGV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
