Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AC9C10F26
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEC972080C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:22:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tFRBAviG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEC972080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4D4WZernIEezs9nLp27YhQRM1OMqMUccR+RGtM2JB7k=; b=tFRBAviG7yVMPz
	BhGsAYk/3fLt4jzfL6RZ+EnEw4RaEN71ArQIyzEDOyHIWtUSa9cQKE2fPAINC1ywpANy+CitZqNT/
	VTBSaj94AeUzAygvcSTUmbbxyYwh8VhlbLSYCA86cN6CkqOCxLa9hLviwOQRh/4lib3Pjq22NnCSD
	qIoVGuIlj6slSNglczudOZYmsXq7hvB5Rymn02WyINUikfKgsHr+R5KDiQskTVpBPdNnDbvq4/AqY
	1FtSoknd6x7VxZPv8yd4raywz/2rNj1n7kATtTx6nb7y/Nfnds3xD4yVzZWRssrGtSSpZ90FHha/i
	32JfG3W4ZzXMp79dn3HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJOLX-0002iV-83; Tue, 31 Mar 2020 21:22:55 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJOLT-0002hr-VU
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 21:22:53 +0000
IronPort-SDR: QR7t2sq7HuWH1hhMN3VrTwoC0z8LW75DNk8WD3UcEbFjx+2SofB2RUDe9ZKrylj3qMAwvgjYrB
 jKyFWmzDraLH3wVTDJWnVPJKqA10vk5+GkM5Jf5NKEoCri3VNd/hn+0GGjkuGsbvp4OmTRf5l1
 W5OG85Xs/uSfSAAXE/mwrHm49fSIcFwv3+8c6xZUR+pxkukcuZIFaGEjJEWst8it5Y0aKu4r8z
 V6P75ED0z+qmCZBdY88Yrp3vWO+SLYaVcAEpAz7vuGXc4njxcee3V7FbyiyNldRZdtDoo8N6id
 /Ss=
X-IronPort-AV: E=Sophos;i="5.72,329,1580803200"; d="scan'208";a="47320209"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 31 Mar 2020 13:22:51 -0800
IronPort-SDR: CyqP8o4QaHFUUJmC2Nro+9t43lWaCQNsRh5ToTuOhouL+B5VItI9PmktiNSmsH8SBl4ovaVhrH
 fEnmog0AzQWZ8yAJ5zRqYj0FmcQY7ykate4ZUJRgKwxIyd/3w8r2iravxZ/D7Pe6dXjaRxjOxp
 TSHoMuJj3cgb2YY89kW2MDGTYn0MY/yjX3yXTeasSqt23YekrS3loXSL21EYN/UZxSDFQs6V9p
 sEGIsrYcq3JJnKOeppjMtiuC2FWMqkyCMTbbutSNZyjMP/J1Vqci3WyPDeVHgRpS15bZoN79Cd
 jaw=
Date: Tue, 31 Mar 2020 21:22:45 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] provide y2038 safe socket constants
In-Reply-To: <10f0a47d-189d-14f2-f665-5b5532be629b@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003312122350.30236@digraph.polyomino.org.uk>
References: <20200329041612.4071-1-vgupta@synopsys.com>
 <87r1x8qpx6.fsf@mid.deneb.enyo.de>
 <alpine.DEB.2.21.2003312038320.30236@digraph.polyomino.org.uk>
 <10f0a47d-189d-14f2-f665-5b5532be629b@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_142252_049166_A8B5F347 
X-CRM114-Status: UNSURE (   6.23  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>, Florian Weimer <fw@deneb.enyo.de>,
 Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 31 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> On 3/31/20 1:45 PM, Joseph Myers wrote:
> > I'm concerned the present patch is wrong for x32, however; that has 
> > __TIMESIZE == 64 && __WORDSIZE == 32 but should use the old values; the 
> > patch should be using __SYSCALL_WORDSIZE when available in place of 
> > __WORDSIZE.
> 
> Something like below ?
> 
> -#if __TIMESIZE == 64 && __WORDSIZE == 32
> 
> +#if TIMESIZE == 64 && (__WORDSIZE == 32 \
>      && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))

Yes, that sort of thing.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
