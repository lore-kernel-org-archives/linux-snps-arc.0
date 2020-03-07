Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3724C10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75889206D7
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rFNj/pwu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75889206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVXfJXK85aNEItrJd6kGmvxrwGEEJkkEW0bL+CfT5Bw=; b=rFNj/pwuCOGLrT
	7rs1WCkBQDGw3UUayrti0pAr8gmTBnaQsSTYyjpsOZVwbgEWgbi+0bcyU44SMT/5HpjJ/vWuEH1Uq
	Lv3eWMQKFSIkmFxO63utO2O31i3D4coO3SH4iDEmpO8+H6EIY2yxHtnjTlV4aS+voAhAbxDY77l8x
	VevbDElMB1nHjh7zRoOY61JFrn6FBaAhgGePkfGHrKhCf8Z9dP+Gns1NkLrtq9ao7beEo+Pl4lFRh
	X3UFtgr4J1tpZWscQL6dhSAwRJVw8XqghyVpSNNbfVqZs+q6JH/PqIPs8kBAmxcxUZmdMy9Ir19V4
	PX+t8PZlG2EM66B4pwUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jANDU-0008Sv-6D; Sat, 07 Mar 2020 00:21:20 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jANDR-0008SQ-Hr
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 00:21:18 +0000
IronPort-SDR: VeXAxSpRNb8hPfB8YPYDnnLriSLzv6w6BYT23g0ahhOBnK0wMYOMxCUhKYEg5VfPlseXc3BiTW
 +HhmOYNZ6aBTEfT4Q1gGo4ypHCmjzWoDi77ZP7KgQx591nJsrPODpB4qptw+i58hvn9Vu1MW9m
 H68f+GuXhdW7K62RLFcXubuHES58ApvfwYblC0Xuv0HjobhSCMO+Ggt/ra2g7882ZkLW9KFY5l
 Unuo1nKcSC6mWvTVrbks+uFdkDFT0ykfyoKLVmWdBQ0YIKuwOGJPjSwo23zZJJdWuLoooiu9sU
 IOE=
X-IronPort-AV: E=Sophos;i="5.70,524,1574150400"; d="scan'208";a="46512373"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 06 Mar 2020 16:21:17 -0800
IronPort-SDR: OyjYQKL1yf9m+COW6j5FnnrPHaW9G3HAQrhpoCRITO+1fR3JLXW9NYBUa/JON8CwP4SXlywUXe
 KGlWBa/ARuWEiHjaYbDpZO4TM3OtWQJLwdPP2CmjhLhlj3AwYJUIs3fNm4hKVf2ijPPzmlr/ro
 i+Plefu5AIA2HZeJGBYZF7EK9tSkuchf56EtEMuXnQK0BdNu3cb2RL+GyteT+IGm6Yx2DQLixW
 AgcWmKTe9hBcUUZ9THAzQEraO1Xa7+qDrSzY8s/z/9ba8ZAzfefVBG2kwLkXctPeE1W+TvsYeG
 ApE=
Date: Sat, 7 Mar 2020 00:21:11 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v3 00/17] glibc port to ARC processors
In-Reply-To: <20200306182419.13945-1-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003070020370.26274@digraph.polyomino.org.uk>
References: <20200306182419.13945-1-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-05.mgc.mentorg.com (139.181.222.5) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_162117_626697_1AD08DEB 
X-CRM114-Status: UNSURE (   1.16  )
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

Please give details of what the entries would be for 
<https://sourceware.org/glibc/wiki/ABIList> and 
<https://sourceware.org/glibc/wiki/PortStatus> for this port that you 
intend to add once the port is in.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
