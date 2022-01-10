Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C6EC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Jan 2022 23:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdA/YCHk4x94orKbY5YTBZbW0+bDcn6gIjMyZuacf6w=; b=L6VAbMiiiTPUzJ
	ZsU3UQmRKqZQfAeRD/cn02BdD2SIBFby497SlZhPPgUk4qpI2rb6x8FMPG2RGSVJqR8uHVtf2NO2K
	3gzc8rai0KzaQMF9oWWhRGUm0QDjIWV+JqBz2TU1Z/LY7gPmeSRsQ9nd1dSW4aF957ub25RHb2jCH
	zGsVHR/PW9Chb1Z9J1O5ZV2+PUjJBzsy+fN5dOiB+M7prkOfuXisvWrUqbEthRIlDyyrKeKVoJKTH
	CnPdZYQmG+x3GGBKTfbNjgdl0YQOA5DYYqVRB4O1FP/f1Ir6e6MflAlYjpqmk5iuPyb63A9Bgvp2I
	4nssq3oKgVJKQPnGVBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n74D1-00Dv7d-RZ; Mon, 10 Jan 2022 23:36:15 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n74Cy-00Dv68-Ne
 for linux-snps-arc@lists.infradead.org; Mon, 10 Jan 2022 23:36:14 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JXqvt0WfXzQk39;
 Tue, 11 Jan 2022 00:36:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1641857767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwn6j8VQsQt6HTw52YY1qoT8b3BzC3uMBVyOUE3CDlE=;
 b=nUwFN38U1xKeWZENwGaqRBaIvY8wuRlwmOozWGiKL1+OY8CvVAs66dE/S18o+mlA1ztecG
 hv9WawBhaeu3IpbcZq4Lbme5SoNIo3PEmAgX4mmwfydYbL7zT7KxnidLh4upgMBA90r59e
 gcbhsRFLVQKLoIijWqxVC9FrniBIFgtgbeT7pmMYQddPxSOObGjPbkEnZoyUiPSQjiCfP1
 jczlx5HH4puW+xHTZb7DXIKstNcdRfTgiT3ZFODLK3v5aM/R8+4zxuLALmV7CRTbMiSLYl
 Mwscp395/RLw6TypEPirnUbYYvpjCSxLETToXUsk3uF1PloI0Y4gdgznoknrIQ==
Message-ID: <56c87331-ba75-d109-545e-ee8183d9e762@hauke-m.de>
Date: Tue, 11 Jan 2022 00:36:02 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Paul Spooren <mail@aparcar.org>
Cc: openwrt-devel <openwrt-devel@lists.openwrt.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>
References: <D1B7B4A6-DF52-411D-A712-ED3F2F3692C6@aparcar.org>
 <faa7304a-9ea2-31aa-c3ee-3cfac25fc4b1@hauke-m.de>
 <FE9EB12D-4FC9-4A52-9678-B7C93936196C@aparcar.org>
 <MWHPR1201MB0239C01E0B1A5C409B307AAFA1509@MWHPR1201MB0239.namprd12.prod.outlook.com>
From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [RFT] Kernels for next release
In-Reply-To: <MWHPR1201MB0239C01E0B1A5C409B307AAFA1509@MWHPR1201MB0239.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_153612_982622_C7D39999 
X-CRM114-Status: GOOD (  26.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Alexey,

On 1/10/22 19:30, Alexey Brodkin wrote:
> Hi Paul, Hauke,
>   
>>> I would be fine to remove the arc770 and the ipq807x targets.
>>
>> I removed ipq807x for now, arc770 should receive a patch within the next days.
> 
> Well, actually the original patch for ARC770 posted by Evgeniy some time ago is good.
> I mean this one: https://patchwork.ozlabs.org/project/openwrt/patch/mailman.11570.1635883327.1923571.openwrt-devel@lists.openwrt.org/
> 
> A problem mentioned in the commit message is due to something in either glibc or
> some other part of the toolchain, which causes problems in user space.
> More gory details of that issue you may find here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/400

I was not aware that it was broken since some time already. Thanks for 
the information.

> I'm not sure though when we have time to really look into it, as ARCompact ISA
> (AKA ARCv1) is being deemphasized in favor to ARCv2 (ARC HS3x/4x) &
> ARCv3 (ARC HS5x/6x) processors.
>   
>>> There is no hardware available on the consumer market supported by arc770 and I think archs38 is the successor anyway. If someone wants to add support for real hardware using ARC CPUs later it can be added again.
>>
>> Alexey could you please comment on this? Do you think it makes more sense to focus on archs38?
> 
> For a time being I'd propose to keep ARC770 as long as it builds since
> there're quite some HW exist in the wild with these processors and from time
> to time people appear asking about OpenWrt port for those devices...
> Though I don't remember anybody contributing anything except us... so maybe
> there's no interest in it in the community really. Then maybe mark ARC770 as
> being obsolete/EOL'ed in OpenWrt as well and remove it in the next release cycle.
> 
> But given even building consumes resources you may want to get rid of this thing
> right now. Then it's your call ;)

I would suggest to remove the arc770 target, but keep the archs38 
target. As I understood you the archs38 CPU is more modern then the 
arc770 CPU and arc770 is more or less legacy IP. If you want to add this 
later again you can send a patch to add the working arc770 target again.

I am not aware of any other user of the arc targets in OpenWrt than you, 
but it is normal that we only know about a fraction of the OpenWrt users.

Hauke

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
