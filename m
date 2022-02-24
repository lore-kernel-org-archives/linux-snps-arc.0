Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B71C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Feb 2022 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JM2C2itNGu2SR50yD/QDMZkrJyX7HcCaevMXpJuqDL0=; b=PUO3XRTNKFnXjD
	BKpp65hcQr2qkIymcvljgEVqAo3HtuetM4KojRXImkEmB3xjAUUVJjiaH1xrMTaSknhUF75NGwLAO
	vbeiwaG7ajYE2Aj2Z+nEc7EeNRy4+62c7dFPth9f7pP4qvPEzIWsNtvrx15zh2LlWDSkbYrfblHLe
	VQoT2w080JR6Sem9jA+VUwW0BXUMuzY8H7sp0dGA5g7xGCNYokFmQZZizpmuhg4w9uKeAZRciZ9ij
	PpjXHQZTEqgFRoVOU/TyozciUvm6pZldioiYI9L5LYW9aWcDE3/dURVDoxrzLwgGl3zolBuOz+Csl
	Aadn4Scvz4MsF90cw5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAQg-0004SC-U7; Thu, 24 Feb 2022 09:28:54 +0000
Received: from mail.onlinesuccesses.pl ([198.244.150.235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNADO-00HYkX-Cc
 for linux-snps-arc@lists.infradead.org; Thu, 24 Feb 2022 09:15:14 +0000
Received: by mail.onlinesuccesses.pl (Postfix, from userid 1002)
 id AC734A47F0; Thu, 24 Feb 2022 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onlinesuccesses.pl;
 s=mail; t=1645693581;
 bh=nE8HqilgMh4dy7+Z8ksfg7Bc9rmPeQtYFq3/3YR2ODU=;
 h=Date:From:To:Subject:From;
 b=XdU16x3XW3rbYX0A9TmBbS8oNiXHWXiNxCUCi6sx6i8Dqx7KQXVOqIa5Egpr13Zhd
 j/teB+Abrvab4SVVbXGnOj88lmiUzFp4P6Nz4lrlTNKmc9rTEISt7fhviEji4MTvmq
 22Ua4M9YZVpUF/EzpmQMZjKEnHnL0dGqmkEIbvRw9B670OsesmMEfBH+ZUlOstm4dD
 bzPSwKPv0nNpZHIwCJm/VlOfGcqztwrLqP/ooorSXsur6qd3J4z/5Bp61io1tV5QNm
 1n3J3fpEHwTx1LAxfMtGP8HyhvmbdFhfoVpQRwDDSBPHB3QCJPpQIer8U87OVOLpD8
 F2T0NOnWkSq3Q==
Received: by mail.onlinesuccesses.pl for <linux-snps-arc@lists.infradead.org>;
 Thu, 24 Feb 2022 09:05:53 GMT
Message-ID: <20220224074501-0.1.2r.hnxe.0.bwihvix1m5@onlinesuccesses.pl>
Date: Thu, 24 Feb 2022 09:05:53 GMT
From: "Wiktor Zielonko" <wiktor.zielonko@onlinesuccesses.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Ruch z pierwszej pozycji w Google
X-Mailer: mail.onlinesuccesses.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_011510_581160_C8D82F73 
X-CRM114-Status: UNSURE (   0.54  )
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
