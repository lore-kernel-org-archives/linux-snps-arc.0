Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4262C7EE24
	for <linux-snps-arc@archiver.kernel.org>; Fri,  2 Jun 2023 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cP1vnbbHPjTDn3xu2jxJL9njRyAkIMvXhX4HHePNYBI=; b=qv6Z8Cgg2R4ykd
	3Q38KK6X6cXX/P5RpTvEnsR7/3ZRpq2/wqpRfzkbnLb/MjVuY+oAdebjec9vDOKLkHPmqcl/DYW/G
	sn/3CW65tJE096SxSaPMcW/fQnj+EWrmD4z4BRk5HSJSxGFUHGYhhq1Y/8JOfke0sSqYXTU6274k4
	u0gWjOOaxrcMNDZZ7KlUTk3Y5iFW9A6gQ06DiZ4jR1JRyP2zPhvAVccHODcABNCuLwrZ1nskaXmA0
	sK10OwYemfVYsdM+33uGA8QOuKtEukjICCJO2NTqXmvcjhPdzGhTclDJx1fAbqeM/UF/YvSnLeYqj
	dSMz8If53vBEDOHEf2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50LL-006BRM-1y;
	Fri, 02 Jun 2023 08:41:07 +0000
Received: from mail.webtopbits.pl ([195.231.64.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50LI-006BPL-2J
	for linux-snps-arc@lists.infradead.org;
	Fri, 02 Jun 2023 08:41:05 +0000
Received: by mail.webtopbits.pl (Postfix, from userid 1001)
	id 39941A390B; Fri,  2 Jun 2023 09:40:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=webtopbits.pl;
	s=mail; t=1685695263;
	bh=Eh8ECMiYd4baGAwPAzhz8mhJACXX7NSRkYjh+plaY18=;
	h=Date:From:To:Subject:From;
	b=ZF64eWGrvDr2Ft5DPufQNupBuV316oDLP0hc1JPUwx4ywiH3x/LfW6k+xVDaK8R5A
	 6MsLs2CEkuI0JiG5JTo5ZLxqlZkAPZWzGMEBiBfk7yP5gTPPq+cnkA5LTFWFJTfJOx
	 vQI6Id1bX8Y4HtYrlLmncCTL1Bg/73rZb9Mv4eO8WKfGqppZqcaOVS1NwY/pD2Ruen
	 Z+pfyfW/cctTmML7jwaNvCeKLpLvdmzBQXUdBhVvafvsuS0KIS+qjcW67gdVI+LCo9
	 aNWY/T5bXkSVXQkQQ9tOsyfu1TT8OMJpkp8lqntL4/DbXr3U7oI+HVSMnR3c/QNZbF
	 07l2PO7M9A4Zg==
Received: by mail.webtopbits.pl for <linux-snps-arc@lists.infradead.org>; Fri,  2 Jun 2023 08:40:50 GMT
Message-ID: <20230602085530-0.1.8w.5ke2.0.9f7il2g1o9@webtopbits.pl>
Date: Fri,  2 Jun 2023 08:40:50 GMT
From: "Kamil Durjasz" <kamil.durjasz@webtopbits.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Wy=C5=BCsza_konwersja_w_e-sklepie_?=
X-Mailer: mail.webtopbits.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_014104_901523_329B8F67 
X-CRM114-Status: UNSURE (   1.67  )
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

RHppZcWEIGRvYnJ5LAoKdyBqYWtpIHNwb3PDs2IgZG9jaWVyYWrEhSBQYcWEc3R3byBkbyBvZGJp
b3Jjw7N3PwoKVHdvcnp5bXkgcG90xJnFvG5lIG5hcnrEmWR6aWEgc3ByemVkYcW8eSwga3TDs3Jl
IHBvendhbGFqxIUga29tcGxla3Nvd28gcm96d2nEhXphxIcgcHJvYmxlbXkgcG90ZW5jamFsbnlj
aCBrbGllbnTDs3cgaSBza3V0ZWN6bmllIHdwxYJ5bsSFxIcgbmEgaWNoIGRlY3l6amUgemFrdXBv
d2UuIAoKU2t1cGlhbXkgc2nEmSBuYSBQYcWEc3R3YSBwb3RyemViYWNoIHp3acSFemFueWNoIHog
b2JzxYJ1Z8SFIHNrbGVwdSwgb2N6ZWtpd2FuaWFjaCBpIHBsYW5hY2ggc3ByemVkYcW8b3d5Y2gu
IFN6Y3plZ8OzxYJvd28gZG9wYXNvd3VqZW15IGdyYWZpa8SZLCBmdW5rY2pvbmFsbm/Fm2NpLCBz
dHJ1a3R1csSZIGkgbWlrcm9pbnRlcmFrY2plIGRvIFBhxYRzdHdhIGdydXB5IGRvY2Vsb3dlaiwg
Y28gcHJ6ZWvFgmFkYSBzacSZIG5hIG9jemVraXdhbmUgcmV6dWx0YXR5LgoKQ2jEmXRuaWUgcHJ6
ZWRzdGF3acSZIGRvdHljaGN6YXNvd2UgcmVhbGl6YWNqZSwgYWJ5IG1vZ2xpIFBhxYRzdHdvIHBy
emVrb25hxIcgc2nEmSBvIG5hc3p5Y2ggbW/FvGxpd2/Fm2NpYWNoLiBNb2fEmSBzacSZIHNrb250
YWt0b3dhxIc/CgoKUG96ZHJhd2lhbQpLYW1pbCBEdXJqYXN6CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QK
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
