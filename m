Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7A8C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Jan 2022 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vksri4aGCSq8UoRmMijzsrGwXry2RO6lCVPqrnHsWDY=; b=FkGboeaQ2lYUKf
	atbfrMZwl5NxySZSs6IveGdwHrY+vGY38tpRwSH3Uw0XvNTRSWh5A29ACbP3SM3Ov4QsksHWrft06
	NR0sc3JoRiIoQ5mY82F63U/Ej9SClYcRoYe3hDME0JD7tzvj9kuUozCoum3oQcQcC8uW8iH6or3oH
	cv+nDsV0Y3ye5ODPrPDQMAuRl8+AnAPGtnGCTh7I9G5bVaLFxJd0830noplte499viLhHfHlf0n19
	RMopJUu2uj8TVxSXYwLF+KJQ2D4eGMNZ4AqbbP8sPHMzZeTn71w06Adxaiq33D5D3QBXLVAKdzqR5
	n3LV7Mvsh6iCQGJzwk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIOy-007FwY-4a; Tue, 25 Jan 2022 09:46:12 +0000
Received: from mail.belongsenergy.pl ([185.45.112.191])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCHvS-0073ZQ-O2
 for linux-snps-arc@lists.infradead.org; Tue, 25 Jan 2022 09:15:44 +0000
Received: by mail.belongsenergy.pl (Postfix, from userid 1001)
 id 80FFE2664C; Tue, 25 Jan 2022 09:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=belongsenergy.pl;
 s=mail; t=1643102141;
 bh=JAEkA4FCBmQ7T7M+WVau75EdqeDf4MEEr9hE2/l61BA=;
 h=Date:From:To:Subject:From;
 b=BoauUUkaaxpSbt7zo3ryFK5fJIlV3ADWA5n806uV5r+HQPMg3R4UhNP6Dp7SXMNCb
 kiatnD9MlA8WuoweMCYuGQCuC5zY1aRIU7aanx8ldL1l8Mzzl0xFpldiM0/Dd/o1d9
 3W6flEN8f/OTBTG+MUugmmMVddER7Su7rwrL/38fhqPZXYSFECDvmATogg2UmenQ4X
 IPXC3MjIGNhS67GoUlTaCeWk7GDY1ns8zUZP1HblW2EoSUVIQF6wTm7C+MnxY3jugV
 Ed8Qss9CR8pDgr6OH2xNW8MvOrzGPPCkK6tLSaLyK0T//Wh4ZZ/ArHwB4k9l+EmX85
 db8zlPJ0SPdyA==
Received: by mail.belongsenergy.pl for <linux-snps-arc@lists.infradead.org>;
 Tue, 25 Jan 2022 09:15:27 GMT
Message-ID: <20220125074500-0.1.7.30v.0.endfxjc828@belongsenergy.pl>
Date: Tue, 25 Jan 2022 09:15:27 GMT
From: "Maciej Nitycz" <maciej.nitycz@belongsenergy.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.belongsenergy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_011542_964842_A2757B66 
X-CRM114-Status: UNSURE (   1.80  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCk1hY2llaiBOaXR5
Y3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
