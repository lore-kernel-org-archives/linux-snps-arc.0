Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C19C07545
	for <linux-snps-arc@archiver.kernel.org>; Tue, 24 Oct 2023 08:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5/v34WnRP+vJAgEJBMCe1C98FS3gDW5prDjbAYF/weQ=; b=sejAqBZRFHrXK7
	b1tJcNudtEmlH4+giFShqhooFoN5HQddamFZEtg8GvGRq8U7s7Vq4+U+Gl+CSKb5CUSHXMBS20W/j
	5DswUI4hPjyG1SWePUDXon8avFY4PSnVNOCBOPLg/8WOAOEN89Ejbd/9tumHjS6w7TVpjLedD3+LS
	gt4zBer+avN7kgN4b018iB/lhoIMQeE0gtZo8H3YVGyB0fzDsS/BGVJ+JolPzCPcxfx1ZHoZWGqQj
	1g+Of8Rpi+1CJ6MK18bTDAtLfUZEK74QnVO3WiXmnigddm0Yq65yGvfzij+qalW7welAirMxu+XnP
	0bCDXy0iTAU84PjRjYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCVP-0099pH-1R;
	Tue, 24 Oct 2023 08:11:15 +0000
Received: from mail.citycodes.pl ([158.255.215.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCVM-0099ne-2t
	for linux-snps-arc@lists.infradead.org;
	Tue, 24 Oct 2023 08:11:14 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id 806EE2168C; Tue, 24 Oct 2023 10:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1698135071; bh=fClkhHu/p6gIm8tbpvFwCqGX3kXIMdqjiuDdSiYGEkk=;
	h=Date:From:To:Subject:From;
	b=ia5qI1Ek79eK/nMnyl18LoP+OoavJnzIdpdLNy1CmUghAwaM1U4TtfX1/AykHIWjZ
	 5ZRU5f5evcj+Exhuupyd1/me9I9VUXVFLV53xpN6YM2qJ6PAXQ4HcUu/GFnVB9kKMQ
	 BszTsg0sDwo/fMulmtd1U2nCa0NYxjK15X0RF4gtvBn59LjFh8A8U+WwZlpAOTHpT4
	 KhuWwRHzpYNdOzggp8scs9xm6ZL7hmuKbosGgVpzHB5iC4D9db3jWRubCQGWzs/3pi
	 2Jrp+x9byFCzvxnyCn1A/sXwtMR2WyZekDC/DXJBzOF7SMW2OXpjT9ADibOQjRwsgx
	 nqbTF9c710zKQ==
Received: by mail.citycodes.pl for <linux-snps-arc@lists.infradead.org>; Tue, 24 Oct 2023 08:10:35 GMT
Message-ID: <20231024084500-0.1.8a.l89x.0.u4mithdbnh@citycodes.pl>
Date: Tue, 24 Oct 2023 08:10:35 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_011113_068783_5B0D5A63 
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5ZmlrYWNqxIUgd3N0
xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkthbWlsIExhc2VrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
