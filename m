Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72A3C10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:12:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B06206D7
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCZirHHK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79B06206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZQNDadmlGMzVIzW8WsyT4jozA2a9t5NMbE63YCw5Bc=; b=gCZirHHKOju0vT
	hgGGRUXCjsxoIFL/UJ5e/svpeZhFAyxQck2w6/McoO2M7xzAKH7mMcnj07GxAx8nbR4Yz3y79S/oq
	Sh6Jjr/U/xWZ/F+kl4yqQVz4WrKOpI1XkE9qrSIsDylDdy4CksNo1yywte/bQHph+DI5QNSc4ie6q
	K3XG+uelB5uSoTAgLDsUeRAxB2nzoGSYyFomk85hfuPGodSvLsUU25TjcQAJdBDZOMs813+Y0p9fF
	1kDwztayl3Dzxo0bmAlzx+P/MpN3KN7qoEDdnR+pfXYp4L7+oRseILGN5rH9YIcQ5H7k9ldgrWajs
	aqJ2v1j442WcrtMBpP5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAN5D-0004Wb-HM; Sat, 07 Mar 2020 00:12:47 +0000
Received: from esa2.mentor.iphmx.com ([68.232.141.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAN5A-0004WA-KH
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 00:12:45 +0000
IronPort-SDR: mWRakZZU95y8lILhRbtv4Gnb0MlePAtDjnjrGsaM6v3d9dwZ4r35Yy84Jj9mJpH6Y21LWxqxLJ
 7Wgz3HzuETwoVfFJKBer6qusIrLftewRVW/YcPFePZC5vjrUN+67vavmcf3g4Gl2UgV6/RwRro
 TiUvNTP2aG6gE22dH6qrbkMLwUnuZx4LDmJvQkVC4PEKwpz06Ab5yl2oaxYaTTZ9ZcN6faBStu
 AsYrL35NiYYgwrnGEsFicxNRWma0QhAnBpNmVXJjeaFfY4JJOiRuEpsxheI1mz6huVk6AneOr7
 xoY=
X-IronPort-AV: E=Sophos;i="5.70,523,1574150400"; d="scan'208";a="46436156"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 06 Mar 2020 16:12:43 -0800
IronPort-SDR: UDIXBlXC+uLncdMUTOo1fbRM1lwZy0c+q5dI3/gpzxeehdcICsyqspuMGs8K2A2e6H7PLQbGTi
 KeOOa1Aoe1fRfQRlCdOm/7KoKV0PRCtrawEuTnm3gmKpHp94cTZk9ySAtOoNsnO/B+/8YrM9aH
 QHEEV0LO7go7jb7rzTLG2PpE93ewDFooHYZDS7KOzXKReqlIBk6tbObdP3k1j/Lkbyqj+2Ah58
 /1ljBtIhEss3XHrtvJl3Qw15Pj0S7EiikpLkybXAltIjUNjMGhj6eF6GiKc5dnN2u1gxgTrCDs
 qvc=
Date: Sat, 7 Mar 2020 00:12:37 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v3 01/17] gcc PR 88409: miscompilation due to missing cc
 clobber in longlong.h macros
In-Reply-To: <20200306182419.13945-2-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003070012230.26274@digraph.polyomino.org.uk>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-2-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_161244_674492_7A906CD5 
X-CRM114-Status: UNSURE (   1.60  )
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

If this gets longlong.h back in sync with changes made in the GCC version, 
then please commit.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
