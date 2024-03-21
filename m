Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910ECC54E68
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 Mar 2024 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o5ieGCfJqpwaze8RzxQUfzsEZ8VvIwA+KH5O77UzRek=; b=qPaowoSpQppKYV
	IjtEOJB3FaNLhk6baWwXNQ+/Ns5qf9qoNGclzQ7Jg6FhCOV+ID4WLQGWy3FN0RzPz5/yzmFnPQR5G
	cic9LcItrf1+jThdFHSNDbjUbtOeySCSRF7tnV3EXfeuypc4D9zFqtsacxnSEEdJOpw7nAQctWjI0
	X7ABleuRFhhq0TNmJnH4FXkYF3vf5RqQIV9gcv/rnGhArxfra+N+Gxmp6naNLc6ixmB0N81W1fLuF
	aLec7aNr8lvn53Wex+dFAG1vChSOv+FjCZkUb8g9dDXeuFOAA31bmU0g51Cq4DTa00zIo/ePRm3cx
	iXF1OIQnudqMODW1TW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE5F-00000002NaE-0R7f;
	Thu, 21 Mar 2024 08:47:33 +0000
Received: from mail.haughton.pl ([195.231.81.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE59-00000002NUn-2rfn
	for linux-snps-arc@lists.infradead.org;
	Thu, 21 Mar 2024 08:47:31 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id BCE0D83997; Thu, 21 Mar 2024 09:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1711010844; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=WdR4O3R0EtMZRxjRKTx8KMUvHeunHla0Xj42TORMeHLioKV3CbcR8L2FguZoN+aKD
	 2p0LqQNtacsSKzq+fcYmZLn1o/ikMgVRRA3SUnAOg2WDXxHutRVRJNZpLs/LBO1iN/
	 AWrzndJp6X3IwodGkAePchB6hWhUYhQnPP2b0DhZXTlEkA/CCM98554kh4K+NaGgrQ
	 jxOUflWIJQQdsUkpldjXM3bGZKFJVyRAbo4Au4ac3/ISB/hG7ZrmaLOaCdHasXqTdR
	 3gKuTm/103casuzKl8uDxfGDDzAzdxoQ0wKUivuN3mKK7CpjHqUJ8Hq1acrJ9wFNZi
	 Hom36GVCrJZkg==
Received: by mail.haughton.pl for <linux-snps-arc@lists.infradead.org>; Thu, 21 Mar 2024 08:46:21 GMT
Message-ID: <20240321084500-0.1.16.bqa6.0.3n07kg33o5@haughton.pl>
Date: Thu, 21 Mar 2024 08:46:21 GMT
From: "Patryk Wysocki" <patryk.wysocki@haughton.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_014727_960753_C6FC1CD2 
X-CRM114-Status: UNSURE (   1.23  )
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
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
