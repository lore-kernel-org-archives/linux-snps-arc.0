Return-Path: <SRS0=LyzR=6C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3680C38A29
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 16:50:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C790621D6C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 18 Apr 2020 16:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c7J+TLYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C790621D6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deneb.enyo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvnlnQyvIDoU2xokvtDgbQsf4BvrY7e7gJr/rjxyoaE=; b=c7J+TLYDaUYpGZ
	hd+jJxDBuhmcYjVHspGPDNeR5s4C6XpuQgH9Rd6NjsxMIiC5OXyjrhVpGXAVMLxOSDIbC1TeDuG2P
	ltrVQ6TuozzstKicb7UqRq9wF8kjfF3HBMTSv++eCTttWlrHz1puYw0Jxb1UK0bDgkbyrbsPKuY2A
	Y0R2x12TibNpLGHZLrHlnweokS0yeFfbRH2mgS5tbaOC0LLZtODmtd3ZRGXLbuqc4jCzSfojCuXPc
	sL05Qs21ADt/xXxruNQ/zXza+oXcEStt8MUQb7dw6iVfu/eCxUWBgwTbmUdyRJhhkw3JMF/oXcw91
	vA7gPHKFqU1T+Na0T+9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPqfn-00071n-AG; Sat, 18 Apr 2020 16:50:31 +0000
Received: from albireo.enyo.de ([37.24.231.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPqfj-00070o-0d
 for linux-snps-arc@lists.infradead.org; Sat, 18 Apr 2020 16:50:30 +0000
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jPqfb-0003BC-EQ; Sat, 18 Apr 2020 16:50:19 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jPqfb-0006ZH-Am; Sat, 18 Apr 2020 18:50:19 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
References: <20200312183325.594-1-vgupta@synopsys.com>
 <20200331214717.23902-1-vgupta@synopsys.com>
 <c87dd5b4-8be6-714f-3210-4cbfbe89a069@synopsys.com>
 <9eda9480-d0d5-07ec-3a99-83e61b076a2a@synopsys.com>
 <46b17be4-da49-a6d3-3a07-accf406302b7@synopsys.com>
Date: Sat, 18 Apr 2020 18:50:19 +0200
In-Reply-To: <46b17be4-da49-a6d3-3a07-accf406302b7@synopsys.com> (Vineet Gupta
 via Libc-alpha's message of "Sat, 18 Apr 2020 00:28:30 +0000")
Message-ID: <87y2qs68ms.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_095027_055968_7FB2C1A9 
X-CRM114-Status: UNSURE (   4.97  )
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

> On 4/13/20 2:12 PM, Vineet Gupta via Libc-alpha wrote:
>> On 4/6/20 11:54 AM, Vineet Gupta wrote:
>>> On 3/31/20 2:47 PM, Vineet Gupta via Libc-alpha wrote:
>>>> From: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
>>>>
>>>> An older asm-generic syscall ABI may have kernel provide 32-bit
>>>> time syscalls, so undef them to not mix 32/64 in 64-bit time regime.
>>>>
>>>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>>>
>>> ping !
>> 
>> ping ^2 !
>
> If this is not suitable for common code, I'd still like to add this
> as part of ARC port to safe guard against future snafus.

Have you tried to add the #undefs to fixup-asm-unistd.h?
See sysdeps/unix/sysv/linux/arm/fixup-asm-unistd.h for an example.

I have not tried if #undefs work there, but they should.  If not, we
can fix that.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
