Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D412C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:59:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA1F220737
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/GSetxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA1F220737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/+pXPff8ebENMMQZT9CST3zOTUyzCJGc0ynJZCGhwg=; b=u/GSetxeE4/MsR
	h8U+MU234eK2zq715NhUj80dqii4Wa2gsc7tBteltsqTRFI4YGiSiXnU9msqwhpDNvS5mz73T6jH6
	w3no/vYqWoHtlKtIBwBhDGARYaL8pClYzGvimcC1vTYRZJf3S7QpILivxhfctGm9JoV/QH4GnZI/w
	wflANN7ZhTUWPcRGbSKCH0D3YWyR/qQsA2wSYYAKSoa1CnoS3vtyILSq+mM5C6AhxdHdCDzG4VkCL
	ObGZnY8CRrGNvHC/HVqdvnzB1zHLBS5aDGFeNpo2U6JjDyFWIuD86qtRkCPINxpJqjDnRI/n93zBH
	wlM5p2iJl5OwL3LimQ8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHHo3-0007XF-SD; Thu, 26 Mar 2020 01:59:39 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHHo1-0007Wq-17
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 01:59:38 +0000
IronPort-SDR: RhFUXIL+P+6QfwX+iTCHOAchM7uKPiYTICPBVFyRAJu1z88wuA8wtPnm5Zc1R0sQiMM44oPH26
 uuMKTI4ECdqVAB8oVMEPj6vYv/skdhjnmMaFRBn6R6ZMHBYAyG46MHDHv8802DoF9ZdAtH7XQk
 JBm2wRmdkGXA1mD2oOzABiEb/k0MW54ZKpl4BFb1wAInzIwZylAxD+L1Fq0vpGspdZ6uuDg4px
 iv5sznT5+Q4v8mGbykhKd8DjWr3vHb2tS+u4Dr5/kySGzlm3c1sLfOtWjcSyauB6K7y04CcOvK
 h3Q=
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="49085214"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 25 Mar 2020 17:59:36 -0800
IronPort-SDR: j6y2JiTPfqjDhzBMwTSqTCeedRcQfMymq/9YL0v6fB+66z/XeiS/qfUYQPp8DS0guQSOBNXYEs
 UhQvHPKKSMyZ7TZuZ7JY/Nvu43ktM+ax3DdhNp8dnSWe2zmBwNy0wFk/MUD6GnvkRxRGWcIgqU
 5nrm2KGRvQgA+5GYLPfLGDo/iuX+293Z6CB3JVAnagnyUWIvyytHH2SGMeM8GEzIYbZ/gWygbl
 4SZPX9ycXC9y/G2o4YCfn6oN/gBivEYi7yzMwT091SlKL1rPjbMwoA1DX9miePzvSYRaMR067w
 3cM=
Date: Thu, 26 Mar 2020 01:59:31 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 06/15] ARC: math soft float support
In-Reply-To: <20200313030419.15843-7-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003260159100.31593@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-7-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_185937_077834_C860B23D 
X-CRM114-Status: UNSURE (   2.29  )
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

On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> +/* Soft-float doesnot support exceptions.  */

Missing space, should be "does not".

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
