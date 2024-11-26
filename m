Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAD1D3B7C1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Nov 2024 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oz9O2jib7INpYtcZvUqd/rl33WkHO8OC4nHr9CG3oHQ=; b=TjNngpacDFFHW8
	7rX4PfqRRpDjYDOyF6qg/Ew3wb8aqGES0S2tCa3YQ1meDXRTr6rhdTtCThNuEJvkPwmdtCFShZWnj
	IF6FMaO+vQAXFVnz3WrV+L5ZLB9enj46K90fF1ldgwt1FVT9653z1Tp3afCxiCkkaK+nBnJUhiRXP
	01fzJfnRV+95mLUdOAmjzec2hBeRSN+x4eNuuSW05rV78As6uejVxjnxD5bYZmu0TiDFsoTpVdn5t
	NJnG0KsjSgiAtNa8rndA0Cl67+UwQvp/+mdIzeJtuR/dQCuOrwiFNA+6nUMIEB5T6VYIpMyo3WFxA
	Y9geDmmL00lz2DUmZIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrjR-0000000A5VC-2Yi1;
	Tue, 26 Nov 2024 09:19:41 +0000
Received: from mail.sharpwise.pl ([5.249.155.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFriZ-0000000A4h6-1AOT
	for linux-snps-arc@lists.infradead.org;
	Tue, 26 Nov 2024 09:18:48 +0000
Received: by mail.sharpwise.pl (Postfix, from userid 1002)
	id 5BF98854F3; Tue, 26 Nov 2024 10:17:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sharpwise.pl; s=mail;
	t=1732612648; bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=kFa0H6C//39kdTn+H+LD3/uoRLR8H9pBx0mwAC1+OX7xvJrSW8IZQ3nn42z6HEPN8
	 6eiD6Yxg5iIRYquN7WLQBhuAjuM7un2WC2dQOGybYCrlLVQD21DsGoIIjLMp1vpkx2
	 ATnBBJrUs08CBJkZo8rhCy2zLhSxxx9b7DlABbDMfW0keBJe0jvdHd6zwP0oRN/184
	 gtNbaXCpG98Lz6lsvktwTt/B8EAELuqKZbbWOV01njMx6Jd4pStukV0x3To28d/gb4
	 tihtr8atz6bI4TY+rGz5TMyvQG+DPEtUEZvRY7og14yk7ALYQNpoXBl9zxsTUvGNGx
	 DPmoebOpm/6ig==
Received: by mail.sharpwise.pl for <linux-snps-arc@lists.infradead.org>; Tue, 26 Nov 2024 09:16:18 GMT
Message-ID: <20241126084501-0.1.83.1b6nm.0.6fka2tp98g@sharpwise.pl>
Date: Tue, 26 Nov 2024 09:16:18 GMT
From: "Patryk Wysocki" <patryk.wysocki@sharpwise.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.sharpwise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_011847_463761_F81E7636 
X-CRM114-Status: UNSURE (   1.76  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8KCgpQb3pkcmF3aWFtClBhdHJ5
ayBXeXNvY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
