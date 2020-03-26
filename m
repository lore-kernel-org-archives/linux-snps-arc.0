Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B466CC43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:38:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 833BC20719
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:38:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kXiQ5lbx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 833BC20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vn2EGdXzspZbT8irhcuegu6iFfI7GehrEl0+uH7Wxjc=; b=kXiQ5lbxfVi0i5
	FzwQTh4NOMUjpR2+8lxcoy5ELbFHFhkVQmS3rHfDQlaQiYCkqi4r4JofqfU0nT+FhYtcAgMNw7Bh5
	xyb1wAusGMfAnae5xip0oEfl3sNLxUEMF4lEutfMGIvC/plVsKddIn965kZCymCsHzZX9/p6xysZp
	NijZbN2PgsgFHTq/pFhchR2BLOG4ZjCuIlaTenvnE7iGBChTATBpj/wKixNE0+7BRw2+uz/lM9ANY
	E6Pn7Nza1vVL+gWosfPrBrIwVZn/ABrpg08KNF4NWxoZWsdaVU94H5QHk1AIKb9EGgN4Vn3jAXXET
	fWcDpbStGkWoLTGpa1GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHHT4-0000eZ-J8; Thu, 26 Mar 2020 01:37:58 +0000
Received: from esa2.mentor.iphmx.com ([68.232.141.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHHT1-0000dx-Nr
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 01:37:57 +0000
IronPort-SDR: z93zsJ5/Tf+unEvX735EYF1UZxMKFIB7gf4qEKvmTwhntZ+gtwebeT9mDUNLJVFUukFjlq8m2S
 a/KxW8XQUTQGoualitcD8OqlrlC1zBxAJg8ggH4dHUTTb3T5L0H1YZZBv+5VvRrAFu0htP+m7d
 MozXs1VrZlVvC9ekm6rjN2Jp/0Mc4ueSbngQJOkdOwF48RoJizQkWdFScsxdIiv+N1ooFBgFv4
 IO4bOVXeGnry/BynT06ay0m4EWovBW9oO6szGv+IJ8VwPD5MEMg4SIlkYB4H314Qa8BGxBWsMX
 6yY=
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="47033686"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 25 Mar 2020 17:37:52 -0800
IronPort-SDR: NZUXPRreKVLFQAEOKxDJa1NMxC8nGszrg1Pp/LCfRdns99VvARqWIsAjkQNdq/0ic9i1I7uk1v
 2qZHFJQhwOKAuJ8tEzub/iL97LoSXrMxuy1/+8WJtlKbUPMRfzvFdSKP5Z4iycrK/os5Uu4KC5
 dAxVDfujebX/8p46kOITn4Mt5LRY8KrZcxXgjtlaeYi0E6EYGy5rtx1rAJyzc5D+TEG+PS6ivH
 9Js1TmQ3ubum70oGAoZMvqO0h5wUOu5NKnW6mCMmK69LL5CqfaTpT2raIEiVyy3p+KbGk0+/HK
 7/g=
Date: Thu, 26 Mar 2020 01:37:46 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 01/15] ARC: add definitions to elf/elf.h
In-Reply-To: <20200313030419.15843-2-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003260137210.31593@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-2-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_183755_782401_47DB758D 
X-CRM114-Status: UNSURE (   2.48  )
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

This patch is OK (it can be committed without waiting for the rest of the 
port to be ready).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
