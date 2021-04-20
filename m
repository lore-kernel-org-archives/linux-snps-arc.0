Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41F1C433B4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 03:10:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F836102A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 03:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85F836102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eT2vIzpiuPuPVHgFpPCMp8KpoQ2DleViwDnLJMEp1qc=; b=W6k4cJ4/O1NUAZNAoeih2nQqt
	I00PAk8jwFt2oZnE0DB/Ppu5tpvLTVVXqx/NJ6k5JyRAvpavOw7skdK6JOKBrLCjF2cWdg76aCKJ+
	A3YpjfImSXS9bfDF1eBIc6thoa1oWiGBN4bSRvJu60mRksioYZSU7r4zsSDAyhhAxoe5dDFrwAxZx
	0ATtaFlGgB8P5lxizbuY20cm1XbLR4AWWC8sYsBRwXwgWTAKvg/CTXJCwxWahhZ+/XvTH6omBLzOP
	i47LljrvMgrcp08XhqJY2+wr7sKV8R2UF3gz/ZZJqD8nNr9s2BwHut5/3dDzqNxPS2UVBTsoBu2dB
	8Zt1mi+Iw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYgms-00B2fv-JO; Tue, 20 Apr 2021 03:10:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYgmh-00B2eg-0s; Tue, 20 Apr 2021 03:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AqTuRNKIkAmLe8Av3ztkUAdmYLIeq8PftziUxkdnED4=; b=cmFm54dBhWL/FJIZPa1qLdPQCh
 Hw3d+6yeN1BRhVLA8lXi0+OxBNGlwLN0iOxnz1tNw19z7dwED70uUHLHZ0QHCfVKNKBQenpL6sjTp
 RiTDO60rG0H/+Io0sMW2Sl9Yi8uXuQbOmHCm5NzIBmET6uhHQgkerVA9dwlFEY8qLE05GHB/V0PuZ
 Ao/jqa8j5AAd9wR8FIZ6K7RUe8Zya2Y8SayHTkT8KDCcVbyrGWXzGbXLEMb2IexWdlSkgwpOFyitu
 JUjQ4dGrsXV5WoOuWngimlVppnjX5FKsAVbm0+zGZtX6LrP+cU2NI9VCFMIOrg0zh0XBFnqcrMJKV
 Y0NuvgGw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lYgmT-00Ee86-KY; Tue, 20 Apr 2021 03:10:34 +0000
Date: Tue, 20 Apr 2021 04:10:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: "brouer@redhat.com" <brouer@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "arnd@kernel.org" <arnd@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "mgorman@suse.de" <mgorman@suse.de>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210420031029.GI2531743@casper.infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
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

On Tue, Apr 20, 2021 at 02:48:17AM +0000, Vineet Gupta wrote:
> > 32-bit architectures which expect 8-byte alignment for 8-byte integers
> > and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
> > page inadvertently expanded in 2019.
> 
> FWIW, ARC doesn't require 8 byte alignment for 8 byte integers. This is 
> only needed for 8-byte atomics due to the requirements of LLOCKD/SCOND 
> instructions.

Ah, like x86?  OK, great, I'll drop your arch from the list of
affected.  Thanks!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
