Return-Path: <SRS0=Lght=Z4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B743C43603
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Dec 2019 21:18:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEEC7206C3
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Dec 2019 21:18:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kS3YHeTn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEEC7206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1u3Cd5uv3UBHDkcVVPkwSaUX0yNXYWz7eZjPfo1KgI=; b=kS3YHeTnVM/fwM
	jc1lqOkpyD2xTvGl4qKG3fJj4sYHvYJATO2Hmq+k+HUyIVUFFoLls2enwomGgFeqX07oiuJSEMoJP
	q8nYhEv0Cwv2KuPbKu5z/k4ry0hQUWIY15bKJvRIjGTAutcB8AzZ84dNrxjPntzA7q8JLT4Hi13OD
	qSYzhPxeYSJFoi4ksVP7/dnaC3UHcTef1qI37o5MsAyeug7/B/UEWmiLSaaERktKtiO3YSDRGkvq8
	Fa5NZza2ATunOSHmWN8Z0bCj4/T3Q4760YHtS3b7q6MdPXt2qq37qLfzXB98peebxU8etjBmZpgJv
	hw5kYGQNhosPjLSpBbvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idKzW-0005XI-I0; Fri, 06 Dec 2019 21:18:22 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idKzT-0005Wj-GV
 for linux-snps-arc@lists.infradead.org; Fri, 06 Dec 2019 21:18:21 +0000
Received: from windsurf.home (amarseille-658-1-11-109.w86-210.abo.wanadoo.fr
 [86.210.146.109])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6E653200002;
 Fri,  6 Dec 2019 21:18:08 +0000 (UTC)
Date: Fri, 6 Dec 2019 22:18:07 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH 1/3] toolchain, glibc: Allow ARC big endian
 glibc builds
Message-ID: <20191206221807.6a33e36c@windsurf.home>
In-Reply-To: <20191206193924.18777-2-vgupta@synopsys.com>
References: <20191206193924.18777-1-vgupta@synopsys.com>
 <20191206193924.18777-2-vgupta@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4git49 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_131819_685248_B37E3077 
X-CRM114-Status: UNSURE (   8.50  )
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
Cc: buildroot@busybox.net, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri,  6 Dec 2019 11:39:22 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
> 
> Apparently big endian glibc builds just work, if we let the endian
> header allow that (which prev was #error).
> 
> The current ARC glibc version in buildroot arc-2019.09-rc1 already
> contains that fix.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master with an improved commit title/log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
