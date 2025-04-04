Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21384C36010
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Apr 2025 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5em60Q9c87RokXw8BN4IVJtmNYnJHmw8hSk6nXUmAPU=; b=kVjRgBEhTaNIfz
	42Cp0x89TMjlKuCsiBtprxlzBJIKNpw5nkoycxgJVBKqj7t+l43lrLu/E7tu643Sb1Jsim4SQtw3U
	k0vLArHr6NQ4mpfgAEPMkkhAOA4aDvMvoqZvap1zNz7JicN+fy/w25qN3gMkJ76kY5lmMUPYmgX8U
	ykassHgEOKe/jt0QXsiA7rWGFmZ7ZLSrWhUm5ac73Wau5es70cYdtTvNdyiCD7eSA8n2o9szH/SUp
	K2keCrLfpozOjW8Adiigt+/vaznM/ULetQnSdLoMj4r1wKQzkop/8IEdrA6ak3IsBl1qrN5TDfibV
	3nh670eVTULOtXbCDuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cXZ-0000000BAJC-2sdD;
	Fri, 04 Apr 2025 08:36:41 +0000
Received: from mail.ventrixor.pl ([91.134.88.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cVs-0000000BADD-0pqE
	for linux-snps-arc@lists.infradead.org;
	Fri, 04 Apr 2025 08:34:57 +0000
Received: by mail.ventrixor.pl (Postfix, from userid 1002)
	id 84693262F5; Fri,  4 Apr 2025 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ventrixor.pl; s=mail;
	t=1743755603; bh=Pi9+p40l7//vLKO8DuYTv+ORJz3B9aWETGdVOxLyydc=;
	h=Date:From:To:Subject:From;
	b=vEbh3aaIfBWkYV8cRdhH79Q3SlVhTWCfKdZs28NLxHj2MVmmaaGqdHaJfBXC9MQ/m
	 N0Y/8meQqvHE5uf4qhPdbnhXVhEtkqcSME0/bGc9o/lxS3tbCDu/9kdcn/OgnFNEte
	 WUQiOLKld+FIdYOUKKGHTqzwg4cgQrJaSpqQyKzXSyK1J9+V9E1NWa2H1mQFYU7Ex1
	 pgAs6CG/3PzKp7oCg/ywWEHDCh6wTFHUSjsgkDxlSa2ddsv0q0GxW3qTEyKgCP1cCd
	 ux+fgAlEa6ew9i5C2h8bkSlwr7O7YRzy+P4EQ2EXc4+YwCmZDYaksxqoxAXcIuI0jB
	 NWH3weWECw9Mw==
Received: by mail.ventrixor.pl for <linux-snps-arc@lists.infradead.org>; Fri,  4 Apr 2025 08:33:09 GMT
Message-ID: <20250404074859-0.1.6c.1c9ig.0.qu399d9h3j@ventrixor.pl>
Date: Fri,  4 Apr 2025 08:33:09 GMT
From: "Jan Adamczyk" <jan.adamczyk@ventrixor.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.ventrixor.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_013456_374578_FCBE2774 
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
