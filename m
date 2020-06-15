Return-Path: <SRS0=fi28=74=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6031DC433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 19:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74AD20734
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 19:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNk4kyDl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74AD20734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcN/kfO9wkdhLJVyCfPubCTmMRfcqUu0AQ9gnKKJJ5w=; b=KNk4kyDlMsX5Bu
	ahRTXapMLDc5g4yyBZHTRxBQNUICRVx+AKepmoHsoO6StqMLwKjgslJdtCSrETr+yG7nv1BNIx2KP
	pc5/TozPBst5Fatl/sQ0ygGCqtiQGhIa5lerV/GZmHXAJR3MeLldC1GN7pe8/C8B6qCnjEE7Pa8mK
	u6MFwQkTNKBdX5WIMGAeDtPQSgzU7+gL+a1ebClYmqKrjoMR9+rLRikPwhtRVFAjjbcBixTFZgmUv
	XrygUzop3r1iBrWgBWIzzUSE/JWOvLi9VGIIyZV9Dpdnd91r2OzOdghaeHVR6HR2EmzIbft33mfrz
	g5mVcya8hj2L4VsF57kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkvAm-0005tf-VF; Mon, 15 Jun 2020 19:53:36 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkvAk-0005t3-TC
 for linux-snps-arc@lists.infradead.org; Mon, 15 Jun 2020 19:53:36 +0000
IronPort-SDR: vE+bz7ireciByyZm7xIBmBEZUWBzPZbXGrojtIFVn4ZLJmRdnVsB1muoEsDUIjZDcUrGDL7oaM
 NHtTt5Nnf/tg/WsRGW9ZAuA9pdGoYuv+7GHu8VVtrcjO5lOfbqvedNZYtzS/2fyyUf8ozqYNm1
 OkcqJlQf58CsFBRVCEypMyq6N9hy2XtgvmwqVq4a/cNr6Ibv/ukose7K2L/0g79DjBAShPMvHO
 5Lh4IjM5i1WfyKB5huqopNxZUru2rbt+LlCTpkloKZ5fl7dISzLGr5tSdhfYKaqkqKxDO6umqu
 t+A=
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; d="scan'208";a="49955255"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa4.mentor.iphmx.com with ESMTP; 15 Jun 2020 11:53:33 -0800
IronPort-SDR: x19FK3SeA3h5OM82YSXRwjp6pecrGN+glcG8iXVqP3710L3HJwXFlv8vbyjXQZyol3KM7NvUPq
 vxxEAGEs4zEWAUk7MXt2jlc/6+/Unnw+NXL2tf+nZ1+TlRXNBaFBbaBaSZlZQPqOlQ8Gx6NCCp
 TeHNPXuMQV0TGM53HEm+1tJM5s8KCaaKSd8wh1KKG55iacfH7Sdis+cQ2wcPyQO1E+bOHKH1kj
 77lR7eoZYLknATCywrOM10H/OXg0WvyKhjHqaDWW7wrqYsItPK+7cGturtOt+T4hjZIYUbuXLY
 PYM=
Date: Mon, 15 Jun 2020 19:53:27 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Subject: Re: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
In-Reply-To: <04e95814-5f81-1ca8-f0fb-1f6bb53eff78@linaro.org>
Message-ID: <alpine.DEB.2.21.2006151953110.1874@digraph.polyomino.org.uk>
References: <alpine.DEB.2.21.1911112247180.30786@digraph.polyomino.org.uk>
 <20200602023223.13823-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2006021814210.3673@digraph.polyomino.org.uk>
 <d38b8dfe-5caa-5884-8843-0a845afbbb67@synopsys.com>
 <115b2236-e994-cdfd-d96e-2e8d354b7fde@synopsys.com>
 <6d22b849-e27d-9843-90e3-7ea635c6d863@synopsys.com>
 <04e95814-5f81-1ca8-f0fb-1f6bb53eff78@linaro.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_125334_996585_7BB9E727 
X-CRM114-Status: UNSURE (   4.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, 15 Jun 2020, Adhemerval Zanella wrote:

> >> Is this sufficient for comparison ?
> > 
> > ping !
> > 
> 
> This analysis looks good me, although I can't voucher for Joseph.

This patch is OK.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
