Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A96FC3DA5D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Jul 2024 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YOE8WhJogGtosYg3kAD0fsluRq9MXuSLa4uuarOhIOo=; b=jCYqFc5O2+MhM9
	kF2NR8u1IzHS6Mpy1GW+bYzVOpsYlm7Pia6V0XFXDoWTPFEjUCSb1w9aIrwc0cu5Y5pxmgE9RmUlO
	n9S/s06K1VMJhngNZ+XAtE9Q34fW0xDeZF58zNNBhyBk4GuTozkU8kM6/78z0HS74aUh+iiQ7LxM4
	DRlhhcbGkCuVQMZvySYHtFpiUWKCzi1EbDokB+Pl8YOCvyX8qoDCKwoeIN5vzRi7MdHvUC809LSn8
	nwbn4f18qL8FugknA24L1ZY6P1JoYG+Tn83CppsWH42GEXAILh0zOuDn7VOxPr92gzRNvLKPWtAMB
	QrQbd4JcyrHCNtbsLxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUiqP-000000022h0-325r;
	Fri, 19 Jul 2024 08:20:01 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUiqN-000000022fk-1DQn
	for linux-snps-arc@lists.infradead.org;
	Fri, 19 Jul 2024 08:20:00 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 7AD6C8B573; Fri, 19 Jul 2024 10:12:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1721376760; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=hvxSGnY5mKgHs3ZSgwxopcSDaXC3F/Tii7kYCLdG+F8V6RsPnsytjsmUjmcOGFbhu
	 F9AsKyFMdXZC0W9528bsnstWO8SaasuouP7o707a9zSwzQFBYMG+OTzgKrxhA5pdXr
	 JhUEIDqFFmfLK1gRD371RGF+PJgfyFnHvHh+1DHmpNC3mvWjOYobXzlvCgBWdGLHpv
	 F6ag00B2m6vH3Q/cwT7ryIDJliQ9/x0WJUXshhnXbZ0tPDYe24+qbSJtXWAsS2a3h4
	 dRNfwOJ1ihPBK/ub0CZBg5IwARse50GQsiqwmpA82XZ5bYETz0+KtLlN2hVp2LL8Vb
	 zaLT0iyxEt9iQ==
Received: by mail.quirkbyte.pl for <linux-snps-arc@lists.infradead.org>; Fri, 19 Jul 2024 08:11:13 GMT
Message-ID: <20240719084500-0.1.4a.2h2jj.0.ghzg49oi2z@quirkbyte.pl>
Date: Fri, 19 Jul 2024 08:11:13 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_011959_481050_A5B4EB4A 
X-CRM114-Status: UNSURE (   0.66  )
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

RHppZcWEIGRvYnJ5LAogCkN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIG1vbnRhxbwgc3lzdGVtdSBm
b3Rvd29sdGFpY3puZWdvPwogCkluc3RhbGFjamEgZm90b3dvbHRhaWN6bmEgamVzdCBuYWpsZXBz
enltIHNwb3NvYmVtIG5hIG9ibmnFvGVuaWUgd3lzb2tvxZtjaSByYWNodW5rw7N3IHphIHByxIVk
IChwb3pvc3RhasSFIHR5bGtvIG9wxYJhdHkgc3RhxYJlKSBpIHphYmV6cGllY3plbmllIHNpxJkg
cHJ6ZWQgcm9zbsSFY3ltaSBjZW5hbWkgZW5lcmdpaSBlbGVrdHJ5Y3puZWouIEplc3QgdG8gdyBw
ZcWCbmkgb2RuYXdpYWxuZSBpIGJlemVtaXN5am5lIMW6csOzZMWCbyBlbmVyZ2lpLCBkemnEmWtp
IGN6ZW11IHByenljenluaWFteSBzacSZIGRvIG9jaHJvbnkgxZtyb2Rvd2lza2EgbmF0dXJhbG5l
Z28uCiAKRHppYcWCYW15IG9kIHdpZWx1IGxhdCBuYSByeW5rdSBlbmVyZ2V0eWN6bnltLiBQcnp5
Z290dWplbXkgcHJvamVrdCwgd3ljZW7EmSBvcmF6IGtvbXBsZWtzb3dvIHd5a29uYW15IGkgemfF
gm9zaW15IHJlYWxpemFjasSZIGRvIHpha8WCYWR1IGVuZXJnZXR5Y3puZWdvLiAKIApDenkgY2hj
xIUgUGHFhHN0d28gcG96bmHEhyBuYXN6xIUgcHJvcG96eWNqxJk/ICAKCgpQb3pkcmF3aWFtCk5v
cmJlcnQgS2FyZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zbnBzLWFyYwo=
