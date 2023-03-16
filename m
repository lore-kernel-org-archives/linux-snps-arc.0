Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2579AC6FD19
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Mar 2023 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HV2UAZ46ME1b4BkaDeq65/pr0NgdbnBDMYKGzeCcIww=; b=IP7baC8Y7Saw1C
	wO73xU/I+7loUVGYGlgohJlFhYe5kQ29lLbqUEuYh44oO7J8Tb5pswTYtOXz40kp8poKydHpKMRzE
	PPkv4lTEJPTEJP5qulIG3cKg3ECg6lngsWceFPLSz/+u4LgpJ9E1dBN6JBx5jPxgQX8IdFmh811zf
	DDHUM0UtA0XwvEo64iayW/d+FyogPeo4kOSlIN1AX6QU+wpjjWO/vmX3fK0nKsVEuwP5PjOG7NjTx
	56PKKeCW+pndaalqaUxOWmZ/23yu5h0FLnYGXW9CG3PlfFRMRwsGmCK8lsVb5ob+dYYz5GJb/Vjx8
	c9V1CwHDXhQjQuqomfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjQ4-00FnIB-1L;
	Thu, 16 Mar 2023 08:57:08 +0000
Received: from mail.corrib.pl ([185.58.226.145])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjQ1-00FnHJ-2H
	for linux-snps-arc@lists.infradead.org;
	Thu, 16 Mar 2023 08:57:06 +0000
Received: by mail.corrib.pl (Postfix, from userid 1001)
	id 04081A2A69; Thu, 16 Mar 2023 08:56:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corrib.pl; s=mail;
	t=1678957004; bh=X6IEpSISwJiYlJ3uA866lskXve3r+4o2hf4z7VM6m5o=;
	h=Date:From:To:Subject:From;
	b=g1fRXuQ0e/pT0QGS457tosMVdAoF6SuFib0Jx2r0hVZftqT5bTcVg5B4HBo1B4faP
	 +otPKI3/lEYOtvwxyrlF15HN0Ls9ogkmPRy0J31hPmD2DAdIgrdlXO47WtUO6MSbo6
	 bRNTdFDT/pDnpmePBuDKXjIS86Tet0WFehPpT/ECKJAjKVqXlbyRxsV9QM4Cir1THe
	 zutOoQXpTFtsNroe7scZIm6YX4h1GijEkfDOQYXZ9cuK4MnaI4e5M8cpQ1/GRZHZba
	 r0y+yDG1fyEXoD3dBMZoMDJ0h+ELJzN8oDpYwTG1dX9F2ojsmGoFkYpdSWUpqHUosQ
	 OKlDPsaHK+qcw==
Received: by mail.corrib.pl for <linux-snps-arc@lists.infradead.org>; Thu, 16 Mar 2023 08:56:02 GMT
Message-ID: <20230316074501-0.1.63.j07t.0.9gv8yrpj40@corrib.pl>
Date: Thu, 16 Mar 2023 08:56:02 GMT
From: =?UTF-8?Q?"Szczepan_Kie=C5=82basa"?= <szczepan.kielbasa@corrib.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Faktoring
X-Mailer: mail.corrib.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_015705_895175_3265E72E 
X-CRM114-Status: UNSURE (   0.84  )
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

RHppZcWEIGRvYnJ5LAoKcm96d2HFvGFsaSBQYcWEc3R3byB3eWLDs3IgZmluYW5zb3dhbmlhLCBr
dMOzcmUgc3BlxYJuaSBwb3RyemVieSBmaXJteSwgemFwZXduaWFqxIVjIG5hdHljaG1pYXN0b3d5
IGRvc3TEmXAgZG8gZ290w7N3a2ksIGJleiB6YsSZZG55Y2ggcHJ6ZXN0b2rDs3c/IAoKUHJ6eWdv
dG93YWxpxZtteSByb3p3acSFemFuaWEgZmFrdG9yaW5nb3dlIGRvcGFzb3dhbmUgZG8gUGHFhHN0
d2EgYnJhbsW8eSBpIHdpZWxrb8WbY2kgZmlybXksIGR6acSZa2kga3TDs3J5bSwgbmllIG11c3rE
hSBQYcWEc3R3byBtYXJ0d2nEhyBzacSZIG8gbmlld3lwxYJhY2Fsbm/Fm8SHIGtvbnRyYWhlbnTD
s3csIHBvbmlld2HFvCB0cmFuc2FrY2plIHPEhSB6YWJlenBpZWN6b25lIGkgcG9zaWFkYWrEhSBn
d2FyYW5jasSZIHNwxYJhdHkuIApDaGPEhSBQYcWEc3R3byBwcnplYW5hbGl6b3dhxIcgZG9zdMSZ
cG5lIG9wY2plPwoKClBvemRyYXdpYW0KU3pjemVwYW4gS2llxYJiYXNhCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
