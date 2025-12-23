Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028ADE6F077
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Dec 2025 09:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YZIzPpOIZ4jTW9JlaQxahEHs7WccPK6kAklXfbeWZjs=; b=c8nj7wuUCAXYJ+
	+4+ByHCU7TY3b8ejNxAzZ6SVadtJr8NzXxpAEN8aLCD2yHMaXl7kDlqVrngjQOBoL7Ld9TlZSRwGl
	e1eAw2KKHh8SysvKUQ1zLs7K7ELsI7aLEojRfSE6q+Pv/caIruG9nOOwbmoFDnIbNs0782SgwxTSw
	IB4bD+eMJHImDmjb7HJSiqkzQfBRrJ4zX2yG72jymIxq0rjLpVK455/gMBWMGnVug2PucvVXRZk4x
	nqOZukPUIj1CUyRTcrRPB6DOrwKsVCWP9nEL/mlkqWS1pNOA8dViSFd15lGVLahSjoOVPdSIrdtCy
	rj9v3uNvaT9WOnFSkd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXySH-0000000EjEd-2Jax;
	Tue, 23 Dec 2025 09:13:21 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXySF-0000000EjD9-0TfM
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 Dec 2025 09:13:20 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 3F0EAA6925; Tue, 23 Dec 2025 10:11:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1766481114; bh=rBf3jQVFnGCeJlMPbA0E+WWQIPnf9AfAJW4UEB5U3Ig=;
	h=Date:From:To:Subject:From;
	b=kBPS6vL1WRvK7vsMD15QqiYKwayg1GrStWuyPWPfrB2tSnvTn9BcNzapOpeZxdBhL
	 5xcbJ8iw1jgrXJmGgWF5GtTM7tQrtdMJzc14rPxLmqXDD4P447l//160XgAz6nor2L
	 NaUOVaeCJs2iC+9F967YLPUKP20oMpvvHvaqXo6wjJjfcSBpcjRkoxxgEQnSlAYqOR
	 qE7jhBBwePKXjL8MW2awJHnk0J1+RPRgn90nyDWldnybD8NkNOdYTSZaKTFXR5RYRu
	 loTotgGWLMxCOc2KLuGuJ8MAhEzjMANOa936t16xL5icEGNMok2SiFb2p8yd+4Zf91
	 abLeTaJl8fJxg==
Received: by mail.vexro.pl for <linux-snps-arc@lists.infradead.org>; Tue, 23 Dec 2025 09:10:57 GMT
Message-ID: <20251223084500-0.1.pd.4t03i.0.tl8mbdp0op@vexro.pl>
Date: Tue, 23 Dec 2025 09:10:57 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_011319_621203_1A1405EE 
X-CRM114-Status: UNSURE (   1.17  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IGlzdG5pZWplIG1vxbxsaXdvxZvEhyBwb3Jvem1hd2lhbmlhIHog
UGHFhHN0d2VtIG8gd3Nww7PFgnByYWN5PwoKRG9zdGFyY3phbXkgaSB3ZHJhxbxhbXkgc3lzdGVt
LCBrdMOzcmVnbyBlZmVrdGVtIGplc3Qgb2JuacW8ZW5pZSBrb3N6dMOzdyB6YSBwYWxpd28sIHN6
eWJzemUgcG9rb255d2FuaWUgdHJhcywgc2tyw7NjZW5pZSBjemFzdSBkb3N0YXcgb3JheiB3acSZ
a3N6ZSBiZXpwaWVjemXFhHN0d28ga2llcm93Y8OzdyBuYSBkcm9kemUuCgpQcm9zesSZIG8ga29u
dGFrdCwgamXFm2xpIGludGVyZXN1amUgUGHFhHN0d2EgcG96bmFuaWUgbW/FvGxpd2/Fm2NpIGx1
YiBiZXpwxYJhdG55IHRlc3QgdGVnbyB0eXB1IG5hcnrEmWR6aWEuCgoKUG96ZHJhd2lhbQpBZGFt
IERyemV3aWVja2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
