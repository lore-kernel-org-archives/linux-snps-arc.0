Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A33C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Mar 2022 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gxTJWHXGUY6eKDjx2t76V6OVdcBH/0DI8crZlyCe88M=; b=GOxCZojlUW6ROY
	qCRnDe4SnqXhxTwI1Zdr0qg/gQ+9iVn2ahPCX2aoXI62hL5YJu5FOZwjQSY8/KzM9e3nCmLaKcul0
	jv2IcGHWAx4A7Hfd2VKBH5Gvwhb+Y0uBWXITO65+DsgJrTZhq/PZnNg+nZh5+BlHzDp29IA5Wv4M7
	R6ox9knBwdYe0tNlm5+lFLLL4cvuNaM+5vPDvo2I6y0b/96rT3cMrfYjp6FiMqDF3Vgazs6tgxp1r
	6YHohAEp36vnHVjeyJMKUruXkRoNdpvwcFqdy7nGPNyizCtimi1+/HIxSjcp53DRhVadzvYatrJzt
	undvawR2DBaV8vYIkcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV8Ao-000qqm-Nr; Fri, 18 Mar 2022 08:41:26 +0000
Received: from mail.postform.pl ([195.231.64.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV8Al-000qpZ-VP
 for linux-snps-arc@lists.infradead.org; Fri, 18 Mar 2022 08:41:25 +0000
Received: by mail.postform.pl (Postfix, from userid 1001)
 id 38EA2AAC3D; Fri, 18 Mar 2022 08:37:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=postform.pl; s=mail;
 t=1647592783; bh=Cp7iEcBs6UYsUZoqwaSKv66JiG6VJnuY7Lx3D9vYwU4=;
 h=Date:From:To:Subject:From;
 b=S6fQ2v1iGEdZwGeVQcG+T6HUHNWGcey4k2y1w9euwN69wCo030+zq4AO+IqdX1oiK
 J36iaW+a9Puf1zBHjGYxSevXcFsOAUsUpfLXxK/Ns2LoFInBtoQWT+4cnwJLk2HTaN
 XLqU9RhdrRaXrYmU5NrVySe2FU6tAebyhLDQPzyCofVvyzerjwT96vjthZyffomgUq
 l+MnPlah2d1NDY3cJASNNcba8JuWjJ70wBo75m/CTqJvrz3+8qK1y4X7BigYO1N5OI
 ls74HAVp9FlI6eUpG6ZqQEg99tyBky2FaH1kb4lpwul5lC1Kzjv8P6ZNnd5iKvaF4X
 uj0PMy13mxTBw==
Received: by mail.postform.pl for <linux-snps-arc@lists.infradead.org>;
 Fri, 18 Mar 2022 08:36:44 GMT
Message-ID: <20220318074502-0.1.1i.jnxe.0.rqndj6dzip@postform.pl>
Date: Fri, 18 Mar 2022 08:36:44 GMT
From: "Norbert Karecki" <norbert.karecki@postform.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.postform.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_014124_179735_A34D83EC 
X-CRM114-Status: UNSURE (   1.18  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0KTm9yYmVydCBLYXJl
Y2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
