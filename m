Return-Path: <SRS0=euEp=QD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FCFC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Nov 2021 08:46:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4225B61BE5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Nov 2021 08:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4225B61BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bizjoindeal.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x4aQRJQEe5t7OfxhcButYGndFZDAVEGN8CnjlBML9CI=; b=HMIdrZzI+Dd3IY
	NPt8sh4zBIoGQLW1iF+bxo+mMY3xmcGW2wdViKLOGIvnPFRe7WNL8+JUm4UiwSonE7OET1N+yVhwH
	8HBnKLiEO83O8sTxmlJJFBF06nJScYWF5eLTix11/+08V/Bqs29ls7rtEALM/1qSJVcBaRT8HSdCf
	ARF3nNeaoloMTK7rNVn/gr4G2KOxUR3tPU7zhpXHRvPR5sFnYhlswA+ucJAoPFaYiPSxKzjpm/PBW
	YtIKtQCHeM2rjbA9tMbNoIVoh++kPoRDosX+qKfCyyoSa+H7z6MBtRF9sAJ+QMDhc7cSoQ1vmfLKo
	wXbNYMH495SQTiUEh41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmu6u-000msc-Rh; Tue, 16 Nov 2021 08:46:36 +0000
Received: from mail.bizjoindeal.pl ([80.211.97.164])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmu6r-000mrO-2M
 for linux-snps-arc@lists.infradead.org; Tue, 16 Nov 2021 08:46:34 +0000
Received: by mail.bizjoindeal.pl (Postfix, from userid 1001)
 id 99FE6A2916; Tue, 16 Nov 2021 08:46:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizjoindeal.pl;
 s=mail; t=1637052391;
 bh=JZuQ1fK7zFtz2oeUB7Xfid9vb7kUywdmDd2OluR8ywA=;
 h=Date:From:To:Subject:From;
 b=QHXjaGsrhSoNhhFFGcXLCgzY8lXHTHmypJP/fyD462s/bQOlOt93Ow4QJJ2AlbhxW
 0RgvqE2fGt3wx2gPReqoRRdfIN5rzRB7GPYCy3HK+9/+/AqmvXYE8IFzQuzcg25/IS
 VWtxL2XBSmE0honvgiw06uzUWVxSClptvEpXAZmrrTn6/BHD+td4BUHUhlHT2ADsTA
 Vt/X3/OMYr9uwreWuobUVHlKOvRomj5YJcwhGgQ0N33KpPE7xsoUtk9HxbL6tTbS6O
 Pg+lq5uQhXvUdjKCpbMoQ3IsfzbvooSXqn6IFIMWwGdzsgGDOLeaKSwjv0P0FnEJ46
 vGJk5AD+a+tSA==
Received: by mail.bizjoindeal.pl for <linux-snps-arc@lists.infradead.org>;
 Tue, 16 Nov 2021 08:46:10 GMT
Message-ID: <20211116074500-0.1.60.f06s.0.j924ghmf8l@bizjoindeal.pl>
Date: Tue, 16 Nov 2021 08:46:10 GMT
From: "Dorian Kwiatkowski" <dorian.kwiatkowski@bizjoindeal.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.bizjoindeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_004633_297410_FB58AD57 
X-CRM114-Status: UNSURE (   1.37  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB6IFBhxYRzdHdlbSwgcG9uaWV3YcW8IGRv
c3RyemVnYW0gbW/FvGxpd2/Fm8SHIHJlZHVrY2ppIG9wxYJhdCB6YSBwcsSFZC4KCk9kcG93aWVk
bmlvIGRvYnJhbmEgaW5zdGFsYWNqYSBmb3Rvd29sdGFpY3puYSB0byByb3p3acSFemFuaWUsIGt0
w7NyZSBwb3p3YWxhIHd5Z2VuZXJvd2HEhyBzcG9yZSBvc3pjesSZZG5vxZtjaSB3IHNrYWxpIHJv
a3UuCgpDaGNpYcWCYnltIHBvcm96bWF3aWHEhyB6IFBhxYRzdHdlbSBvIHRlZ28gdHlwdSByb3p3
acSFemFuaXUsIGEgdGFrxbxlIHByemVkc3Rhd2nEhyB3c3TEmXBuZSBrYWxrdWxhY2plLgoKQ3p5
IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaT8KClBvemRyYXdpYW0sCkRvcmlhbiBLd2lhdGtv
d3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
