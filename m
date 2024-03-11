Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C300C5475B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Mar 2024 09:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qfS8yq/Fvd/5oZqVZgw1jS7cngigvq+Xd6kvSqAX8Ek=; b=EUGvEk3PRkIVRl
	8oUD4ZWZVzrHmmZ27/Tm/W5i7cFxJYlhX3GNt3tZBThOL1NJ1UFSql5bo1HDwKngsWRXXK0cV0GrC
	Pmq77pr3t+79oTiXSD02lvbuOapSwvi6FtcjnWNgn+d9BbZAo9aMky1Knj3q4WYCEyk+LgbqiTDed
	OxzVK1LcvmHTANGsH2gw4YxMBFbwQGEpCgFRGp04uYhTA0biBfW/vAV9dp9smbK8U7K74APhmkGuo
	vbIbQNcY0symdbKuNxHspSHv9V25NIbMNaU9+LZOSoL2KaH4WW8I6prbmPjOUt/kfG4B1zgZEPBTe
	CF93NzwFVmB08uGCwQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbr0-00000000oee-3y62;
	Mon, 11 Mar 2024 09:21:54 +0000
Received: from mail.buildbrigade.pl ([135.125.238.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbqv-00000000oYG-2bro
	for linux-snps-arc@lists.infradead.org;
	Mon, 11 Mar 2024 09:21:51 +0000
Received: by mail.BuildBrigade.pl (Postfix, from userid 1002)
	id 2F940A2C7E; Mon, 11 Mar 2024 09:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=BuildBrigade.pl;
	s=mail; t=1710148550;
	bh=EYN951LA1I6x2LqQG9SRvdSsS/DbVhjOvb+nDwRFhwc=;
	h=Date:From:To:Subject:From;
	b=c8bbVMDO6cmE9xVL42+dFU/1ztM+b7CC88g5mLCiEcmjfQUPVsLP3tq1/WGvpqpCP
	 dvblV6Z1dDmENZfvbFWElzLjgIH079GQzVpLHesfxMkPlAcde0H+mBLoSr+RFoe4Hi
	 VAUzlGDjkzdREWrXTNelK9KObBg9yETrlN64GlrxsrTzukFhgM016nojNsvK1hcF5d
	 0HHJVdVk9VH4zYwLCyslL+I3IBJ3TclF0TXsss1kc4sScXHEdH5UT+0xNjBgmlB4XQ
	 o1DEsaVBJmb2LYeWUXJiFKNoXjZgmikGtS56txeFKvgUm7mL8c7KMJmUTTMyLRaSy6
	 7L1AmVRN6xv7Q==
Received: by mail.BuildBrigade.pl for <linux-snps-arc@lists.infradead.org>; Mon, 11 Mar 2024 09:15:20 GMT
Message-ID: <20240311074500-0.1.c1.1gyjl.0.d7ddv40vm0@BuildBrigade.pl>
Date: Mon, 11 Mar 2024 09:15:20 GMT
From: "Tomasz Mrozowski" <tomasz.mrozowski@buildbrigade.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Niskokosztowa_modernizacja_o=C5=9Bwietlenia?=
X-Mailer: mail.BuildBrigade.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_022150_002478_2AA861D6 
X-CRM114-Status: UNSURE (   1.03  )
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

V2l0YW0sIAoKamVzdGXFm215IHBvbHNraW0gcHJvZHVjZW50ZW0gb3ByYXcgb8Wbd2lldGxlbmlv
d3ljaCwgZG9zdG9zb3dhbnljaCBkbyBwb3RyemViIHNla3RvcmEgcHJ6ZW15c8WCb3dlZ28uCgpO
YXN6eW0gY2VsZW0gamVzdCBwb21hZ2FuaWUgZmlybW9tIHByemVteXPFgm93eW0gdyBvc3pjesSZ
ZHphbml1IGVuZXJnaWkgaSB6d2nEmWtzemFuaXUgZWZla3R5d25vxZtjaSBwb3ByemV6IG1vZGVy
bml6YWNqxJkgb8Wbd2lldGxlbmlhLgoKUHJ6ZXByb3dhZHppbXkgbmllem9ib3dpxIV6dWrEhWN5
IGkgYmV6cMWCYXRueSBhdWR5dCBvxZt3aWV0bGVuaWEgdyBQYW5pL1BhbmEgZmlybWllLCBrdMOz
cnkgcG9tb8W8ZSB6aWRlbnR5Zmlrb3dhxIcgcG90ZW5jamFsbmUgb3N6Y3rEmWRub8WbY2ksIGph
a2llIG1vxbxuYSBvc2nEhWduxIXEhyBwbyB6YXN0b3Nvd2FuaXUgbmFzenljaCBvcHJhdy4gCgpE
emlhxYJhbXkga29tcGxla3Nvd28sIHBvY3rEhXdzenkgb2Qga29uc3VsdGFjamkgbG9rYWxueWNo
LCBwb3ByemV6IHByb2pla3Rvd2FuaWUgb3B0eW1hbG5lZ28gbmF0xJnFvGVuaWEgxZt3aWF0xYJh
LCBhxbwgcG8gcHJvZmVzam9uYWxueSBtb250YcW8IG5hc3p5Y2ggcHJvZHVrdMOzdy4gCgpPcHJh
Y293YWxpxZtteSBpbm5vd2FjeWpueSBtb2RlbCBmaW5hbnNvd2FuaWEgaW53ZXN0eWNqaS4KClBy
b3N6xJkgbyBvZHBvd2llZMW6LCBqZcWbbGkgamVzemN6ZSBuaWUgd3ltaWVuaWxpIFBhxYRzdHdv
IG/Fm3dpZXRsZW5pYSBuYSBMRUQgaSBqZXN0ZcWbY2llIHphaW50ZXJlc293YW5pIG5hc3rEhSBw
cm9wb3p5Y2rEhS4KCgpQb3pkcmF3aWFtClRvbWFzeiBNcm96b3dza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
