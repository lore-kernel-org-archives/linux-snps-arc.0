Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D226C5472D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Aug 2024 07:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y+R8QkZbSMKsmqtU4odEr+8l//qid3JRLgnH17ggUsE=; b=w7PiCed4kBQf85
	v3SmPSzYSU38b25Eje1K9+rBV2nSF+htJz+94+DUHaeZUQELcMekUNHynIhT/JjUOucSjnA6BJ070
	5empPRhY3YjJvMvsQZMsgjLKo5c+94ho96tgMt7UKLTscrJ7W5pieAYj9XfXNv4atZlW7yRi6a8Fx
	mEqsVCPSaNVeGUoUOC0cAPxLrZyJEiFiQlewde8tYHpNbqsvAkiolqcoPtxRE4qYTc4zSoMJPslSy
	L2yfPTGewunLSUu3nC+dQxr/VOHiIHwLuv/M1dZXfNNg/t06xntx9DD96guFgeauXcQnpQkjc+7Yh
	28kjosTYt+CHUzvg/vDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDUQ-0000000EOVZ-32Pz;
	Wed, 28 Aug 2024 07:53:14 +0000
Received: from mail.widebizscope.pl ([51.77.245.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDSI-0000000ENuA-04Ai
	for linux-snps-arc@lists.infradead.org;
	Wed, 28 Aug 2024 07:51:03 +0000
Received: by mail.widebizscope.pl (Postfix, from userid 1002)
	id 9CAD624697; Wed, 28 Aug 2024 09:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=widebizscope.pl;
	s=mail; t=1724831458;
	bh=7b2Hseb9QY/049WYSH5jOQc1GsDAtRo2MBj6O2PAhWg=;
	h=Date:From:To:Subject:From;
	b=zJ1IpkZQCXyiHcWm9bCgixSY6EaloAnGJieLGBI+Q73HYZhXA2V6yTrEtFkQn05pd
	 mPbZQjFbsyAZRUS26BFdlJ6KJfumK58KVuZ52kJxoJ/lQCgzTjB6RSuehgOWEQgfPv
	 jEa62PWyMjID3oHvqH5F1iMh4a2fpRQPoW1h0ZQzbvt8cvnEbac+xkjk3sbZZFyb57
	 zhnD0KUtpgP2/UN1LCS/z4Bcsnwh+y6KL6oVrHS8ZRTCSSL9vKdI3WU79ePDgrKBna
	 xzTgM3tF2fmdjqYPm0I5WqEdSRJijJ5AKiGhsZanfAkeZsl2ManJigkOWfZDDHVJfb
	 tMkdDEJEfgfXQ==
Received: by mail.widebizscope.pl for <linux-snps-arc@lists.infradead.org>; Wed, 28 Aug 2024 07:50:36 GMT
Message-ID: <20240828084500-0.1.dc.rm2o.0.1e2la41kzz@widebizscope.pl>
Date: Wed, 28 Aug 2024 07:50:36 GMT
From: "Szczepan Andryszczuk" <szczepan.andryszczuk@widebizscope.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Faktury
X-Mailer: mail.widebizscope.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_005102_393817_75AEE680 
X-CRM114-Status: UNSURE (  -0.10  )
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

U3phbm93bmkgUGHFhHN0d28sCgpDenkgem1hZ2FqxIUgc2nEmSBQYcWEc3R3byB6IHByb2JsZW1h
bWkgcMWCeW5ub8WbY2kgZmluYW5zb3dlaiB3eW5pa2FqxIVjeW1pIHogZMWCdWdpY2ggdGVybWlu
w7N3IHDFgmF0bm/Fm2NpIG9kIGtsaWVudMOzdz8gCgpOYXN6ZSB1c8WCdWdpIGZha3RvcmluZ293
ZSBtb2fEhSBiecSHIHJvendpxIV6YW5pZW0sIGt0w7NyZWdvIHBvdHJ6ZWJ1amUgUGHFhHN0d2Eg
ZmlybWEsIGFieSBzenliY2llaiB6YW1pZW5pYcSHIHd5c3Rhd2lvbmUgZmFrdHVyeSBuYSBnb3TD
s3drxJkuCgpKZcWbbGkgemFsZcW8eSBQYcWEc3R3dSBuYSBuYXR5Y2htaWFzdG93eW0gZG9zdMSZ
cGllIGRvIMWbcm9ka8OzdyBmaW5hbnNvd3ljaCBwbyB3eXN0YXdpZW5pdSBmYWt0dXJ5LCB6YXBy
YXN6YW0gZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpTemN6ZXBhbiBBbmRyeXN6Y3p1awoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1h
cmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
