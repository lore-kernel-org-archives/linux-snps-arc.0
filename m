Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DD0C43334
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Jun 2022 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JM2C2itNGu2SR50yD/QDMZkrJyX7HcCaevMXpJuqDL0=; b=pY/Uwuik80ithc
	k7bt3X9DJRm9kAmaPSMOAq5rpqdB2iLpN0UeOaV77DmcCcGHDCnxq/dK/6CmeiJFkTKgua8ellYFC
	6079q1ifFhH+dsxJAgGskD7C8kFM767OX+L0wFzmukF94n6oL+u6xTovx9rn0dpdO/0ZEfxEP+Aec
	C7ptz2mVooF6GNYjgd8pocdtuBn481weNObowq9s692W+61Z+WrK643xg78fucGmlwHU0Hm4us80A
	lsQMppioIa93m8KVthmQkp/o6I1ILu8BSQJ6u51I+1HtJafIeIymapE3ntHthHXfMT+/LeBXmkyBL
	TNdyejwMl3PfgGu4OkiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HXi-00DvQG-75; Thu, 23 Jun 2022 07:46:22 +0000
Received: from mail.onlinesuccesses.pl ([198.244.150.235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HXg-00DvP8-3C
	for linux-snps-arc@lists.infradead.org; Thu, 23 Jun 2022 07:46:21 +0000
Received: by mail.onlinesuccesses.pl (Postfix, from userid 1002)
	id 3497FAA2EC; Thu, 23 Jun 2022 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onlinesuccesses.pl;
	s=mail; t=1655970219;
	bh=nE8HqilgMh4dy7+Z8ksfg7Bc9rmPeQtYFq3/3YR2ODU=;
	h=Date:From:To:Subject:From;
	b=aiYYyXUB4EAYb/bw8JeDjvoApFrLyB1FF06oM7jAzj/6vgC3W6Q32E6oAGSAsZqUP
	 v+4dEdGrR0Q6/XgiEn6t+y4A2zfGUMz+eufricgKpwy59rCwNDZSKPr8YXYG6JIvSK
	 T70NeVWsXeTOQkNyJNfktynOE79x0b8KSU9JxX8Q/1AjHbjebNpuaV/viJgfDRT5RW
	 SofAKXhMjXz4poMpA/uozQ0/pFzGU7l4g/81cuW7MsZYInJ4shrnHzY9Zrn7O8yog9
	 TwZ0XsG3gMTZWCyvE3O2L29wNZlbMZul8tlWWzE5yPw5OW7Q4tgFxKpPzlzy4LGL+4
	 vz9yD4ba92WKg==
Received: by mail.onlinesuccesses.pl for <linux-snps-arc@lists.infradead.org>; Thu, 23 Jun 2022 07:41:20 GMT
Message-ID: <20220623064501-0.1.51.1mryr.0.dn4rfspe0i@onlinesuccesses.pl>
Date: Thu, 23 Jun 2022 07:41:20 GMT
From: "Wiktor Zielonko" <wiktor.zielonko@onlinesuccesses.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Ruch z pierwszej pozycji w Google
X-Mailer: mail.onlinesuccesses.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_004620_287442_C4DC2D94 
X-CRM114-Status: UNSURE (   0.46  )
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

RHppZcWEIGRvYnJ5LCAKCmpha2nFmyBjemFzIHRlbXUgemfFgm9zacWCYSBzacSZIGRvIG5hcyBm
aXJtYSwga3TDs3JlaiBzdHJvbmEgaW50ZXJuZXRvd2EgbmllIHBvenljam9ub3dhxYJhIHNpxJkg
d3lzb2tvIHcgd3lzenVraXdhcmNlIEdvb2dsZS4gCgpOYSBwb2RzdGF3aWUgd3lrb25hbmVnbyBw
cnpleiBuYXMgYXVkeXR1IFNFTyB6b3B0eW1hbGl6b3dhbGnFm215IHRyZcWbY2kgbmEgc3Ryb25p
ZSBwb2Qga8SFdGVtIHdjemXFm25pZWogb3ByYWNvd2FueWNoIHPFgsOzdyBrbHVjem93eWNoLiBO
YXN6IHdld27EmXRyem55IHN5c3RlbSBjb2R6aWVubmllIGFuYWxpenVqZSBwcmF3aWTFgm93ZSBk
emlhxYJhbmllIHdpdHJ5bnkuICBEemnEmWtpIGluZHl3aWR1YWxuZWogc3RyYXRlZ2lpLCBmaXJt
YSB6ZG9ieXdhIGNvcmF6IHdpxJljZWogS2xpZW50w7N3LiAgCgpDenkgY2hjaWVsaWJ5IFBhxYRz
dHdvIHp3acSZa3N6ecSHIGxpY3pixJkgb3PDs2Igb2R3aWVkemFqxIVjeWNoIHN0cm9uxJkgaW50
ZXJuZXRvd8SFIGZpcm15PyBNw7NnxYJieW0gcHJ6ZWRzdGF3acSHIG9mZXJ0xJk/IAoKClBvemRy
YXdpYW0gc2VyZGVjem5pZSwKV2lrdG9yIFppZWxvbmtvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
