Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEA8C8300F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Aug 2024 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zwvG9IvKO2ARj40q4RTKnIHUb+/Qu0IARwGIwke4sx8=; b=1ym2+ok9i+Q9f1
	INDPR+eF8X7WaCt9QX89Vp8hT5gpy0qY3XknOfMlmHUePMqAjIzRBI9sFUZ/Gl0sY10+nM44hlnCo
	ncLgrC02iITZK5ySRJJPtXXCpVv7f7JnX0dRvpB1tvTBcvJ+lqaUJO2Gs39S5CCTPnbp4l3aFDojz
	eczZk/5fLX/WibqEvAXx13CHuPIzXpcVcjyrtxwhtQQHxZL9SOV2NeDEl9TEa8MOAiKHdP+xQBPjf
	sxNgaM69l+3pAeGQYTI/CZ8nK9DFtaov+xnvrzcv3NcFobkTxemUMrSud13WdadLQS6sgVSsSpBSe
	JD+iwYZN7PQug3XENM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjapB-00000001DJI-1ZgC;
	Thu, 29 Aug 2024 08:48:13 +0000
Received: from [103.240.110.122] (helo=mail.arsenet.co.id)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjaoZ-00000001D06-0syF
	for linux-snps-arc@lists.infradead.org;
	Thu, 29 Aug 2024 08:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=maai.co.id;
	s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kdRVH+YhzleuV+zsEjhpI76q72s71W6sCQMg3VV8G9w=; b=N7oaaaDO/ApTfifn/3ZS8b8UIU
	b8AyAZ/H0YDPfMdxeQdqusKGLQEFSyEHj5CK7c0dYM2r49ZwMsjUXXw2gbsrB8SImYquJtl4Q8avI
	96MZLAO2ABOyeM/knWyGNwvyk2BbEqrpHYksg3ksCYfV85nypDPgAbg5q9TtYo0/xvUQv4N4KZGyT
	Y7gutYgvQWUVvBb/hIIcLcHDRhkC4RpZS/dwJmKA2DFhb4Wb1CacdSIQ8wRsKQd4h1rmQ4oP+Sufk
	td6AFL6OZjONHNCUOIwC/mLmILKVUvcDfTWMaO1gWOAVbyUQF/2hUgOxBIWJ3YqMW12+Z2cDPEwXJ
	3+7ecrUw==;
Received: from [46.183.223.78] (port=55210 helo=maai.co.id)
	by ns1.titipserver.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <info@maai.co.id>)
	id 1sjanj-00C80h-1s
	for linux-snps-arc@lists.infradead.org;
	Thu, 29 Aug 2024 15:46:44 +0700
From: Saudi Aramco Petroleum <info@maai.co.id>
To: linux-snps-arc@lists.infradead.org
Subject: VENDORS EOI
Date: 29 Aug 2024 11:46:41 +0300
Message-ID: <20240829114640.EE162F519F6B71D7@maai.co.id>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.titipserver.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - maai.co.id
X-Get-Message-Sender-Via: ns1.titipserver.com: authenticated_id: info@maai.co.id
X-Authenticated-Sender: ns1.titipserver.com: info@maai.co.id
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_014735_654408_55E228CD 
X-CRM114-Status: UNSURE (  -4.18  )
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
Reply-To: projects@aramco-tender.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

R3JlZXRpbmdzIFNpci9NYWRhbSwKCldlIGFyZSBleHRlbmRpbmcgYW4gaW52aXRhdGlvbiB0byB5
b3VyIHZhbHVlZCBjb21wYW55IHRvIHJlZ2lzdGVyIAphcyBwb3RlbnRpYWwgYSBWZW5kb3Ivc3Vw
cGxpZXJzIGFuZCBwYXJ0bmVycyBmb3IgdGhlIEFyYW1jbyAKUGV0cm9sZXVtIFJlZmluZXJpZXMg
MjAyNOKAkzIwMjUgcHJvamVjdHMuCgpUaGVzZSBpbml0aWF0aXZlcyBvZmZlcnMgYSByZW1hcmth
YmxlIG9wcG9ydHVuaXRpZXMgZm9yIApjb29wZXJhdGlvbiBhbmQgYXJlIGFjY2Vzc2libGUgdG8g
YnVzaW5lc3NlcyBmcm9tIGFjcm9zcyB0aGUgCndvcmxkLiBXZSByZXNwZWN0ZnVsbHkgYXNrIHRo
YXQgeW91IHJlcXVlc3QgdGhlIFZlbmRvcnMgClF1ZXN0aW9ubmFpcmUgYW5kIEVPSSAoRXhwcmVz
c2lvbiBvZiBJbnRlcmVzdCkgaWYgeW91ciAKb3JnYW5pemF0aW9uIGlzIGludGVyZXN0ZWQgaW4g
cGFydGljaXBhdGluZyBpbiB0aGlzIGVuZGVhdm9yLgoKV2Ugd2lsbCBnaXZlIHlvdSB0aGUgaW5m
b3JtYXRpb24geW91IG5lZWQgdG8gY29tbWVuY2UgeW91ciAKcmVnaXN0cmF0aW9uIHdpdGggdGhl
c2UgcHJvamVjdHMgdXBvbiB5b3VyIHJlcXVlc3QuIE91ciBkZWRpY2F0ZWQgCnRlYW0gd2lsbCB0
aGVuIHJlYWNoIG91dCB0byBndWlkZSB5b3UgdGhyb3VnaCB0aGUgc3Vic2VxdWVudCAKc3RlcHMu
CgpXZSBhcHByZWNpYXRlIHlvdXIgaW50ZXJlc3QgaW4gdGhpcyBpbnZpdGF0aW9uIGFuZCBsb29r
IGZvcndhcmQgCnRvIHJlY2VpdmluZyB5b3VyIHByb21wdCByZXNwb25zZS4KCktpbmQgUmVnYXJk
cywKCiAKIFRBTEFMIE9NQVIKIFZlbmRvciBDb29yZGluYXRvciBHcm91cCBQcm9jdXJlbWVudCAm
IENvbnRyYWN0cyBTaGFyZWQgU2VydmljZXMKIENlbnRlcgogU2F1ZGkgQXJhbWNvCiBQLk8uIEJv
eCA1MDAwLCBEaGFocmFuLCAzMTMxMSwKIHByb2plY3RzQGFyYW1jby10ZW5kZXIuY29tCiBLaW5n
ZG9tIG9mIFNhdWRpIEFyYWJpYS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtc25wcy1hcmMK
