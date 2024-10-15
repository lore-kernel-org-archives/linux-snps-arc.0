Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36132CFC274
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2024 08:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oz9O2jib7INpYtcZvUqd/rl33WkHO8OC4nHr9CG3oHQ=; b=IDBVroMSqkc9cH
	7903u6Mzpm10zkS7vLPnHaY0GC9ZYfUe4Mm5I+4RhLDZyi45lzgIwlA9VePqy+Y2x/GOOcP48iT8T
	eebVC4T3hS5OhI4jRAyA71z3bFrtT8mPuaK8CO6/s0EGmfUSZtNoTuB+fgBIKEycxsYAiFAM39Dff
	2ZPTCvqd0B7ZD7cX14MIRkcmUgyM2iY5RrDC954MHZkjlZBC/xmwxEplGYgEW38LWjB4VI+7D8EBd
	qP64hry0FAe12dTlVvAPJ+Jb2f6ogVO9dUHPHNGjR1JDuQbQWuAcrPZPHVh8A+k21++wtmuwJrpn/
	fdsObi5Dq+YqskzV6SvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cYq-00000007R39-2slK;
	Tue, 15 Oct 2024 08:05:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cTo-00000007QG3-2vk7
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 15 Oct 2024 08:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=; b=ZUiOPrGObXxM+xKtdXeFhNI0iF
	FRxWaZx5O3JfwkfYMRk7bPLgu5F5oUa1G6E5DhoRIivPkkcbFXZ95rOB3OMccZGUFO4ho/xtYWjH/
	7gl1OG2uWs7L9YKmkqYC3RX6pbwM3X42Wevz4oj24IxgOlfHR0yR3mIzk2Wz95FwQL+wsre+Rv3u2
	mUGXolmdo2+7V8DsHK75oKDC2zEoMC90NBBBcCT2JxJ+/EM+Tdh63W+ktXlO+0OP4o6Bmd2ohrwx4
	ZYJKxG4ylAHNVm/qYme+VkHJ08SWXDV35JPqDSorbecKq8sxmITqWhiF14qorvVHO7Wdckagczzxp
	M7LQfL2g==;
Received: from mail.geniusthrive.pl ([217.61.112.199])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cTk-0000000437j-2Mk7
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Oct 2024 08:00:31 +0000
Received: by mail.geniusthrive.pl (Postfix, from userid 1002)
	id E1F52844EE; Tue, 15 Oct 2024 09:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geniusthrive.pl;
	s=mail; t=1728979005;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=rqDHdB3jA5PLvFDsQvSHpKgCjpmFmGrvHEShMfeaRrVSAJilKUNMy+4HL3g2orNOy
	 OgkRbsMuLDROjUA8+CmSX+IYi3jxJiVScUkxLsxrDiG3uWFBG3vkjBXR6bq/Ipc/tt
	 7vEqgnTFmWYcCY/69mu/a0Cxl8tX+XuKXMjoOfQnI6+autEgqQlm2lIsC59odjXg3K
	 kWbkPWzDrsQ9I6pfYoIyX98AjWeTTBtSI+TvVm12voQJUC9W3Z3LWIpYzrOjgJt8lg
	 yeKazSUy68utCSmW5rWOkazHfOOKWJ0rnLYg56v+KJNwQRvSYlQy4o99Uqo0dEdkrU
	 mEP0CAW/laKaw==
Received: by mail.geniusthrive.pl for <linux-snps-arc@lists.infradead.org>; Tue, 15 Oct 2024 07:55:30 GMT
Message-ID: <20241015084500-0.1.aa.1gs1h.0.8zph2rpkdh@geniusthrive.pl>
Date: Tue, 15 Oct 2024 07:55:30 GMT
From: "Patryk Wysocki" <patryk.wysocki@geniusthrive.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.geniusthrive.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_090029_599088_B02DA62E 
X-CRM114-Status: UNSURE (   0.50  )
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
