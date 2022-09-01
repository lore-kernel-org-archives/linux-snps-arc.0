Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFA4ECAAD1
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Sep 2022 07:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ijV+tBOH3CAg1O8TBC1OMUay4ooftQQ9KDcuGVZaEZ0=; b=Ss6awwrvfsDqnn
	rT1kZ9y0TSQw0rbnEqkFdxMf2kwlw0ZbWB1nM00CNbZsr6wdNH0ieErryGOv/McAPiYkKZPK7zoM4
	VZQ/AwJbuplCH4K5YasCkTHYUg9VcCIoDfYHlvTVjycxcPm04lfInbPKJ8T75rdXDcEOtOC1JzJTT
	apGaWi/LMg8Q2G75YgBhzxJice1tkcYF9V9ZQGiSzbIwrhLu5KpDL+GPoKKtHaV+O3r7DpgFcFjoU
	QaEog/MywvJBz9ovGHXlQUFuwGuvrpkf/ZsfLBHFc5PCqp+ibQSrfRS4J/lVBrKaAX1NbvUos31Wz
	RYlKTG3tMlzFMbI6JgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTexN-00AOxB-Q2; Thu, 01 Sep 2022 07:49:45 +0000
Received: from mail.fadrush.pl ([54.37.225.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTexL-00AOvv-A9
	for linux-snps-arc@lists.infradead.org; Thu, 01 Sep 2022 07:49:44 +0000
Received: by mail.fadrush.pl (Postfix, from userid 1002)
	id 080B522713; Thu,  1 Sep 2022 07:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fadrush.pl; s=mail;
	t=1662018132; bh=bD6j9gIFU6CLTaCGl0Ow9oeIxtirvTfMeNZSfLEZQ+I=;
	h=Date:From:To:Subject:From;
	b=XA0zqPpNZT/HgTB+qWx4fNQFG8RFxdHRA4wEQYKSO4T7OOCEF/V2EmPR+VIi9YxDn
	 0BGCUuvr0QyRVIkMDFo/Mt4BpFeNSraAI3x264w/Z3owkss7FE8HH+gO5JOSnIqK93
	 VrNonF2lYj8Fuit315jgrB1IQkzLLaFz95vjqSLqwBiDnNA1CReTKYl2+Rk10LCKwZ
	 9iAEvdEULgDqD/FxnZUVxOgwxBoP6uStxXFvojBBiQDvTUpTfwygxf0RXgDhHV1crc
	 AZkKsXsnsnC38iWZLb3fGnYVkqWCpfaiL0/vLd6hhHE4MgUZQkxNMqO4oykMm53sKk
	 knOBYz5AqEg8A==
Received: by mail.fadrush.pl for <linux-snps-arc@lists.infradead.org>; Thu,  1 Sep 2022 07:41:15 GMT
Message-ID: <20220901064500-0.1.1d.bp22.0.0rmjrx2jmi@fadrush.pl>
Date: Thu,  1 Sep 2022 07:41:15 GMT
From: "Jakub Olejniczak" <jakub.olejniczak@fadrush.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Zwi=C4=99kszenie_p=C5=82ynno=C5=9Bci_finansowej?=
X-Mailer: mail.fadrush.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_004943_502525_76786C24 
X-CRM114-Status: UNSURE (   1.40  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB6IFBhxYRzdHdlbSwgcG9uaWV3YcW8IGNo
Y2lhxYJieW0gemFwcm9wb25vd2HEhyB3eWdvZG5lIHJvendpxIV6YW5pZSwga3TDs3JlIHVtb8W8
bGl3aSBQYcWEc3R3YSBmaXJtaWUgc3RhYmlsbnkgcm96d8Ozai4gCgpLb25rdXJlbmN5am5lIG90
b2N6ZW5pZSB3eW1hZ2EgY2nEhWfFgmVnbyB1bGVwc3phbmlhIGkgcG9zemVyemVuaWEgb2ZlcnR5
LCBjbyB6IGtvbGVpIHdpxIXFvGUgc2nEmSB6IGtvbmllY3pub8WbY2nEhSBpbndlc3Rvd2FuaWEu
IEJyYWsgb2Rwb3dpZWRuaWVnbyBrYXBpdGHFgnUgcG93YcW8bmllIG9ncmFuaWN6YSB0ZW1wbyBy
b3p3b2p1IGZpcm15LgoKT2Qgd2llbHUgbGF0IHogcG93b2R6ZW5pZW0gcG9tYWdhbSBmaXJtb20g
dyB1enlza2FuaXUgbmFqbGVwc3plaiBmb3JteSBmaW5hbnNvd2FuaWEgeiBiYW5rdSBvcmF6IFVF
LiBNYW0gc3RhxYJ5Y2ggS2xpZW50w7N3LCBrdMOzcnp5IG5hZGFsIGNoxJl0bmllIGtvcnp5c3Rh
asSFIHogbW9pY2ggdXPFgnVnLCBhIHRha8W8ZSBwb2xlY2FqxIUgamUgaW5ueW0uCgpDenkgY2hj
aWVsaWJ5IFBhxYRzdHdvIHNrb3J6eXN0YcSHIHogcG9tb2N5IHd5a3dhbGlmaWtvd2FuZWdvIGkg
ZG/Fm3dpYWRjem9uZWdvIGRvcmFkY3kgZmluYW5zb3dlZ28/CgoKUG96ZHJhd2lhbQpKYWt1YiBP
bGVqbmljemFrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
