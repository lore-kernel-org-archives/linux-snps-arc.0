Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA855CAC58F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Sep 2025 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jo5iin0caJAv3vTQvqoy3LNvmUzjq/N37CtcqLh3s80=; b=1DSI8/LEWt0tBq
	XYKp9mnOnQnninMZ2tycr3vSkVAn5SPWI41O0vdO+GqVoHwf/oo5NNlKyHR+lCqeiJP9hRvDaT+2L
	nmH0gAertMBXguajhtcNuzSys/22pd9M1fk8aP/z7aVNigy/I5aURSpVn4/4Blyw1HCXsMBailYYZ
	KVG/0ocYEUgXFBIkcUxf+6jNe4fupXeAaKgph1vvC/0H+GvossrIxPtrfdx1dMln1e9+0XUI8vLpr
	5Qt3eLYR7Lx87+P8HaMzK0+CQWNHsAXGOYFyDG6n6AgcoGVgijclx0GObys5OBwJefVfbkcW/SWdp
	lbiWHQuTXzq9aXj1pEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy44d-000000037j2-1WZj;
	Mon, 15 Sep 2025 07:56:31 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy44a-000000037iY-30mK
	for linux-snps-arc@lists.infradead.org;
	Mon, 15 Sep 2025 07:56:30 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 9AE1BA55CF; Mon, 15 Sep 2025 09:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1757922984; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=x14gaqCsQgBy1RSlSJ8YI9csg3dJ5c70rUR4z0YxlXPBNiGNZs2KFxAQnc2LW9v61
	 DQAV0v1DuOPwiN1CSTchDGMNcT1Agt77Fkg4awYmJgvVA6c0FCGSuGif65x7ahrkUy
	 fSxGCecjptjYgSogaTQRDP5hS+wObJPPHHg1Uk9O7TVq7C3oVw1WUrngN9afPDSh/7
	 IUDwpwmI+4jDkHKwbS9cccVDAcc1PauB6sOlF3cUkv64uY8C/ULDNk9Ap+u55utdrR
	 eYzp3LzWc26+NYinE6Ex/Q+GpUPQfhgbRbvaor/dQyj93KNL201kHYphGnT8EjyFmx
	 sLXl2d3mgXNYw==
Received: by mail.vexro.pl for <linux-snps-arc@lists.infradead.org>; Mon, 15 Sep 2025 07:55:38 GMT
Message-ID: <20250915084500-0.1.nf.3yuni.0.8dg7rgnymu@vexro.pl>
Date: Mon, 15 Sep 2025 07:55:38 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_005629_025192_325260D4 
X-CRM114-Status: UNSURE (   0.65  )
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
