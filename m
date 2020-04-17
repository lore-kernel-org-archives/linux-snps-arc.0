Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329DAC2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:02:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0112E214D8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UHSK2in9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0112E214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fECV9yaTrU2hHpj4pKBQIeZs9aIGbtYhO/aYCMiwghA=; b=UHSK2in9rHkxOg
	jALYDf2xbp/H54M3DW+NXA2NmFvYN6HRaPp1od5iwux0jqkPX6suBGJzX8Ybc8lwag4KiRA67s1sp
	l98KD5+MDlIFwq40lhm5cMDskp9dxY5YIhA2l32HSDsWzzGkQwKuGK9L/FnjQ4D18Pl40LafqBBHB
	R7WMp9VTpwOoc4rjjDETmk5goDG2JCaxc1RsQra+ERQYHIv8OEGGeLfXZ3Ttsh+BIR08F/m8uqdq2
	Xh7OxwDg76x5+mzMsMQw1SwdVizwpL4QpJQasVdtCwOcuhT4VLfoZAdryuhpt+CziC9o4CVUAFrrG
	WrfyPbTasEOM2nFNE2rQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPZzw-0006Nm-P3; Fri, 17 Apr 2020 23:02:12 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPZzu-0006NI-31
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:02:11 +0000
IronPort-SDR: 71v9m2x0jDZ1/pf05OAK+aAb/OQq9Vzhmu2aiOqR3NbO+c0NgsbpfQzTXgY1XW8l6f/vV2du6C
 fXoJc7mnWEBPLXIDC+YeQPCM9C2pIxfZKbrBsr6JU1RScW7Oj75MlIAPppmBGIBsjA9O1WD3W1
 Ke/FB13lSC+w4FlLvd/o0EwOagiKrsDfezxgcdbZeaGs/kWyx0r6kHetq5uX5G8uz+v1leLAoQ
 zjoW7VV1L5Yp4IxXD6Iz7+ApnKzf1yi9hOdnkW8Q570MohzSoAgXUXX3yvuWtxxRzUv5fQXvru
 N+A=
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="49929632"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 17 Apr 2020 15:02:06 -0800
IronPort-SDR: 4QhPrMGc2Cw5lb4V6std/80o7kMPDx5KJ0OeacPfNtoBEfSUvwwF+XZardQnCJJoNvI6jBr5nF
 7C7fTlNKWLKZMtesmBcNs3fK3yj7XgWoZOvzuKzDtpzfkUGiBhWJ4GPoMO+qw0aPGetseklzjg
 u72EGu1yLUZaMXdfMwgXsqX6NPjjMl1P0J9v2Nfs4DuXIAynG4mPQdrZJo5afB2cLDWohfMknU
 RjSbNP7pamyY/94+HMqxptSfZfSsMfT/+YECWKnt6LPnoF3srFXvNoieVgNcEJlduvDdXoVGZm
 gFg=
Date: Fri, 17 Apr 2020 23:02:01 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v5 08/14] ARC: Linux ABI
In-Reply-To: <20200409025615.27003-9-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2004172301140.1082@digraph.polyomino.org.uk>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-9-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_160210_135247_D93F1E38 
X-CRM114-Status: UNSURE (   2.55  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:

> +      for (i = 0; i < stack_args; i++)
> +        *r++ = va_arg(vl, unsigned long int);

Missing space before '(' in call to va_arg.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
