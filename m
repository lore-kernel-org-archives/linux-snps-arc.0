Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FA2C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Apr 2022 07:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11G8glZwLAD601KpWJWBdaTmkf8B/BOvuTw3KB/rpVY=; b=S1H5RfKFsMcJDi
	MdxJv3Hwz1cnmo6h3o6klse1mAanmZ/w5lELAdBmyZjOv76JNiOq0je2CgKCil/azWXSdDtfLIlgv
	bCcl68czpcRAJVptLsD5UjSw+Cd2AayUeVQj/6Q9oJvbtKmdjxZTBhapXk4fu9NLRsmH6NqccYZIZ
	xRjMOkKPW+XP4U/Iw4a7FxLKva4RFVUsSmQEDrdSilZ3AOv2iMB51qE0bqv8igOb7/53q0HjwhyPv
	7fAQdd5MImPcFMm+3ZWNTDfNLhIw0SDjrypEW9yU+/rEX7cRK9KRyFLKoVpagZZB2zr8iA5t3WTpu
	oTRFr4nSDD1TKKRfVA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBQg-00COmM-7a; Tue, 12 Apr 2022 07:59:14 +0000
Received: from mail.growthmindset24.pl ([212.237.36.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBND-00CMmN-NE
 for linux-snps-arc@lists.infradead.org; Tue, 12 Apr 2022 07:55:41 +0000
Received: by mail.growthmindset24.pl (Postfix, from userid 1001)
 id 3F7BD87E6E; Tue, 12 Apr 2022 08:52:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growthmindset24.pl;
 s=mail; t=1649750018;
 bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=bD9Fji6GwmFyVv8WaEord2lFPYRb6lEkMhrzpmOQFvEdoYIh1QLdjzUMtJ/RwWUYG
 RSV1rij5emoDaAvELO4DV98tKzlDPaEkWqOGChpxXOgZ+2lNvTEArLEtalYisy/vEW
 AFSa04q39rerI40msdwmT3Paecksg1snW9df35psG7cegVau4nWFZag+ccygIdMRvg
 LguXVYH3FEMDztBl24JVGz1EF946OZKRBmwInaidy9FOIcH5CIZ0GT5kU2JdJCyvuu
 p7O6bZtYJk1uyY6frrOUB/h+1OAwtL7Zq4nZ6Y5KNYD2CMpRN0R2rpYU06vJ65CfLf
 iEfrVD86GSTjg==
Received: by mail.growthmindset24.pl for <linux-snps-arc@lists.infradead.org>;
 Tue, 12 Apr 2022 07:50:49 GMT
Message-ID: <20220412073001-0.1.2w.d794.0.6u354t25km@growthmindset24.pl>
Date: Tue, 12 Apr 2022 07:50:49 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@growthmindset24.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.growthmindset24.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_005540_055355_98C5CCD5 
X-CRM114-Status: UNSURE (   1.66  )
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
