Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF5DCAC5A5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Sep 2025 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5em60Q9c87RokXw8BN4IVJtmNYnJHmw8hSk6nXUmAPU=; b=hcH6FOpZ1QC2IB
	/o5ZuB7WPSGW+s8wlQ2izQcYZY87dobcfJUb7Ub+26Y8VXM1Ol+zHNW2Vlkg8Ic0m47v3pFin26do
	3/eY4KKEr6RVPp7fPO2D0LOiziiquUWhnzQm+Mk/7dO4X+yNj1p9bC6zCEgzPqFw07cDDjsAxzUDa
	l6cy8Uknf2MdexVYnLMCmJ218ClNR35OUkh0KV+o5QVuhrmZOmCvV8GUmvlF5vU1zVtmz1Kznei5b
	yP9TXVqJXGI5QqygAIpRqRWdkpyPNOOBkRzvfXPWPTOjl2RhJZM3jSJAh+LjNFJ9dsFg180F9nX6e
	vYN+PAyDu88GteD4oz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVxw-00000002Ant-061x;
	Fri, 19 Sep 2025 07:55:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVxu-00000002An3-1h6u
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 19 Sep 2025 07:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=; b=qNcCS5oo+U43P4fSuOQs1m1hux
	Nx1w+a35Nq9jgm/NWjfP6yGUnSWOCPT7ynFWP7Apyyj7CT1CtXUc/i9v3xEZ4ws02QHIXbPAGQQTt
	hFEApdVZUp7v0fZVfAwEPDE2Ph+ry+JFp8iwZnBEQPuhg3k6j3nIT4E2mrwvmJk/ksvhmELVDXy47
	4oYZ5Y7KW+RJek6wL+H5oKHPWeJVt+luTIxCFF66tSqjvz/jTLjkdsUpxip8gDCJm042U07ERHq20
	cpdtAxkoW1/dF2TyRzWsrSo2jbrQeJVkQRSNv/roJjWPHqYZzkPAaAZxshTslh79bEhz0hfgWiYUh
	Z2ZVYdoA==;
Received: from mail.ventrixor.pl ([91.134.88.136])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVxq-00000007mcC-3M6U
	for linux-snps-arc@lists.infradead.org;
	Fri, 19 Sep 2025 07:55:33 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id 38C1A25F3D; Fri, 19 Sep 2025 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1758268527; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=z17B2vYSqG+rR6XHnLx146Nbq0Ypko1jJJKnQOPhpn+BGe5v/dKpFGx9lM7QdBun5
	 iOv8mqZV9ms0FHAlcRWyc/7mhIla9UEPdK/Mh3zKT8Bo7w62gY9r8nIGjxlu5HfdO0
	 n7A4rqJ2Pp1IMwo9VwDzZ8J7zM4O/oRoeNvWJDNN5WhowkOe5Cl7Scw57KutYCY4UO
	 99XzXixP4HzB32iNYUjMJaoftR2fa1aq1W57GdNB877JQOwnAiGbgJZi7AsLuHqzdX
	 0AXRs95zLxylF47FhtQ618Y0bOsrRHX8pxu6VPwVbWoBIYGaV03FFy/3k8LgBb5+fI
	 YSUH7agKou1SQ==
Received: by mail.ventrixor.pl for <linux-snps-arc@lists.infradead.org>; Fri, 19 Sep 2025 07:55:18 GMT
Message-ID: <20250919064500-0.1.9i.266z5.0.ltyqml8ko2@ventrixor.pl>
Date: Fri, 19 Sep 2025 07:55:18 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085531_490643_3E2E3856 
X-CRM114-Status: UNSURE (   1.65  )
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
