Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554ABC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 May 2022 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/vT14NlSnpeFbJpef9/6iVfucHzcvR+yuJBCsqQRKes=; b=RLgcpGJ1ddPBai
	nvLbGXzfjR5HxFq3ypH4wqpZXL+Tdzd4YXcsJ+CNhaPHPIPvqa8MrLiiBM/u9DN0nT2tVKvMH18xK
	K5HrzMCnAbPpC+4wpDU6olN1J25WfVoCQpmtvHEHrDpYuDWmRPBXzREpZtD+r/kSmoddrLNSjboLo
	NdojlWMQ6g1RGiOrff5XBBgYXVdrLsfh08rySlpN0gmOm8+/JcFEhj5KIXu3PKLGDSrmE0iLPbNX7
	XuwbXLXtELphr+DYIGnH9YWpcxKPXGy2OFnLNGeH4yqdPxVbuy0at4uCcfQtsJpoFJ48ubAUEd6dM
	hZbXEIOOgmqHfIjuFuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltsx-006LIz-Mg; Tue, 03 May 2022 14:52:19 +0000
Received: from mail.megasoftsol.com ([43.231.250.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltsd-006L4o-BN
 for linux-snps-arc@lists.infradead.org; Tue, 03 May 2022 14:52:00 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.megasoftsol.com (Postfix) with ESMTP id 1DE8290D907
 for <linux-snps-arc@lists.infradead.org>; Tue,  3 May 2022 20:17:05 +0530 (IST)
Received: from mail.megasoftsol.com ([127.0.0.1])
 by localhost (mail.megasoftsol.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PALGhNrYPkm3 for <linux-snps-arc@lists.infradead.org>;
 Tue,  3 May 2022 20:17:04 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
 by mail.megasoftsol.com (Postfix) with ESMTP id A4F3690D8E4
 for <linux-snps-arc@lists.infradead.org>; Tue,  3 May 2022 20:17:04 +0530 (IST)
X-Virus-Scanned: amavisd-new at megasoftsol.com
Received: from mail.megasoftsol.com ([127.0.0.1])
 by localhost (mail.megasoftsol.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mnomlWihrLgi for <linux-snps-arc@lists.infradead.org>;
 Tue,  3 May 2022 20:17:04 +0530 (IST)
Received: from asda.co.uk (unknown [20.97.211.134])
 (Authenticated sender: admin)
 by mail.megasoftsol.com (Postfix) with ESMTPSA id D768890D8BD
 for <linux-snps-arc@lists.infradead.org>; Tue,  3 May 2022 20:17:03 +0530 (IST)
From: ASDA Stores Limited <Hanes.Thomas23877@asda.co.uk>
To: linux-snps-arc@lists.infradead.org
Subject: 2nd Quater puchase request
Date: 03 May 2022 14:49:32 +0000
Message-ID: <20220503092157.D5903757B6B7C0B7@asda.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_075159_718471_D1B7D513 
X-CRM114-Status: UNSURE (  -0.57  )
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
Reply-To: sales@asdaa.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RGVhciBsaW51eC1zbnBzLWFyYwoKV2UgYXJlIGludGVyZXN0ZWQgaW4gaGF2aW5nIHNvbWUgb2Yg
eW91ciBob3Qgc2VsbGluZyBwcm9kdWN0IGluIApvdXIgc3RvcmVzIGFuZCBvdXRsZXRzIHNwcmVh
ZCBhbGwgb3ZlciBVbml0ZWQgS2luZ2RvbSwgTm9ydGhlcm4gCklzbGFuZCBhbmQgQWZyaWNhLiBB
U0RBIFN0b3JlcyBMaW1pdGVkIGlzIG9uZSBvZiB0aGUgaGlnaGVzdC0KcmFua2luZyBXaG9sZXNh
bGUgJiBSZXRhaWwgb3V0bGV0cyBpbiB0aGUgVW5pdGVkIEtpbmdkb20uIAogIApXZSBzaGFsbCBm
dXJuaXNoIG91ciBkZXRhaWxlZCBjb21wYW55IHByb2ZpbGUgaW4gb3VyIG5leHQgCmNvcnJlc3Bv
bmRlbnQuIEhvd2V2ZXIsIGl0IHdvdWxkIGJlIGFwcHJlY2lhdGVkIGlmIHlvdSBjYW4gc2VuZCAK
dXMgeW91ciBjYXRhbG9nIHRocm91Z2ggZW1haWwgdG8gbGVhcm4gbW9yZSBhYm91dCB5b3VyIGNv
bXBhbnkncyAKcHJvZHVjdHMgYW5kIHdob2xlc2FsZSBxdW90ZS4gSXQgaXMgaG9wZWZ1bCB0aGF0
IHdlIGNhbiBzdGFydCBhIAp2aWFibGUgbG9uZy1sYXN0aW5nIGJ1c2luZXNzIHJlbGF0aW9uc2hp
cCAocGFydG5lcnNoaXApIHdpdGggeW91LiAgCiAgCiAgCllvdXIgcHJvbXB0IHJlc3BvbnNlIHdv
dWxkIGJlIGRlbGlnaHRmdWxseSBhcHByZWNpYXRlZC4gCiAgCkJlc3QgV2lzaGVzIAogIAogIApI
YW5lcyBTLiBUaG9tYXMgClByb2N1cmVtZW50IE9mZmljZS4gCkFTREEgU3RvcmVzIExpbWl0ZWQg
ClRlbDogICsgNDQgLSA3NDUxMjcxNjUwIApXaGF0c0FwcDogKyA0NCDigJMgNzQ0MTQ0MDM2MCAK
V2Vic2l0ZTogd3d3LmFzZGEuY28udWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
