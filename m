Return-Path: <SRS0=LyzR=6C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D4FC2D0EF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 10:31:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA10821D79
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 10:31:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BCz+MxLh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA10821D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deneb.enyo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZsCctOQy/MomkwT9khKRX1DWyiP/Bdcjjoz2Ux3G8M=; b=BCz+MxLhJu0PfN
	sgXe83c6Mg4jgocVJ/R9Zdq6QJacmbJi0nS4OsjJbgMHfEQ72RONVwLyoSrfljaDF+3XM3PYGbnI2
	Q7BzP6isok6O6oN7yuLdCSIcPIlX1GfHBAtizqXWYgvyNtf9uNjMGSAJWjwH2/Zxdb+jG9pwq96ax
	sMj55CTMklj66OMkbwjdnW+BktqOoLf0QVbwN1v2FoOm1xVnGoeaIySqrnUc+qo0m6t3F/NM6YnrT
	pyDYjh2yHJG/3q5tx8U84TTBYi4DAcCdcCxCrhPCtuVT5soI2XFonbo73jx4w1NAXCzK9JSuc7ncH
	k51LsG9VSkYW6MqapOMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPklP-0005Nq-LI; Sat, 18 Apr 2020 10:31:55 +0000
Received: from albireo.enyo.de ([37.24.231.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPklM-0005L5-Cr
 for linux-snps-arc@lists.infradead.org; Sat, 18 Apr 2020 10:31:53 +0000
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jPklB-0004rL-O2; Sat, 18 Apr 2020 10:31:41 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jPklB-0000ze-L2; Sat, 18 Apr 2020 12:31:41 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: [PATCH v5 11/14] ARC: Update syscall-names.list for ARC specific
 syscalls
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-12-vgupta@synopsys.com>
 <alpine.DEB.2.21.2004172305550.1082@digraph.polyomino.org.uk>
 <b763c8c7-470d-c22b-52b9-76c29f414e44@synopsys.com>
Date: Sat, 18 Apr 2020 12:31:41 +0200
In-Reply-To: <b763c8c7-470d-c22b-52b9-76c29f414e44@synopsys.com> (Vineet Gupta
 via Libc-alpha's message of "Fri, 17 Apr 2020 23:53:05 +0000")
Message-ID: <87zhb96q5u.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_033152_433694_0AEE3A55 
X-CRM114-Status: UNSURE (   3.03  )
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
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta via Libc-alpha:

> On 4/17/20 4:05 PM, Joseph Myers wrote:
>> This patch is OK.
>
> So when the rest of port is ready, this will be part of main commit ?

I think this can go in today.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
