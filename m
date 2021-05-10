Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA07C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 20:09:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221C061466
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 20:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 221C061466
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dap76+ltAnB2E0JWYohM9mIogNIT+pM2SF1tqb/8Gv4=; b=hdI3Va801GDOjIaS4xVUgm49Q
	yE5nj1URvSWH351t7x4+x7sURt9TnFIM0LmHtY3SSXgt9TWMNXtT2K9lHpjSl7OE9gXcjEpPKqtTV
	dA4geKMXztIbQV2meDL5fRAUMF7gcq2YqbfwhibVixnng3CRZ3fD+0jBmYNq+WsRY5znzfA+QnSSf
	FsVUmKbsXxEXGlz7iQ3Rh5yMOIJ5Selk7ZsF14Mx0U83tGi4aH9g65AdTpcyMacUALPqdW8s7dNnz
	8iWokHLjddPA08o3gNsr/pinjcuwKiqN9NjTOlhI/4+yFHFz1kmf/7ygrdo8wO/8bB9w7HI6ExR8o
	vLCPNdmaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgCDn-00FdWv-Ap; Mon, 10 May 2021 20:09:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCDk-00FdWh-3z
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 20:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=/+i3VNtidQGxuzmqXKj/p2pY/d1/VrayAAGpcWSFTnc=; b=asM/xgK5JzjywWhuu6I5NgcuK4
 9vxNEVRxSl9F3/44qPh98/tfHAj9yTEXZs0Hxhk28U9Mb6MbwvnD3Ah3OktT5MG+KDDK6Ca3m1w0W
 dlUTBXcKyk787w4Ofv4dq3/gxTASA/3OjSJS3F+AF1MjU6i9HiNMAqI3eFUbZSBTREw5iHdsdRjXO
 2MG7JMy4nsOVftua1BpxD+8mKUlN6t8jsBPXFxbJ/Q/+hHyX94mNyUsexBdLXIHdg2TV1iEwWJQR2
 MB0fs00lTfW+bCuVshhwMXyxQ/OOQmrUyjkU21PIvOTgnJvzq4hKrbLCYTEir03GxD/uvFblvx65p
 NZ+2rTWA==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCDg-0095wH-VM
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 20:09:38 +0000
X-Originating-IP: 90.76.218.148
Received: from windsurf (lfbn-tou-1-1158-148.w90-76.abo.wanadoo.fr
 [90.76.218.148]) (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E211D60003;
 Mon, 10 May 2021 20:09:31 +0000 (UTC)
Date: Mon, 10 May 2021 22:09:31 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta via buildroot <buildroot@busybox.net>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Subject: Re: [Buildroot] [PATCH v3 3/4] lmbench: emulate --prefix to avoid
 scattering binaries all over
Message-ID: <20210510220931.1dc78bde@windsurf>
In-Reply-To: <20210510180049.61421-5-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-5-vgupta@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_130937_176485_795DD252 
X-CRM114-Status: UNSURE (   5.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, 10 May 2021 11:00:48 -0700
Vineet Gupta via buildroot <buildroot@busybox.net> wrote:

>  - moves all lmbench binaries to <target>/lmbench/bin/<ARCH>
>  - scripts copied to <target>/lmbench/scripts
>  - scripts/os overwritten to setup "OS" as expected by LMBench runtime scripts
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Where are lmbench binaries currently installed? Because /lmbench/ looks
really really odd as an installation location.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
