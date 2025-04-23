Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B294C369CB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Apr 2025 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jo5iin0caJAv3vTQvqoy3LNvmUzjq/N37CtcqLh3s80=; b=WNy9oOY1N3zelv
	izGpw6tTZcNQZH918UlOQ6KXSEom0OzGT0aI5LaXNhqgdPBDBbR6wBpoNdsrnwyJPuirGRvesolFz
	NcNYZfF5m4cgdnPfy6nBciKIqLe9RhBJwRJG4pRCAFOu1NP62jd4F+me0LUxR+mzztidiOkfYi56r
	erCTCN5srQPctPlA+qrTHhpjoAoT2dK/F9+qAobUd6PzMn8jGDAJvAZdgMuefRpJ8fpxpLjSA7Bt8
	9PZ8ATfwXi21m7orty1N/fWyEGonQUNPVy1DHr64+Pr6GL25xJ6OMe94XZmM5J9HVk99Yj/NDx1Yk
	k7MCjThinwx7+5Vv6XXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VR7-00000009jbX-0edu;
	Wed, 23 Apr 2025 08:26:29 +0000
Received: from mail.astutebeam.pl ([162.19.205.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Uui-00000009aBA-2UCH
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Apr 2025 07:53:02 +0000
Received: by mail.astutebeam.pl (Postfix, from userid 1002)
	id 3724C26893; Wed, 23 Apr 2025 09:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astutebeam.pl;
	s=mail; t=1745394712;
	bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=b54zfuWCdsKpjspDLIFA7uf1sndNhzXndgzrRZKfLD6vKYEojH/XgFcSte7vTUNif
	 /TAX0F1LRmBSoLeOka40IYLxADZRy5BUj09o504R+Y3r3q1b9sTfGNagIeMgEOirpc
	 7Nu4KWUCz3p7H7ePbI+w/zPKvRFL1ch3E0U4dMSLi7f+v48lhtH/PSTeoZYuDYcI4R
	 12NQSP2JSyfZ3B3r0cw5GCiAr+oxBUKQduKvB084jbNePhN8sWPpt4w1nOqNeKLQVa
	 kxSWe5hrVIhSw5K3sgZTnzMndBluCx2LGXCXpbl+odb/PGRDwqkZ2ZT3A5P1SvPQYs
	 NopW2zPkVPYXg==
Received: by mail.astutebeam.pl for <linux-snps-arc@lists.infradead.org>; Wed, 23 Apr 2025 07:50:57 GMT
Message-ID: <20250423084500-0.1.hs.1d9tt.0.qio7v4ssg9@astutebeam.pl>
Date: Wed, 23 Apr 2025 07:50:57 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@astutebeam.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.astutebeam.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_005301_331607_2EEF4F62 
X-CRM114-Status: UNSURE (  -0.00  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
