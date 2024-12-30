Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E16E77188
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Dec 2024 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qC9owMTkZV+11so9kTBz09X6j0dmltQZMdd4aJDZVGc=; b=ap1eh05KEkBvlV
	xDWzNS/pRKgUqlc1rYG53OUpTT2qZIpC8xqGYNwYuSyC+FGT/ht41eTSlq2+O4Z2XwWW7jsSzpEVO
	1P3MmCLGI7CMGMmH1BY4uO4/WvvnHPZ3sgpAqLe1PhEH7Rz8n3cLraIJgQCzc58wDVKEI+ee3VG53
	+LghODPhSSt6haJIt7oC5WLweE2nvnrCUkZLziw7pEFY/aN9k5JFqSJ5AmHJW6kkdtxyrp0bEKTMP
	mcSQkkOhLsa9xO7GeCAIf/M840xMo88yGk68AQQJ5o8SL2uY0nwz8wK7YFX2m1e7H/NDReMU9v8Cm
	JXIzsiznSCDFC/2DkwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGU2-00000005KCf-3RQw;
	Mon, 30 Dec 2024 14:11:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFWI-00000005FJc-3way
	for linux-snps-arc@bombadil.infradead.org;
	Mon, 30 Dec 2024 13:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VL5yUWcYeO/+41IWEwU5ih2KiIhi0F9iezSabocUnLo=; b=i7a06wShgI5+YGWZaHNugYyeuw
	xl1eWNROZ+rXXlocHcY8UREUK8cjJpzqGvnD0tkNZsmQGX/AteLMorlXNkqiHarpCv1rk50Y/nG8M
	qI02zorMKUxZOTW/LXVEZ9XHsP2seCwfiqeiz0I52ITXGFJrmCqLtfi7mAbgjtjx/MOlDi/znkVQi
	fJShuXmyAqy2Uqdk1S3WF5oPI278xSLNDtfVmwa3P+MxZqc+olAEihCvnlHjI/2PEipkM9ItGMaBH
	36TSkF6Sko3pIavLpmooNPjoL22ir+4ijDddMQ42tIfA4FJIJHnc+nOXp+kQWe4vxlkmxXgjjxpQv
	9bpXDA/g==;
Received: from [217.61.0.218] (helo=mail.startupcovey.pl)
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFWF-000000006VT-0Sc2
	for linux-snps-arc@lists.infradead.org;
	Mon, 30 Dec 2024 13:09:17 +0000
Received: by mail.startupcovey.pl (Postfix, from userid 1002)
	id 3D1E28358C; Mon, 30 Dec 2024 14:08:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=startupcovey.pl;
	s=mail; t=1735564139;
	bh=VL5yUWcYeO/+41IWEwU5ih2KiIhi0F9iezSabocUnLo=;
	h=Date:From:To:Subject:From;
	b=KoG3p+1xLd2qpFVnoD4dCR9VSXpztCs5uT/oJfHnpWq4n8CYWeelO+vGHqyqaWSye
	 SjKLbAzril9FlUq3QV3cHkQZUcJetavyDFJ0cRSWuIbgG3aIxKU51zGhkhNRdLpyD4
	 aRBdcOFkzE2OgySyJGgnvm7zlK71SrxxzV9APqyCnYmoaBVs9NkXvLkOsi0sQfalo2
	 G33nKEPd7G/PAVFpytM0YUffT2BFI9hN27gvCw6RQqaC+Zt9rFQRVvbamlavrcIKFH
	 8U0efuxW+sw/K62bCvQi2JAqM/tnHuu93bXLlGQZav2FxMBES8JZbuyXFNhBUvHMsA
	 H5sVuupDuCqnw==
Received: by mail.startupcovey.pl for <linux-snps-arc@lists.infradead.org>; Mon, 30 Dec 2024 13:08:17 GMT
Message-ID: <20241230134314-0.1.f.24yb.0.69anhc38k5@startupcovey.pl>
Date: Mon, 30 Dec 2024 13:08:17 GMT
From: "Robert Paczkowski" <robert.paczkowski@startupcovey.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.startupcovey.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_130915_770681_59F9A16E 
X-CRM114-Status: UNSURE (   0.43  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0gc2VyZGVjem5pZQpSb2JlcnQgUGFjemtvd3NraQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
