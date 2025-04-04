Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F340C36010
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Apr 2025 08:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5em60Q9c87RokXw8BN4IVJtmNYnJHmw8hSk6nXUmAPU=; b=vgQ53TQoaxcvj6
	mwDJ8b1mx7/BHkGVNXjoMPeesqlKKQIJLUGW/ZOSOT2XD8oY5ChkGdef4IcjMYr/0AxIS2IbOe2fl
	jVP2l5wyGfkSIAIUwIcGIVW57QJrg7TBhLRTvn11RQZN8P7wxX6L5HZT0+9iJv+SD1YSgCV3fC1KQ
	IQ4Mx+HsWMoU9dobuBCylyXphJNbOHTaDTguIiUlA5gh2xCSo9uaejNxOSK/JXh949Kxm9svl3BII
	mZMSl7T0pbHYXcAFEhd0Y01FoxnC1mRWcSt1Oim0Md4ItoftTFGxdz0mHAEtd4zwMRnLchb3OhhuV
	Z/p3s7zr1qLewb6fyd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0c5b-0000000B6Pc-3aDr;
	Fri, 04 Apr 2025 08:07:47 +0000
Received: from mail.ventrixor.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0c3x-0000000B6JJ-2JZW
	for linux-snps-arc@lists.infradead.org;
	Fri, 04 Apr 2025 08:06:06 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id 395A525CB0; Fri,  4 Apr 2025 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1743753964; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=hUoM8bsgo+hjlGho5K4z4e5mnQzx4tFs2r8d+pWUiq5QWnazTnDyJHc6Kc6vitBbr
	 1npeLHShwbRNNsqP7gMF2RydwZMR4D7N9ZWhOS40KF1JUq6n8DAYeA+nMc2ghZh4ty
	 YEpNiG2vTQ0NWyJbb1Dfn5Z9c69uTK6HWhknmfZapR4WIpDsITsaNSSQ9Co1sNc4NI
	 ztz1qVqicBBfh8oztGeXbf6o0VintFucnUSU9pw+y7brQrdgBqipIt+8ZBInHLEMbo
	 s17Gt4vTOnvicreOkRoI9DaHC24n4DyW6B7adSdyD4ZjJ3lfomGNjMlXDb4hfnZMLr
	 5MRVmhon2w9Xg==
Received: by mail.ventrixor.pl for <linux-snps-arc@lists.infradead.org>; Fri,  4 Apr 2025 08:05:41 GMT
Message-ID: <20250404064500-0.1.6b.1c9ig.0.nfcamr34ew@ventrixor.pl>
Date: Fri,  4 Apr 2025 08:05:41 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_010605_729115_1E8A860B 
X-CRM114-Status: UNSURE (   1.28  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPyAKCgpQb3pkcmF3aWFt
CkphbiBBZGFtY3p5awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zbnBzLWFyYwo=
