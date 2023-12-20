Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2424DC3DA6E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Dec 2023 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8pOBw7vukVutYLMtZZmun9FHKcZCJJDrTJGJg9mw/QQ=; b=SUK6LDrCuxXk7A
	FDQ6xIbqPHkdqugcNZj9a0TEND8g0nKiJ+9QQbDShdT1lpM/nWRdYVKClROPmZUCcsQNmF2XwbNsu
	J8ZL8UG6KLHWdPZZ/s50J99Ye+XeLyeQtsozeZvIZ0aS+U2hT4RjA/iNQpRNo7QufVzNXehSG4RZc
	UWhz+ij+RyueJv8GcVZkodUT0gPHoVphHxVIV9H8qwW3IRnFeqifBpN97ZLZtzmge1GqSGEB8zRjo
	6YUZGiZsbVt0VMJcVUmLjWc+Alma0w5YUEkEdNllx8a5CpSKBjobRzTQRPEbUmQxbAMfwVEz1HYkb
	DFe01kARfbPH+LnwdeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFs8S-00GbWT-0D;
	Wed, 20 Dec 2023 08:41:00 +0000
Received: from mail.bizloop.pl ([217.61.97.183])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFs8M-00GbUb-1s
	for linux-snps-arc@lists.infradead.org;
	Wed, 20 Dec 2023 08:40:55 +0000
Received: by mail.bizloop.pl (Postfix, from userid 1002)
	id 9E2B282CEA; Wed, 20 Dec 2023 09:31:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizloop.pl; s=mail;
	t=1703061094; bh=fAh84/03FbcPDOiro+kD9EaI9x3ZXWqpoFIQ90ndT2M=;
	h=Date:From:To:Subject:From;
	b=tYBhKhSABInCy7APcCWUguGeNj1xrG50VLB475Ay4P1ChQlhJqgvz+PTJaXjKwEPu
	 Bf0NmN8VsGHWUQIn5onHweNg4UhV0EdgtwjsXVJflmV2M8WZRKwSGqNFSzFVtQ3tTr
	 KyAxKG1XCGhbOT1fcp4H9oKuPAveQfAj6W2d/dIxd2i6iivx1DkifbTGxxwBHhgkUE
	 gK5rPFUMr/eBykRpvoyMtpeEwnJS64P83SCmlosTCM/G8QvtDNP0GCkDLcF3LZkaBX
	 psCy6LkPs7rjfH7tfSzptNIqzzxZYCukw9V5gedmSMudB0syaDxaeCe3Cr3egPxqwl
	 hJD+SBeD8Zckw==
Received: by mail.bizloop.pl for <linux-snps-arc@lists.infradead.org>; Wed, 20 Dec 2023 08:31:11 GMT
Message-ID: <20231220084500-0.1.1a.3hkp.0.jcsneir2x0@bizloop.pl>
Date: Wed, 20 Dec 2023 08:31:11 GMT
From: "Adrian Mackiewicz" <adrian.mackiewicz@bizloop.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Nowe informacje na stronie www
X-Mailer: mail.bizloop.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_004054_758943_D0738E2B 
X-CRM114-Status: UNSURE (   0.81  )
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

U3phbm93bmkgUGHFhHN0d28sCgp6YXN0YW5hd2lhbGkgc2nEmSBQYcWEc3R3byBuYWQgbm93xIUg
c3Ryb27EhSBpbnRlcm5ldG93xIUgZGxhIHN3b2plaiBmaXJteT8KClRlY2hub2xvZ2lhIGkgdHJl
bmR5IHcgcHJvamVrdG93YW5pdSBzdHJvbiBzdGFsZSBzacSZIHptaWVuaWFqxIUuIEFrdHVhbGl6
YWNqYSB3aXRyeW55IHBvendvbGkgV2FtIHV0cnp5bWHEhyBrcm9rIHogbmFqbm93c3p5bWkgcm96
d2nEhXphbmlhbWksIGNvIHogcGV3bm/Fm2NpxIUgcHJ6eWNpxIVnbmllIHV3YWfEmSBrbGllbnTD
s3cgaSB3eXLDs8W8bmkgV2FzIHfFm3LDs2Qga29ua3VyZW5jamkuCgpEemnEmWtpIG5vd3ltIHRl
Y2hub2xvZ2lvbSBvZmVydWplbXkgbGVwc3plIGRvxZt3aWFkY3plbmllIHXFvHl0a293bmlrYSwg
Y28gcHJ6ZWvFgmFkYSBzacSZIG5hIHp3acSZa3N6b27EhSBzYXR5c2Zha2NqxJkga2xpZW50w7N3
IGkgd2nEmWtzesSFIHNrxYJvbm5vxZvEhyBkbyBpbnRlcmFrY2ppIHogV2FzesSFIG1hcmvEhS4K
CldhcnRvIHJvendhxbx5xIcsIGphayBub3dvY3plc25lIHBvZGVqxZtjaWUgbW/FvGUgcG9kbmll
xZvEhyBQYcWEc3R3YSBvYmVjbm/Fm8SHIG9ubGluZSBuYSB3ecW8c3p5IHBvemlvbS4gTW/FvGVt
eSBwb3Jvem1hd2lhxIcgdyB0ZWogc3ByYXdpZT8KCgpQb3pkcmF3aWFtCkFkcmlhbiBNYWNraWV3
aWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
